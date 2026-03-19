# 현재 세션에서 다른 agent spawn 하는 방법

작성일: 2026-03-19

## 개요

현재 세션에서 다른 agent를 띄우는 가장 표준적인 방법은 `sessions_spawn` 도구를 사용하는 것이다. 
이 방식은 크게 두 가지로 나뉜다.

1. **subagent 실행**: OpenClaw 내부 서브에이전트를 띄워 작업 위임
2. **ACP harness 실행**: Codex, Claude Code 같은 외부 코딩 에이전트 세션을 띄워 작업 위임

상황에 따라 `mode`, `runtime`, `label`, `thread` 등을 다르게 설정하면 된다.

---

## 1. 가장 기본: `sessions_spawn`

`sessions_spawn`는 현재 세션에서 별도의 작업 세션을 생성하는 도구다.

핵심 파라미터:

- `task`: 새 agent에게 전달할 작업 지시문
- `runtime`: 어떤 종류의 agent를 띄울지 지정
  - `subagent`
  - `acp`
- `mode`: 실행 방식
  - `run`: 한 번 실행하고 종료하는 단발성 작업
  - `session`: 살아 있는 세션을 만들어 이후에도 계속 대화 가능
- `label`: 사람이 구분하기 쉬운 이름
- `thread`: 채팅/스레드 기반 지속 세션이 필요한 경우 사용

---

## 2. `subagent`로 띄우기

### 언제 쓰나

이 경우는 OpenClaw 내부에서 비교적 독립적인 작업을 맡길 때 적합하다.

예:
- 저장소 구조 분석
- 문서 초안 작성
- 긴 조사 작업 위임
- 현재 작업과 분리된 보조 분석

### 2-1. 단발성 실행 (`mode: "run"`)

한 번 맡기고 결과만 받는 패턴이다.

예시:

```json
{
  "task": "이 저장소 구조를 훑고 README 개선안 제안해줘",
  "runtime": "subagent",
  "mode": "run",
  "label": "readme-helper"
}
```

특징:
- 작업이 끝나면 결과를 반환하고 종료
- 짧고 명확한 위임 작업에 적합
- 후속 대화가 필요 없을 때 편함

### 2-2. 지속 세션 실행 (`mode: "session"`)

계속 대화하면서 협업하려면 세션 모드가 적합하다.

예시:

```json
{
  "task": "이 프로젝트 프론트엔드 리팩터링 도와줘",
  "runtime": "subagent",
  "mode": "session",
  "label": "frontend-helper"
}
```

특징:
- 띄운 뒤 계속 메시지를 보낼 수 있음
- 큰 작업을 단계적으로 나눠 맡기기 좋음
- 이후 `sessions_send`로 추가 지시 가능

---

## 3. 띄운 뒤 추가 메시지 보내기: `sessions_send`

`mode: "session"`으로 띄웠다면, 이후 같은 agent에게 계속 작업을 이어서 요청할 수 있다.

예시:

```json
{
  "label": "frontend-helper",
  "message": "Button 컴포넌트부터 봐줘"
}
```

다른 예시:

```json
{
  "label": "frontend-helper",
  "message": "방금 본 구조를 기준으로 우선순위 높은 리팩터링 항목 3개만 추려줘"
}
```

실무 팁:
- `label`을 잘 정하면 이후 찾기 쉽다.
- 큰 일을 맡길 때는 처음 task를 넓게, 이후 `sessions_send`로 점진적으로 좁혀가는 방식이 효율적이다.

---

## 4. 결과를 기다리는 방식: `sessions_yield`

다른 agent를 띄운 뒤 현재 턴을 마치고, 완료 이벤트를 다음 메시지로 받고 싶다면 `sessions_yield`를 사용하면 된다.

흐름:
1. `sessions_spawn` 호출
2. 필요하면 여러 agent를 띄움
3. `sessions_yield` 호출
4. 완료 알림 또는 결과를 다음 턴에서 받음

이 패턴은 장시간 작업이나 병렬 위임에 특히 유용하다.

---

## 5. 상태 확인 / 개입: `subagents`

필요할 때만 현재 세션에서 띄운 서브에이전트를 관리할 수 있다.

### 목록 보기

```json
{
  "action": "list"
}
```

### 방향 수정

```json
{
  "action": "steer",
  "target": "readme-helper",
  "message": "README 제안보다 설치 섹션 개선에 집중해줘"
}
```

### 중지

```json
{
  "action": "kill",
  "target": "readme-helper"
}
```

주의:
- 상태 확인은 필요할 때만 한다.
- 반복 폴링은 피하는 것이 좋다.

---

## 6. ACP harness로 띄우기 (`runtime: "acp"`)

사용자가 다음처럼 특정 에이전트를 명시하는 경우가 있다.

예:
- "codex로 해줘"
- "claude code로 처리해줘"
- "gemini 같은 코딩 에이전트로 돌려줘"

