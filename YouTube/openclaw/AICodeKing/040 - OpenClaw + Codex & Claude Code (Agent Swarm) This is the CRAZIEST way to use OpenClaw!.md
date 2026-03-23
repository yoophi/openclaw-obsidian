---
title: "OpenClaw + Codex & Claude Code (Agent Swarm): This is the CRAZIEST way to use OpenClaw!"
source: "https://www.youtube.com/watch?v=kx4OOL7vpzA"
original_url: "https://www.youtube.com/watch?v=kx4OOL7vpzA"
youtube_id: "kx4OOL7vpzA"
playlist: "📙 openclaw"
channel: "AICodeKing"
duration: "8:52"
publish_date: "2026-02-28"
playlist_index: 40
tags:
  - youtube
  - playlist
  - openclaw
  - channel/aicodeking
  - playlist/📙 openclaw
generated_by: "OpenClaw summarize skill"
generated_at: "2026-03-23 19:26:43 +0900"
language: "ko"
---

# OpenClaw + Codex & Claude Code (Agent Swarm): This is the CRAZIEST way to use OpenClaw!

## 영상 정보

- 원본 주소: https://www.youtube.com/watch?v=kx4OOL7vpzA
- 채널: AICodeKing
- 제목: OpenClaw + Codex & Claude Code (Agent Swarm): This is the CRAZIEST way to use OpenClaw!
- 게시일: 2026-02-28
- 재생시간: 8:52
- 플레이리스트: 📙 openclaw
- 플레이리스트 순서: 40

## 영상 설명

In this video, I'll be telling you about how someone built a one-person dev team using OpenClaw, Codex, and Claude Code all working together as an agent swarm, pulling off 94 commits in a single day for just $100 to $190 a month.

--
Resources:

Twitter Post: https://x.com/elvissun/article/2025920521871716562

--
Key Takeaways:

🤖 OpenClaw runs an orchestrator agent called Zoe that holds all your business context, so coding agents always have the bigger picture.
💡 The two-tier system separates business context from code writing, giving each agent a specialized and focused role.
🔄 A cron job monitors all agents every 10 minutes and auto-respawns failed agents up to 3 times, so you're never babysitting.
🔍 Every PR gets reviewed by three separate AI models before it even reaches you, covering logic, security, and final validation.
📸 Any PR that changes the UI must include a screenshot, or CI fails, which dramatically cuts down human review time.
🧠 The Ralph Loop V2 makes the system smarter over time by analyzing failures and adjusting prompts based on what worked before.
⚙️ RAM is the main bottleneck, as each agent needs its own worktree, node modules, TypeScript compiler, and test runner loaded into memory.

## 요약

## 핵심 요약
- OpenClaw(오케스트레이터) + Codex, Claude Code, Gemini 등을 역할별로 분리해 에이전트 군집으로 운영하면 개발 생산성을 대폭 높일 수 있다.  
- 핵심은 단일 모델 성능이 아니라 비즈니스 컨텍스트를 보유한 상위 에이전트(Zoey)와 코드 작성에 특화된 하위 에이전트의 분업과 조율이다.  
- 자동 모니터링, 3중 AI 코드 리뷰, CI 기반 검사, 실패 시 동적 프롬프트 보정(Ralph Loop V2)으로 신뢰도를 확보해 사람이 개입하는 시간을 최소화한다.  
- 병렬 에이전트 운영의 주된 병목은 RAM(각 에이전트별 작업 트리·node_modules·테스트 러너 복제)이다.

## 주요 내용
- 아키텍처 개요
  - 상위 오케스트레이터: OpenClaw의 Zoey가 모든 비즈니스 컨텍스트(고객 데이터, 회의 노트, 과거 결정 등)를 보유하고 에이전트들을 조율.
    - *"Zoe holds all the business context"*
  - 하위 에이전트: Codex, Claude Code, Gemini 등은 코드 작성에만 집중. Zoey가 구체화한 프롬프트만 받아 작업 수행.
    - *"three different AI models reviewing each PR"*
