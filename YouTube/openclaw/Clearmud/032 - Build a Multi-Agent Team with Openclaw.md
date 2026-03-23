---
title: "Build a Multi-Agent Team with Openclaw"
source: "https://www.youtube.com/watch?v=WqWMszBB9t0"
original_url: "https://www.youtube.com/watch?v=WqWMszBB9t0"
youtube_id: "WqWMszBB9t0"
playlist: "📙 openclaw"
channel: "Clearmud"
duration: "8:11"
publish_date: "2026-03-03"
playlist_index: 32
tags:
  - youtube
  - playlist
  - openclaw
  - channel/clearmud
  - playlist/📙 openclaw
generated_by: "OpenClaw summarize skill"
generated_at: "2026-03-23 19:23:09 +0900"
language: "ko"
---

# Build a Multi-Agent Team with Openclaw

## 영상 정보

- 원본 주소: https://www.youtube.com/watch?v=WqWMszBB9t0
- 채널: Clearmud
- 제목: Build a Multi-Agent Team with Openclaw
- 게시일: 2026-03-03
- 재생시간: 8:11
- 플레이리스트: 📙 openclaw
- 플레이리스트 순서: 32

## 영상 설명

What if you could run an entire AI team: a CTO, CMO, CRO, and COO all as OpenClaw agents that talk to each other, hold meetings, and file reports? 

That's exactly what I built. And in this video, I'm pulling back the curtain on the full setup so you can copy it. I show you how to wire agents together so they communicate. And finally, autonomous standups where your AI team holds daily meetings without you lifting a finger.

⏱️ TIMESTAMPS:
0:00 - In this video
0:19 - My Multi-Agent Setup
1:11 - My Inter-Agent Communication
2:10 - Org Chart
2:27 - Don't Just Copy
2:43 - Agent Config
2:59 - Inter-Agent Communication
4:14 - Prompts
6:08 - DON'T SKIP THIS STEP
6:44 - Bootcamp Preview
7:32 - Key takeaways

🧰 TOOLS FEATURED:
→ OpenClaw: https://openclaw.ai
→ OpenClaw Docs (Multi-Agent): https://docs.openclaw.ai/concepts/multi-agent
→ OpenClaw GitHub: https://github.com/openclaw/openclaw

📺 RELATED VIDEOS:
→ 3 Things You Should Do Right After Installing OpenClaw: https://www.youtube.com/watch?v=Sf-MEy5m0Y4&
→ I Built 25 AI Agents to Run My Business: https://www.youtube.com/watch?v=zwV5qC1wS6M&

💬 What departments would YOUR AI team have? Drop your org chart idea in the comments. I want to see what you build.

Making AI simple and easy to use. For businesses, entrepreneurs, and creatives.

Subscribe for weekly hands-on AI builds from Clearmud → https://www.youtube.com/@Clearmud

#OpenClaw #AIAgents #MultiAgent #AITeam #Automation #BuildWithAI #AIForBusiness #OpenClawTutorial #AIWorkflow #Clearmud #CopyMe #AISetup

## 요약

## 핵심 요약
- OpenClaw로 다수의 에이전트를 조직화한 멀티에이전트 운영체계(Muddy OS) 구조와 운용 원칙을 소개  
- 에이전트별 ID·모델·메모리·심박(heartbeat)·세션(통신) 설정이 핵심 구성 요소  
- 에이전트 간 위임(delegate)과 자동화(cron + 스킬), 그리고 일일/주간/월간 회의 자동화로 운영을 최적화  
- 특정 키워드로 에이전트가 직접 실행하는 오버라이드(예: *"Do it now."*)와 보고 기반의 파이어앤포겟 워크플로우 구현  
- 실습용 프롬프트 템플릿 제공으로 사용자가 자신의 조직에 맞게 에이전트를 생성·조정하도록 안내

## 주요 내용
- 조직 구조
  - 사람(CEO)은 최종 의사결정자. Muddy가 주요 오케스트레이터(연구·대리·집행 보조). CTO/CMO/CRO 등 역할별 에이전트 배치.
  - 각 주요 에이전트와 서브에이전트는 독립 워크스페이스와 심박(heartbeat)을 가짐.