이럴 때는 일반 `subagent`가 아니라 **ACP harness**를 써야 한다.

핵심 규칙:
- `runtime`은 `"acp"`
- 보통 `agentId`를 명시해야 함
- 로컬 `exec`로 우회하지 말고 `sessions_spawn`를 써야 함

### 예시: Codex 세션

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

의미:
- `runtime: "acp"` → ACP 기반 에이전트 실행
- `agentId: "codex"` → 어떤 ACP 에이전트를 쓸지 지정
- `mode: "session"` → 계속 대화 가능한 세션 생성
- `thread: true` → 채팅 문맥에서 thread-bound 세션으로 유지

---

## 7. ACP와 subagent의 차이

### `subagent`

적합한 경우:
- OpenClaw 내부 작업 위임
- 문서 정리, 조사, 분해, 분석
- 비교적 가벼운 보조 작업

### `acp`

적합한 경우:
- Codex / Claude Code / Pi 같은 외부 코딩 에이전트를 직접 사용할 때
- 코드 작성, 수정, 리팩터링, 구현 위임
- 사용자가 특정 coding agent를 명시했을 때

간단히 말하면:
- **일반 위임 작업** → `subagent`
- **특정 코딩 에이전트 호출** → `acp`

---

## 8. 자주 쓰는 패턴

### 패턴 A. 한 번만 맡기기

```json
{
  "task": "이 파일들의 공통 문제점을 정리해줘",
  "runtime": "subagent",
  "mode": "run",
  "label": "analysis-helper"
}
```

적합:
- 분석 1회
- 결과만 받으면 되는 작업

### 패턴 B. 지속 협업

```json
{
  "task": "이 기능 설계 도와줘",
  "runtime": "subagent",
  "mode": "session",
  "label": "design-helper"
}
```

이후:

```json
{
  "label": "design-helper",
  "message": "MVP 범위만 먼저 좁혀줘"
}
```

적합:
- 여러 번 주고받는 협업
- 점진적 작업 분해

### 패턴 C. Codex/Claude Code 요청 처리

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

적합:
- 사용자가 특정 coding agent를 원할 때
- 구현/수정 중심 작업

---

## 9. 추천 실무 규칙

### 라벨을 꼭 붙이기

라벨이 없으면 나중에 여러 agent를 구분하기 어려워진다.

좋은 예:
- `readme-helper`
- `frontend-helper`
- `login-bug-codex`

### task는 처음부터 너무 길지 않게

처음 task에는 큰 방향만 넣고, 세부 조정은 후속 메시지로 보내는 편이 낫다.

### ACP 요청은 ACP로 처리하기

사용자가 Codex/Claude Code를 명시했으면:
- `exec`로 로컬에서 비슷하게 흉내내지 말 것
- `runtime: "acp"`로 정확하게 띄울 것

### 장시간 작업은 yield 활용

spawn 후 바로 결과를 기다리기보다, `sessions_yield`로 턴을 넘겨 완료 이벤트를 받는 패턴이 안정적이다.

---

## 10. 최소 기억 버전

정말 핵심만 기억하면 아래 세 가지다.

1. **한 번만 맡기기**
   - `sessions_spawn(... mode: "run")`
2. **계속 협업하기**
   - `sessions_spawn(... mode: "session")`
3. **추가 지시 보내기**
   - `sessions_send(...)`

그리고 사용자가 Codex/Claude Code 같은 특정 coding agent를 원하면:

4. **ACP로 띄우기**
   - `sessions_spawn(... runtime: "acp", agentId: "..." )`

---

## 11. 예시 요약

### 예시 1: 문서 분석 맡기기

```json
{
  "task": "이 프로젝트 문서를 읽고 빠진 섹션을 정리해줘",
  "runtime": "subagent",
  "mode": "run",
  "label": "docs-reviewer"
}
```

### 예시 2: 장기 협업 세션 시작

```json
{
  "task": "리팩터링 계획을 같이 세우자",
  "runtime": "subagent",
  "mode": "session",
  "label": "refactor-planner"
}
```

후속 메시지:

```json
{
  "label": "refactor-planner",
  "message": "우선순위가 높은 파일부터 정리해줘"
}
```

### 예시 3: Codex로 구현 맡기기

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

## 결론

현재 세션에서 다른 agent를 spawn할 때는 기본적으로 `sessions_spawn`를 중심으로 생각하면 된다.

- 일반 작업 위임 → `subagent`
- 특정 코딩 에이전트 호출 → `acp`
- 한 번만 실행 → `mode: "run"`
- 계속 협업 → `mode: "session"`
- 추가 지시 → `sessions_send`
- 완료 대기 → `sessions_yield`
- 상태 개입 → `subagents`

실제로는 아래 한 줄로 요약할 수 있다.

> **보조 작업이면 `subagent`, Codex/Claude Code면 `acp`, 단발이면 `run`, 계속 협업이면 `session`.**
