---
tags:
  - AI
  - 에이전트
  - CoPaw
  - 오픈소스
  - Alibaba
  - AgentScope
date: 2026-04-09
---

# CoPaw (Co Personal Agent Workstation) 조사

조사 일자: 2026-04-09

## 핵심 요약

CoPaw는 **Alibaba AgentScope 팀**이 만든 오픈소스 개인 AI 어시스턴트 워크스테이션이다. 로컬/클라우드 배포, 다중 채팅 채널 연동, 로컬 LLM 실행, 스킬 확장 시스템을 제공한다. OpenClaw와 유사한 점이 많지만 AgentScope 프레임워크 기반으로 독립적으로 구현되었다.

---

## 1. 기본 정보

| 항목 | 내용 |
|------|------|
| 이름 | CoPaw (Co Personal Agent Workstation) |
| 개발 | Alibaba AgentScope 팀 |
| 라이선스 | Apache 2.0 |
| 언어 | Python 72.8%, TypeScript 22.2% |
| 프레임워크 | AgentScope |
| 현재 버전 | v1.0.1 (2026-04-04) |
| GitHub | https://github.com/agentscope-ai/CoPaw |
| 공식 사이트 | https://copaw.bot |

---

## 2. 핵심 기능

### 2.1 멀티 채널 채팅 연동

네이티브 지원 채널:
- DingTalk (딩톡)
- Feishu / Lark (페이슈)
- WeChat (위챗)
- QQ
- Discord
- Telegram
- iMessage
- Matrix
- Mattermost
- MQTT
- 커스텀 채널 (HTTP 라우트/Webhook)

### 2.2 로컬 LLM 실행

- **llama.cpp**: 크로스 플랫폼 지원
- **MLX**: Apple Silicon (M1–M4) 네이티브
- **Ollama**: 별도 설정 없이 연동
- 클라우드 API: Qwen 시리즈, Zhipu AI 등
- API 키 없이 완전 로컬 실행 가능

### 2.3 모듈형 에이전트 아키텍처

```
Agent Core
├── Prompt (프롬프트 모듈)
├── Hooks (후킹 모듈)
├── Tools (도구 모듈)
└── Memory (메모리 모듈)
```

- 각 모듈을 독립적으로 교체/확장 가능
- 개발자가 블록을 조립하듯 에이전트 구성

### 2.4 스킬 시스템

내장 스킬:
- Cron 스케줄링
- PDF/Office 문서 처리
- 뉴스 다이제스트
- 파일 읽기/검색
- 이메일/캘린더 연동
- 소셜 미디어 집계

특징:
- 워크스페이스에서 자동 로드
- CLI로 설치/제거/관리
- 벤더 락인 없음
- 커스텀 스킬 개발 가능

### 2.5 장기 기억 & Heartbeat

- 대화에서 결정, 선호, 할 일을 자동 기억
- ReMe(Reflective Memory) 메모리 시스템
- Heartbeat 메커니즘으로 자율적 스케줄 작업 수행
- 이메일 확인, 리포트 작성, 할 일 정리 등 자동 실행

### 2.6 멀티 에이전트 협업

- 여러 독립 에이전트 생성 (각각 역할 부여)
- 에이전트 간 통신 스킬로 복잡 작업 협업
- 백그라운드 작업 지원 (`--background` 플래그)
- 우선순위 큐 시스템, `/stop` 명령으로 작업 취소

### 2.7 보안

- Tool Guard (도구 보호 규칙)
- 파일 접근 제어
- 스킬 보안 스캔
- 중국어 프롬프트 인젝션 탐지
- 시스템 재부팅/서비스 보호 규칙

---

## 3. 설치 방법

### 3.1 pip (가장 빠름)

```bash
pip install copaw
copaw init --defaults
copaw app
# http://127.0.0.1:8088/
```

### 3.2 원클릭 스크립트

```bash
# macOS / Linux
curl -fsSL https://copaw.agentscope.io/install.sh | bash

# Windows PowerShell
irm https://copaw.agentscope.io/install.ps1 | iex
```

### 3.3 Docker

```bash
docker pull agentscope/copaw:latest
docker run -p 8088:8088 \
  -v copaw-data:/app/working \
  -v copaw-secrets:/app/working.secret \
  agentscope/copaw:latest
```

### 3.4 클라우드 배포

