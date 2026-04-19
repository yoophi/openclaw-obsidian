---
tags:
  - DESIGN.md
  - AI-코딩
  - 에이전트
  - CLAUDE.md
  - AGENTS.md
  - 디자인-시스템
  - Google-Stitch
date: 2026-04-19
---

# DESIGN.md — AI 코딩 에이전트를 위한 디자인 시스템 문서

조사 일자: 2026-04-19

---

## 1. 핵심 요약

**DESIGN.md**는 AI 코딩 에이전트(Claude Code, Cursor, Codex 등)가 **일관된 UI를 생성**하도록 돕는 마크다운 기반 디자인 시스템 명세 파일이다.

**한 줄 정의:** Figma/JSON 디자인 토큰 대신 **AI가 읽을 수 있는 평문 마크다운**으로 디자인 시스템을 기술하는 포맷

**핵심 가치:**
- AI 에이전트가 매 프롬프트마다 색상, 폰트, 간격을 재추론하지 않아도 됨
- 프로젝트 전체에서 UI 일관성 유지
- 버전 관리 가능, 사람이 읽을 수 있음
- Google Stitch가 최초 도입, 커뮤니티로 확산 중

---

## 2. 배경: 왜 DESIGN.md가 필요한가

### 2.1 문제

AI 코딩 에이전트를 사용할 때 발생하는 전형적인 문제:

```
1. 프롬프트: "버튼 컴포넌트 만들어줘" → primary: #3B82F6 (파란색)
2. 프롬프트: "카드 컴포넌트 만들어줘" → primary: #1D4ED8 (다른 파란색)
3. 프롬프트: "네비게이션 바 만들어줘" → primary: #2563EB (또 다른 파란색)
```

AI는 이전 대화의 디자인 결정을 **지속적으로 기억하지 못한다**. 매번 새로운 값을 추론하고, 결국 디자인이 어긋난다.

### 2.2 기존 해결책의 한계

| 방식 | 한계 |
|------|------|
| Figma 디자인 토큰 | AI가 직접 읽을 수 없음 (파싱 필요) |
| JSON 디자인 토큰 | 사람이 읽기 어렵고, 컨텍스트 윈도우를 많이 차지 |
| 매 프롬프트마다 지시 | 프롬프트가 길어지고, 여전히 불일치 발생 |
| Tailwind 설정 | 코드 수준이지 디자인 의도를 담지 못함 |

### 2.3 DESIGN.md의 해결

> 프로젝트 루트에 하나의 마크다운 파일로 전체 디자인 시스템을 기술. AI 에이전트가 **자동으로 읽고 일관되게 적용**.

---

## 3. DESIGN.md 파일 구조

### 3.1 포함되는 섹션

```markdown
# Design System

## Colors
- Primary: #1A73E8 (CTAs, 링크 전용)
- Secondary: #5F6368
- Background: #FFFFFF
- Surface: #F8F9FA
- Success: #34A853
- Error: #EA4335
- Warning: #FBBC04

## Typography
- Primary Font: Inter
- Heading H1: 32px / Bold / Line-height 1.2
- Heading H2: 24px / SemiBold / Line-height 1.3
- Body: 16px / Regular / Line-height 1.5
- Caption: 12px / Regular / Line-height 1.4

## Spacing
- Base unit: 8px
- xs: 4px | sm: 8px | md: 16px | lg: 24px | xl: 32px | 2xl: 48px

## Components
### Button
- Primary: bg #1A73E8, text white, radius 8px, padding 12px 24px
- Secondary: bg transparent, border #1A73E8, text #1A73E8
- Hover: darken 10%
- Disabled: opacity 0.5, cursor not-allowed

### Card
- bg white, shadow 0 1px 3px rgba(0,0,0,0.12)
- radius 12px, padding 24px

## Border Radius
- Small: 4px (inputs, tags)
- Medium: 8px (buttons)
- Large: 12px (cards, modals)

## Shadows
- sm: 0 1px 2px rgba(0,0,0,0.05)
- md: 0 4px 6px rgba(0,0,0,0.1)
- lg: 0 10px 15px rgba(0,0,0,0.15)
```

### 3.2 핵심 원칙

| 원칙 | 설명 |
|------|------|
| **정확한 값** | hex 코드, px 값 등 수치로 명시 (추상적 표현 금지) |
| **의미론적 이름** | `brand-primary` 등 용도별 이름 부여 |
| **Do's and Don'ts** | "brand-primary는 CTAs와 링크에만 사용" 같은 제약 명시 |
| **컴포넌트 상태** | hover, focus, disabled, active 상태 모두 정의 |

---

## 4. 다른 지시 파일과의 관계

### 4.1 에이전트 지시 파일 생태계

AI 코딩 에이전트 생태계에는 여러 지시 파일이 공존한다:

```
프로젝트 루트/
├── CLAUDE.md      ← Claude Code 전용 지시 (코드 규칙, 워크플로우)
├── AGENTS.md      ← 범용 에이전트 지시 (Codex, Cursor 등 공통)
├── DESIGN.md      ← UI/디자인 시스템 명세 (이 문서의 주제)
├── PLAN.md        ← 프로젝트 계획 (목표, 아키텍처, 로드맵)
├── PROGRESS.md    ← 개발 진행 상황 추적
└── src/
    └── AGENTS.md  ← 하위 패키지별 오버라이드
```