- 에이전트 기본 설정
  - 에이전트마다 고유 ID 설정 필요. 세션 키로 이 ID를 사용해 에이전트 간 메시징 설정.
  - 기본(Primary) 모델 지정, 정체성(identity)·책임(responsibilities)·성격(personality traits) 정의.
  - 스타트업 시퀀스(startup sequence)와 빈 메모리(empty memory) 또는 정해진 메모리 구조 설정.
- 에이전트 간 통신 및 위임
  - sessions send를 툴로 활성화해야 에이전트 A가 에이전트 B에게 메시지·업무 위임 가능.
  - 위임 예시: Muddy가 Elon(CTO)에 "블로그 배포 CSS 문제 확인"처럼 특정 담당자로 라우팅.
  - 위임은 기본적으로 ‘fire-and-forget’ 방식으로 Muddy가 보고를 받고 실행 책임은 수신 에이전트에게 있음.
  - 특정 문구로 오버라이드: *"Do it now."*을 끝에 붙이면 에이전트가 다른 구조를 거치지 않고 직접 실행.
- 자동화(크론, 스킬)
  - 각 크론(cron)은 고유한 스킬(skill)과 연결해 지정된 워크플로우를 실행하도록 권장.
  - 크론 주기와 수행 스킬은 사용자가 직접 정의하되, 스킬은 개인화된 커스텀 워크플로우로 관리.
- 회의 및 동기화
  - 일일(매일) executive sync: 직전 2~3개 대화 기록을 읽고, 3라운드 토론을 진행하고, 대화록 생성, 음성 오디오 생성, 요약을 텔레그램에 전송 등 자동 회의 워크플로우 제안.
  - 주간/월간 캘린더로 진행 상황 추적. 대화 메모리를 통한 반복 방지 및 이력 참조.
- 운영·유지보수
  - 인프라 업그레이드용 'Infra Saturday'처럼 시스템 가동중단·유지보수 일정 관리 가능.
- 제공 프롬프트(요약)
  - 에이전트 생성 템플릿 예시: 이름·역할·모델·성격·정체성·전담 분야·스타트업 시퀀스·메모리·보고 대상 지정 및 sessions send 활성화 후 간단한 위임 테스트 수행.
- 저자가 강조한 원칙
  - 단순 복붙 금지: 각자 필요에 맞게 에이전트와 워크플로우를 설계할 것.
  - 점진적 확장: 처음엔 소수의 서브에이전트로 시작해 필요에 따라 확장.

*“This is the true unlock with automations and multi-agent teams.”*  
*“Do it now.”*

## 실무 포인트
- 필수 설정: 에이전트별 고유 ID와 primary model 설정, sessions send(세션 전송) 활성화로 에이전트간 메시징 보장.
- 테스트: 에이전트 A→B 위임 테스트를 반드시 수행해 메시징·보고 경로가 정상인지 확인할 것.
- 크론·스킬 설계: 각 정기 작업(cron)에 대해 전용 스킬을 만들어 재현 가능한 워크플로우로 관리. 스킬은 팀 고유의 로직으로 유지.
- 메모리·심박 관리: 에이전트가 중복 작업하지 않도록 최근 대화·작업 히스토리를 메모리로 유지하고, heartbeat로 상태 모니터링.
- 오버라이드 사용 주의: *"Do it now."* 같은 직접 실행 키워드는 남용하면 자동화 구조를 우회하므로 필요 시에만 사용.
- 조직 설계 우선: 단순 템플릿 적용보다 먼저 어떤 역할·책임이 필요한지 설계하고 에이전트를 맞춤 제작해야 효과적.
- 운영 가용성 고려: 백엔드 업그레이드 등으로 시스템을 오프라인해야 할 경우(예: Infra Saturday) 일정과 영향 범위를 미리 정의.
- 한계 및 전제: 초기에는 작은 집합으로 실험하고, 운영 복잡도가 증가하면 모니터링·로깅·에러핸들링 추가 필요. 발표자는 실험적 빌드 중심으로 직접 검증 결과를 공유하나 완전한 보증을 하진 않음.

## 한줄 평
OpenClaw 기반으로 역할별 에이전트를 조직화하고 자동화·회의·위임까지 운영하는 실무적 구조와 설정 프롬프트를 실전 중심으로 설명해 줍니다.
