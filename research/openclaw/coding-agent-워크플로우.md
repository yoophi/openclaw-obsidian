---
tags:
  - openclaw
  - coding-agent
  - 워크플로우
  - skill
date: 2026-03-13
---

# OpenClaw Coding Agent 워크플로우

조사 일자: 2026-03-13

조사 일자: 2026-03-13
목적: OpenClaw에서 coding 기능이 내부적으로 동작하는 방식 정리
출처: OpenClaw coding-agent SKILL.md, 공식 문서

---

## 1. 핵심 요약

**OpenClaw Coding 기능의 본질:**
- OpenClaw 자체가 코드를 작성하는 것이 아님
- **외부 Coding Agent를 실행시키는 Orchestrator**
- Agent는 독립된 프로세스로 실행, OpenClaw는 감시만

**지원 Agent:**
1. **Claude Code** — Anthropic CLI (`claude`)
2. **Codex** — OpenAI CLI (`codex`)
3. **OpenCode** — 오픈소스 CLI (`opencode`)
4. **Pi** — 커스텀 CLI (`pi`)

**작동 흐름:**
```
User Request
    ↓
OpenClaw (Orchestrator)
    ↓
coding-agent Skill 로드
    ↓
exec Tool로 Agent 실행 (background)
    ↓
process Tool로 모니터링
    ↓
완료 시 사용자에게 보고
```

---

## 2. 상세 분석

### 2.1 아키텍처

**Layer 구조:**
```
┌─────────────────────────────────────────┐
│         User Interface                  │
│  (Telegram, Discord, Slack, etc.)       │
└──────────────┬──────────────────────────┘
               ↓
┌─────────────────────────────────────────┐
│       OpenClaw Agent (Main)             │
│  - Receives request                     │
│  - Loads coding-agent skill             │
│  - Decides which tool to use            │
└──────────────┬──────────────────────────┘
               ↓
┌─────────────────────────────────────────┐
│         Skill Layer                     │
│  - coding-agent/SKILL.md                │
│  - Provides instructions                │
│  - Specifies tool parameters            │
└──────────────┬──────────────────────────┘
               ↓
┌─────────────────────────────────────────┐
│         Tool Layer                      │
│  - exec (run shell commands)            │
│  - process (monitor background)         │
└──────────────┬──────────────────────────┘
               ↓
┌─────────────────────────────────────────┐
│    External Coding Agent Process        │
│  - Claude Code CLI                      │
│  - Codex CLI                            │
│  - OpenCode CLI                         │
│  - Pi CLI                               │
└─────────────────────────────────────────┘
```

**핵심 포인트:**
- OpenClaw Main Agent는 **코드를 작성하지 않음**
- Skill은 **지침만 제공**
- 실제 코딩은 **별도 프로세스**에서 수행

---

### 2.2 Skill의 역할

**coding-agent Skill 위치:**
```
/opt/homebrew/lib/node_modules/openclaw/skills/coding-agent/SKILL.md
```

**Skill이 하는 일:**
1. **어떤 Tool을 사용할지 결정** — `exec`, `process`
2. **어떤 Parameters를 전달할지 지정** — `pty`, `workdir`, `background`
3. **어떤 Agent를 사용할지 결정** — Claude Code vs Codex
4. **어떤 Flags를 사용할지 지정** — `--full-auto`, `--yolo`, `--print`
5. **주의사항 제공** — PTY 사용, git repo 필요, etc.

**Skill이 하지 않는 일:**
- ❌ 코드 작성
- ❌ 파일 수정
- ❌ Agent 실행 (Agent Main이 실행)
- ❌ Agent의 결정에 개입

**Skill 트리거 조건:**
```yaml
description: >
  Delegate coding tasks to Codex, Claude Code, or Pi agents via background process.
  Use when: (1) building/creating new features or apps, (2) reviewing PRs,
  (3) refactoring large codebases, (4) iterative coding that needs file exploration.
  NOT for: simple one-liner fixes (just edit), reading code (use read tool),
  thread-bound ACP harness requests in chat (use sessions_spawn with runtime:"acp"),
  or any work in ~/clawd workspace (never spawn agents here).
```

---

### 2.3 실행 모드

#### Mode 1: One-Shot (Foreground)

