---
title: "I Replaced OpenClaw With Claude Code in One Day"
source: "https://www.youtube.com/watch?v=9Svv-n11Ysk"
original_url: "https://www.youtube.com/watch?v=9Svv-n11Ysk"
youtube_id: "9Svv-n11Ysk"
playlist: "📙 openclaw"
channel: "Mark Kashef"
duration: "15:07"
publish_date: "2026-02-24"
playlist_index: 56
tags:
  - youtube
  - playlist
  - openclaw
  - channel/mark kashef
  - playlist/📙 openclaw
generated_by: "OpenClaw summarize skill"
generated_at: "2026-03-23 19:33:27 +0900"
language: "ko"
---

# I Replaced OpenClaw With Claude Code in One Day

## 영상 정보

- 원본 주소: https://www.youtube.com/watch?v=9Svv-n11Ysk
- 채널: Mark Kashef
- 제목: I Replaced OpenClaw With Claude Code in One Day
- 게시일: 2026-02-24
- 재생시간: 15:07
- 플레이리스트: 📙 openclaw
- 플레이리스트 순서: 56

## 영상 설명

Join My Community: https://www.skool.com/earlyaidopters/about

ClaudeClaw Guide/Prompt: https://markkashef.gumroad.com/l/claudeclaw

---

OpenClaw was the four-minute mile moment. It showed us what's possible. But it was patching together a derivative of the original Claude Code harness that already exists and is already exceptional.

So I asked the question: why not just use what you already have?

In this video, I walk you through exactly how I built ClaudeClaw — a personal AI assistant that runs on my real desktop through Claude Code, accessible from Telegram, WhatsApp, or anywhere. No third-party bridges. No forks. No dual maintenance. One unified system.

I also share the mega prompt I put together so you can build your own version in under 2 hours.

---

Timestamps

0:00 — What ClaudeClaw actually is (demo)
1:12 — Why I stopped using OpenClaw
2:25 — The architecture: Medium + Bridge
3:26 — How it works (non-technical explanation)
5:08 — What you get: 30+ skills, MCP servers, memory, web search
6:06 — OpenClaw was the four-minute mile
7:19 — Why every fork is a derivative of a derivative
9:00 — The old way vs the new way
10:36 — Why you don't need to pay for API
12:08 — The 8-stage message pipeline (end to end)
16:18 — Memory system: 3 layers explained
17:20 — Layer 1: Session persistence
19:00 — Layer 2: SQLite + semantic + episodic memory
20:00 — Layer 3: Context injection
21:24 — The mega prompt walkthrough (terminal demo)
26:25 — The setup wizard (interactive)
30:27 — TLDR: How to get started
31:18 — One unified AI operating system
32:18 — Works with any CLI-based model (Codex, Gemini, etc.)
34:00 — Get the mega prompt (link above)
35:23 — Final thoughts

---

Book a Consultation: https://calendly.com/d/crfp-qz3-m4z

#OpenClaw #ClaudeCode #AIAssistant #ClaudeClaw #PersonalAI #Anthropic #AgentSDK #Telegram #AISecondBrain #Claude

## 요약

## 핵심 요약
- 로컬에 이미 있는 Cloud Code(데스크탑 인스턴스)를 Anthropics의 agent SDK로 텔레그램 등 메시징 플랫폼과 연결해 원격 개인비서를 만든다.
- 로컬 Cloud Code를 그대로 사용하므로 별도 클라우드 이중 유지가 필요 없고 기존 스킬·파일시스템·메모리를 즉시 재활용할 수 있다.
- 멀티모달(비디오·이미지·음성) 입출력, 크론 기반의 능동 스케줄링 등 OpenClaw이 제시한 기능을 더 통합적이고 사용자가 제어 가능한 방식으로 구현한다.
- *OpenClaw was the 4-minute mile.*  
- *you have one unified system, one unified AI operating system*