- ModelScope Studio 원클릭 배포
- Alibaba Cloud ECS 원클릭 배포

### 3.5 데스크톱 앱 (Beta)

별도 설치 가능 (Python 불필요)

---

## 4. 버전 히스토리

| 버전 | 날짜 | 주요 변경 |
|------|------|----------|
| v0.0.7 | 2026-03-12 | 초기 |
| v0.1.0 | 2026-03-18 | 안정화 |
| v0.2.0 | 2026-03-24 | 기능 확장 |
| v1.0.0 | 2026-03-30 | 멀티 에이전트, 로컬 모델 제공자, 보안 강화 |
| v1.0.1 | 2026-04-04 | Zhipu AI 지원, 비디오 분석, OneBot v11 |

---

## 5. 경쟁사 비교

| 기능 | CoPaw | AutoGPT | CrewAI | 클라우드 어시스턴트 |
|------|-------|---------|--------|-------------------|
| 핵심 초점 | 개인 에이전트 워크스테이션 | 자율 작업 에이전트 | 멀티 에이전트 오케스트레이션 | 일반 대화 AI |
| 배포 | 로컬/클라우드/Docker | 로컬/클라우드 | 로컬/클라우드 | 클라우드만 |
| 멀티 채널 채팅 | ✅ 5+ 플랫폼 | 제한적 | 제한적 | API 기반 |
| 로컬 모델 | ✅ llama.cpp + MLX | ✅ | ✅ | ❌ |
| 프라이버시 | 완전 (로컬 배포) | 보통 | 보통 | 제한적 |
| 스킬/플러그인 | ✅ 내장 + CLI | 플러그인 | 커스텀 에이전트 | 다양 |
| 자율 스케줄링 | ✅ Heartbeat + Cron | ❌ | ❌ | ❌ |
| 라이선스 | Apache 2.0 | MIT | MIT | 독점 |

---

## 6. OpenClaw와의 관계

### 6.1 독립 아키텍처 감사

CoPaw 공식 사이트에 **Design Audit** 섹션이 있다. OpenClaw(NGOClaw)와 모듈별 비교를 통해 독립 구현임을 명시.

### 6.2 주요 차이점

| 항목 | CoPaw | OpenClaw |
|------|-------|----------|
| 언어 | Python + TypeScript | Node.js |
| 프레임워크 | AgentScope | 자체 |
| 컨텍스트 압축 | 토큰 비율 (80%) | 메시지 수 기준 |
| 루프 종료 | max_iters=50 | 토큰 예산 |
| DoomLoop 감지 | 없음 | 슬라이딩 윈도우 |
| 보안 훅 | 없음 (별도 Tool Guard) | SecurityHook |
| 채널 | 중국 앱 중심 (딩톡, 페이슈, QQ) | 글로벌 앱 중심 (WhatsApp, Telegram) |

### 6.3 유사성

- ReAct 에이전트 루프
- pre-LLM Hook 인젝션
- 토큰 비율 기반 자동 압축
- keep-recent-N 테일 전략
- 프롬프트 로딩 시스템

---

## 7. 적합한 사용자

### 추천:

- ✅ 중국 생태계 사용자 (딩톡, 페이슈, QQ)
- ✅ 로컬 LLM으로 완전 프라이버시 원하는 사용자
- ✅ Apple Silicon (M1–M4) 활용 가능한 사용자
- ✅ 스케줄 기반 자율 작업이 필요한 사용자
- ✅ 멀티 에이전트 협업이 필요한 사용자

### 비추천:

- ❌ 한국 생태계에 특화된 채널 연동이 필요한 경우
- ❌ 영어 중심 문서/커뮤니티 선호하는 경우
- ❌ 프로덕션급 엔터프라이즈 배포가 필요한 경우

---

## 8. 참고 자료

- GitHub: https://github.com/agentscope-ai/CoPaw
- 공식 사이트: https://copaw.bot
- PyPI: https://pypi.org/project/copaw/
- DeepWiki 분석: https://deepwiki.com/agentscope-ai/CoPaw/1-overview
- Reddit v0.2.0 게시물: https://www.reddit.com/r/copaw/comments/1s4twbk/copaw_v020_just_dropped/
- Toolify 리뷰: https://www.toolify.ai/tool/copaw
- i-scoop 분석: https://www.i-scoop.eu/copaw-alibaba/

---

_조사: Research Agent_
