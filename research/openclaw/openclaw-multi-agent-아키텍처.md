---
tags:
  - openclaw
  - multi-agent
  - architecture
  - paperclip
date: 2026-03-15
---

# OpenClaw Multi-Agent 아키텍처

조사 일자: 2026-03-15

## 핵심 요약

OpenClaw는 다중 에이전트 환경을 지원하며, 에이전트 간 상호작용을 통해 복잡한 작업을 분산 처리할 수 있다. Paperclip과 결합하면 계층적 조직 구조를 구성할 수 있다.

## Agent 간 상호작용 방식

### 1. sessions_spawn — 하위 에이전트 스포닝

한 에이전트가 다른 에이전트(또는 서브에이전트)를 생성하여 작업을 위임:

```bash
sessions_spawn(task="...", runtime="subagent")
```

**런타임 옵션:**
- `runtime: "subagent"` — 독립된 하위 에이전트
- `runtime: "acp"` — ACP 코딩 세션 (Codex, Claude Code 등)
- `thread: true` — Discord 등에서 스레드 바인딩

### 2. sessions_send — 세션 간 메시지 전송

다른 세션으로 메시지 직접 전송:

```bash
sessions_send(sessionKey="agent:work:main", message="...")
```

### 3. Agent-to-Agent Messaging (config 설정)

`openclaw.json`에서 명시적으로 활성화:

```json5
{
  tools: {
    agentToAgent: {
      enabled: true,
      allow: ["home", "work"],  // 서로 통신 허용할 agent 목록
    },
  },
}
```

### 4. 공유 메모리/파일

같은 워크스페이스 또는 공유 파일(`MEMORY.md`, `memory/`)을 통해 간접 통신:
- 한 에이전트가 정보를 기록 → 다른 에이전트가 읽기

## 구조 예시

```
┌─────────────┐     sessions_spawn      ┌──────────────┐
│   CEO       │ ─────────────────────► │   Worker 1   │
│   Agent     │                         │   (coding)   │
└─────────────┘                         └──────────────┘
       │
       │ sessions_send
       ▼
┌─────────────┐
│   Research  │
│   Agent     │
└─────────────┘
```

## Multi-Agent Routing 설정

### 기본 개념

- **agentId**: 하나의 "뇌" (워크스페이스, 인증, 세션 저장소)
- **accountId**: 채널 계정 인스턴스 (예: WhatsApp "personal" vs "biz")
- **binding**: 인바운드 메시지를 `(channel, accountId, peer)` 기준으로 agent에 라우팅

### 설정 예시

```json5
{
  agents: {
    list: [
      {
        id: "home",
        default: true,
        name: "Home",
        workspace: "~/.openclaw/workspace-home",
        agentDir: "~/.openclaw/agents/home/agent",
      },
      {
        id: "work",
        name: "Work",
        workspace: "~/.openclaw/workspace-work",
        agentDir: "~/.openclaw/agents/work/agent",
      },
    ],
  },

  bindings: [
    { agentId: "home", match: { channel: "whatsapp", accountId: "personal" } },
    { agentId: "work", match: { channel: "whatsapp", accountId: "biz" } },
  ],

  tools: {
    agentToAgent: {
      enabled: true,
      allow: ["home", "work"],
    },
  },
}
```

## Paperclip + OpenClaw 통합

### Paperclip의 역할

Paperclip은 에이전트들을 조직도 형태로 계층화:

- **AI CEO → 부서 → 팀 → 개별 에이전트**
- 각 에이전트에 역할, 예산, 작업, 보고 체계 부여
- OpenClaw 게이트웨이 어댑터 제공

### 통합 결과

- React 대시보드 제공 (조직도, 활성 에이전트, 작업 큐, 승인, 에이전트별 메모리/액션)
- 에이전트별 모델 선택 가능 (복잡한 추론엔 Claude Sonet, 실행엔 빠르고 저렴한 모델)
- 구체적 역할 예시: CEO "AICO", 콘텐츠 에이전트, 엔지니어링 에이전트

### 장점

- 인간 대역폭이 병목이 되지 않음
- 작업을 잊지 않고 컨텍스트를 유지하며 지속적으로 실행
- 2026년 3월 업데이트로 통합이 훨씬 원활해짐

## 주의사항

1. **보안**: `agentToAgent`은 기본 비활성화 → 명시적 allowlist 필요
2. **격리**: 각 에이전트는 별도 세션/워크스페이스 → 상태 공유 안 됨
3. **도구 제한**: `sessions_spawn`, `sessions_send` 도구가 허용되어 있어야 함

## 참고 자료

- [OpenClaw Multi-Agent Routing 문서](/opt/homebrew/lib/node_modules/openclaw/docs/concepts/multi-agent.md)
- YouTube: "OpenClaw + Paperclip: build a full AI company" (https://youtu.be/mndpFJXksRs)
