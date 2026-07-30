---
tags:
  - terminal
  - ai-agent
  - multiplexer
  - developer-tools
  - open-source
  - rust
date: 2026-07-30
---

# Herdr (herdrdev/herdr) — Agent Multiplexer, tmux 비교 분석

조사 일자: 2026-07-30
레포지토리: https://github.com/herdrdev/herdr
공식 사이트: https://herdr.dev
라이선스: Apache 2.0
언어: Rust (단일 바이너리)

---

## 1. 핵심 요약

Herdr는 **터미널 안에 사는 AI 에이전트 멀티플렉서**다. 여러 코딩 에이전트(Claude Code, Codex, Grok, Gemini CLI 등)를 각각의 터미널 pane에서 실행하고, 상태(blocked / working / done / idle)를 실시간으로 추적하며, SSH 어디서나 재접속할 수 있는 persistent 서버 구조를 제공한다.

tmux가 범용 터미널 멀티플렉서라면, Herdr는 **AI 에이전트 실행과 오케스트레이션에 특화된 터미널 멀티플렉서**다.

---

## 2. tmux와의 차별화된 목표

### 2.1 근본적 차이: 범용 vs 에이전트 특화

| 구분 | tmux | Herdr |
|------|------|-------|
| **정체성** | 범용 터미널 멀티플렉서 | 에이전트 멀티플렉서 |
| **대상 사용자** | 모든 터미널 사용자 | AI 코딩 에이전트를 동시 실행하는 개발자 |
| **상태 추적** | 없음 (pane은 그저 터미널) | 에이전트 상태 자동 감지 (blocked/working/done/idle) |
| **에이전트 감지** | 불가 | 프로세스, 화면 매니페스트, 라이프사이클 훅으로 자동 감지 |
| **제어 인터페이스** | tmux 명령어 | CLI + Socket API (에이전트가 Herdr 자체를 제어 가능) |
| **마우스 지원** | 제한적 | 마우스 네이티브 (클릭, 드래그, 분할, 우클릭 메뉴) |
| **의존성** | ncurses | Rust 단일 바이너리 (Electron 없음) |

### 2.2 Herdr가 목표하는 차별화

1. **에이전트 상태의 시각적 롤업**
   - tmux: pane이 실행 중인지 멈춰 있는지 사용자가 직접 확인해야 함
   - Herdr: 각 pane의 에이전트 상태를 자동 분류해서 사이드바에 롤업. 어느 에이전트가 입력을 기다리고(blocked), 어느 것이 작업 중인지(working) 한눈에 파악

2. **에이전트-에이전트 협업 (Socket API)**
   - tmux: tmux 명령으로 pane을 만들 수 있지만, 에이전트가 다른 에이전트를 기다리는 것은 불가능
   - Herdr: 순수 Socket API로 에이전트가 pane을 생성하고, 다른 에이전트의 출력을 읽고, 완료를 대기 가능. `agent.wait`로 특정 에이전트가 done 상태가 될 때까지 대기

3. **에이전트 감지 시스템**
   - tmux: pane 안에서 무슨 프로그램이 돌고 있는지 관심 없음
   - Herdr: 화면 매니페스트(TOML 기반) + 라이프사이클 훅 + 프로세스 감지로 20종 이상 에이전트 자동 인식. 원격 매니페스트 자동 업데이트로 새로운 에이전트 UI 패턴 학습

4. **트리 단위 세션 복원**
   - tmux: 세션/윈도우/pane 구조는 plugin으로 복원 가능하지만 에이전트 상태는 복원 불가
   - Herdr: 워크스페이스 → 탭 → pane 구조를 서버 재시작 후 복원. 에이전트 세션 ID 추적으로 네이티브 세션 복원 지원

---

## 3. 주요 기능

### 3.1 에이전트 상태 자동 감지

| 상태 | 의미 |
|------|------|
| blocked | 에이전트가 입력, 승인, 결정을 기다리는 중 |
| working | 에이전트가 활발히 실행 중 |
| done | 에이전트가 완료했고 사용자가 아직 확인 안 함 |
| idle | 에이전트가 대기 중이거나 사용자가 확인함 |

감지 방식 (3계층):
- **라이프사이클 훅**: 에이전트에 통합 설치 시 가장 정확한 상태 보고
- **화면 매니페스트**: 터미널 하단 버퍼 스냅샷으로 패턴 매칭 (TOML 규칙)
- **프로세스 감지**: foreground 프로세스 이름으로 에이전트 식별

