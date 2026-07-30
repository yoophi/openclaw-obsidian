---
tags:
  - terminal
  - ai-agent
  - multiplexer
  - plugin-system
  - developer-tools
  - open-source
  - rust
date: 2026-07-30
---

# Herdr 플러그인 시스템 심층 분석

조사 일자: 2026-07-30
레포지토리: https://github.com/herdrdev/herdr
플러그인 문서: https://herdr.dev/docs/plugins/
마켓플레이스: https://herdr.dev/plugins/
예제 저장소: https://github.com/ogulcancelik/herdr-plugin-examples

---

## 1. 핵심 요약

Herdr 플러그인 시스템은 **언어 중립적인 실행 가능한 워크플로우 패키지**다. 플러그인은 Bash, JavaScript, Lua, Rust, Python, Go 등 머신에서 실행할 수 있는 어떤 명령어든 될 수 있다. Herdr가 호스트 영역(설치, 매니페스트 검증, 키바인딩, 터미널 pane, 이벤트, 소켓 접근)을 소유하고, 플러그인이 구현 영역(언어, 의존성, 파일, 상태)을 소유하는 구조다.

**설계 철학**: "Plugin SDK가 따로 없다. Herdr CLI 전체가 곧 플러그인 API다."

---

## 2. 아키텍처

### 2.1 이원 소유권 모델

| 영역 | 소유자 | 내용 |
|------|--------|------|
| **호스트 (Herdr)** | Herdr 코어 | 설치, 매니페스트 검증, 키바인딩, pane 생성, 이벤트, 소켓, 로깅 |
| **플러그인** | 플러그인 작성자 | 구현 언어, 의존성, 파일, 내구성 있는 상태 |

이 구조는 Herdr 코어를 가볍게 유지하면서, 커뮤니티가 워크플로우를 자유롭게 확장할 수 있게 한다.

### 2.2 Plugin = 디렉토리 + 매니페스트

플러그인의 정체는 단순하다:

```
my-plugin/
├── herdr-plugin.toml    # 매니페스트 (계약)
├── index.js             # 실행 파일 (어떤 언어든)
└── ...
```

별도의 SDK, 컴파일 단계, 런타임이 필요 없다. `herdr-plugin.toml` 매니페스트와 실행 가능한 명령어만 있으면 된다.

### 2.3 확장 포인트 (v1)

플러그인은 5가지 진입점을 가진다:

| 진입점 | 용도 | 트리거 |
|--------|------|--------|
| **Actions** | 사용자가 호출하는 워크플로우 | 키바인딩, CLI, Socket API |
| **Events** | Herdr 이벤트에 반응 | `worktree.created` 등 |
| **Startup hooks** | 서버 시작/복원 시 1회 실행 | 세션 복원, 라이브 핸드오프 |
| **Panes** | 플러그인 전용 터미널 pane | 오버레이, 팝업, 분할, 탭 |
| **Link handlers** | 터미널 내 URL 클릭 처리 | 정규식 패턴 매칭 |

---

## 3. 매니페스트 (`herdr-plugin.toml`)

매니페스트는 Herdr와 플러그인 사이의 계약서다.

### 3.1 전체 구조

```toml
id = "example.layout"
name = "Layout"
version = "0.1.0"
min_herdr_version = "0.7.0"
description = "Apply project layouts"
platforms = ["linux", "macos", "windows"]

# 빌드 명령 (설치 시 실행)
[[build]]
command = ["npm", "ci"]

[[build]]
command = ["npm", "run", "build"]
platforms = ["linux", "macos"]

# 시작 훅 (서버 복원 후 1회 실행)
[[startup]]
command = ["node", "dist/restore.js"]

# 액션 (사용자 호출)
[[actions]]
id = "apply"
title = "Apply layout"
contexts = ["workspace"]
command = ["node", "dist/apply.js"]

# 이벤트 훅
[[events]]
on = "worktree.created"
command = ["herdr", "workspace", "list"]

# 플러그인 pane
[[panes]]
id = "board"
title = "Project board"
placement = "overlay"
command = ["herdr-board"]

# 링크 핸들러
[[link_handlers]]
id = "github-issue"
title = "Open GitHub issue"
pattern = "^https://github\\.com/[^/]+/[^/]+/(issues|pull)/[0-9]+$"
action = "apply"
```

