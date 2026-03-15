---
tags:
  - openclaw
  - coding
  - multi-agent
  - best-practices
date: 2026-03-15
---

# 코딩 작업 Agent 구성 전략

조사 일자: 2026-03-15

## 핵심 요약

프로젝트 단위로 agent를 분리할지, 하나의 agent에서 모든 것을 처리할지는 **프로젝트 성격, 팀 규모, 격리 필요성**에 따라 결정한다. 상황별로 적절한 전략을 선택하는 것이 중요하다.

---

## 두 가지 접근 방식 비교

### 1. 단일 Agent (통합 방식)

모든 코딩 작업을 하나의 agent에서 처리

```
┌─────────────────────────────────┐
│          Main Agent             │
│  ┌─────────┐ ┌─────────┐ ┌────┐│
│  │Project A│ │Project B│ │etc ││
│  └─────────┘ └─────────┘ └────┘│
│         Shared Memory           │
└─────────────────────────────────┘
```

**장점:**
- 컨텍스트가 공유되어 프로젝트 간 참조 용이
- 설정 관리 단순
- 공통 패턴/스타일 일관성 유지
- 초기 설정 비용 낮음

**단점:**
- 프로젝트 충돌 가능성 (서로 다른 코딩 스타일, 규칙)
- 컨텍스트 오염 위험 (한 프로젝트의 정보가 다른 프로젝트에 영향)
- 메모리가 복잡해질 수 있음
- 민감한 정보 격리 어려움

### 2. 프로젝트별 Agent 분리 (격리 방식)

각 프로젝트에 전용 agent 할당

```
┌──────────────┐  ┌──────────────┐  ┌──────────────┐
│  Agent A     │  │  Agent B     │  │  Agent C     │
│ ┌──────────┐ │  │ ┌──────────┐ │  │ ┌──────────┐ │
│ │ Project A│ │  │ │ Project B│ │  │ │ Project C│ │
│ └──────────┘ │  │ └──────────┘ │  │ └──────────┘ │
│  Own Memory  │  │  Own Memory  │  │  Own Memory  │
└──────────────┘  └──────────────┘  └──────────────┘
```

**장점:**
- 프로젝트별 완전한 격리
- 독립적인 메모리/컨텍스트
- 프로젝트별 맞춤 설정 가능 (모델, 스킬, 규칙)
- 보안/민감 정보 격리 용이

**단점:**
- 설정 관리 복잡
- 프로젝트 간 컨텍스트 공유 불가
- 리소스 사용 증가
- 초기 설정 비용 있음

---

## 상황별 추천 전략

### ✅ 단일 Agent 추천 상황

| 상황 | 이유 |
|------|------|
| **개인 프로젝트 (1인)** | 컨텍스트 공유가 유리, 관리 부담 최소 |
| **관련성 높은 프로젝트들** | 공통 패턴, 라이브러리 공유 필요 |
| **프로토타이핑/실험** | 빠른 시작, 설정 오버헤드 없음 |
| **규칙이 유사한 프로젝트** | 코딩 스타일, 규칙 충돌 없음 |

### ✅ 프로젝트별 Agent 분리 추천 상황

| 상황 | 이유 |
|------|------|
| **팀/클라이언트 프로젝트** | 명확한 책임 분리, 보안 격리 |
| **서로 다른 기술 스택** | Python vs Rust, Frontend vs Backend |
| **상충하는 코딩 규칙** | 프로젝트별 다른 스타일 가이드 |
| **민감한 정보 포함** | API 키, 내부 코드 등 격리 필요 |
| **장기 대규모 프로젝트** | 독립적인 메모리/컨텍스트 유지 |
| **다양한 모델 필요** | 고급 모델 vs 경제적 모델 선택 |

---

## 하이브리드 전략: 계층적 구성

복잡한 상황에서는 계층적 구성이 최적일 수 있다:

```
┌───────────────────────────────────────────┐
│             Orchestrator Agent            │
│        (라우팅, 조정, 공통 작업)           │
└────────────┬──────────────────┬───────────┘
             │                  │
     ┌───────▼──────┐    ┌──────▼──────┐
     │  Work Agent  │    │ Personal    │
     │  (회사/클라) │    │  Agent      │
     └──────┬───────┘    └─────────────┘
            │
    ┌───────┼───────┐
    │       │       │
┌───▼───┐ ┌─▼───┐ ┌─▼───┐
│Proj A │ │Proj B│ │Proj C│
└───────┘ └─────┘ └─────┘
```

**Orchestrator 역할:**
- 요청을 적절한 agent로 라우팅
- 공통 작업 처리 (문서, 조사)
- agent 간 조정

**Work Agent:**
- 비즈니스/클라이언트 프로젝트 전담
- 보안 격리 유지

**Personal Agent:**
- 개인 프로젝트, 실험
- 자유로운 컨텍스트

---

## 구현 예시

### 단일 Agent 설정

```json5
{
  agents: {
    defaults: {
      workspace: "~/.openclaw/workspace",
    },
  },
}
```

### 프로젝트별 Agent 분리 설정

```json5
{
  agents: {
    list: [
      {
        id: "work",
        name: "Work Projects",
        workspace: "~/.openclaw/workspace-work",
        model: "anthropic/claude-sonnet-4-5",
      },
      {
        id: "personal",
        name: "Personal Projects",
        workspace: "~/.openclaw/workspace-personal",
        model: "anthropic/claude-sonnet-4-5",
      },
      {
        id: "client-a",
        name: "Client A Project",
        workspace: "~/.openclaw/workspace-client-a",
        model: "anthropic/claude-opus-4-6",  // 고급 모델
      },
    ],
  },
  bindings: [
    { agentId: "work", match: { channel: "telegram", accountId: "work" } },
    { agentId: "personal", match: { channel: "telegram", accountId: "personal" } },
  ],
}
```

---

## 결론

| 상황 | 추천 전략 |
|------|-----------|
| 개인, 소규모, 유사 프로젝트 | **단일 Agent** |
| 팀/클라이언트, 보안 격리 필요 | **프로젝트별 Agent 분리** |
| 복잡한 다양한 요구사항 | **계층적 하이브리드** |

**핵심 원칙:**
1. **격리가 필요하면 분리** — 보안, 규칙, 기술 스택 차이
2. **공유가 유리하면 통합** — 관련 프로젝트, 개인 작업
3. **복잡하면 계층화** — 다양한 요구사항, 팀 규모

---

## 참고 자료

- [OpenClaw Multi-Agent Routing](/opt/homebrew/lib/node_modules/openclaw/docs/concepts/multi-agent.md)
- [OpenClaw Agent Runtime](/opt/homebrew/lib/node_modules/openclaw/docs/concepts/agent.md)
- [OpenClaw Agent Workspace](/opt/homebrew/lib/node_modules/openclaw/docs/concepts/agent-workspace.md)