- 워크플로우(8단계 요약)
  - 1) 스코핑 및 에이전트 생성: Zoey가 범위 결정, 필요 설정(예: 프로덕션 DB 설정)과 적절한 코딩 에이전트 생성.
  - 2) 에이전트 격리 환경: 각 에이전트는 독립된 git work tree와 전용 TM 세션, 전체 터미널 로그를 가짐.
  - 3) 모니터링 루프: 10분마다 크론이 활성 세션, 열린 PR 상태, CI 상태(GitHub CLI 통해) 등을 점검. 실패 시 최대 3회까지 자동 재시도/응답.
  - 4) PR 생성 규칙: 에이전트가 작업 완료하면 커밋·푸시·PR 생성(GHPR create-fill). 완료 정의는 PR 생성, 브랜치가 main과 동기화, CI 통과.
  - 5) 자동 코드 리뷰: 각 PR에 대해 Codex(엣지케이스·로직), Gemini(보안·확장성·UI 감각), Claude Code(최종 검증) 등 3중 AI 리뷰 적용.
  - 6) 자동화된 테스트/CI: 린트, TypeScript 검사, 유닛/엔드투엔드 테스트 실행. UI 변경 PR은 스크린샷 첨부 규칙(스크린샷 없으면 CI 실패).
  - 7) 휴먼 리뷰 및 머지: 자동화 검증을 통과하면 대부분 5~10분 내 머지. 사람이 코드 전체를 상세히 읽지 않아도 신뢰 수준 확보.
  - 8) Ralph Loop V2(피드백 고도화): 실패 시 동일 프롬프트로 재시도하지 않고 비즈니스 컨텍스트 기반으로 실패 원인을 분석해 프롬프트를 동적으로 수정. 에러 로그/회의 노트/깃 히스토리로 신규 작업도 도출.
- 역할 분배(언급된 용도)
  - Codex: 백엔드 로직, 복잡한 버그, 다중 파일 리팩터 등 약 90% 작업 담당.
  - Claude Code: 프론트엔드 작업, git 작업, 빠른 반복 사이클.
  - Gemini: UI 및 디자인 감성 관련 검토·생성.
- 운영·추적
  - JS 기반 태스크 레지스트리(cloudbot/active-tasks.js)에 모든 작업 상태, PR 번호, 완료 타임스탬프, 검증 체크 기록.
  - Timmucks(언급된 도구)로 에이전트가 작업 중 벗어났을 때 실시간으로 코스 보정 가능.
- 비용·성과 (영상에서 인용된 수치)
  - 주장되는 성과 예: *"94 commits in a single day, seven pull requests done in 30 minutes"* (영상에서 제시된 사례).
  - 비용 범위(영상 언급): 대략 $100~$190/월(구성 방식에 따라 다름).

## 실무 포인트
- 세팅 팁
  - 비즈니스 컨텍스트는 중앙(영상에서는 Obsidian vault)에 체계적으로 보관. Zoey 같은 상위 에이전트가 참조하도록 정형화된 노트·결정 기록 필요.
  - UI 변경 PR에는 스크린샷 첨부를 CI 규칙으로 강제하면 리뷰 시간과 위험을 크게 줄여준다.
  - 각 에이전트는 독립 작업 트리와 전용 세션으로 격리해 충돌과 추적을 용이하게 하라.
  - 모니터링 크론(예: 10분 주기)과 자동 응답/재시도 정책을 통해 사람의 상시 감시 필요성을 낮춘다.
- 리소스·제약
  - RAM이 주된 병목: 동시 에이전트 수를 제한하거나 에이전트당 가벼운 환경(의존성 캐시, 공유 컴파일러 등) 설계를 고려해야 함.
  - 신뢰성 전제: 자동 리뷰·테스트에 과도히 의존하면 미묘한 설계 결함이나 컨텍스트 기반 의사결정을 놓칠 수 있으므로 중요 변경은 사람 리뷰 권장.
- 유지·관리
  - Ralph Loop V2처럼 실패 학습 루프를 구축하면 시간이 지날수록 성공 패턴을 학습해 안정성 향상.
  - 태스크 레지스트리를 통해 실시간 상태를 노출하면 디버깅과 감사가 쉬워짐.
  - 에이전트별 역할과 한계를 명확히 문서화(어떤 모델이 어느 업무에 최적인지)하면 분업 효율이 높아짐.

## 한줄 평
에이전트를 단순히 많이 띄우는 것이 아니라 비즈니스 컨텍스트를 중심으로 역할을 분리·조율하고, 자동화된 리뷰와 학습 루프를 결합한 실무적 설계 사례를 보고 싶다면 이 영상은 유용하다.