### 3.2 필수 필드

- `id`: 플러그인 식별자 (ASCII 문자, 숫자, 점, 콜론, 언더스코어, 하이픈)
- `name`: 표시 이름
- `version`: 시맨틱 버전
- `min_herdr_version`: 최소 Herdr 버전 (호환성 검증)

### 3.3 플랫폼 선언

- 최상위 `platforms`: 전체 플러그인 지원 플랫폼
- 진입점별 `platforms`: 개별 명령어의 플랫폼 오버라이드
- 플랫폼 미선언 시 링크 단계에서 경고

---

## 4. 런타임 환경

### 4.1 주입되는 환경 변수

Herdr가 플러그인 명령어 실행 시 주입하는 환경 변수:

| 환경 변수 | 용도 |
|-----------|------|
| `HERDR_SOCKET_PATH` | Herdr 소켓 경로 (Unix socket 또는 Windows named pipe) |
| `HERDR_BIN_PATH` | 실행 중인 Herdr 바이너리 경로 |
| `HERDR_ENV` | `1`로 설정 → Herdr 환경 내 실행 중임을 표시 |
| `HERDR_PLUGIN_ID` | 플러그인 ID |
| `HERDR_PLUGIN_ROOT` | 플러그인 설치/링크 디렉토리 |
| `HERDR_PLUGIN_CONFIG_DIR` | 사용자 설정 디렉토리 (.env 등) |
| `HERDR_PLUGIN_STATE_DIR` | 로컬 런타임 상태 디렉토리 |
| `HERDR_PLUGIN_CONTEXT_JSON` | 호출 컨텍스트 (workspace, tab, pane, agent, 선택 텍스트, 클릭 URL 등) |
| `HERDR_WORKSPACE_ID` | 현재 워크스페이스 ID (가능한 경우) |
| `HERDR_TAB_ID` | 현재 탭 ID (가능한 경우) |
| `HERDR_PANE_ID` | 현재 pane ID (가능한 경우) |
| `HERDR_PLUGIN_ACTION_ID` | 액션 명령어에만 |
| `HERDR_PLUGIN_EVENT` | 시작/이벤트 훅에만 (`startup`, 이벤트명) |
| `HERDR_PLUGIN_EVENT_JSON` | 이벤트 훅에만 (이벤트 데이터) |
| `HERDR_PLUGIN_ENTRYPOINT_ID` | pane 명령어에만 |

### 4.2 디렉토리 분리 원칙

```
HERDR_PLUGIN_ROOT/         # 소스 체크아웃 (GitHub 설치 시 관리됨)
  ├── herdr-plugin.toml
  └── index.js

HERDR_PLUGIN_CONFIG_DIR/   # 사용자 수정 가능 (.env, 설정)
  └── .env

HERDR_PLUGIN_STATE_DIR/    # 런타임 상태 (캐시, 세션)
  └── session.json
```

**중요**: `HERDR_PLUGIN_ROOT`에 사용자 크리덴셜이나 내구성 있는 상태를 저장하지 말 것. GitHub 설치 플러그인은 managed checkout이므로 재설치 시 덮어씌워진다.

### 4.3 Herdr CLI 회귀 호출

플러그인이 Herdr를 제어하는 두 가지 경로:

1. **`HERDR_BIN_PATH` (권장)**: 포터블한 CLI 호출. Unix socket과 Windows named pipe 차이를 무시
2. **`HERDR_SOCKET_PATH` (고급)**: 원시 JSON 요청/응답. 직접 프로토콜 클라이언트 작성 시

