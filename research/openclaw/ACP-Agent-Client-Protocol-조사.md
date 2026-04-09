---
tags:
  - ACP
  - OpenClaw
  - 프로토콜
  - IDE
  - 에이전트
date: 2026-04-09
---

# ACP (Agent Client Protocol) 조사

조사 일자: 2026-04-09

## 핵심 요약

ACP(Agent Client Protocol)는 **코드 에디터/IDE와 코딩 에이전트 간의 통신을 표준화하는 프로토콜**이다. LSP(Language Server Protocol)가 언어 서버 통합을 표준화한 것처럼, ACP는 에이전트-에디터 통합을 표준화한다.

---

## 1. ACP란?

### 1.1 왜 필요한가

기존 문제:
- 각 에디터가 모든 에이전트에 대해 커스텀 통합을 구축해야 함
- 에이전트는 특정 에디터 API만 구현 → 호환성 제한
- 에이전트 선택 = 에디터 선택에 갇힘 (벤더 락인)

### 1.2 해결

> ACP는 LSP가 언어 서버 통합을 표준화한 것처럼, 에이전트-에디터 통신을 표준화한다.

- ACP 구현 에이전트 → 모든 호환 에디터에서 작동
- ACP 지원 에디터 → 모든 ACP 호환 에이전트에 접근
- 양쪽 모두 독립적으로 혁신하면서 개발자는 자유롭게 도구 선택

### 1.3 통신 방식

| 시나리오 | 통신 방식 |
|----------|----------|
| 로컬 에이전트 | JSON-RPC over stdio (에디터 서브프로세스) |
| 리모트 에이전트 | HTTP 또는 WebSocket |

---

## 2. OpenClaw에서의 ACP

OpenClaw에서 ACP는 **두 가지 역할**로 사용된다:

### 2.1 ACP 브릿지 모드 (`openclaw acp`)

에디터/클라이언트가 ACP로 OpenClaw에 연결:

```
에디터 (Zed, VS Code 등)
    ↓ ACP (stdio)
OpenClaw ACP 브릿지
    ↓ WebSocket
OpenClaw Gateway
```

**용도:** IDE에서 OpenClaw 에이전트를 직접 사용

### 2.2 ACP 에이전트 모드 (하네스 세션)

OpenClaw가 외부 코딩 에이전트를 실행:

```
사용자 (채팅)
    ↓ 메시지
OpenClaw Gateway
    ↓ ACPX 플러그인
외부 에이전트 (Codex, Claude Code 등)
```

**용도:** 채팅에서 "Codex로 실행해"라고 말하면 ACP를 통해 Codex 구동

---

## 3. 지원 에이전트

acpx 하네스를 통해 지원되는 에이전트:

| 에이전트 | 식별자 |
|----------|--------|
| Claude Code | `claude` |
| OpenAI Codex | `codex` |
| GitHub Copilot | `copilot` |
| Cursor | `cursor` |
| Gemini CLI | `gemini` |
| Pi | `pi` |
| OpenCode | `opencode` |
| OpenClaw | `openclaw` |
| Droid | `droid` |
| Kimi | `kimi` |
| Kiro | `kiro` |
| Qwen | `qwen` |
| iFlow | `iflow` |
| Kilocode | `kilocode` |

---

## 4. 핵심 기능

### 4.1 세션 관리

| 명령 | 역할 |
|------|------|
| `/acp spawn` | ACP 세션 생성 |
| `/acp cancel` | 실행 중인 턴 취소 |
| `/acp steer` | 실행 중인 세션에 지시 |
| `/acp close` | 세션 종료 + 바인딩 해제 |
| `/acp status` | 상태 확인 |
| `/acp model` | 모델 변경 |
| `/acp permissions` | 권한 프로파일 설정 |
| `/acp timeout` | 타임아웃 설정 |
| `/acp doctor` | 백엔드 건강 진단 |

### 4.2 바인딩 모드

| 모드 | 설명 |
|------|------|
| `--bind here` | 현재 대화를 그대로 ACP 세션에 바인딩 |
| `--thread auto` | 스레드가 있으면 바인딩, 없으면 생성 |
| `--thread here` | 현재 스레드에 바인딩 (없으면 실패) |
| `--thread off` | 바인딩 없음 |

### 4.3 세션 모드

| 모드 | 설명 |
|------|------|
| `oneshot` | 일회성 실행 |
| `persistent` | 지속적 세션 (스레드 바인딩) |

---

## 5. 실제 사용 시나리오

### 5.1 Discord에서 Codex 실행

```text
/acp spawn codex --mode persistent --thread auto
```
→ Discord 스레드에 Codex 세션이 바인딩되어 계속 작업

### 5.2 현재 채팅을 Codex에 바인딩

```text
/acp spawn codex --bind here --cwd /workspace/repo
```
→ 현재 채팅 채널이 Codex 작업 공간이 됨

### 5.3 일회성 Claude Code 실행

```text
/acp spawn claude --mode oneshot
```

### 5.4 Zed 에디터에서 OpenClaw 사용

```json
{
  "agent_servers": {
    "OpenClaw ACP": {
      "type": "custom",
      "command": "openclaw",
      "args": ["acp"]
    }
  }
}
```

---

## 6. ACP vs 서브에이전트

| 항목 | ACP 세션 | 서브에이전트 |
|------|---------|-------------|
| 런타임 | ACP 백엔드 플러그인 (acpx) | OpenClaw 네이티브 |
| 세션 키 | `agent:<id>:acp:<uuid>` | `agent:<id>:subagent:<uuid>` |
| 명령어 | `/acp ...` | `/subagents ...` |
| 외부 에이전트 | Codex, Claude, Gemini 등 | OpenClaw 자체 에이전트 |
| 샌드박스 | 호스트에서 실행 (미지원) | 지원 |

---

## 7. 권한 설정

| 값 | 동작 |
|----|------|
| `approve-all` | 모든 파일 쓰기/셸 명령 자동 승인 |
| `approve-reads` | 읽기만 자동 승인, 쓰기/실행은 프롬프트 |
| `deny-all` | 모든 권한 프롬프트 거부 |

비대화형 세션에서 권한 프롬프트 처리:

| 값 | 동작 |
|----|------|
| `fail` | 세션 중단 (기본값) |
| `deny` | 권한 거부하고 계속 진행 |

---

## 8. 참고 자료

- ACP 공식 사이트: https://agentclientprotocol.com/
- OpenClaw ACP CLI 문서: `/opt/homebrew/lib/node_modules/openclaw/docs/cli/acp.md`
- OpenClaw ACP 에이전트 문서: `/opt/homebrew/lib/node_modules/openclaw/docs/tools/acp-agents.md`
- LSP (참고): https://microsoft.github.io/language-server-protocol/

---

_조사: Research Agent_
