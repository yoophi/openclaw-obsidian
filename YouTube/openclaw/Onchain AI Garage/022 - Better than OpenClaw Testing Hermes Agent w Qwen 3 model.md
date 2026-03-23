---
title: "Better than OpenClaw? Testing Hermes Agent w/ Qwen 3 model"
source: "https://www.youtube.com/watch?v=8tpuky8HpXw"
original_url: "https://www.youtube.com/watch?v=8tpuky8HpXw"
youtube_id: "8tpuky8HpXw"
playlist: "📙 openclaw"
channel: "Onchain AI Garage"
duration: "15:08"
publish_date: "2026-03-11"
playlist_index: 22
tags:
  - youtube
  - playlist
  - openclaw
  - channel/onchain ai garage
  - playlist/📙 openclaw
generated_by: "OpenClaw summarize skill"
generated_at: "2026-03-23 19:17:51 +0900"
language: "ko"
---

# Better than OpenClaw? Testing Hermes Agent w/ Qwen 3 model

## 영상 정보

- 원본 주소: https://www.youtube.com/watch?v=8tpuky8HpXw
- 채널: Onchain AI Garage
- 제목: Better than OpenClaw? Testing Hermes Agent w/ Qwen 3 model
- 게시일: 2026-03-11
- 재생시간: 15:08
- 플레이리스트: 📙 openclaw
- 플레이리스트 순서: 22

## 영상 설명

I heard the hype: Hermes Agent was like OpenClaw, but with better memory, enhanced skill-learning, and tougher security. So I decided to try it out myself using Qwen 3.

Watch more Onchain AI Garage: https://www.youtube.com/playlist?list=PLmpUb_PWAkDy2uX2h_3a5Qm0ss88eXKUa

Hermes Agent is a new open-source AI agent by Nous Research with a built-in learning loop, persistent memory, and terminal access. We test it from scratch — install, model setup, tool use, and coding tasks.

We walk through installing Hermes Agent on WSL2, finding a model that actually supports tool calling, and running it through web research, file ops, and code execution tasks.

✅ Open-source, MIT licensed, runs anywhere
✅ Model-agnostic — works with OpenRouter, Nous Portal, or any endpoint
✅ Built-in memory, skill creation, and cron scheduling

Scampi & Tonbi are a human-AI duo building onchain projects in public. Tonbi brings taste, judgment, and domain expertise. Scampi brings tireless research, coding, and shrimp energy. 🦐

🐦 Tonbi: https://x.com/tonbistudio
💻 Tonbi's GitHub: https://github.com/tonbistudio
🌐 Portfolio: https://www.tonbistudio.com (https://www.tonbistudio.com/)
🐦 Scampi: https://x.com/itsthatshrimple

Resources:
🔗 Hermes Agent GitHub: https://github.com/NousResearch/hermes-agent
🔗 Hermes Agent Docs: https://hermes-agent.nousresearch.com/docs/
🔗 OpenRouter: https://openrouter.ai (https://openrouter.ai/)
🔗 Qwen3 on OpenRouter: https://openrouter.ai/qwen/qwen3-235b-a22b


What we built:

• Hermes Agent installed and running on WSL2 Ubuntu
• Qwen3 235B configured via OpenRouter for tool-capable agent sessions
• CLI tests: web research, file ops, terminal commands, code execution

Coming Next:
What are some great use cases for OpenClaw?

Got questions about Hermes Agent or open-source AI agents? Drop them in the comments! If this helped, like and subscribe for more builds! 🦐✨

#HermesAgent #Qwen3 #NousResearch #OpenSourceAI #AIAgent #OpenClaw #LocalAI #WSL2 #AITools #OnchainAIGarage

## 요약

## 핵심 요약
- Hermes Agent는 OpenClaw과 유사한 터미널·툴·메모리 기능을 제공하되, *it creates and improves skills autonomously* 같은 자율적 스킬 개선 루프를 내세움.  
- 메모리 방식은 전체 텍스트 검색 기반으로 세션 간 기억을 스스로 선별·구축하는 접근을 사용(*it decides what to keep and builds a model of you without being asked.*).  
- 설치는 리눅스/맥/WSL2 환경에서 원클릭 설치 스크립트로 진행되며, 설정 마법사에서 모델·프로바이더·도구·메시징 연동 등을 선택 가능.  
- Open Router를 통해 여러 모델을 시험했으며, 일부 Hermes 모델은 Open Router 경유 시 툴 사용에 제약이 있어 모델 호환성 확인 필요.  
- 데모: 웹 탐색, 파일 생성, 의존성 설치 및 코드 실행(예: 테슬라 가격 스크립트) 등 실사용 워크플로우에서 정상 동작 및 세션 간 기억 유지 확인.