**용도:** 빠른 작업, 대화형

**동작:**
1. OpenClaw가 명령어 구성
2. `exec` Tool로 실행
3. 완료될 때까지 대기
4. 결과 반환

**예시 (Claude Code):**
```typescript
// OpenClaw 내부 실행 (개념적)
exec({
  command: "claude --permission-mode bypassPermissions --print 'Fix the bug'",
  workdir: "/Users/yoophi/project",
  pty: false  // Claude Code는 PTY 불필요
})
```

**예시 (Codex):**
```typescript
exec({
  command: "codex exec 'Build a snake game'",
  workdir: "/Users/yoophi/project",
  pty: true,  // Codex는 PTY 필수
  timeout: 600  // 10분
})
```

---

#### Mode 2: Background

**용도:** 장시간 작업, 병렬 실행

**동작:**
1. OpenClaw가 명령어 구성
2. `exec` Tool로 background 실행
3. `sessionId` 반환
4. OpenClaw는 계속 사용자와 대화 가능
5. 필요 시 `process` Tool로 상태 확인
6. 완료 시 사용자에게 보고

**예시:**
```typescript
// 실행
const result = await exec({
  command: "codex --yolo 'Refactor the auth module'",
  workdir: "/Users/yoophi/project",
  pty: true,
  background: true
});

// sessionId 저장
const sessionId = result.sessionId;

// 나중에 확인
const status = await process({
  action: "poll",
  sessionId
});

// 로그 확인
const logs = await process({
  action: "log",
  sessionId,
  offset: 0,
  limit: 100
});

// 완료 시
if (status.completed) {
  // 사용자에게 보고
}
```

---

### 2.4 Agent별 특성

#### Claude Code

**특징:**
- Anthropic의 공식 CLI
- PTY 불필요 (`--print` 모드)
- Full tool access
- Interactive confirmation 없음 (`--permission-mode bypassPermissions`)

**실행 방식:**
```bash
claude --permission-mode bypassPermissions --print 'Your task'
```

**장점:**
- PTY 없이 실행 가능
- 출력이 깔끔함
- Permission 제어 가능

**단점:**
- 별도 설치 필요
- Anthropic API 필요

---

#### Codex

**특징:**
- OpenAI의 CLI
- PTY 필수 (interactive terminal app)
- Git repo에서만 실행
- 다양한 실행 모드

**실행 방식:**
```bash
# One-shot
codex exec 'Your task'

# Auto-approve
codex exec --full-auto 'Your task'

# YOLO (no sandbox)
codex --yolo 'Your task'
```

**Flags:**
- `exec` — One-shot 실행
- `--full-auto` — Sandboxed but auto-approves
- `--yolo` — No sandbox, no approvals (가장 빠르고 위험)

**장점:**
- OpenAI 모델 사용
- 강력한 auto-mode

**단점:**
- PTY 필수
- Git repo 필수
- Sandbox 모드에서 제약 있음

---

#### OpenCode

**특징:**
- 오픈소스 CLI
- PTY 필수

**실행 방식:**
```bash
opencode run 'Your task'
```

---

#### Pi

**특징:**
- 커스텀 CLI (`@mariozechner/pi-coding-agent`)
- PTY 권장
- 다양한 provider 지원

**실행 방식:**
```bash
pi 'Your task'
pi --provider openai --model gpt-4o-mini -p 'Your task'
```

---

### 2.5 Tool 상호작용

#### exec Tool

**역할:** Shell 명령어 실행

**주요 Parameters:**
| Parameter | Type | Description |
|-----------|------|-------------|
| `command` | string | 실행할 명령어 |
| `workdir` | string | 작업 디렉토리 |
| `pty` | boolean | PTY 할당 여부 |
| `background` | boolean | 백그라운드 실행 |
| `timeout` | number | 타임아웃 (초) |

**내부 동작:**
1. PTY가 필요한 경우 pseudo-terminal 할당
2. Shell process fork
3. 명령어 실행
4. Output 캡처
5. Background인 경우 sessionId 반환
6. Foreground인 경우 완료까지 대기

---

#### process Tool

**역할:** Background 프로세스 관리

