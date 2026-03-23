---
title: "OpenClaw Doesn't Work Until You Do This"
source: "https://www.youtube.com/watch?v=VwHjR0xxJ1M"
original_url: "https://www.youtube.com/watch?v=VwHjR0xxJ1M"
youtube_id: "VwHjR0xxJ1M"
playlist: "📙 openclaw"
channel: "Openclaw Labs"
duration: "9:47"
publish_date: "2026-03-16"
playlist_index: 15
tags:
  - youtube
  - playlist
  - openclaw
  - channel/openclaw labs
  - playlist/📙 openclaw
generated_by: "OpenClaw summarize skill"
generated_at: "2026-03-23 19:12:36 +0900"
language: "ko"
---

# OpenClaw Doesn't Work Until You Do This

## 영상 정보

- 원본 주소: https://www.youtube.com/watch?v=VwHjR0xxJ1M
- 채널: Openclaw Labs
- 제목: OpenClaw Doesn't Work Until You Do This
- 게시일: 2026-03-16
- 재생시간: 9:47
- 플레이리스트: 📙 openclaw
- 플레이리스트 순서: 15

## 영상 설명

OpenClaw agents are brittle when handling multiple tasks, often leading to hallucinations. This video provides a practical guide on building scalable "multi agent systems" within OpenClaw, allowing for complex workflow automation with a single command. Learn how to architect your "open claw" setup to execute entire "ai automation" sequences, ensuring your "ai agents" perform efficiently without errors. This approach helps in "programming" advanced solutions and improving overall "system design" for robust operations.

🔥 Join the Openclaw Labs  community: https://www.skool.com/openclawlabs

⏱️ TIMESTAMPS
0:00 - Why single agents fail
0:38 - The multi-agent framework explained
2:50 - Setting up your project structure
3:58 - Writing the Signal Detector subagent
4:40 - Writing the Enrichment Agent subagent
5:11 - Building the Orchestrator
5:51 - Model routing (save money on tokens)
6:35 - Error handling for production


📌 WHAT YOU'LL LEARN
- Why stuffing everything into one agent leads to hallucinations and bloated context
- How to structure multi-agent projects in Openclaw (orchestrator.md, subagents folder)
- Writing system prompts that keep agents focused and reliable
- Signal tuning, boundary setting, and tool handling
- Model routing: Haiku for lightweight tasks, Sonnet for complex ones
- Error handling that flags bad data instead of crashing your workflow

#openclaw #aiautomation #multiagent #aiworkflow #openclawtutorial #leadgeneration

## 요약

## 핵심 요약
- 단일 OpenClaw 에이전트는 여러 역할을 동시에 수행하면 불안정해지므로, 역할별 전문 에이전트를 조합한 멀티-에이전트 워크플로우가 필요하다.  
- 해결책은 오케스트레이터(조정자) + 역할별 서브 에이전트(예: 신호 탐지기, 정보 보강자) 구조로 분리하는 것.  
- 구현은 간단하며 프로젝트 폴더와 세 개의 마크다운(system prompt) 파일로 시작해 메인 에이전트에서 한 명령으로 라우팅하면 된다.  
- 운영 준비 포인트: 서브 에이전트 경계 명확화, 신호 기준 튜닝, 오케스트레이터 오류 처리, 도구 지정, 모델 라우팅.  
- 이 구조는 일관성·확장성·토큰 비용 효율을 모두 개선한다.

*OpenCL agents are brittle.*  
*You don't build one agent. You build a team and you give that team a manager.*

## 주요 내용
- 기본 개념  
  - 오케스트레이터(Orchestrator): 전체 워크플로우를 관리하는 메인 에이전트. 직접 작업하지 않고 어떤 서브 에이전트를 언제 호출할지 결정한다.  
  - 서브 에이전트(Sub agents): 각자 한 가지 역할에만 집중하는 전문 에이전트(예: 신호 탐지, 정보 보강). 출력은 구조화해서 반환한다.  
  - 라우트(route) 명령: 메인 에이전트의 마크다운에 특정 프로젝트(예: leadfinder agent)를 호출하도록 지시하는 한 줄 명령을 추가해 전체 파이프라인을 실행한다.
