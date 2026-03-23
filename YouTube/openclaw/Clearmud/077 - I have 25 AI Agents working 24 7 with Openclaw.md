---
title: "I have 25 AI Agents working 24/7 with Openclaw"
source: "https://www.youtube.com/watch?v=zwV5qC1wS6M"
original_url: "https://www.youtube.com/watch?v=zwV5qC1wS6M"
youtube_id: "zwV5qC1wS6M"
playlist: "📙 openclaw"
channel: "Clearmud"
duration: "12:44"
publish_date: "2026-02-12"
playlist_index: 77
tags:
  - youtube
  - playlist
  - openclaw
  - channel/clearmud
  - playlist/📙 openclaw
generated_by: "OpenClaw summarize skill"
generated_at: "2026-03-23 19:42:50 +0900"
language: "ko"
---

# I have 25 AI Agents working 24/7 with Openclaw

## 영상 정보

- 원본 주소: https://www.youtube.com/watch?v=zwV5qC1wS6M
- 채널: Clearmud
- 제목: I have 25 AI Agents working 24/7 with Openclaw
- 게시일: 2026-02-12
- 재생시간: 12:44
- 플레이리스트: 📙 openclaw
- 플레이리스트 순서: 77

## 영상 설명

I built a dashboard to manage my entire AI agent team — 25 agents, 3 AI chief of staff, voice standups, task tracking, and persistent memory. All from one screen.

In this video, I walk you through the Ops module of Muddy OS — an internal AI operations dashboard I built with React, TypeScript, Tailwind, and OpenClaw. You'll see the task manager, the org chart, voice standup meetings where AI chiefs debate strategy out loud, the framework that gives agents persistent identity, and living documentation that stays current as the system evolves.

Everything here is built with free, open-source tools. OpenClaw is free. Edge TTS is free. The dashboard is React + markdown files on a Ubuntu VM. 

No paid services, no fancy infrastructure. If you're running AI agents and want better visibility into what they're doing, this is for you.

⏱️ TIMESTAMPS:
0:00 - In This Video
0:26 - Ops Dashboard Preview
0:46 - Task Manager
1:40 - Org Chart
5:53 - Voice Standups (AI Meetings)
8:50 - Workspaces (Manage AI Agents)
11:15 - Documentation
11:48 - THANK YOU @steipete
12:14 - Closing Thoughts

🎥 RELATED VIDEOS:
No Mac Mini, No VPS Hosting → https://www.youtube.com/watch?v=D8FEYFbF7wk
The EASIEST Openclaw(Clawdbot) setup guide for Windows → https://www.youtube.com/watch?v=E3D8xEWysrI
3 Things You NEED TO DO After Install → https://www.youtube.com/watch?v=Sf-MEy5m0Y4

🧰 TOOLS FEATURED:
→ OpenClaw (AI Agent Framework): https://openclaw.ai
→ React 19 + TypeScript + Vite + Tailwind
→ Edge TTS (free text-to-speech by Microsoft)

💬 What would YOUR AI operations dashboard look like? What sections would you add? Drop a comment — I read every one.

Making AI simple and easy to use. For businesses, entrepreneurs, and creatives.

#AIAgents #OpenClaw #AIAutomation #AIDashboard #BuildWithAI #AITools #Clearmud #ReactDashboard #AIWorkflow #MuddyOS #VibeCoding #AITeam #OnePersonStartup #BuildInPublic #FreeAITools

## 요약

## 핵심 요약
- 한 대시보드(Muddy OS)로 25개의 AI 에이전트를 24/7 자율 운영하며 조직도, 작업 관리, 스케줄, 문서와 메모리를 통합 관리함.
- 중앙 브레인 역할의 Muddy가 연구·위임·오케스트레이션을 담당하고, CTO/CMO/CRO(각각 Elon/Gary/Warren 모사) 등 부서별 에이전트들이 역할 분담함.
- 모델을 목적별로 조합 사용(예: Opus 4.6 중역, Sonnet 4.5 출력 등)하고 경량 모델은 커뮤니티 역할로 비용 효율화함.
- 워크스페이스별 영속적 메모리와 '하트비트/게이트웨이' 구조로 개별 에이전트 정체성·권한을 분리·관리함.
- 음성 스탠드업 자동화, 액션 아이템 추적, 문서 실시간 업데이트 등 실무용 기능을 구현함.

*“I have 25 agents running 24/7”*  
*“Muddy is always available to me. He never cues prompts. He always delegates.”*