지원 에이전트 (20+): Claude Code, Codex, GitHub Copilot CLI, Cursor Agent CLI, Grok, Gemini CLI, Amp, Devin, Kimi Code, Qoder, Droid, OpenCode, Kilo Code, Kiro, Hermes, MastraCode, Antigravity, Maki, Pi, Cline 등

### 3.2 Socket API — 핵심 차별화

에이전트와 스크립트가 Herdr를 제어하는 로컬 소켓 API:

```
herdr agent wait w1:p1 --until done
herdr pane split w1:p1 --direction right
herdr pane run w1:p2 "npm test"
herdr pane read w1:p2 --source recent --lines 50
```

주요 메서드 영역:
- **Workspace**: create, list, focus, rename, close
- **Tab**: create, list, focus, rename, close
- **Pane**: split, swap, resize, zoom, read, send_text, send_keys, close
- **Agent**: list, get, read, explain, prompt, wait, rename, focus, start
- **Layout**: export, apply (BSP 트리 구조)
- **Events**: subscribe, wait (상태 변화 구독)
- **Plugin**: link, list, enable, disable, action.invoke

`agent.wait`는 서버 소유의 이벤트 기반 대기. pane의 에이전트를 pinned해서 교체로는 만족시킬 수 없음. `agent.prompt`는 제출 + 대기를 한 번에 수행해 레이스 컨디션 방지.

### 3.3 영속성과 원격 접속

- **백그라운드 서버**: 클라이언트가 detach해도 에이전트 계속 실행
- **SSH 원격 모드**: `herdr --remote workbox` — 로컬 클라이언트가 SSH로 원격 서버에 연결
- **세션 복원**: 서버 재시작 시 워크스페이스/탭/pane 구조 복원
- **네임드 세션**: `herdr session attach work` — 독립적인 런타임 네임스페이스
- **터미널 관찰자 모드**: 제3자 브릿지가 렌더링된 터미널 바이트를 읽기 전용으로 스트리밍 (JSON NDJSON)

### 3.4 플러그인 시스템
- pane과 워크플로 확장
- 마켓플레이스: https://herdr.dev/plugins/
- Socket API로 플러그인 액션 호출 가능

### 3.5 입력 방식
- tmux 스타일 prefix 키 (ctrl+b)
- 마우스 네이티브 (클릭, 드래그, 분할)
- 모드: Terminal mode, Prefix mode, Navigate mode
- `mouse_capture = false`로 마우스 캡처 비활성화 가능

---

## 4. 장단점 분석

### 장점 ✅

| 항목 | 설명 |
|------|------|
| **가벼움** | Rust 단일 바이너리. Electron 없음. 기존 터미널에서 실행 |
| **에이전트 상태 추적** | tmux에는 없는 핵심 기능. 어느 에이전트가 주의를 필요로 하는지 즉시 파악 |
| **Socket API** | 에이전트가 Herdr를 제어. 에이전트 간 협업, 자동화된 오케스트레이션 가능 |
| **마우스 네이티브** | 키보드만 고집하지 않음. 클릭/드래그/분할 모두 지원 |
| **20+ 에이전트 감지** | 주요 코딩 에이전트 자동 인식. 매니페스트 원격 업데이트 |
| **영속성** | detach 후에도 에이전트 실행 유지. SSH 재접속으로 어디서나 이어서 작업 |
| **로컬 CLI 도구** | tmux 명령어보다 직관적인 CLI (`herdr agent wait`, `herdr pane split` 등) |
| **터미널 내 동작** | 원하는 터미널 에뮬레이터 그대로 사용. Ghostty, iTerm, Alacritty 등 |
| **플러그인 생태계** | 확장 가능한 구조. 마켓플레이스 존재 |

### 단점 ❌