### 4.2 역할 비교

| 파일 | 대상 | 내용 | 누가 읽나 |
|------|------|------|-----------|
| **AGENTS.md** | 코드 | 빌드 명령, 린트 규칙, 프로젝트 구조, PR 워크플로우 | Codex, Cursor, Copilot, Claude 등 (60K+ 프로젝트 사용) |
| **CLAUDE.md** | 코드 | Claude Code 전용 지시. AGENTS.md의 Claude 버전 | Claude Code |
| **DESIGN.md** | UI | 색상, 타이포그래피, 간격, 컴포넌트 패턴 | Claude Code, Cursor, Copilot 등 |
| **PLAN.md** | 기획 | 프로젝트 목표, 기능 명세, 개발 전략 | Claude Code (참고용) |
| **PROGRESS.md** | 진행 | 완료/진행 중/예정 작업, 이슈 로그 | Claude Code (참고용) |

### 4.3 상호작용

```
AGENTS.md (코드 규칙)
    +
DESIGN.md (UI 규칙)
    = 일관된 코드 + 일관된 UI
```

CLAUDE.md에서 DESIGN.md를 참조하는 방식:
```markdown
# CLAUDE.md

## 디자인 규칙
- UI 생성 시 반드시 @DESIGN.md의 값을 사용
- DESIGN.md에 정의되지 않은 색상, 폰트, 간격 값을 임의로 생성하지 않음
- 컴포넌트의 모든 상태(hover, focus, disabled)를 DESIGN.md에서 확인
```

`@` 접두사가 Claude Code에게 "이 파일의 내용을 읽어라"는 의미.

---

## 5. AGENTS.md 심층

### 5.1 개요

AGENTS.md는 **AI 코딩 에이전트를 위한 README**. 60,000개 이상의 오픈소스 프로젝트에서 사용 중.

**주체:** OpenAI Codex, Amp, Google Jules, Cursor, Factory가 공동 개발. 현재 Agentic AI Foundation (Linux Foundation)이 관리.

### 5.2 포함 내용

```markdown
# AGENTS.md

## Setup commands
- Install deps: `pnpm install`
- Start dev server: `pnpm dev`
- Run tests: `pnpm test`

## Code style
- TypeScript strict mode
- Single quotes, no semicolons
- Use functional patterns where possible

## Testing instructions
- Run `pnpm test` before committing
- Add tests for any code you change

## PR instructions
- Title format: [<project_name>] <Title>
- Always run `pnpm lint` and `pnpm test` before committing
```

### 5.3 계층 구조

```
~/.claude/CLAUDE.md         ← 전역 (개인 설정)
프로젝트/AGENTS.md           ← 프로젝트 루트 (가장 중요)
프로젝트/src/AGENTS.md       ← 하위 패키지 오버라이드
```

**규칙:** 가장 가까운 AGENTS.md가 우선. 사용자 프롬프트가 모두 우선.

---

## 6. Google Stitch와 DESIGN.md

### 6.1 Google Stitch란

Google Labs의 AI 디자인 도구. 텍스트 설명이나 참고 이미지로 UI를 생성하며, 결과물로 design.md 파일을 함께 출력.

### 6.2 워크플로우

```
1. Google Stitch에서 UI 설명
   "SaaS 분석 대시보드, 다크 네이비 + 오프화이트 팔레트"

2. Stitch가 화면 + design.md 생성

3. design.md를 프로젝트 루트에 저장

4. CLAUDE.md에서 @design.md 참조

5. Claude Code가 design.md의 값만 사용하여 UI 생성
```

### 6.3 핵심 특징

- **AI가 읽도록 설계됨**: Figma나 JSON 토큰과 달리 LLM이 네이티브로 파싱 가능
- **버전 관리**: Git으로 디자인 변경 이력 추적
- **컴팩트**: 컨텍스트 윈도우를 적게 차지

---

## 7. DESIGN.md 커뮤니티 생태계

### 7.1 DESIGNmd (designmd.ai)

100개 이상의 무료 DESIGN.md 파일을 제공하는 커뮤니티 라이브러리.

**기능:**
- 스타일, 색상, 용도별 검색
- 원클릭 다운로드
- MCP 서버 지원 (Claude Code, Cursor에서 직접 검색 가능)

**MCP 설정 (Claude Code):**
```json
{
  "mcpServers": {
    "designmd": {
      "command": "npx",
      "args": ["designmd-mcp"]
    }
  }
}
```

### 7.2 Awesome DESIGN.md

58개 이상의 인기 웹사이트에서 추출한 DESIGN.md 컬렉션.

### 7.3 기여

GitHub 계정으로 누구나 DESIGN.md를 업로드 가능. 자동 리뷰 후 커뮤니티에 공개.

---

## 8. 실전 사용 가이드