```javascript
// 권장 방식
const herdr = process.env.HERDR_BIN_PATH ?? "herdr";
const result = spawnSync(herdr, ["workspace", "list"], {
  encoding: "utf8",
});
```

---

## 5. 확장 포인트 상세

### 5.1 Actions

사용자가 호출하는 워크플로우. 키바인딩, CLI, Socket API로 실행.

```toml
[[actions]]
id = "list-workspaces"
title = "List workspaces"
contexts = ["workspace"]
command = ["node", "index.js"]
```

키바인딩 연결:
```toml
[[keys.command]]
key = "prefix+l"
type = "plugin_action"
command = "example.layout.apply"
description = "apply layout"
```

전역 ID는 `plugin.id.action` 형식 (예: `example.layout.apply`).

### 5.2 Events

Herdr 이벤트에 반응하는 훅.

```toml
[[events]]
on = "worktree.created"
command = ["herdr", "workspace", "list"]
```

이벤트 훅은 `HERDR_PLUGIN_EVENT_JSON`로 이벤트 데이터를 받는다.

### 5.3 Startup Hooks

서버 복원 후 API 소켓이 준비되면 1회 실행. 라이브 핸드오프 시에도 재실행.

특징:
- 비동기 실행 (서버를 차단하지 않음)
- 실패해도 서버가 중지되지 않음
- 1회성 초기화 (데몬이 아님)
- 설치 미리보기에 자동 실행 명령이 표시됨

전형적 용도: 저장된 Agent view 복원, 플러그인 상태 재적용.

### 5.4 Panes

플러그인 전용 터미널 pane. 5가지 배치 방식:

| Placement | 동작 |
|-----------|------|
| `overlay` (기본) | 활성 pane 위에 임시 줌 오버레이. 닫으면 이전 포커스/줌 복원 |
| `popup` | 세션 모달 팝업. 타일 레이아웃 변경 없음. Escape 포함 모든 입력 수신 |
| `split` | 일반 pane 분할. 다른 pane과 동일하게 동작 |
| `tab` | 새 탭에 pane 생성 |
| `zoomed` | 줌 상태로 pane 생성 |

```toml
[[panes]]
id = "picker"
title = "Picker"
placement = "popup"
width = "80%"
height = 20
command = ["sh", "picker.sh"]
```

- `split`, `tab`, `zoomed`, `overlay` pane은 일반 Herdr pane으로 동작. `pane.move`, `pane.swap`, `pane.resize`, `pane.zoom` 등 표준 API 사용 가능
- `popup`은 싱글톤 세션 리소스. pane ID 없음. 레이아웃/영속성/에이전트 API에 참여 안 함

### 5.5 Link Handlers

터미널 내 URL 클릭을 플러그인 액션으로 라우팅.

```toml
[[link_handlers]]
id = "github-issue"
title = "Open GitHub issue"
pattern = "^https://github\\.com/[^/]+/[^/]+/(issues|pull)/[0-9]+$"
action = "apply"
```

- 수정 클릭(Control/Ctrl) 시 브라우저 대신 플러그인 액션 실행
- `pattern`은 Rust 정규식
- macOS에서도 Command가 아닌 Control 사용 (터미널 마우스 캡처 제약)

---

## 6. 설치 및 관리

### 6.1 설치 방식

```bash
# GitHub에서 설치 (owner/repo/subdir 형식)
herdr plugin install ogulcancelik/herdr-plugin-examples/agent-telegram-notify

# 로컬 디렉토리 링크 (개발용)
herdr plugin link /path/to/plugin

# 신뢰하는 소스는 --yes
herdr plugin install owner/repo/plugin --yes

# 특정 리비전 고정
herdr plugin install owner/repo/plugin --ref v1.2.0
```

### 6.2 설치 프로세스

