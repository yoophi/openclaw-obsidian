---
title: "I Build a FREE OpenClaw with Antigravity + Opencode (It’s INSANE)"
source: "https://www.youtube.com/watch?v=Uuke9w4lAeA"
original_url: "https://www.youtube.com/watch?v=Uuke9w4lAeA"
youtube_id: "Uuke9w4lAeA"
playlist: "📙 openclaw"
channel: "SoftwareGent"
duration: "38:01"
publish_date: "2026-03-03"
playlist_index: 34
tags:
  - youtube
  - playlist
  - openclaw
  - channel/softwaregent
  - playlist/📙 openclaw
generated_by: "OpenClaw summarize skill"
generated_at: "2026-03-23 19:24:09 +0900"
language: "ko"
---

# I Build a FREE OpenClaw with Antigravity + Opencode (It’s INSANE)

## 영상 정보

- 원본 주소: https://www.youtube.com/watch?v=Uuke9w4lAeA
- 채널: SoftwareGent
- 제목: I Build a FREE OpenClaw with Antigravity + Opencode (It’s INSANE)
- 게시일: 2026-03-03
- 재생시간: 38:01
- 플레이리스트: 📙 openclaw
- 플레이리스트 순서: 34

## 영상 설명

👉 Join my Skool Community & Learn How to Build Your Own AI SaaS: https://www.skool.com/ai-saas-builders

🚀My AI Startup - AI File Organizer: https://www.softwaregentofficial.com

📩 Business inquiries:
softwaregentofficial@gmail.com

Links:
🚀 Voice Transcription App: https://ref.wisprflow.ai/Softwaregent
👉Openclaw Repo: https://github.com/openclaw/openclaw
🧲 Antigravity: https://antigravity.dev
💻 Opencode: https://opencode.ai
🦾 OpenClaw: https://openclaw.ai
🐳 Docker: https://www.docker.com/
🟢 Node.js: https://nodejs.org/

Timestamps⌚:
00:00 Intro
00:41 Overview
03:34 Download Apps
06:44 Start Building
13:45 Connect to Telegram
16:31 Install Ollama
20:41 Voice transcription
22:39 Giving it Memory
29:00 Create CronJobs
31:17 Third Party Apps
35:45 Build Interface



I Build a FREE OpenClaw with Antigravity + Opencode (It’s INSANE) – In this video, I show you how I built a completely free version of OpenClaw using Antigravity together with Opencode to automate the development workflow. We go step by step through planning the architecture, generating the core features, setting up the environment with Node.js, containerizing with Docker, and getting everything running locally. You’ll see how to recreate powerful AI tooling without paying for expensive subscriptions and how to structure the project properly so it’s scalable. This is a practical, real-world build for developers and founders who want to leverage AI to create serious tools without spending money.

🚀 LIKE, SUBSCRIBE & COMMENT if you want to build unstoppable AI products 🤖⚡

## 요약

## 핵심 요약
- Antigravity(에이전트 중심 도구)와 OpenCode(코드 실행·모델 선택 도구)를 결합해 OpenClaw 클론을 완전 무료로 구축하는 과정 설명  
- 로컬 LLM(Ollama + Llama 계열)과 Whisper로 모델·음성 인식을 로컬에서 운영해 API 비용을 제거  
- Telegram 연동, 음성 전사, RAG(메모리) 구현(Supabase), cron 작업 스케줄링, 외부 서비스 연동(MCP via Zapier)과 간단한 웹 UI까지 완성

## 주요 내용
- 준비물 및 설치
  - Antigravity(데스크탑 앱), OpenCode(터미널 또는 확장), Node.js, Docker 설치 필요  
  - OpenCode는 터미널에서 설치 커맨드 또는 확장으로 추가 가능; Antigravity 내 터미널로 OpenCode 실행
- 저장소 분석 및 빌드 플랜
  - 공식 OpenClaw GitHub를 Antigravity에 분석시키고 Claude/Opus(영상에서는 Opus 4.6)를 써서 상세 빌드 플랜 생성  
  - 생성된 플랜을 프로젝트 파일(build/plan)로 저장하고 OpenCode에게 해당 플랜을 따라 코드 생성·수행하도록 지시
