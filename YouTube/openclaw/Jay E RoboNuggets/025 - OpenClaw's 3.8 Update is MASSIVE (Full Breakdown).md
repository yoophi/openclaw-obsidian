---
title: "OpenClaw's 3.8 Update is MASSIVE (Full Breakdown)"
source: "https://www.youtube.com/watch?v=MoKNM53PLS4"
original_url: "https://www.youtube.com/watch?v=MoKNM53PLS4"
youtube_id: "MoKNM53PLS4"
playlist: "📙 openclaw"
channel: "Jay E | RoboNuggets"
duration: "10:38"
publish_date: "2026-03-09"
playlist_index: 25
tags:
  - youtube
  - playlist
  - openclaw
  - channel/jay e robonuggets
  - playlist/📙 openclaw
generated_by: "OpenClaw summarize skill"
generated_at: "2026-03-23 19:19:26 +0900"
language: "ko"
---

# OpenClaw's 3.8 Update is MASSIVE (Full Breakdown)

## 영상 정보

- 원본 주소: https://www.youtube.com/watch?v=MoKNM53PLS4
- 채널: Jay E | RoboNuggets
- 제목: OpenClaw's 3.8 Update is MASSIVE (Full Breakdown)
- 게시일: 2026-03-09
- 재생시간: 10:38
- 플레이리스트: 📙 openclaw
- 플레이리스트 순서: 25

## 영상 설명

🍳 Join RoboNuggets when you're ready to learn OpenClaw and other Agentic tools: https://www.skool.com/robonuggets/about?ref=c1365a0fede2445292bc2bbd2b9e9359 — see if that's for you + get all our templates, meet 1000+ AI practitioners, get $3M in AI tool discounts, and more 👍🏻


***

Summary 🔻
OpenClaw's biggest update yet - summarized in this full breakdown

Our AI Partner Tools (affiliate revenue go to community perks):
🥚 Free trial of n8n: https://n8n.partnerlinks.io/o3jqtj032c02 
🥚 Free trial of Blotato: https://blotato.com/?ref=robonuggets
🥚 Free trial of Make https://www.make.com/en/register?pc=robonuggets
🥚 Free trial of ElevenLabs: https://try.elevenlabs.io/m5mn2jkv5rzk
🥚 Free credits at Apify:  https://www.apify.com?fpr=sffv1
🥚 Free trial of JSON2Video: https://json2video.com/?afco=robonuggets

--- 
About Me 👋🏼 

Hey thanks for watching! I'm Jay - spent my career in data and brand building, founded the ROBO Group to help forward-looking businesses grow with AI, and now teaching what I know through this channel and the RoboNuggets community. 

If you learned something new and want to see more, support the channel by subscribing: https://www.youtube.com/@RoboNuggets

Follow on other platforms 🔻
➗ Instagram: https://www.instagram.com/robonuggets
➖ Tiktok: https://www.tiktok.com/@robonuggets
✖️ Twitter/X:  https://www.twitter.com/robonuggets
➕ LinkedIn: https://www.linkedin.com/in/j-enri/

For business, reach out at https://robolabs.so

Leave me a comment if you have a specific request! Thanks.
— J

---

#AI #AIAgents #AIAutomation #ClaudeCode #CursorAI #VibeCoding #Anthropic #MCPProtocol #Codex #AntigravityAI #Antigravity #AIAgency #AgencyAutomation #AIDevelopment #AITools #OpenAI #ChatGPT #AIWorkflow #NoCode #LowCode #AIIntegration #PromptEngineering #AIBusiness #AISaaS #AIServices #AgentBuilding #AutomationAgency #AIConsulting #AIForBusiness #ClientAutomation #AIProductivity #TechAgency #AIImplementation #BuildWithAI #AIFreelance #AIDeveloper #AIEngineering #CodingAgents #AutonomousAgents #AIAssistant #AIStartup

## 요약

## 핵심 요약
- OpenClaw 3.7·3.8 업데이트는 토픽 라우팅, 포스트 컴팩션 제어, 플러그인 확장, 백업 명령 등 작업·안전성·유연성을 크게 개선함  
- 텔레그램 내 토픽별로 모델·시스템 프롬프트·스킬을 분리해 각 토픽을 독립된 세션/메모리로 관리할 수 있음  
- 컨텍스트 컴팩션 제어(어떤 지시가 유지되는지 선택 가능)와 플러그인으로 요약 방식 커스터마이징 가능해짐  
- 전체 설정·에이전트·메모리 백업/검증 명령 추가로 복구·안전 관리를 손쉽게 수행 가능