## 주요 내용
- 아키텍처 흐름(요약)
  - 사용자 → 텔레그램(또는 다른 메시지 인터페이스) → 텔레그램 API 인증 → 미디어 핸들러(비디오/사진/음성 처리) → 메모리 주입 → Anthropics agent SDK가 로컬 Cloud Code의 서브프로세스(claude subprocess)를 실행 → 응답을 텍스트/음성으로 변환해 되돌려줌.
- 에이전트 SDK 역할
  - 로컬 Cloud Code의 기능을 에이전트 서브프로세스로 노출하여 원격에서 동일한 기능(툴 호출, 스킬 실행 등)을 수행하게 함.
- 메모리 시스템(3계층)
  - 세션 레벨: 각 대화에 session ID를 부여해 컨텍스트 지속.
  - 로컬 DB: SQLite 기반으로 운영(무료, OS 무관). 두 가지 메모리 유형 사용 가능—시맨틱(벡터 DB형)과 에피소드(대화 시간적 감쇠).
  - 컨텍스트 주입: 최근 메모리 우선 검색, 노이즈 중복 제거 등으로 응답 품질 유지.
- 멀티모달 지원
  - 영상 업로드 후 Cloud Code가 분석해 해석 가능(예: 장비나 화면을 설명).
  - 이미지 생성(예: nano banana) 및 음성 입출력 지원.
- 음성 엔진 선택
  - 예시로 Grock(빠름), 11 Labs(클론 음성에 유리), OpenAI 등 선택 가능. 속도·품질 트레이드오프 존재.
- 설정 자동화: mega prompt(빌드 위저드)
  - 대시보드형 마법사(설정 질문→옵션 선택→빌드 실행)를 포함하는 거대한 프롬프트로 자동 구성 가능.
  - 사용자가 원하는 기능(비디오 분석, WhatsApp 브리지, 음성 등)을 선택해 재구성·설치.
- 프로액티브 기능
  - 로컬에서 cron 잡으로 스케줄링된 작업(알림·자동 실행 등)을 통해 OpenClaw 유사한 능동성 제공.
- 교체 가능성
  - Cloud Code 대신 CLI 지원하는 다른 모델(예: CodeX, Gemini 등)도 같은 방식으로 대체 가능.

## 실무 포인트
- 운영 전제
  - 로컬(예: Mac Mini)에서 지속적 가동 필요: 컴퓨터가 꺼져 있으면 서비스 불가(크론·영구 스킬 제한).
- 컨텍스트 한계
  - 로컬 모델의 컨텍스트 윈도우 제약이 있으므로 큰 컨텍스트가 필요한 경우 더 큰 모델(예: million-token 모델)을 고려해야 함.
- 메모리/DB 관리
  - SQLite로 시작해 필요하면 백업·정리·보존 정책을 설계할 것(데이터 용량·프라이버시 고려).
  - 에피소드·시맨틱 메모리 균형을 조절해 오래된 대화가 과도하게 참조되는 것을 방지.
- 보안·인증
  - 텔레그램 API·OAuth 등 인증 설정을 올바르게 해야 하며, API 키·자격 증명 노출 주의.
- 유지보수 효율화
  - 기존 데스크탑 Cloud Code를 그대로 사용하면 기능 중복(데스크탑 vs 모바일)을 피할 수 있어 유지보수 부담 감소.
- 설정 시간·난이도
  - 영상 기준 제작자는 수 시간(최대 10–30분 설명) 내 설정 완성 가능하다고 언급. 비기술적 사용자도 위저드로 단계별 구성 가능.
- 음성·비디오 선택의 트레이드오프
  - 음성 엔진 선택 시 응답 속도와 음질을 비교해 결정. 비디오 분석은 처리 시간(약 30–40초 예시)을 고려.
- 확장성
  - 필요 시 다른 LLM/CLI로 교체 가능하므로 인프라·비용 정책에 맞춰 유연하게 선택.

## 한줄 평
로컬에 구축한 Cloud Code를 Anthropics agent SDK로 원격 인터페이스(텔레그램 등)와 연결해, 멀티모달·스케줄링·통합 메모리까지 갖춘 개인비서를 빠르게 재사용·구성하는 실무 가이드입니다.