1. **git clone** (GitHub 설치 시)
2. **미리보기 표시** (인터랙티브 터미널): 소스와 실행할 명령어 표시
3. **빌드 명령 실행** (`[[build]]` 순서대로)
4. **등록**: 플러그인 데이터 디렉토리에 저장, config/state 디렉토리 생성

빌드 실패 시 설치 중단, 플러그인 등록 안 됨.

### 6.3 관리 명령어

```bash
herdr plugin list                              # 설치된 플러그인 목록
herdr plugin config-dir <id>                   # 설정 디렉토리 경로
herdr plugin action list --plugin <id>         # 액션 목록
herdr plugin action invoke <plugin.action>     # 액션 실행
herdr plugin pane open --plugin <id> --entrypoint <id>  # pane 열기
herdr plugin log list --plugin <id>            # 로그 조회
herdr plugin uninstall <id-or-source>          # 제거 (GitHub: 체크아웃도 삭제)
herdr plugin unlink <id>                       # 로컬 링크 해제 (파일 유지)
herdr plugin enable <id>                       # 활성화
herdr plugin disable <id>                      # 비활성화
```

### 6.4 글로벌 스코프

설치/링크된 플러그인과 활성화 상태는 **현재 사용자에게 글로벌**이다. 모든 Herdr 세션에서 사용 가능. 서버가 실행 중이지 않아도 설치/링크 가능.

---

## 7. 마켓플레이스

### 7.1 자동 발견 메커니즘

