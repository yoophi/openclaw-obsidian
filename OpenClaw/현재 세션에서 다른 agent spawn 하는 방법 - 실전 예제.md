# 현재 세션에서 다른 agent spawn 하는 방법 - 실전 예제

작성일: 2026-03-19

이 문서는 설명보다 **바로 쓸 수 있는 예제**만 모아둔 버전이다.

---

## 1. 문서/분석 작업을 한 번만 맡기기

```json
{
  "task": "이 저장소 구조를 훑고 README 개선안 제안해줘",
  "runtime": "subagent",
  "mode": "run",
  "label": "readme-helper"
}
```

```json
{
  "task": "이 프로젝트 문서를 읽고 빠진 섹션을 정리해줘",
  "runtime": "subagent",
  "mode": "run",
  "label": "docs-reviewer"
}
```

```json
{
  "task": "이 파일들의 공통 문제점을 분석해서 요약해줘",
  "runtime": "subagent",
  "mode": "run",
  "label": "analysis-helper"
}
```

---

## 2. 지속 협업 세션으로 띄우기

```json
{
  "task": "이 프로젝트 프론트엔드 리팩터링 도와줘",
  "runtime": "subagent",
  "mode": "session",
  "label": "frontend-helper"
}
```

```json
{
  "task": "리팩터링 계획을 같이 세우자",
  "runtime": "subagent",
  "mode": "session",
  "label": "refactor-planner"
}
```

```json
{
  "task": "새 기능의 MVP 범위를 정의하는 걸 도와줘",
  "runtime": "subagent",
  "mode": "session",
  "label": "mvp-helper"
}
```

---

## 3. 띄운 세션에 후속 지시 보내기 (`sessions_send`)

```json
{
  "label": "frontend-helper",
  "message": "Button 컴포넌트부터 봐줘"
}
```

```json
{
  "label": "refactor-planner",
  "message": "우선순위가 높은 파일 3개만 먼저 골라줘"
}
```

```json
{
  "label": "mvp-helper",
  "message": "필수 기능과 나중에 넣을 기능을 분리해줘"
}
```

---

## 4. Codex로 작업 맡기기 (`runtime: "acp"`)

```json
{
  "task": "이 버그를 수정해줘",
  "runtime": "acp",
  "agentId": "codex",
  "mode": "session",
  "thread": true,
  "label": "bugfix-codex"
}
```

```json
{
  "task": "로그인 버그를 재현하고 수정 방향을 제안해줘",
  "runtime": "acp",
  "agentId": "codex",
  "mode": "session",
  "thread": true,
  "label": "login-bug-codex"
}
```

```json
{
  "task": "이 테스트 실패 원인을 찾고 수정안을 제안해줘",
  "runtime": "acp",
  "agentId": "codex",
  "mode": "session",
  "thread": true,
  "label": "test-fix-codex"
}
```

---

## 5. Claude Code로 작업 맡기기 (`runtime: "acp"`)

```json
{
  "task": "이 기능 구현 방향을 잡아줘",
  "runtime": "acp",
  "agentId": "claude-code",
  "mode": "session",
  "thread": true,
  "label": "feature-claude"
}
```

```json
{
  "task": "이 리팩터링 계획을 코드 수준에서 더 구체화해줘",
  "runtime": "acp",
  "agentId": "claude-code",
  "mode": "session",
  "thread": true,
  "label": "refactor-claude"
}
```

> 참고: 실제 사용 가능한 `agentId`는 환경 설정에 따라 다를 수 있다.

---

## 6. 작업 여러 개 던진 뒤 결과 대기 (`sessions_yield`)

### 예시 흐름

먼저 두 개를 띄운다:

```json
{
  "task": "문서 구조를 분석해줘",
  "runtime": "subagent",
  "mode": "run",
  "label": "docs-analyzer"
}
```

```json
{
  "task": "테스트 실패 원인을 찾아줘",
  "runtime": "subagent",
  "mode": "run",
  "label": "test-analyzer"
}
```

그다음 현재 턴을 넘긴다:

```json
{
  "message": "두 작업 끝나면 결과를 다음 턴에서 받을게"
}
```

---

## 7. 현재 세션에서 띄운 서브에이전트 상태 보기 (`subagents`)

```json
{
  "action": "list"
}
```

---

## 8. 방향 수정하기 (`subagents steer`)

```json
{
  "action": "steer",
  "target": "readme-helper",
  "message": "설치 섹션 개선에 집중해줘"
}
```

```json
{
  "action": "steer",
  "target": "frontend-helper",
  "message": "성능보다 유지보수성 관점으로 다시 봐줘"
}
```

---

## 9. 중지하기 (`subagents kill`)

```json
{
  "action": "kill",
  "target": "readme-helper"
}
```

```json
{
  "action": "kill",
  "target": "frontend-helper"
}
```

---

## 10. 가장 자주 쓰는 최소 패턴

### 한 번만 맡기기

```json
{
  "task": "이 코드의 문제점만 빠르게 요약해줘",
  "runtime": "subagent",
  "mode": "run",
  "label": "quick-review"
}
```

### 계속 협업하기

```json
{
  "task": "이 기능 설계를 같이 다듬자",
  "runtime": "subagent",
  "mode": "session",
  "label": "design-helper"
}
```

### 후속 지시 보내기

```json
{
  "label": "design-helper",
  "message": "API 설계부터 정리해줘"
}
```

### Codex로 맡기기

```json
{
  "task": "이 버그를 추적하고 수정안을 제안해줘",
  "runtime": "acp",
  "agentId": "codex",
  "mode": "session",
  "thread": true,
  "label": "bug-codex"
}
```

---

## 11. 복붙용 요약

### subagent 단발

```json
{
  "task": "...",
  "runtime": "subagent",
  "mode": "run",
  "label": "..."
}
```

### subagent 지속 세션

```json
{
  "task": "...",
  "runtime": "subagent",
  "mode": "session",
  "label": "..."
}
```

### 후속 메시지

```json
{
  "label": "...",
  "message": "..."
}
```

### ACP / Codex

```json
{
  "task": "...",
  "runtime": "acp",
  "agentId": "codex",
  "mode": "session",
  "thread": true,
  "label": "..."
}
```