**Actions:**
| Action | Description |
|--------|-------------|
| `list` | 실행 중인 세션 목록 |
| `poll` | 세션 상태 확인 |
| `log` | 세션 출력 가져오기 |
| `write` | stdin에 데이터 전송 |
| `submit` | 데이터 + Enter 전송 |
| `send-keys` | 키 토큰/바이트 전송 |
| `paste` | 텍스트 붙여넣기 |
| `kill` | 세션 종료 |

**내부 동작:**
1. sessionId로 프로세스 식별
2. 해당 프로세스의 상태/로그 조회
3. 필요 시 입력 전송
4. 완료 시 리소스 정리

---

### 2.6 전체 실행 흐름 예시

**시나리오:** "snake game 만들어줘"

**Step 1: 사용자 요청**
```
User (Telegram): "snake game 만들어줘"
```

**Step 2: OpenClaw Main Agent 수신**
```json
{
  "message": "snake game 만들어줘",
  "channel": "telegram",
  "sessionId": "telegram:42511907"
}
```

**Step 3: Skill 로드**
```
OpenClaw Agent:
  - 요청 분석: "coding task"
  - Skill 검색: "coding-agent" 매칭
  - Skill 로드: /skills/coding-agent/SKILL.md
```

**Step 4: Skill 지침 적용**
```
coding-agent Skill:
  - Codex 사용 권장
  - PTY: true
  - workdir: ~/Projects/snake-game (또는 새 디렉토리)
  - background: true
  - command: "codex exec --full-auto 'Build a snake game'"
```

**Step 5: Tool 호출**
```typescript
// OpenClaw Main Agent가 Tool 호출
const result = await exec({
  command: "codex exec --full-auto 'Build a snake game'",
  workdir: "/Users/yoophi/Projects/snake-game",
  pty: true,
  background: true
});

// sessionId: "abc123"
```

**Step 6: 사용자에게 진행 상황 보고**
```
OpenClaw → User:
  "Codex를 시작했어. ~/Projects/snake-game에서 작업 중."
```

**Step 7: 백그라운드 실행**
```
별도 프로세스:
  - Codex가 파일 생성/수정
  - OpenClaw Main Agent는 다른 요청 처리 가능
  - 주기적으로 process.poll로 상태 확인
```

**Step 8: 완료 감지**
```typescript
const status = await process({
  action: "poll",
  sessionId: "abc123"
});

if (status.completed) {
  // 완료됨
}
```

**Step 9: 결과 보고**
```
OpenClaw → User:
  "Snake game 완성! 🐍
  
  파일: ~/Projects/snake-game/
  - index.html
  - game.js
  - style.css
  
  실행: open index.html"
```

---

### 2.7 PTY vs Non-PTY

**PTY (Pseudo-Terminal):**
- Interactive terminal 앱에 필요
- Codex, OpenCode, Pi — PTY 필수
- Claude Code — PTY 불필요 (`--print` 모드)

**왜 PTY가 필요한가:**
- Terminal UI 렌더링 (colors, cursor movement)
- Interactive input (confirmation prompts)
- Real-time output streaming

**PTY 없이 실행 시 문제:**
- Output 깨짐
- Agent hang
- Confirmation dialog 처리 불가

---

### 2.8 Git Repo 요구사항

**Codex 제약:**
- Git repo 외부에서 실행 거부
- Trust boundary 설정용

**해결 방법:**
1. **실제 프로젝트:** 이미 git repo
2. **Scratch work:** `mktemp -d && git init`
3. **PR review:** Git worktree 사용

**예시:**
```bash
# Scratch work
SCRATCH=$(mktemp -d) && cd $SCRATCH && git init
codex exec "Quick prototype"
```

---

### 2.9 Permission Modes

**Codex:**
- `--full-auto` — Sandboxed but auto-approves in workspace
- `--yolo` — No sandbox, no approvals

**Claude Code:**
- `--permission-mode bypassPermissions` — 모든 권한 허용
- `--dangerously-skip-permissions` — (deprecated)

**OpenClaw 관점:**
- OpenClaw는 권한 제어하지 않음
- Agent의 권한 설정에 의존
- `--full-auto` 또는 `bypassPermissions` 권장

---

## 3. 장단점

### 3.1 OpenClaw의 Orchestrator 방식