| 항목 | 설명 |
|------|------|
| **초기 단계** | v0.4.0. 이슈 115개, PR 9개 — Orca(이슈 1,200+) 대비 작은 커뮤니티 |
| **Windows 미지원** | Windows는 beta. SSH logout이 서버를 죽이는 버그 (#2008), WSL2 클라이언트 드롭 (#2006) |
| **IME 버그** | 중국어 ibus-rime 입력 시 마지막 문자 삭제 불가 (#2009). 한국어 IME도 잠재적 위험 |
| **마우스 버그** | Grok pane에서 마우스 휠 무반응 (#1997). 일부 에이전트에서 마우스 이벤트 인코딩 실패 |
| **화면 감지 한계** | screen manifest 기반 감지는 새로운 에이전트 UI 패턴에 대해 false idle 가능성. 라이프사이클 훅이 없는 에이전트는 정확도 떨어짐 |
| **git worktree 미지원** | Orca와 달리 worktree 기반 격리 없음. 에이전트가 같은 repo에서 작업 시 파일 충돌 가능 |
| **단일 개발자** | 풀타임 단일 개발자(ogulcancelik)가 주도. 버스 팩터 낮음 |
| **문서 대비 기능량** | Socket API가 매우 방대하지만 사용 사례/예제가 부족할 수 있음 |
| **에이전트 통합 설치 필요** | 정확한 상태 추적을 위해서는 에이전트별로 `herdr integration install` 필요 |

---

## 5. tmux vs Herdr — 사용 시나리오별 추천

### tmux가 나은 경우
- 범용 터미널 멀티플렉싱 (AI 에이전트 무관)
- 서버 관리, 로그 모니터링, 다중 셸 세션
- 이미 tmux에 익숙하고 커스터마이징이 완료된 사용자
- 모든 플랫폼에서 동일한 동작이 필요한 경우
- 대규모 생태계와 안정성이 우선인 경우

### Herdr가 나은 경우
- 2개 이상의 AI 코딩 에이전트를 동시에 실행하는 개발자
- 에이전트가 blocked 상태일 때 즉시 알림을 받고 싶은 경우
- 에이전트 간 프로그래밍 방식 협업이 필요한 경우 (Socket API)
- SSH 원격에서 에이전트를 실행하고 모니터링해야 하는 경우
- 마우스와 키보드를 모두 사용하고 싶은 경우
- Electron 없이 가벼운 도구를 원하는 경우

---

## 6. Orca와의 비교 (참고)

| 구분 | Herdr | Orca |
|------|-------|------|
| 정체성 | 터미널 에이전트 멀티플렉서 | 에이전트 개발 환경 (ADE) |
| UI | 터미널 안 | Electron 데스크톱 앱 |
| 무게 | 가벼움 (Rust 바이너리) | 무거움 (Electron + Chromium) |
| worktree 격리 | 없음 | 있음 (git worktree 기반) |
| 코드 에디터 | 없음 (외부 사용) | VS Code 내장 |
| 모바일 | 없음 | iOS/Android 앱 |
| 에이전트 상태 추적 | 있음 (화면 매니페스트 + 훅) | 있음 (터미널 상태 추적) |
| Socket API | 있음 (매우 상세) | Orca CLI로 일부 |
| 라이선스 | Apache 2.0 | MIT |
| 성숙도 | v0.4.0 (초기) | 일일 릴리스 (성숙) |

---

## 7. 결론

Herdr는 tmux와 Orca 사이의 틈새를 노린다.

**"tmux의 가벼움 + 에이전트 인식 + Socket API"** 를 결합한 도구다. Orca처럼 무거운 IDE를 원하지 않으면서, tmux의 에이전트 블라인드 문제를 해결하고 싶은 개발자에게 어필한다.

**차별화의 핵심은 Socket API**다. 에이전트가 다른 에이전트를 제어하고 대기하는 능력은 tmux에는 없는, Orca도 CLI로만 부분적으로 지원하는 기능이다. 이것이 Herdr의 가장 큰 장기적 가치다.

다만 v0.4.0이라는 초기 버전, 단일 개발자 의존성, Windows/IME 버그, 그리고 worktree 격리 부재는 현실적인 제약이다. **터미널 중심의 가벼운 에이전트 오케스트레이션**을 원하고 macOS/Linux를 사용한다면 주목할 만한 프로젝트.

---

## 8. 참고 자료

- GitHub: https://github.com/herdrdev/herdr
- 공식 문서: https://herdr.dev/docs/
- 개념 설명: https://herdr.dev/docs/concepts/
- Socket API: https://herdr.dev/docs/socket-api/
- 에이전트 감지: https://herdr.dev/docs/agents/
- 영속성/원격: https://herdr.dev/docs/persistence-remote/
- 플러그인 마켓: https://herdr.dev/plugins/
- 퀵 스타트: https://herdr.dev/docs/quick-start/
- Sponsor: https://github.com/sponsors/ogulcancelik