## 주요 내용
- 설치/환경
  - Windows 사용자는 WSL2 필요(WSL 버전에 2로 시작하는지 확인). 설치는 제공된 한 줄 스크립트로 의존성 자동 설치.
  - 설치 후 셸을 리로드해야 Hermes 명령을 인식(예: "Hermes not found" 오류 대응).
- 설정 마법사(설정 가능한 항목)
  - 모델·프로바이더(API 키): Open Router 선택 가능(200+ 모델). 예시로 Hermes 4, Hermes 3, Qwen 3 등 사용.
  - 백엔드 실행 모드: 로컬(default) 또는 Docker 선택 가능.
  - 메시징 플랫폼 연동: Telegram, Discord, Slack, WhatsApp 등 연동 지원(설정에서 선택).
  - 에이전트 설정: max iterations, tool progress mode(툴 활동 표시량), context compression, session reset mode, daily reset hour 등 조정 가능.
  - Pseudo(가상 사용자) 지원 설정 및 비밀번호 입력 필요.
- 툴·스킬 및 기능
  - 웹 검색·브라우저 자동화·파일 시스템 접근·코드 실행·메모리·Chrome 작업 예약·홈어시스턴트 연동 등 다양한 도구 지원.
  - 기본 제공 스킬: 80개 이상, 13개 카테고리(예: 이메일 관리, 크리에이티브 도구, 게임 관련 스킬 등).
  - 이미지 생성 옵션 등 일부 기능은 설치 시 건너뛸 수 있음.
- 모델 호환성 예시
  - Hermes 4 모델(페인튜닝된 Llama 계열)은 Open Router 경유 시 툴 사용 불가 에러 발생.
  - Qwen 3 (235B, MoE) 모델은 Open Router 통해 툴 사용 가능했고, 코딩·추론·지시 따르기 성능이 강점으로 소개됨.
- 데모 작업 흐름(영상 시연)
  - 사용 가능한 스킬 목록 조회, PolyMarket 관련 시장 정보 브라우징·요약 파일(weather.md) 생성.
  - GitHub 트렌딩 리포지토리 조사 및 AI 관련 리포 정리(마크다운 파일 생성, 추적 옵션 제공).
  - 간단 코드 과제: yfinance 설치, 테슬라 가격 가져오는 스크립트 생성·실행 → 실제 가격 반환 성공.
  - 메모리 테스트: 같은 내용(PolyMarket, GitHub 요약, 생성 파일 등)을 새 세션에서 질의하자 정확히 회상함(세션 간 기억 유지 확인).
- 프로젝트 상태
  - Hermes Agent는 영상 기준으로 출시된 지 약 2주 된 신생 프로젝트이며 개발/실험이 활발히 진행 중.

## 실무 포인트
- 필수 전제조건: Windows면 WSL2 필수(버전 확인), macOS·Linux는 바로 설치 가능.
- 설치 시 유의사항: 설치 완료 후 셸(터미널)을 재시작해야 Hermes 명령이 인식됨.
- 모델 선택 주의: Open Router를 통한 모델·툴 호환성 체크 필요(일부 모델은 툴 사용 불가). 도구 사용 목적이면 툴 지원 모델로 선택할 것.
- 설정 팁: 설정 마법사에서 max iterations, tool progress mode, session reset 등을 초기에 맞춰두면 작업 흐름이 더 예측 가능함.
- 메시징 연동: Telegram/Discord/Slack/WhatsApp 등과 연결해 CLI 외 채팅 인터페이스로도 사용 가능(설정에서 토큰/API 필요).
- 기능 검증: 브라우저 자동화·파일 생성·패키지 설치·스크립트 실행 같은 워크플로우는 데모에서 정상 작동함을 확인했으나, 안정성은 프로젝트 성숙도에 따라 변동 가능.
- 기억(메모리) 동작: Hermes의 메모리는 전체 텍스트 검색 기반으로 스스로 보존 항목을 결정하므로, 의도적 메모리 관리가 필요하면 설정·검증이 필요.

## 한줄 평
Hermes Agent의 설치·설정부터 Qwen 3 모델 연동, 툴 사용·메모리 성능까지 실전 예제로 빠르게 확인할 수 있는 입문형 데모 영상입니다. 영상은 특히 자율적인 스킬 개선과 세션 간 기억 기능을 직접 시험해보고 싶은 실무자에게 유용합니다.