**장점:**
1. **관심사 분리** — OpenClaw는 대화, Agent는 코딩
2. **유연성** — 다양한 Agent 사용 가능
3. **병렬성** — 여러 Agent 동시 실행
4. **안정성** — Agent crash가 OpenClaw에 영향 없음
5. **전문성** — 각 Agent가 최적화된 모델 사용

**단점:**
1. **지연** — Agent 실행 오버헤드
2. **복잡성** — 여러 CLI 설치/관리
3. **디버깅 어려움** — 별도 프로세스
4. **리소스 사용** — 각 Agent가 독립 프로세스

---

### 3.2 Background 실행

**장점:**
1. **Non-blocking** — OpenClaw가 계속 대화 가능
2. **병렬 처리** — 여러 작업 동시 실행
3. **Long-running tasks** — 장시간 작업 가능

**단점:**
1. **모니터링 필요** — 상태 확인해야 함
2. **사용자 업데이트** — 진행 상황 보고 필요
3. **Error handling** — 실패 시 재시도 로직 필요

---

### 3.3 Skill 기반 지침

**장점:**
1. **Token 효율** — 필요시에만 로드
2. **업데이트 용이** — Skill만 교체
3. **재사용성** — 여러 Agent가 동일 Skill 사용

**단점:**
1. **간접적** — 직접 코딩보다 복잡
2. **Skill 의존** — Skill 품질이 결과 좌우

---

## 4. 결론

### 4.1 OpenClaw Coding 기능의 본질

**핵심:**
- OpenClaw는 **Orchestrator**
- 실제 코딩은 **External Agent**가 수행
- Skill은 **지침 제공**
- Tool은 **실행/모니터링**

**비유:**
```
OpenClaw = Project Manager
Skill = Work Instructions
Tool = Communication Channel
External Agent = Developer
```

---

### 4.2 작동 메커니즘 요약

1. **Request** → OpenClaw 수신
2. **Skill Load** → coding-agent 지침 로드
3. **Tool Call** → exec로 Agent 실행
4. **Monitor** → process로 상태 확인
5. **Report** → 사용자에게 결과 보고

---

### 4.3 실용적 관점

**언제 Coding Agent 사용:**
- ✅ 새로운 기능/앱 구축
- ✅ PR 리뷰
- ✅ 대규모 리팩토링
- ✅ 파일 탐색이 필요한 작업

**언제 직접 Tool 사용:**
- ❌ 간단한 one-liner fix → `edit` Tool
- ❌ 코드 읽기 → `read` Tool
- ❌ 단순 검색 → `web_search` Tool

---

### 4.4 모범 사례

1. **적절한 Agent 선택**
   - Claude Code: 깔끔한 출력, permission 제어
   - Codex: OpenAI 모델, 강력한 auto-mode

2. **올바른 실행 모드**
   - Quick task: One-shot (foreground)
   - Long task: Background

3. **적절한 Parameters**
   - PTY: Codex/OpenCode/Pi → `true`, Claude Code → `false`
   - workdir: 명확한 프로젝트 디렉토리
   - background: 장시간 작업 시

4. **사용자 커뮤니케이션**
   - 시작 시 보고
   - 마일스톤 시 업데이트
   - 완료 시 상세 보고

5. **Error handling**
   - 실패 시 재시도 또는 사용자에게 질문
   - Silent takeover 금지

---

## 5. 참고 자료

### OpenClaw 문서
- coding-agent Skill: `/opt/homebrew/lib/node_modules/openclaw/skills/coding-agent/SKILL.md`
- Agent Runtime: https://docs.openclaw.ai/concepts/agent
- Tool Reference: https://docs.openclaw.ai/tools

### External Agents
- Claude Code: https://github.com/anthropics/claude-code
- Codex: OpenAI CLI
- OpenCode: 오픈소스 CLI
- Pi: `@mariozechner/pi-coding-agent`

### 관련 기술
- PTY (Pseudo-Terminal): Terminal emulation
- Background Process: Non-blocking execution
- Agent Client Protocol (ACP): Agent integration standard

---

_작성자: Hank McCoy_
_조사 방법: OpenClaw coding-agent SKILL.md 분석, 공식 문서_
