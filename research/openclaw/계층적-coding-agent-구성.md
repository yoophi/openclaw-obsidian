---
tags:
  - openclaw
  - coding
  - multi-agent
  - architecture
  - hierarchy
date: 2026-03-15
---

# 계층적 Coding Agent 구성

조사 일자: 2026-03-15

## 핵심 요약

OpenClaw는 두 가지 계층적 에이전트 모델을 지원한다:
1. **Sub-agents**: OpenClaw 네이티브 하위 에이전트
2. **ACP Agents**: 외부 코딩 하네스 (Codex, Claude Code, Gemini CLI 등)

---

## 1. Sub-agents (네이티브 계층)

### 기본 구조

```
┌─────────────────────────────────────────────┐
│              Main Agent (Depth 0)            │
│           agent:<id>:main                    │
└──────────────────┬──────────────────────────┘
                   │ sessions_spawn
       ┌───────────┼───────────┐
       ▼           ▼           ▼
┌──────────────┐ ┌──────────────┐ ┌──────────────┐
│ Orchestrator │ │ Orchestrator │ │    Leaf      │
│  (Depth 1)   │ │  (Depth 1)   │ │  (Depth 1)   │
└───────┬──────┘ └──────────────┘ └──────────────┘
        │
   ┌────┼────┐
   ▼    ▼    ▼
┌────┐┌────┐┌────┐
│ D2 ││ D2 ││ D2 │  Depth 2 Workers
└────┘└────┘└────┘
```

### Depth 레벨

| Depth | Session Key | 역할 | 스폰 가능? |
|-------|-------------|------|-----------|
| 0 | `agent:<id>:main` | 메인 에이전트 | 항상 |
| 1 | `agent:<id>:subagent:<uuid>` | 오케스트레이터 / 리프 | `maxSpawnDepth >= 2`일 때만 |
| 2 | `...subagent:<uuid>` | 리프 워커 | 절대 불가 |

### 설정

```json5
{
  agents: {
    defaults: {
      subagents: {
        maxSpawnDepth: 2,           // 중첩 허용 깊이 (1-5, 기본 1)
        maxChildrenPerAgent: 5,     // 세션당 최대 자식 수 (1-20)
        maxConcurrent: 8,           // 전역 동시성 cap
        runTimeoutSeconds: 900,     // 기본 타임아웃
      },
    },
  },
}
```

### 도구 정책

| Depth | 도구 접근 |
|-------|----------|
| 0 (Main) | 모든 도구 |
| 1 (Orchestrator, depth 2 허용 시) | `sessions_spawn`, `subagents`, `sessions_list`, `sessions_history` |
| 1 (Leaf, depth 1만 허용) | 세션 도구 없음 |
| 2 (Worker) | 세션 도구 없음, `sessions_spawn` 항상 거부 |

### 스폰 예시

```json
{
  "task": "이 프로젝트의 테스트를 병렬로 수정해줘",
  "runtime": "subagent",
  "label": "test-fixer",
  "thread": true,
  "mode": "session"
}
```

---

## 2. ACP Agents (외부 하네스)

### 개요

ACP (Agent Client Protocol)를 통해 외부 코딩 하네스를 실행:

- **Codex** (OpenAI)
- **Claude Code** (Anthropic)
- **Gemini CLI** (Google)
- **OpenCode**
- **Pi**
- **Kimi**

### ACP vs Sub-agents

| 영역 | ACP Session | Sub-agent |
|------|-------------|-----------|
| 런타임 | ACP 백엔드 플러그인 | OpenClaw 네이티브 |
| 세션 키 | `agent:<id>:acp:<uuid>` | `agent:<id>:subagent:<uuid>` |
| 주요 명령 | `/acp ...` | `/subagents ...` |
| 스폰 도구 | `sessions_spawn` + `runtime:"acp"` | `sessions_spawn` (기본) |

### 설정

```json5
{
  acp: {
    enabled: true,
    backend: "acpx",
    defaultAgent: "codex",
    allowedAgents: ["pi", "claude", "codex", "opencode", "gemini", "kimi"],
    maxConcurrentSessions: 8,
    runtime: {
      ttlMinutes: 120,
    },
  },
}
```

### 스폰 예시

```json
{
  "task": "Open the repo and summarize failing tests",
  "runtime": "acp",
  "agentId": "codex",
  "thread": true,
  "mode": "session"
}
```

### /acp 명령

| 명령 | 설명 |
|------|------|
| `/acp spawn` | ACP 세션 생성 |
| `/acp cancel` | 현재 턴 취소 |
| `/acp steer` | 실행 중 세션에 지시 |
| `/acp close` | 세션 종료 |
| `/acp status` | 상태 확인 |
| `/acp model` | 모델 변경 |
| `/acp cwd` | 작업 디렉토리 변경 |