## 주요 내용
- iOS 앱 예비 화면 및 음성 인터페이스 준비: 별도 종속성 없이 음성으로 OpenClaw와 상호작용할 가능성(세부 정보는 제한적).  
- 토픽 라우팅(텔레그램)
  - 하나의 그룹에서 여러 토픽을 만들고, 각 토픽에 대해 다른 에이전트, 모델, 시스템 프롬프트, 사용 가능한 스킬을 지정 가능.  
  - 각 토픽은 독립된 세션·메모리·워크스페이스로 동작해 컨텍스트 혼선 감소.  
  - 활성화 방법: 텔레그램 그룹 설정 → 관리 → 토픽 활성화.  
- 포스트 컴팩션 섹션 제어
  - agents.md(에이전트 초기 지시문)가 컴팩션 시 어느 부분이 유지될지 직접 지정 가능.  
  - 대형 컨텍스트(예: Opus 4.6의 100만 토큰 윈도우 — 영상 비유: 성경 두께)에 도달하면 요약(compaction)으로 이전 내용 축약됨.  
  - 요약 과정에서 중요 지시가 사라져 잘못된 동작을 유발하던 문제를 완화할 수 있음.  
  - 관련 짧은 인용: *"post compaction sections"* — 컴팩션 후에도 살아남길 원하는 지시를 명시하는 섹션.  
- 컴팩션 플러그인
  - 플러그인 형태로 요약 알고리즘을 교체/확장 가능(예: lossless claw 같은 오픈소스 플러그인으로 더 나은 압축 시도).  
  - 최근 턴 보존 수(recent turns preserved)를 사용자가 조정 가능해 컴팩션 시 더 많은 최신 메시지를 유지할 수 있음.  
- 백업 및 복구
  - openclaw backup create: 설정·에이전트·메모리·워크스페이스 전체 아카이브 생성.  
  - openclaw backup verify: 백업 유효성 검사.  
- 모델·검색·보안 업데이트
  - 새로운 모델 옵션(예: Gemini 3.1 flashlight, GPT 5.4 등) 추가로 선택 폭 확장.  
  - 내장 퍼플렉시티 검색에 언어/지역/기간 필터 옵션 추가.  
  - API 키 보호, 토큰 스니펫 제거 등 자격 증명·데이터 실행 관련 보안 강화(특히 VPS 호스트 사용 시 유의).  
- 커뮤니티·오픈소스 현황: 약 200명 기여로 빠른 발전과 장기 유지 가능성 시사.

## 실무 포인트
- 개인 이메일·중요 파일 접근 제한: 에이전트에 개인 이메일 직접 권한을 주지 말고 별도 계정/샌드박스 환경에서 운영할 것.  
- 긴급 중지 방법: 일반 채팅으로 "멈춰" 같은 메시지는 작업 큐에 쌓일 수 있으므로 실제 중단이 필요하면 *"/s stop"* (영상 표기: backslash s stop) 같은 명령으로 즉시 중단. 관련 인용: *"agent was aborted"*.  
- 핵심 안전 지시를 포스트 컴팩션 섹션에 넣어 컴팩션 후에도 유지되게 설정할 것(예: "메일 발송 금지" 등).  
- 스킬 수 관리: 하나의 에이전트에 스킬을 과다 로드하면 어떤 스킬을 사용할지 혼동하므로 토픽별로 스킬을 나누어 간결하게 유지.  
- 플러그인 사용 시 검증 필요: 오픈소스 플러그인(예: lossless claw)은 성능/안전성 검증을 거쳐 프로덕션에 배포할 것.  
- 정기 백업 습관화: 업데이트·테스트 전과 중요한 변경 전 backup create 및 verify로 롤백 포인트 확보.  
- 호스팅 보안 점검: VPS에 배포하는 경우 이번 보안 하드닝 업데이트를 반영하고 API 키 노출 로그·권한 설정을 재점검할 것.  
- iOS 앱 및 일부 기능은 아직 정보가 제한적이므로 실무 도입 전 기능·권한 동작을 먼저 테스트할 것.

## 한줄 평
OpenClaw 3.7·3.8은 에이전트 운영의 안전성·유연성·복구성을 크게 향상시켜, 실무 환경에서 더 안정적으로 여러 역할·컨텍스트를 분리·관리할 수 있게 해준다.
