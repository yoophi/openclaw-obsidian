---
tags:
  - github
  - desktop-app
  - tauri
  - react
  - acp
  - coding-agent
  - 개인프로젝트
date: 2026-07-08
---

# Agentic Workspace 프로젝트 조사

조사 일자: 2026-07-08
저장소: https://github.com/yoophi/agentic-workspace

## 핵심 요약

Agentic Workspace는 유박사(yoophi)의 개인 프로젝트로, **로컬 데스크톱 환경에서 AI 코딩 에이전트를 활용한 소프트웨어 개발을 지원하는 모노레포**다. 핵심 앱인 **Agentic Workbench**는 Git worktree 관리와 ACP(Agent Client Protocol) 기반 에이전트 실행을 단일 Tauri 데스크톱 앱에서 통합한다.

- **생성일:** 2026-06-22
- **최근 업데이트:** 2026-07-08 (활발히 개발 중)
- **주 언어:** TypeScript (63%), Rust (37%)
- **Star:** 1 / **Fork:** 0
- **오픈 이슈:** 13개 / **오픈 PR:** 1개
- **릴리스:** 없음 (개발 단계)

## 상세 분석

### 포함된 앱

| 앱 | 경로 | 용도 |
| --- | --- | --- |
| **Agentic Workbench** | `apps/agentic-workbench` | 메인 데스크톱 앱. 프로젝트·worktree·ACP 에이전트 세션 관리 |
| **Markdown Annotator** | `apps/markdown-annotator` | Markdown 주석 도구. 코딩 에이전트용 구조화 프롬프트 내보내기 |
| **Git Explorer** | `apps/git-explorer` | Git 저장소 탐색 UI |

### 공유 패키지

| 패키지 | 용도 |
| --- | --- |
| `packages/ui` | 공유 React UI 프리미티브 |
| `packages/git-graph` | Git 브랜치 그래프 라이브러리 |
| `packages/git-ui` | Git 관련 공유 UI |
| `packages/markdown-annotation-core` | Markdown 주석 핵심 로직 |
| `packages/markdown-annotation-react` | Markdown 주석 React 컴포넌트 |
| `packages/workspace-auto-refresh` | 워크스페이스 자동 새로고침 |
| `crates/git-core` | Rust Git 핵심 로직 |

### Agentic Workbench 핵심 기능

- 로컬 프로젝트 등록 (이름, 작업 디렉토리, 설명)
- Git remote, branch, worktree 읽기 및 UI에서 생성/삭제
- Worktree별 세션 페이지에서 ACP 에이전트 실행
- ACP 런 출력, 툴 업데이트, 권한 프롬프트 스트리밍
- Worktree별 목표, 저장 프롬프트, 프로바이더 세션, 런 설정 추적
- 다중 창/탭 지원 (새 창, 새 탭, 현재 창에서 세션 열기)
- MCP 세션 타이틀 컨트롤
- Mermaid preview 모달
- ACP tool prompt 자동완성

### 기술 스택

**프론트엔드:**
- React 19 + Vite + TypeScript
- React Router + TanStack Query
- Tailwind CSS 4 + shadcn/ui 스타일 프리미티브
- Feature-Sliced Design 아키텍처

**백엔드 (Tauri):**
- Tauri 2 (Rust)
- 헥사고날 아키텍처 (domain / application / inbound / infrastructure)
- `agent-client-protocol` 기반 ACP 통합

**빌드/도구:**
- pnpm workspace + Turbo
- Cargo (Rust)
- Storybook

### 아키텍처 특징

**프론트엔드 (Feature-Sliced Design):**
```
app/       앱 구성 및 라우팅 상태
pages/     화면 단위 UI
features/  사용자 액션 및 비즈니스 인터랙션
entities/  도메인 모델, API 어댑터
shared/    재사용 가능한 유틸리티
```

**백엔드 (헥사고날 아키텍처):**
```
domain/          순수 도메인 모델 및 포트
application/     유스케이스 및 비즈니스 규칙
inbound/         Tauri 명령 등 인바운드 어댑터
infrastructure/  Git, ACP, 영속성, 파일시스템 어댑터
```

### 문서화 수준

`docs/` 폴더에 27개의 설계 문서가 존재하며, 아키텍처 결정부터 기능 구현 계획까지 상세히 기록되어 있다. 주요 문서:

- `portable-architecture-plan.md` - 이식 가능한 아키텍처 계획
- `agent-run-session-portability-design.md` - 에이전트 런 세션 이식성
- `ralph-mode-implementation.md` - Ralph 모드 구현
- `acp-http-websocket-transport-design.md` - ACP HTTP/WebSocket 전송 설계
- `git-feature-sharing-monorepo-strategy.md` - Git 기능 모노레포 공유 전략

### 개발 활동

최근 커밋 (2026-07-08 기준):
- `feat(aw): polish worktree session UI (#136)`
- `feat: expand mermaid preview modal support (#135)`
- `fix(aw): display Korean git filenames`
- `refactor(aw): simplify extra agent run panel code`
- `feat(aw): add MCP session title control`

오픈 이슈는 UI 개선, 터미널 통합, 권한 다이얼로그 개선 등 사용자 경험 향상에 집중되어 있다.

## 장단점

### 장점

1. **로컬 우선 설계** — 클라우드 의존 없이 로컬 Git 환경에서 직접 동작
2. **ACP 표준 준수** — Agent Client Protocol을 통해 다양한 코딩 에이전트(Codex 등) 통합 가능
3. **견고한 아키텍처** — 헥사고날 아키텍처와 Feature-Sliced Design으로 도메인 분리 명확
4. **활발한 개발** — 매일 커밋이 이루어지는 활발한 프로젝트
5. **상세한 문서화** — 27개의 설계 문서로 의사결정 과정이 투명하게 기록됨
6. **다중 창/탭 지원** — macOS native tab, 별도 창 등 유연한 세션 관리

### 단점/제약

1. **개인 프로젝트** — 1 star, 커뮤니티 기여 없음. 유지보수가 개인에 의존
2. **개발 초기 단계** — 릴리스 없음, breaking change 가능성 높음
3. **Tauri 의존성** — 데스크톱 앱이므로 웹 접근 불가, 플랫폼별 빌드 필요
4. **러닝 커브** — ACP, Tauri, Feature-Sliced Design 등 익숙하지 않은 개념이 많음
5. **제한적인 에이전트 지원** — ACP 호환 에이전트로 제한

## 결론

Agentic Workspace는 **ACP 기반 코딩 에이전트를 로컬 데스크톱에서 통합 관리하려는 야심찬 프로젝트**다. 단순히 에이전트를 실행하는 것을 넘어, Git worktree를 활용한 격리된 작업 환경, 다중 창 세션, 권한 관리까지 갖춘 통합 워크벤치를 목표로 한다.

특히 주목할 점은:
- **ACP 표준을 전면 채택**하여 특정 에이전트에 종속되지 않는 설계
- **Rust + React 구조**로 성능과 개발 경험을 동시 확보
- **헥사고날 아키텍처**로 백엔드 도메인 로직 보호

현재는 개인 프로젝트로 활발히 개발 중이며, ACP 생태계가 성장하면 그 가치가 더욱 커질 가능성이 있다.

## 참고 자료

- [GitHub 저장소](https://github.com/yoophi/agentic-workspace)
- [Agent Client Protocol](https://github.com/nicholasgriffintn/agent-client-protocol)
- [Tauri 2](https://v2.tauri.app/)