Herdr 플러그인 마켓플레이스(https://herdr.dev/plugins/)는 **GitHub 토픽 기반 자동 인덱싱**을 사용한다:

1. 공개 GitHub 저장소에 `herdr-plugin` 토픽 추가
2. `herdr-plugin.toml` 매니페스트 포함
3. 다음 refresh 주기에 자동 등록

**제출이나 리뷰 큐가 없다.** 토픽만 추가하면 끝.

### 7.2 신뢰 모델

마켓플레이스에 등록된 플러그인은 **Herdr가 검토하지 않는다**. 사용자가 직접 검증하고 설치할 책임이 있다.

보안 장치:
- `herdr plugin install` 시 인터랙티브 터미널에서 소스 + 명령어 미리보기 표시
- `--yes` 플래그가 없으면 사용자 확인 필요
- manifest 검증 (형식, 최소 버전 호환성)
- 플러그인별 격리된 config/state 디렉토리

**샌드박스는 없다.** 플러그인은 사용자 권한으로 실행되며, Herdr CLI 전체에 접근 가능. VS Code 확장이나 shell 플러그인과 동일한 신뢰 수준.

---

## 8. 공식 예제 플러그인

저장소: https://github.com/ogulcancelik/herdr-plugin-examples

| 플러그인 | 언어 | 기능 |
|----------|------|------|
| **agent-telegram-notify** | JavaScript | 에이전트가 특정 상태에 도달하면 Telegram 메시지 전송 |
| **dev-layout-bootstrap** | Lua | 현재 pane 기준 3-pane 개발 레이아웃 자동 생성 |
| **github-link-preview** | Bash | GitHub issue/PR 링크 클릭 시 우측 pane에서 `gh`로 미리보기 |
| **rust-release-check** | Rust | 빌드 단계를 포함한 예제. 현재 Git 트리가 clean한지 확인 |

이들은 참고용이며 적극적으로 유지보수되지 않는다. 필요한 부분을 복사해서 자체 플러그인으로 만드는 것을 권장.

---

## 9. Agent Skill (플러그인과 별도)

플러그인과 구분되는 개념으로 **Agent Skill**이 있다.

### 9.1 차이점

| 구분 | Plugin | Agent Skill |
|------|--------|-------------|
| 대상 | Herdr 확장 | 코딩 에이전트 교육 |
| 형식 | 디렉토리 + 매니페스트 + 실행 파일 | Markdown 파일 (`SKILL.md`) |
| 작동 | Herdr가 명령어 실행 | 에이전트가 Herdr CLI를 사용하도록 지시 |
| 설치 | `herdr plugin install` | `npx skills add herdrdev/herdr --skill herdr` |

### 9.2 Agent Skill의 역할

`HERDR_ENV=1` 환경 변수를 감지한 코딩 에이전트가 다음을 수행하도록 교육:

- 워크스페이스, 탭, pane, 인접 에이전트 inspect
- 포커스를 뺏지 않고 pane 분할 및 명령 실행
- pane 출력 및 최근 로그 읽기
- 서버, 테스트, 다른 에이전트의 완료 대기
- 형제 pane에서 헬퍼 에이전트 시작

가드레일: `HERDR_ENV=1`이 없으면 에이전트는 중지하고 "Herdr pane 내부가 아님"을 알림.

---

## 10. Integrations vs Plugins

Herdr에는 **Integrations**와 **Plugins** 두 확장 체계가 있다.

### 10.1 비교

| 구분 | Integrations | Plugins |
|------|-------------|---------|
| 목적 | 에이전트 상태/세션 추적 | 범용 워크플로우 자동화 |
| 설치 | `herdr integration install <agent>` | `herdr plugin install <source>` |
| 작동 | 에이전트별 hook/plugin 파일 작성 | 매니페스트 기반 명령어 실행 |
| 소스 | Herdr 내장 (번들) | 커뮤니티/GitHub |
| 관리 | Herdr가 파일 작성/삭제 | git clone + 빌드 |

### 10.2 통합 유형

**Lifecycle Authority** (상태 + 세션):
- Pi, OMP, Kimi Code CLI, OpenCode, Kilo Code CLI, Hermes Agent, MastraCode
- hook/plugin이 idle/working/blocked 상태를 권위 있게 보고

**Session Identity** (세션만):
- Claude Code, Codex, GitHub Copilot CLI, Devin CLI, Droid, Qoder CLI, Cursor Agent CLI
- 네이티브 세션 참조로 복원 지원. 상태는 화면 매니페스트 사용

---

## 11. 장단점 분석

### 장점 ✅

| 항목 | 설명 |
|------|------|
| **언어 중립** | Bash, JS, Lua, Rust, Python, Go — 무엇이든 가능. 학습 곡선 낮음 |
| **CLI = API** | 별도 SDK 없음. Herdr CLI 전체가 플러그인 API. 진입 장벽 최소 |
| **풍부한 컨텍스트** | 14개 환경 변수 + JSON 컨텍스트로 workspace/tab/pane/agent 정보 전달 |
| **5가지 확장 포인트** | action, event, startup, pane, link handler로 다양한 워크플로우 커버 |
| **마켓플레이스 자동화** | GitHub 토픽만 추가하면 자동 등록. 리뷰 큐 없음 |
| **디렉토리 분리** | ROOT / CONFIG_DIR / STATE_DIR 3분할로 안전한 상태 관리 |
| **로컬 개발 친화** | `plugin link`로 개발 중 빌드 단계 건너뛰고 바로 테스트 |
| **크로스 플랫폼** | `platforms` 선언으로 OS별 지원 제어. Windows PATHEXT shim 해결 |

### 단점 ❌

| 항목 | 설명 |
|------|------|
| **샌드박스 없음** | 플러그인이 사용자 권한으로 Herdr CLI 전체에 접근. 악성 플러그인에 취약 |
| **보안 검토 없음** | 마켓플레이스 자동 등록, 리뷰 없음. 사용자가 전적으로 검증 책임 |
| **v1 제한** | 런타임 액션 등록 불가, 비터미널 플러그인 UI 없음. 정적 매니페스트 선언만 |
| **업데이트 메커니즘 부재** | 별도 `plugin update` 없음. 재설치로만 갱신. 버전 핀(`--ref`)은 수동 |
| **에코시스템 초기** | 공식 예제 4개. 마켓플레이스는 자동 발견이지만 실제 등록된 플러그인 수 미확인 |
| **빌드 도구 미설치** | 빌드 실패 시 Herdr는 리포트만 하고 도구체인 설치는 사용자 책임 |
| **단일 진입점 불가** | 하나의 플러그인이 action + event + pane을 모두 가질 수 있지만, 복잡한 상태 공유는 직접 구현 |
| **디버깅 도구 부족** | `plugin log list`는 있지만 원격 디버깅, 핫 리로드, 테스트 프레임워크 미비 |

---

## 12. vs 타사 플러그인 시스템 비교

| 구분 | Herdr Plugins | VS Code Extensions | tmux Plugins | Neovim Plugins |
|------|--------------|-------------------|-------------|----------------|
| **언어** | 무엇이든 | TypeScript/JS | Bash/Perl | Lua |
| **SDK** | 없음 (CLI = API) | VS Code Extension API | TPM 프레임워크 | Neovim Lua API |
| **샌드박스** | 없음 | Extension Host 프로세스 | 없음 | 없음 |
| **마켓플레이스** | GitHub 토픽 자동 | Marketplace (리뷰) | TPM (수동) | LuaRocks / GitHub |
| **UI** | 터미널 pane만 | 웹 기반 전용 UI | 없음 | 터미널 내 |
| **복잡도** | 낮음 (매니페스트 1개) | 높음 (package.json, activation, API) | 낮음 | 중간 |

---

## 13. 결론

Herdr 플러그인 시스템은 **"CLI = Plugin API"**라는 극단적으로 단순한 철학으로 설계되었다. 이 접근의 장단점이 명확하다.

**가장 강력한 점**: 진입 장벽이 거의 없다. `herdr-plugin.toml` 파일 하나와 실행 파일 하나면 플러그인이 완성된다. 언어 제약도 없고, SDK 학습도 필요 없다. 14개 환경 변수와 풍부한 컨텍스트 JSON으로 Herdr의 모든 기능에 접근할 수 있다.

**가장 우려되는 점**: 보안. 샌드박스가 없고 리뷰가 없다. 마켓플레이스에서 설치한 플러그인이 사용자 권한으로 Herdr CLI 전체(다른 pane 조작, 에이전트 제어, 파일 읽기/쓰기 등)를 실행할 수 있다. 설치 미리보기가 유일한 방어선이다.

**적합한 사용자**:
- Herdr의 워크플로우를 자동화하려는 파워 유저
- 에이전트 이벤트(완료, blocked)에 반응하는 알림/후속 작업이 필요한 팀
- 자체 터미널 도구를 만들어 Herdr에 통합하려는 개발자
- GitHub 링크 미리보기, 레이아웃 자동 생성 등 터미널 중심 워크플로우 확장이 필요한 경우

**평가**: v1으로서 설계가 깔끔하고 확장 포인트가 잘 정의되어 있다. 다만 생태계가 초기라 실제 사용 가능한 커뮤니티 플러그인이 많지 않고, 보안 모델이 "사용자가 알아서" 수준이다. 장기적으로는 샌드박스나 권한 스코프가 추가되어야 할 영역.

---

## 14. 참고 자료

- 플러그인 문서: https://herdr.dev/docs/plugins/
- 마켓플레이스: https://herdr.dev/plugins/
- 예제 저장소: https://github.com/ogulcancelik/herdr-plugin-examples
- Socket API: https://herdr.dev/docs/socket-api/
- Integrations: https://herdr.dev/docs/integrations/
- Agent Skill: https://herdr.dev/docs/agent-skill/
- SKILL.md 소스: https://github.com/herdrdev/herdr/blob/master/skills/herdr/SKILL.md
- CLI 레퍼런스: https://herdr.dev/docs/cli-reference/
- 신뢰 가이드: https://herdr.dev/docs/plugins/#trust-and-security