- 모델 선택 전략
  - Antigravity는 고급 에이전트 기능과 일부 강력 모델(Opus 4.6 등) 접근에 강함  
  - OpenCode는 다양한(무료 포함) 모델 선택과 코드 실행에 유리 — 예시로 Minimax M2.5(무료)를 사용해 코드 생성
- 로컬 LLM과 음성 인식
  - Ollama를 설치해 Llama 계열 모델(예: 3B, 8B 등)을 로컬에서 구동하여 API 비용 제거  
  - Whisper 설치로 Telegram의 음성 메시지를 로컬에서 전사(transcription) 처리
- Telegram 연동
  - BotFather로 봇 생성 → 발급된 토큰을 Antigravity/OpenClaw 구성에 입력해 Telegram 연동  
  - 초기엔 LM 미연결 상태라 응답 없음 → Ollama/Llama 연결로 응답 가능
- 메모리(RAG) 구성
  - Supabase를 벡터 DB/RAG 백엔드로 권장(영상은 Supabase 프로젝트·토큰 생성 후 Antigravity MCP 도구로 자동 셋업)  
  - 테이블 예시: memories, messages — 대화와 임베딩을 저장해 지속적 메모리 구현
- Cron(스케줄링) 작업
  - OpenClaw 방식과 동일하게 Superbase 테이블에 cron job 저장·스케줄러 구현  
  - 서버 재시작 후 예약 작업이 정상 실행되는지 확인
- 외부 서비스(MCP) 통합
  - Antigravity MCP 서버 목록을 통해 일부 서비스 직접 연결 가능하지만, Zapier/N8n 같은 자동화 플랫폼을 중계하면 훨씬 많은 서비스(Gmail 등)를 쉽게 연결 가능  
  - Zapier에서 MCP 서버 생성 → 토큰 복사 → Antigravity에 등록하여 봇이 외부 서비스 호출 가능하게 설정
- 프론트엔드
  - OpenClaw와 유사한 웹 UI를 Antigravity가 자동 생성, 로컬호스트에서 채팅 인터페이스 제공

- 영상의 직접 인용 예시(강조가 되는 문장)
  - *"we're not going to spend any money on API tokens"*
  - *"It keeps it short one to three sentences challenges you and is also brutally honest with us."*

## 실무 포인트
- 비용 절감 팁
  - 코드 생성·초기 빌드는 OpenCode+무료 모델로 처리해 토큰 소비를 최소화; 실제 서비스는 로컬 Ollama로 운영하면 API 비용을 거의 0으로 유지 가능
- 모델·하드웨어 고려사항
  - Ollama에서 돌릴 모델 크기(3B, 8B, 13B 등)에 따라 필요한 VRAM/디스크가 크게 달라짐. 자원 여건에 맞는 모델을 선택할 것
- 보안·토큰 관리
  - Telegram 봇 토큰, Supabase 키, Zapier 토큰 등 민감 정보를 로컬 환경·비밀 저장소에 안전히 보관하고 공개 저장소에 업로드하지 말 것
- 안정성·운영
  - cron·스케줄러 변경 시 서버 재시작이 필요할 수 있음. 배포 환경(도커 등)에서 자동 재시작 정책을 설정해 둘 것
- 기능 확장성
  - Antigravity는 에이전트형 테스트·자동화에 강하므로 반복적 작업(의존성 설치, DB 생성, 외부 API 연동)을 에이전트에 맡기면 개발 속도 향상
- 한계와 주의점
  - Antigravity가 모든 모델을 지원하지 않음(모델 접근성 차이 존재). 필요한 모델이 없으면 OpenCode나 다른 경로로 보완해야 함  
  - 로컬 모델·음성 모델은 정확도 및 리소스 면에서 클라우드 모델과 차이가 있을 수 있음 — 요구 품질에 따라 적절한 선택 필수

## 한줄 평
Antigravity와 OpenCode를 조합해 로컬 LLM·Whisper·Supabase를 연결하면 완전 무료로도 OpenClaw 수준의 커스터마이징 가능한 챗봇 인프라를 빠르게 구축할 수 있다.