## 주요 내용
- 시스템 전반
  - Muddy OS라는 자체 대시보드에서 모든 에이전트·세션·크론 작업·비용 추정 등을 한 화면에서 관리.
  - 태스크 매니저로 활성 세션, 대기/유휴 상태, 토큰 소모량, 예상 비용 확인 가능.
  - 세션별 대화 기록(트랜스크립트) 열람 기능과 야간 로그, 주간 잡 스케줄링 기능 내장.
- 조직 구조와 역할
  - 최고결정권자(사용자/CEO) → Muddy(운영/연구/위임) → 세 부서장(CTO/CMO/CRO) → 각 세부 서브에이전트로 구성.
  - Muddy는 기본적으로 '위임'을 중심으로 작동, 요청 시 직접 실행도 가능.
  - 각 부서 아래에 백엔드/보안, 프론트엔드/DevOps, QA, 콘텐츠, 커뮤니티, 제품·성장 등 세부 분화.
- 모델·에이전트 매핑
  - Opus 4.6: 주요 연산·리서치·페일세이프 역할(heavy lifting).
  - Opus 4.5 / 기타(anti-gravity 등): 백업 모델로 사용.
  - Sonnet 4.5: 출력(텍스트/콘텐츠) 용도로 페어링.
  - Gemini 3 Flash: 커뮤니티용 저비용 모델로, 충분한 컨텍스트를 먹이면 높은 효율을 보임.
  - Codeex 5.3, GPT 5.3 codecs, Nano Banana Pro 등 특정 서브에이전트에 따라 조합 사용.
- 워크스페이스·메모리·정체성
  - 각 워크스페이스(예: Clay)는 자체 ‘영혼/심장박동(heartbeat)’과 독립 메모리를 가질 수 있음.
  - 일부 에이전트(Clay)는 자체 게이트웨이와 분리된 실행환경을 가짐. 반면 Elon/Gary/Warren 등은 Muddy와 동일 게이트웨이를 공유.
  - 에이전트 메모리는 대화·중요 일정·작업 컨텍스트를 저장해 후속 체크인 가능.
- 스탠드업과 자동화
  - 음성 스탠드업 생성 및 녹음(오픈 소스 마이크로소프트 모델 사용), 텔레그램 알림으로 오디오 확인 가능.
  - 자동 스탠드업으로 에이전트 간 자체 대화·액션 아이템 생성, 완료 여부 트래킹 UI 제공.
- 문서화
  - 운영 대시보드 변경사항을 실시간으로 문서화해 에이전트와 사람들이 참조할 수 있도록 자동 업데이트.

## 실무 포인트
- 중앙 브레인(운영 에이전트)을 먼저 튼튼히 구축하라: Muddy처럼 컨텍스트를 충분히 축적하면 다른 에이전트 관리·조정이 수월해짐.
- 모델을 용도에 맞게 조합하라: 리서치·검증은 고성능 모델, 콘텐츠 출력은 비용 효율적 모델을 페어링하면 비용·성능 균형을 맞출 수 있음(예: Opus + Sonnet).
- 워크스페이스별 권한·메모 설계 중요: 독립된 게이트웨이/하트비트가 필요한지 판단해 에이전트 정체성과 접근 범위를 분리하라.
- 자동화와 검증 병행: 스탠드업·액션 아이템 자동생성은 생산성 증가, 반드시 완료 검증(체크/리뷰) 프로세스도 마련할 것.
- 비용·세션 모니터링 필수: 토큰 소모 및 추정비용을 대시보드에서 실시간 확인해 모델 사용을 조정하라.
- 컨텍스트 공급의 중요성: 저비용 모델도 충분한 컨텍스트(문서·지침)를 주면 높은 성능을 발휘하므로 사전 데이터 구축에 투자하라.
- 한계·운영 리스크
  - 현재 구조는 계속 변화 중이며(주기적 조정 필요), 확장 시 게이트웨이·메모 동기화 설계가 복잡해질 수 있음.
  - 음성 페르소나·톤 튜닝은 반복 개선 필요(버전 관리 권장).
  - 많은 설정과 컨텍스트 투입이 필요하므로 초기 구축 비용(시간)이 높음.

## 한줄 평
실무에 적용 가능한 '에이전트 팀 운영 대시보드'의 구체적 구현 사례와 설계 원칙을 보여주며, 여러 모델을 조합해 비용과 성능을 균형있게 운영하는 방법을 배울 수 있는 영상.
