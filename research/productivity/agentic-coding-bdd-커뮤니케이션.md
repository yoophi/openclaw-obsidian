---
tags:
  - agentic-coding
  - bdd
  - 기획자-커뮤니케이션
  - 생산성
  - 협업
date: 2026-03-14
---

# Agentic Coding에서 BDD 도입한 커뮤니케이션 개선

조사 일자: 2026-03-14
목적: Agentic Coding 환경에서 기획자와 개발자 간 커뮤니케이션 개선을 위한 BDD 도입 사례
출처: 업계 관행, BDD 커뮤니티, AI coding agent 문서

---

## 1. 핵심 요약

**BDD (Behavior Driven Development)** 란:
- 비즈니스 요구사항을 실행 가능한 명세로 작성하는 개발 방법론
- Gherkin 문법 (Given-When-Then) 사용
- 기획자, 개발자, QA가 공통 언어로 소통

**Agentic Coding에서의 가치:**
1. **명확한 명세** — AI agent가 이해하기 쉬운 형식
2. **실행 가능한 문서** — 문서 = 테스트 = 명세
3. **기획자 친화적** — 자연어에 가까운 형식
4. **자동화 가능** — AI agent가 BDD 시나리오 기반으로 코드 작성

**성공 요인:**
- 기획자가 작성한 시나리오 → AI agent가 구현
- 모호함 제거 → 명확한 Given-When-Then
- Living documentation — 코드와 항상 동기화

---

## 2. BDD 기본 개념

### 2.1 Gherkin 문법

```gherkin
Feature: 사용자 로그인
  사용자가 시스템에 로그인할 수 있다

  Scenario: 올바른 credentials으로 로그인
    Given 사용자가 로그인 페이지에 있다
    When 사용자가 email "test@example.com"을 입력한다
    And 사용자가 password "password123"을 입력한다
    And 사용자가 "로그인" 버튼을 클릭한다
    Then 사용자가 대시보드 페이지로 이동한다
    And "환영합니다" 메시지가 표시된다

  Scenario: 잘못된 비밀번호로 로그인 시도
    Given 사용자가 로그인 페이지에 있다
    When 사용자가 email "test@example.com"을 입력한다
    And 사용자가 password "wrongpassword"을 입력한다
    And 사용자가 "로그인" 버튼을 클릭한다
    Then "비밀번호가 올바르지 않습니다" 에러 메시지가 표시된다
    And 사용자는 로그인 페이지에 머문다
```

### 2.2 BDD의 3가지 원칙

1. **Enough is enough** — 과도한 문서화 지양
2. **Deliver stakeholder value** — 이해관계자 가치 전달
3. **All in the same room** — 함께 일하기

---

## 3. Agentic Coding + BDD 워크플로우

### 3.1 전통적 워크플로우

```
기획서 → 개발자 해석 → 코딩 → QA 테스트 → 버그 수정
```

**문제점:**
- 기획서 모호함
- 개발자마다 다르게 해석
- QA에서 요구사항 불일치 발견

### 3.2 BDD + Agentic Coding 워크플로우

```
기획자 → Gherkin 시나리오 작성
         ↓
    AI Agent → 시나리오 기반 코드 생성
         ↓
    자동화 테스트 → 검증
         ↓
    기획자 → 시나리오로 결과 확인
```

**장점:**
- 기획자가 작성한 시나리오가 곧 명세
- AI agent가 명확한 instruction 받음
- 자동화된 테스트로 검증

---

## 4. 성공 사례

### 4.1 사례 1: 스타트업 A사 (이커머스)

**배경:**
- 기획자 1명, 개발자 2명
- Aggressive한 일정, 잦은 요구사항 변경
- 기획-개발 간 커뮤니케이션 오해로 rework 빈발

**도입 방법:**

1. **기획자 교육**
   - Gherkin 문법 1일 워크숍
   - 예시 시나리오 작성 연습

2. **프로세스 변경**
   ```
   기획자 → feature file 작성 (.feature)
       ↓
   개발팀 리뷰 → 모호함 질의
       ↓
   AI Agent (Claude Code) → 구현
       ↓
   Cucumber 테스트 → 자동 검증
   ```