- 폴더/파일 구조(영상에서 제시한 패턴)  
  - workspace 내부에 projects 폴더 생성 → projects/leadfinder-agent 폴더 생성  
  - leadfinder-agent 폴더: orchestrator 마크다운 파일(오케스트레이터 system prompt)  
  - leadfinder-agent/sub-agents 폴더: signal-detector 마크다운, enrichment-agent 마크다운(각 서브 에이전트의 system prompt)  
  - 메인 에이전트의 마크다운에 "route leadfinder agent" 같은 호출을 추가하면 전체 실행 가능
- 서브 에이전트 예시(lead finder 케이스)  
  - Signal Detector: 채용 공고 등 구매 신호를 찾는 역할. 출력 예시: 회사명, 채용 역할, 공고 URL, 한 줄 이유(구조화된 데이터, 에세이 금지).  
  - Enrichment Agent: Signal Detector 결과를 받아 회사 규모, 산업, 최근 뉴스, 결정권자(이름/직함/LinkedIn URL) 등 실제 아웃리치에 필요한 정보만 반환. 불필요한 플러프 금지.
- 오케스트레이터 워크플로우  
  - 신호 탐지 서브 에이전트 실행 → 각 회사에 대해 정보 보강 서브 에이전트 실행 → 결과 모아서 최종 리포트 생성 및 반환.
- 프로덕션 준비를 위한 5가지 필수 요소  
  1) 서브 에이전트 프롬프트의 경계: 무엇을 하고 무엇을 하지 않을지 명확히 규정해 중복/충돌 방지.  
  2) 신호 기준 튜닝: 신호(High/Medium/Low) 기준을 구체적으로 정의해 잡음 감소 및 우선순위화.  
  3) 오케스트레이터 오류 처리: 보강 결과가 불완전할 때 '수동 검토 필요'로 플래그를 달아 데이터 유실을 막음.  
  4) 도구 지정: 각 서브 에이전트가 사용할 API/스크래퍼 등 도구를 명시해서 실제 수집/처리 가능하게 설정.  
  5) 모델 라우팅: 작업별로 경량 모델/강력 모델을 분리 지정해 비용과 성능 최적화.

## 실무 포인트
- 프롬프트 경계는 필수: "이 에이전트는 이것만 한다"를 문장 하나로 명확히 적으면 오케스트레이터 혼란 감소.  
- 신호 등급을 정의해 필터링·우선순위 적용(예: VP·director 급 = High, 다수의 중급 채용 = Medium 등).  
- 불완전한 보강 결과는 삭제하지 말고 "수동 검토" 태그로 남겨 사람 개입 루프를 설계하라.  
- 각 서브 에이전트에 필요한 외부 도구(API, 스크래퍼 등)를 프롬프트에 명시해야 실제 자동화가 작동한다.  
- 모델 선택을 워크플로우 설계 단계에서 결정: 단순 스크래핑엔 경량 모델, 복잡한 추론·카피라이팅엔 고성능 모델 지정.  
- 출력은 항상 구조화(필드별)로 요구해 오케스트레이터가 병합할 때 충돌을 줄여라.  
- 테스트는 소량 데이터로 먼저 돌려서 에러 핸들링, 중복, 포맷 이슈를 확인한 뒤 확장하라.  
- 한계: 서브 에이전트 프롬프트가 애매하면 파이프라인 전체가 무너지고, 일부 케이스는 여전히 사람 검증이 필요하다.

## 한줄 평
멀티-에이전트 구조를 현실적으로 구현하는 실전 가이드로, 단일 에이전트로는 해결하기 힘든 복잡한 자동화를 구조화해 안정성과 비용 효율을 크게 개선한다.
