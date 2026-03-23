---
title: "OpenClaw Architecture Explained: Gateway, Runtime, Skills, and Security"
source: "https://www.youtube.com/watch?v=NikOrMAbg-s"
original_url: "https://www.youtube.com/watch?v=NikOrMAbg-s"
youtube_id: "NikOrMAbg-s"
playlist: "📙 openclaw"
channel: "scrollypedia"
duration: "8:30"
publish_date: "2026-02-20"
playlist_index: 69
tags:
  - youtube
  - playlist
  - openclaw
  - channel/scrollypedia
  - playlist/📙 openclaw
generated_by: "OpenClaw summarize skill"
generated_at: "2026-03-23 19:39:04 +0900"
language: "ko"
---

# OpenClaw Architecture Explained: Gateway, Runtime, Skills, and Security

## 영상 정보

- 원본 주소: https://www.youtube.com/watch?v=NikOrMAbg-s
- 채널: scrollypedia
- 제목: OpenClaw Architecture Explained: Gateway, Runtime, Skills, and Security
- 게시일: 2026-02-20
- 재생시간: 8:30
- 플레이리스트: 📙 openclaw
- 플레이리스트 순서: 69

## 영상 설명

An open-source AI agent with 180,000+ GitHub stars, accessible through WhatsApp, Slack, and any messaging app you already use. Here's how the architecture actually works — and what it means for the future of AI agents.

🎯 KEY TOPICS:
- The Gateway — WebSocket control plane with TypeBox schema validation
- Agent Runtime — model-agnostic LLM loop with JSONL state
- Multi-channel routing across 15+ messaging platforms
- Skills & ClawHub — 5,700+ community-contributed extensions
- Canvas & A2UI — agent-driven interactive HTML interfaces
- Security architecture — the "lethal trifecta" and what the CVEs revealed
- What OpenClaw means for the AI agent industry

📊 KEY NUMBERS:
- 180,000+ GitHub stars (Feb 2026)
- 100K stars in ~2 days — fastest in GitHub history
- 15+ messaging platforms supported
- 5,700+ skills on ClawHub marketplace
- 30,000+ exposed instances discovered by security researchers
- 341→1,184 malicious skills found in community marketplace (Snyk ToxicSkills, Antiy CERT)
- 36.8% of all ClawHub skills contain security flaws (3,984 scanned)
- 91% of malicious skills combine prompt injection with traditional malware

📰 LATEST: Creator Peter Steinberger joined OpenAI on Feb 14, 2026. OpenClaw moves to an open-source foundation with OpenAI sponsorship.

🔗 SOURCES:
- OpenClaw official docs: docs.openclaw.ai
- OpenClaw GitHub: github.com/openclaw/openclaw
- Palo Alto Networks security analysis
- VentureBeat CISO guide
   
Created by Peter Steinberger • Formerly Clawdbot/Moltbot

#openclaw  #AIAgent #OpenSource #AIArchitecture #TechExplained #Claude #Cowork #AIAssistant #SelfHosted #WhatsApp #Telegram #AIAutomation #2026 

Subscribe for more technical deep dives into AI and technology.

DISCLAIMER: This content is for educational purposes. All statistics are sourced from publicly available reports and company announcements as of February 2026. Market projections are based on industry research reports and should not be considered investment advice.

© 2026 Scrollypedia.

## 요약

## 핵심 요약
- OpenClaw는 단일 웹소켓 게이트웨이(허브) + 에이전트 런타임 + 스킬 생태계 + 캔버스(UI)로 구성된 로컬 에이전트 플랫폼이다.
- 게이트웨이는 메시지 라우팅뿐 아니라 이벤트(agent, chat, presence, health, heartbeat, cron)와 규칙 기반의 프로액티브 동작을 제공한다.
- 런타임은 5단계 파이프라인과 하이브리드 메모리(의미 기반 검색 + 키워드 매칭)를 사용하고, 모델 페일오버 체인을 지원한다.
- 스킬은 에이전트를 확장하는 단위이며 에이전트 권한을 그대로 상속하기 때문에 강력하지만 큰 보안 위험을 동반한다.
- 빠른 성장과 함께 스킬 생태계에서 대규모 악성 패키지·메모리 포이즈닝·원격 탈취 같은 심각한 공급망 보안 문제가 발생했다.

*It hit 180,000 GitHub stars in under 3 weeks, making it the fastest growing open-source project in history.*
*Skills inherit the full permissions of the agent they extend, including file system access, network access, and shell execution.*

## 주요 내용
- 게이트웨이
  - 모든 플랫폼(WhatsApp, Telegram, Slack 등) 메시지가 단일 웹소켓 서버를 통해 흐름.
  - 이벤트 6종(agent, chat, presence, health, heartbeat, cron)을 방출해 타이머·웹훅·스케줄러 기반의 자발적 동작 허용.
  - 수신 메시지는 정의된 엄격한 규칙으로 자동 검사되며, 같은 정의에서 프로토콜 문서와 iOS/macOS 네이티브 데이터 모델을 생성.
  - 설정 변경은 재시작 없이 자동 적용.