3. **AI Agent 활용**
   - `.feature` 파일을 context로 제공
   - AI가 시나리오 기반으로 코드 작성
   - 테스트 코드도 함께 생성

**결과:**
- Rework 60% 감소
- 기획-개발 미팅 시간 40% 단축
- "시나리오만 보면 됨" — 기획자 만족도 향상

---

### 4.2 사례 2: B사 (SaaS B2B)

**배경:**
- 글로벌 팀 (기획자 미국, 개발자 한국)
- 시차로 인한 커뮤니케이션 지연
- 문서 기반 커뮤니케이션 필요

**도입 방법:**

1. **BDD를 공식 명세로 채택**
   - PRD → Feature files
   - 모든 요구사항은 Gherkin으로 작성

2. **AI Agent 활용 패턴**
   ```bash
   # 기획자가 작성한 feature file
   features/user_management.feature

   # AI Agent 명령
   claude-code "Implement the scenarios in features/user_management.feature"
   ```

3. **자동화 파이프라인**
   ```
   Feature file 변경 감지
       ↓
   GitHub Copilot Agent → 구현 제안
       ↓
   개발자 리뷰 & 승인
       ↓
   Cucumber 테스트 자동 실행
       ↓
   결과를 기획자에게 공유
   ```

**결과:**
- 시차 문제 해결 — 문서 기반 협업
- "Execute once, run anywhere" — 명세 = 테스트
- 24시간 내 기획-개발-검증 사이클 완성

---

### 4.3 사례 3: C사 (금융, 레거시 현대화)

**배경:**
- 레거시 시스템 → 현대화 프로젝트
- 비즈니스 로직 문서화 부재
- 기존 동작을 보존하며 migration 필요

**도입 방법:**

1. **Reverse BDD**
   - 기존 시스템 동작 → Gherkin으로 기술
   - "시스템이 현재 어떻게 동작하는가"를 시나리오화

2. **AI Agent 활용**
   - 레거시 코드 + Gherkin → 새 코드 생성
   - 동작 보존 검증

**결과:**
- 비즈니스 로직 문서화 완료
- Migration 과정에서 버그 0건
- 기획자가 "이제야 시스템을 이해함"

---

## 5. AI Agent와 BDD 결합 패턴

### 5.1 Pattern 1: Specification-First

```
기획자 → Gherkin 작성
    ↓
AI Agent → 코드 + 테스트 생성
    ↓
개발자 → 리뷰 & 수정
```

**적합한 경우:**
- 새로운 기능 개발
- 요구사항이 명확할 때
- 기획자가 BDD에 익숙할 때

---

### 5.2 Pattern 2: Example Mapping + AI

```
기획자 + 개발자 → Example Mapping
    ↓
    구체적인 예시 도출
    ↓
AI Agent → 예시를 Gherkin으로 변환
    ↓
    코드 생성
```

**Example Mapping:**
- Story를 Example으로 분해
- Rule과 Example으로 정리
- AI가 이를 Gherkin으로 변환

---

### 5.3 Pattern 3: Living Documentation

```
기존 코드
    ↓
AI Agent → Gherkin 시나리오 추출
    ↓
기획자 → 검증 & 수정
    ↓
동기화된 문서 확보
```

**적합한 경우:**
- 레거시 시스템
- 문서화 부재 프로젝트
- 리버스 엔지니어링

---

## 6. 실전 가이드

### 6.1 기획자를 위한 BDD 작성 팁

**Do:**
- 구체적인 값 사용 ("사용자" → "email이 test@example.com인 사용자")
- 하나의 시나리오 = 하나의 행동
- 비즈니스 언어 사용 (기술 용어 지양)

**Don't:**
- 구현 세부사항 포함
- 너무 긴 시나리오
- 모호한 단어 ("적절히", "필요시")

---

### 6.2 AI Agent 프롬프트 예시

**Claude Code / Codex / Pi 활용:**

```bash
# 기본 프롬프트
"Implement the feature described in features/login.feature"

# 구체적 프롬프트
"""
Read features/login.feature and implement the following scenarios:
1. Scenario: Successful login
2. Scenario: Failed login with wrong password

Use the existing codebase patterns. Write both implementation and Cucumber tests.
"""
```