---

## 3. Thread-bound Sessions

### 개념

서브에이전트/ACP 세션을 특정 스레드에 바인딩하면, 해당 스레드의 후속 메시지가 자동으로 같은 세션으로 라우팅된다.

### 지원 채널

- **Discord**: 스레드/채널
- **Telegram**: Forum 토픽

### 설정

```json5
// Discord
{
  channels: {
    discord: {
      threadBindings: {
        enabled: true,
        spawnAcpSessions: true,
        spawnSubagentSessions: true,
      },
    },
  },
}

// Telegram
{
  channels: {
    telegram: {
      threadBindings: {
        spawnAcpSessions: true,
      },
    },
  },
}
```

### 스폰 모드

```bash
# 스레드 자동 바인딩
/acp spawn codex --mode persistent --thread auto

# 현재 스레드 필수
/acp spawn codex --thread here

# 바인딩 없음
/acp spawn codex --thread off
```

---

## 4. 계층적 구성 패턴

### 패턴 1: Orchestrator → Workers

```
Main Agent
    │
    ▼
┌───────────────────┐
│   Orchestrator    │  (Depth 1)
│   subagent:abc    │
└────────┬──────────┘
         │
    ┌────┼────┐
    ▼    ▼    ▼
┌────┐┌────┐┌────┐
│ W1 ││ W2 ││ W3 │  (Depth 2 Workers)
└────┘└────┘└────┘
```

**용도:**
- 대규모 리팩토링
- 병렬 PR 리뷰
- 다중 파일 수정

**요구사항:** `maxSpawnDepth: 2`

### 패턴 2: 프로젝트별 ACP 세션

```
Main Agent
    │
    ├── Project A ──► codex (ACP)
    │
    ├── Project B ──► claude (ACP)
    │
    └── Research  ──► gemini (ACP)
```

**용도:**
- 다양한 코딩 하네스 사용
- 프로젝트별 다른 모델

### 패턴 3: Thread-bound 협업

```
Discord/Telegram Thread
         │
         ▼
┌─────────────────┐
│  ACP Session    │  (Persistent)
│  codex:project  │
└─────────────────┘
         ▲
         │
   Follow-up messages
   automatically route here
```

**용도:**
- 지속적인 코딩 작업
- 실시간 협업

---

## 5. 권장 설정

### 소규모 개인 프로젝트

```json5
{
  agents: {
    defaults: {
      subagents: {
        maxSpawnDepth: 1,  // 단일 레벨
        maxConcurrent: 4,
      },
    },
  },
  acp: {
    enabled: true,
    defaultAgent: "codex",
  },
}
```

### 팀/대규모 프로젝트

```json5
{
  agents: {
    list: [
      {
        id: "orchestrator",
        subagents: {
          maxSpawnDepth: 2,  // 오케스트레이터 패턴
          maxChildrenPerAgent: 10,
        },
      },
      {
        id: "frontend",
        runtime: {
          type: "acp",
          acp: { agent: "claude", mode: "persistent" },
        },
      },
      {
        id: "backend",
        runtime: {
          type: "acp",
          acp: { agent: "codex", mode: "persistent" },
        },
      },
    ],
  },
}
```

---

## 6. 주의사항

### 비용 관리

- 각 서브에이전트는 **독립적인 컨텍스트**와 토큰 사용량
- 메인은 고급 모델, 서브에이전트는 경제적 모델 권장
- `agents.defaults.subagents.model`로 기본 모델 설정

### 샌드박스 제한

- ACP 세션은 호스트에서 실행 (샌드박스 외부)
- 샌드박스된 세션에서 ACP 스폰 불가
- 샌드박스 필요 시 `runtime: "subagent"` 사용

### 권한 설정

```json5
// acpx 플러그인 권한
{
  plugins: {
    entries: {
      acpx: {
        config: {
          permissionMode: "approve-all",  // 또는 "approve-reads"
          nonInteractivePermissions: "fail",  // 또는 "deny"
        },
      },
    },
  },
}
```

---

## 참고 자료

- [ACP Agents 문서](/opt/homebrew/lib/node_modules/openclaw/docs/tools/acp-agents.md)
- [Sub-agents 문서](/opt/homebrew/lib/node_modules/openclaw/docs/tools/subagents.md)
- [Multi-Agent Routing](/opt/homebrew/lib/node_modules/openclaw/docs/concepts/multi-agent.md)
- [Coding Agent Skill](/opt/homebrew/lib/node_modules/openclaw/skills/coding-agent/SKILL.md)