- 에이전트 런타임
  - 5단계 파이프라인: 세션 해결 → 워크스페이스(정체성·스킬) 부트스트랩 → 세션 히스토리·메모리 인덱스에서 컨텍스트 수집 → LLM 호출 → 툴(셸, 브라우저, 파일) 실행 및 결과 JSONL로 영속화.
  - 메모리 시스템: 의미 기반 검색과 정확 키워드 매칭을 병합한 하이브리드 검색으로 관련 문맥 회수.
  - 대화가 길어지면 중요 컨텍스트를 디스크 파일로 자동 저장.
  - 모델 비종속적 설계: 여러 LLM 공급자(클라우드/로컬)를 체인으로 구성해 페일오버 처리(예: 503 시 다음 공급자로 전환).
- 플랫폼·채널 처리
  - 15개 이상의 메신저 플랫폼을 단일 게이트웨이로 처리.
  - 멀티 에이전트 라우팅으로 채널별 워크스페이스·성격(예: 업무용 vs 개인) 분리 가능.
  - 채널별 번역기(translator)로 각 플랫폼에 네이티브한 메시지 형태 유지.
  - DM은 하나의 대화 스레드, 그룹 채팅은 격리. 응답 모드(항상 응답/멘션 시/수동 트리거) 제어 가능.
  - WhatsApp은 중계 없이 프로토콜을 직접 다루는 라이브러리 사용(클라우드 릴레이 불필요).
- 스킬(Skills)
  - 스킬 구성: skill.md(YAML front matter) + 선택적 스크립트·바이너리·설정 템플릿.
  - 기본 번들 스킬 100개 이상(셸 명령, 파일 관리, 브라우저 자동화, cron 등)과 커뮤니티 허브(Clawhub)로 확장.
  - 퍼블리싱 장벽이 낮아(간단한 skill.md와 새 GitHub 계정으로도 등록 가능) 빠르게 패키지 증가.
  - 스킬 폴더의 스크립트/바이너리는 에이전트 권한으로 실행되어 강력하지만 공격 표면 확대.
- 캔버스 및 UI
  - Canvas는 게이트웨이와 분리된 독립 프로세스로 동작해 UI 충돌 시 게이트웨이 지속 운영 보장.
  - A2UI(agent to UI) 프로토콜: 에이전트가 HTML을 쓰고 특수 속성으로 버튼·요소를 에이전트 액션으로 연결, 웹소켓으로 브라우저에 푸시해 실시간 인터랙션 지원.
  - Chrome DevTools Protocol(CDP)을 통해 브라우저 내비게이션, 클릭, 데이터 추출, 스크린샷 등 제어 가능.
  - Mac 메뉴바 앱, iOS/Android 동반 앱, 음성 웨이크 모드(음성 통합) 등 클라이언트/입력 다양성 존재.
- 보안 사고·취약점 사례
  - 커뮤니티 스캔 결과: 다수 스킬에 보안 결함 존재(예: 36.8%에 문제, 13.4%는 치명적).
  - 대부분 악성 스킬은 프롬프트 인젝션과 전통적 맬웨어 기법 결합(91% 사례).
  - Claw Havoc 캠페인: 악성 스킬로 Atomic Stealer 같은 맬웨어 유포, 브라우저 비밀번호·SSH 키·암호화 지갑·OpenClaw API 키 탈취.
  - 메모리 포이즈닝 공격: soul.md / memory.md 조작으로 에이전트 행동 영구 변경(지연 실행 공격 위험).
  - 치명적 원클릭 취약점 및 도커 샌드박스 우회 사례 보고됨.

## 실무 포인트
- 최소 권한 원칙 적용: 에이전트·스킬에 불필요한 파일/네트워크/셸 권한 부여 금지.
- 스킬 검증 정책 수립: 설치 전 코드·문서 검토, 신뢰 가능한 출처만 허용, 서명·정책 기반 허용 목록(allowlist) 도입 권장.
- 메모리·행동 정의 파일 보호: soul.md와 memory.md는 에이전트 장기 행동을 결정하므로 버전 관리, 무결성 검사, 변경 알림 필요.
- 샌드박싱·격리 고려: 스킬 실행을 가능한 한 격리 환경에서 수행(컨테이너·권한 제한), 외부 프로세스 실행 최소화.
- 자격증명 관리: OpenClaw API 키·LLM API 키 등 민감 키 저장 최소화·회전 및 감사 로그 활성화.
- 로그·활동 모니터링: 비정상적 네트워크/파일 액세스 탐지, 스킬 설치·업데이트 기록 상시 확인.
- 구성·업데이트 절차: 자동 업데이트 정책 주의(악성 스킬 자동 설치 위험), 패치가 나오면 신속 적용하되 변경 전 테스트 권장.
- 운영 분리: 업무용과 개인용 에이전트를 분리해 민감 데이터 노출 위험을 줄일 것.
- 한계: 기본적으로 스킬 퍼블리싱에 코드 서명·보안 심사 없음, 로컬 실행 특성상 잘못된 스킬은 시스템 전체를 위험에 빠뜨릴 수 있음.

## 한줄 평
OpenClaw의 내부 구조와 강력한 기능, 그리고 급격한 생태계 확장에 따른 심각한 보안 위험을 한눈에 정리해 주므로 에이전트 도입·운영을 검토하는 실무자에게 필수적인 영상이다.