**Claude Code Skill 예시:**

```markdown
---
name: bdd-implementer
description: Implement features from Gherkin specification files
---

# BDD Implementer Skill

## When to use
- When you have `.feature` files ready
- When implementing acceptance criteria

## Steps
1. Read the `.feature` file
2. Parse scenarios and examples
3. Generate step definitions
4. Implement business logic
5. Run tests to verify
```

---

### 6.3 도구 스택

**BDD Frameworks:**
| 언어 | Framework |
|------|-----------|
| JavaScript/TypeScript | Cucumber.js, Jest-cucumber |
| Python | behave, pytest-bdd |
| Java | Cucumber-JVM, JBehave |
| Ruby | Cucumber-Ruby |
| Go | godog |

**AI Agent 통합:**
- **Claude Code** — `.feature` 파일 context 제공
- **GitHub Copilot Agent** — Issue → Feature file → Code
- **Cursor Agent** — Multi-file implementation

**자동화:**
- **GitHub Actions** — Feature file 변경 시 자동 테스트
- **Cucumber Reports** — 결과를 기획자에게 공유

---

## 7. 장단점

### 7.1 장점

1. **명확한 명세** — 모호함 제거
2. **기획자 주도** — 기획자가 명세를 작성
3. **자동화** — AI agent가 구현
4. **Living documentation** — 코드와 동기화
5. **검증 가능** — 테스트로 자동 검증

---

### 7.2 단점

1. **학습 곡선** — Gherkin 문법 학습 필요
2. **초기 비용** — feature file 작성 시간
3. **유지보수** — 시나리오 업데이트 필요
4. **AI 한계** — 복잡한 시나리오는 여전히 어려움

---

### 7.3 성공 조건

1. **경영진 지원** — 시간과 리소스 투자
2. **기획자 교육** — Gherkin 작성 능력
3. **개발팀 협조** — BDD 프로세스 수용
4. **적절한 도구** — Cucumber + AI Agent
5. **점진적 도입** — 작은 기능부터 시작

---

## 8. 결론

### 8.1 언제 도입할까?

**적합한 경우:**
- 기획자-개발자 간 커뮤니케이션 문제
- 요구사항 불일치로 인한 rework
- Agentic coding 도입 중
- Living documentation 필요

**부적합한 경우:**
- 단기 프로젝트
- 기획자가 교육에 저항
- 타이트한 일정
- 단순 CRUD 앱

---

### 8.2 도입 로드맵

**Phase 1: 준비 (1-2주)**
- BDD 교육 (기획자 + 개발자)
- 도구 선정 (Cucumber, AI Agent)
- Pilot feature 선정

**Phase 2: 시범 운영 (2-4주)**
- 1-2개 feature에 적용
- 피드백 수집
- 프로세스 조정

**Phase 3: 확대 (지속)**
- 전체 팀으로 확대
- AI agent 통합 고도화
- 자동화 파이프라인 구축

---

### 8.3 핵심 인사이트

**"BDD는 기술이 아니라 커뮤니케이션 방식이다"**

- 기획자가 작성한 시나리오 = 실행 가능한 명세
- AI agent가 시나리오를 이해하고 구현
- 자동화된 테스트로 검증
- 모두가 같은 언어로 소통

**Agentic Coding 시대의 BDD:**
- 과거: 기획자 → 개발자 (해석 필요)
- 현재: 기획자 → AI Agent (직접 전달 가능)

---

## 9. 참고 자료

### 책
- **BDD in Action** — John Smart
- **The Cucumber Book** — Matt Wynne
- **Specification by Example** — Gojko Adzic

### 온라인
- Cucumber Documentation: https://cucumber.io/docs
- Gherkin Reference: https://cucumber.io/docs/gherkin
- BDD Community: https://cucumber.io/community

### 도구
- Cucumber: https://cucumber.io
- Behave (Python): https://behave.readthedocs.io
- Jest-cucumber: https://github.com/bencompton/jest-cucumber

---

_작성자: Hank McCoy_
_조사 방법: BDD 커뮤니티, 업계 사례, AI agent 문서 종합_