### 8.1 설정 (Claude Code 기준)

**1단계: DESIGN.md 배치**
```
my-project/
├── DESIGN.md
├── CLAUDE.md
├── src/
└── ...
```

**2단계: CLAUDE.md에 참조 추가**
```markdown
# CLAUDE.md

## 디자인 규칙
- UI 생성 시 반드시 @DESIGN.md를 따름
- DESIGN.md에 정의된 색상, 폰트, 간격만 사용
- 정의되지 않은 값은 임의 생성 금지
- 컴포넌트 상태(hover, focus, disabled)를 DESIGN.md에서 확인 후 구현
```

**3단계: 검증**
```
"이 프로젝트의 primary color가 뭐야?"
→ 정확한 hex 값 (#1A73E8)을 반환하면 성공
```

### 8.2 Tailwind 연동

DESIGN.md의 값을 Tailwind 설정으로 변환:
```
"DESIGN.md를 읽고 tailwind.config.js에 모든 색상, 간격, 타이포그래피 값을 매핑해줘"
```

이렇게 하면 두 번째 방어선이 생성됨 — 프롬프트가 약간 벗어나도 Tailwind 유틸리티 클래스가 실제 토큰 값으로 제한.

### 8.3 일관성 감사

정기적으로 실행:
```
"/components의 컴포넌트 중 DESIGN.md에 정의되지 않은 색상이나 간격을 사용하는 것을 찾아줘"
```

### 8.4 모노레포에서의 활용

```
프로젝트/
├── DESIGN.md          ← 전역 디자인 시스템
├── CLAUDE.md
├── apps/
│   ├── web/
│   │   └── DESIGN.md  ← 웹 전용 오버라이드
│   └── mobile/
│       └── DESIGN.md  ← 모바일 전용 오버라이드
```

---

## 9. 장단점

### 9.1 장점

- **일관성**: AI가 동일한 디자인 값을 지속적으로 사용
- **단순함**: 마크다운 파일 하나. 학습 비용 없음
- **버전 관리**: Git으로 디자인 변경 이력 추적
- **도구 독립**: Claude Code, Cursor, Copilot 등 모든 AI 코딩 도구에서 사용 가능
- **커뮤니티**: 100+ 무료 디자인 시스템 라이브러리
- **MCP 통합**: 에이전트에서 직접 디자인 시스템 검색/다운로드

### 9.2 단점 / 한계

- **수동 유지보수**: 디자인이 변경되면 직접 업데이트해야 함
- **Figma 직접 연동 없음**: Figma → DESIGN.md 자동 변환 경로가 아직 부족
- **AI가 여전히 이탈**: CLAUDE.md에서 명시해도 가끔 임의 값 사용
- **구조 표준 부재**: 공식 스키마가 없어 프로젝트마다 형식이 다름
- **대규모 시스템에 부적합**: 수백 개 컴포넌트의 디자인 시스템은 파일이 너무 길어짐

---

## 10. 결론

DESIGN.md는 **AI 코딩 에이전트를 위한 디자인 시스템의 사실상 표준**으로 자리잡고 있다. AGENTS.md가 코드 규칙을 담당한다면, DESIGN.md는 UI 규칙을 담당하여 둘이 함께 "AI 팀원의 온보딩 매뉴얼"을 완성한다.

Google Stitch가 최초 도입했지만, 이제 Claude Code, Cursor, Copilot 등 모든 AI 코딩 도구에서 사용 가능한 포맷으로 확산되었다. 커뮤니티 라이브러리(designmd.ai, awesome-design-md)도 활성화되어 있어, 새 프로젝트를 시작할 때 기존 디자인 시스템을 바로 가져와 사용할 수 있다.

**실천 권장사항:**
1. 프로젝트에 DESIGN.md를 루트에 배치
2. CLAUDE.md (또는 AGENTS.md)에서 `@DESIGN.md`로 참조
3. Tailwind 등 CSS 프레임워크 설정과 연동
4. 정기적으로 일관성 감사 실행
5. 디자인 변경 시 DESIGN.md도 함께 업데이트

---

## 11. 참고 자료

- Google Stitch + DESIGN.md 가이드: https://www.mindstudio.ai/blog/google-stitch-design-md-claude-code-consistent-ui
- DESIGNmd 커뮤니티 라이브러리: https://designmd.ai/
- DESIGN.md + Claude Code 설정: https://designmd.app/en/guides/claude-code
- AGENTS.md 공식 사이트: https://agents.md/
- AI 코딩 에이전트 지시 파일 개요: https://aruniyer.github.io/blog/agents-md-instruction-files.html
- ClaudeCode Mastery Handbook (PLAN.md/PROGRESS.md): https://github.com/hamodywe/ClaudeCode-Mastery-Handbook
- PyTorchKR 원문 (wikidocs, jaehong): https://discuss.pytorch.kr/t/graphify-ai-knowledge-graph/9652
- CLAUDE.md + AGENTS.md 실전 가이드: https://tianpan.co/blog/2026-02-25-claude-md-agents-md-ai-coding-agent-instruction-files

---

_조사: Research Agent (행크)_
