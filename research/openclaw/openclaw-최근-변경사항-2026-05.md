---
tags:
  - openclaw
  - changelog
  - 리서치
date: 2026-05-05
---

# OpenClaw 최근 변경사항 (2026.5.x)

조사 일자: 2026-05-05
설치 버전: 2026.5.2 (현재 환경)
최신 릴리즈: 2026.5.4 (beta)

---

## 핵심 요약

OpenClaw 2026.5.x 시리즈는 **플러그인 아키텍처 재설계**, **성능 최적화**, **새로운 에이전트 기능**에 집중한 대규모 업데이트다.

---

## 주요 변경사항

### 1. 플러그인 시스템 대개편

- **외부 플러그인 npm-first 전환**: 채널, 프로바이더, 제네릭 플러그인이 코어 패키지에서 분리되어 npm/ClawHub로 이관
- **ClawHub 플러그인 마켓플레이스**: ClawPack 아티팩트 메타데이터, 버전 관리, npm 폴백 지원
- **file-transfer 플러그인** (신규): 페어드 노드에서 바이너리 파일 조작 (`file_fetch`, `dir_list`, `dir_fetch`, `file_write`). 기본 거부 정책, 16MB 제한
- **Crestodian 플러그인**: ClawHub 플러그인 검색, 설치/제거 작업 with 승인 및 감사
- 분리된 플러그인: Discord, WhatsApp, Slack, Google Meet, Matrix, LINE, Feishu, Teams, Telegram, Codex, Brave 등 25+

### 2. 성능 최적화

- **게이트웨이 스타트업 지연 로딩**: cron, 스키마, 세션, 모델 메타데이터 등 필요시에만 로드
- **핫 패스 경량화**: 세션 리스트, 태스크 유지보수, 프롬프트 준비, 툴 디스크립터 계획, 파일시스템 가드
- **플러그인 런타임 범위 제한**: 설정에서 파생된 유효 플러그인만 프리로드
- **jiti 지연 로딩**: 네이티브 로딩 경로에서 소스 변환 비용 회피

### 3. 에이전트 기능

- **`/steer` 커맨드** (신규): 대기 중인 세션의 활성 런을 큐 독립적으로 조종
- **`/side` (=`/btw` 별칭)**: 사이드 질문 슬래시 커맨드
- **`streaming.mode: "progress"`**: Discord, Telegram, Matrix, Slack, Teams에 통합 진행 상태 초안
- **`heartbeat_respond` 툴** (신규): 하트비트 런에서 구조화된 응답 기록
- **`skipOptionalBootstrapFiles`**: 선택적 워크스페이스 파일 스킵 설정
- **Compact explain-mode**: `/verbose`와 프로그레스 초안에서 기본 compact 툴 요약

### 4. 채널/메시징

- **WhatsApp Channel/Newsletter** 타겟팅 지원 (`@newsletter`)
- **Discord**: 접근 그룹 기반 채널 인증, 버튼/셀렉트/폼 게이트웨이 재시작 후에도 유지, 열화 전송 리포팅
- **Slack**: Block Kit 프로그레스 (`streaming.progress.render: "rich"`), 스레드 자동 응답 재시작 후 유지, App Home 탭
- **Telegram**: 포럼 토픽 타겟 지원, 네트워킹 수정
- **Google Meet**: Gemini 리얼타임 음성 브릿지 개선, Twilio dial-in 바지인 지원, 라이브 캡션 헬스
- **BlueBubbles**: 옵트인 reply context API 폴백, 첨부 다운로드 실패 로깅 개선

### 5. 프로바이더

- **xAI**: Grok 4.3 추가 (기본 채팅 모델)
- **OpenAI**: `extraBody`/`extra_body` passthrough (TTS), GPT-5 SSE 기본 전송
- **OpenRouter**: 응답 캐싱 파라미터 (`X-OpenRouter-Cache` 헤더)
- **Codex 런타임**: 네이티브 런타임 문서 명확화, 동적 툴 native-first 기본값

### 6. 인프라/설정

- **`$include` 디렉티브**: `OPENCLAW_INCLUDE_ROOTS` 승인 디렉토리에서 파일 읽기
- **`openclaw proxy validate`**: 프록시 설정 사전 검증
- **`openclaw gateway restart --force / --wait`**: 강제/대기 재시작
- **Config fail-closed**: 잘못된 설정 자동 복원 중단, `doctor --fix`가 담당
- **SDK `tools.invoke` RPC**: SDK 대면 툴 호출
- **macOS 앱**: 세션 컨텍스트를 Context 서브메뉴로 이동

---

## 버전 타임라인

| 버전 | 날짜 | 성격 |
|------|------|------|
| 2026.5.4-beta.1 | 2026-05-04 | file-transfer 플러그인, Meet 음성 개선, streaming progress |
| 2026.5.3-1 | 2026-05-04 | 핫픽스 (플러그인 스캐너 버그) |
| 2026.5.2 | ~2026-05-02 | 플러그인 npm 전환, 성능, 안정성 (현재 설치) |
| 2026.5.1-beta.x | ~2026-05-01 | 베타 채널 배포 |

---

## 분석

### 장점
- 플러그인 분리로 코어 패키지 가벼워짐 → 설치/업데이트 속도 개선 기대
- 게이트웨이 스타트업 최적화 → 응답성 향상
- file-transfer 플러그인으로 노드 간 파일 조작 공식 지원
- `/steer` 커맨드로 실행 중 에이전트 제어 유연성 증가

### 주의점
- npm-first 전환 과도기 → 기존 번들 플러그인 경로 마이그레이션 필요 가능
- beta 채널은 아직 불안정할 수 있음
- 설정 fail-closed 정책 변경 → 잘못된 설정 시 게이트웨이가 시작되지 않음

---

## 참고 자료

- [GitHub Releases](https://github.com/openclaw/openclaw/releases)
- [CHANGELOG.md](https://github.com/openclaw/openclaw/blob/main/CHANGELOG.md)
- [OpenClaw Docs](https://docs.openclaw.ai)
