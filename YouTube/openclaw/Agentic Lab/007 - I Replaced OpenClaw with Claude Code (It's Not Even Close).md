---
title: "I Replaced OpenClaw with Claude Code (It's Not Even Close)"
source: "https://www.youtube.com/watch?v=ODKMmKCgrvw"
original_url: "https://www.youtube.com/watch?v=ODKMmKCgrvw"
youtube_id: "ODKMmKCgrvw"
playlist: "📙 openclaw"
channel: "Agentic Lab"
duration: "8:55"
publish_date: "2026-03-17"
playlist_index: 7
tags:
  - youtube
  - playlist
  - openclaw
  - channel/agentic lab
  - playlist/📙 openclaw
generated_by: "OpenClaw summarize skill"
generated_at: "2026-03-23 19:06:58 +0900"
language: "ko"
---

# I Replaced OpenClaw with Claude Code (It's Not Even Close)

## 영상 정보

- 원본 주소: https://www.youtube.com/watch?v=ODKMmKCgrvw
- 채널: Agentic Lab
- 제목: I Replaced OpenClaw with Claude Code (It's Not Even Close)
- 게시일: 2026-03-17
- 재생시간: 8:55
- 플레이리스트: 📙 openclaw
- 플레이리스트 순서: 7

## 영상 설명

Automate your work with Claude Code https://skool.com/agentic
#1 Agentic Coding Community on Skool


Stop using OpenClaw as a black box. In this video, I break down the 4 zones that make up any AI agent — and show you
  how to build a programmable, transparent agent using just Claude Code and a few lines of Bash. No abstractions, no
  bloat, full control.

  We build a live email triage agent that wakes up via Telegram, reads your Gmail, and sends you a briefing — all on
  your Claude Max plan.

  ---
  Timestamps:

  0:00 - Why OpenClaw needs a better approach
  0:28 - Turning the black box into a glass box
  0:48 - The 4 zones of an agent
  1:02 - Zone 1: The Trigger
  1:13 - Zone 2: The Context
  1:26 - Zone 3: The Tools
  1:46 - Zone 4: The Output
  1:56 - Introducing claude -p
  2:13 - Email agent demo overview
  2:41 - Walking through the spec file
  3:04 - Zone 1: Telegram + cron job triggers
  4:24 - Zone 2: System prompt & customization
  5:33 - Zone 3: Session persistence with --resume
  6:06 - Zone 4: Tools (Bash, Read, fetch_emails.py)
  7:17 - Implementation details & safety
  7:49 - Live demo: "Summarize my last 10 emails"
  8:25 - Prompting flexibility
  8:46 - Join the community

## 요약

## 핵심 요약
- OpenClaw는 널리 쓰이지만 블랙박스라 프로그래밍·디버깅이 어렵고 비용과 지연 문제가 있다.  
- Cloud Code의 단일 명령(claw-p)을 이용하면 에이전트를 '유리상자(glass box)'처럼 프로그래밍 가능하고 더 저렴·빠르게 운영할 수 있다.  
- 에이전트는 네 가지 존(트리거, 컨텍스트, 도구, 출력/세션)으로 구성되며, 각 존을 명확히 분리·제어하면 안정적 자동화가 가능하다.  
- 실전 데모: Telegram/cron으로 트리거되는 이메일 요약 에이전트를 구현(환경변수, 작업공간, IMAP 스크립트, 세션 유지 등).  
- *"OpenClaw is absolutely everywhere."*  
- *"claw-p is the secret to building a powerful sniper agent that automates work for you."*

## 주요 내용
- 네 가지 존(Agent 구성)
  - 트리거: 에이전트를 깨우는 방식(heartbeat, cron, Telegram 메시지 등). 이 없으면 실행이 시작되지 않음.  
  - 컨텍스트: 매 턴마다 모델에 주입되는 정보(시스템 프롬프트, 이전 메시지, cloud.md 등).  
  - 도구: 모델이 외부와 상호작용하도록 해 주는 실행 수단(예: Bash, MCP 서버, Gmail API, IMAP 스크립트). 모델 출력 토큰이 특정 트리거를 발생시키면 도구가 실행됨.  
  - 출력/세션: 모델의 작업 결과가 기록되고, 세션 유지(또는 초기화)를 통해 컨텍스트 연속성이 관리됨.
- Cloud Code와 claw-p 명령
  - claw-p를 통해 헤드리스(headless) 모드로 bash에서 에이전트를 실행 가능(무인 실행, UI 불필요).  
  - 시스템 프롬프트 제어: 기존 프롬프트에 추가하는 append-system-prompt 방식과 전체 프롬프트를 대체하는 옵션(영상에서 'd--system'으로 언급)을 통해 동작을 바꿀 수 있음.  
  - 도구 제어: 도구 정의를 비우는(d-tools 같은 옵션) 방식으로 에이전트에 허용된 도구를 제거해 더 얇은(raw API) 호출처럼 쓸 수 있음.  
  - 세션 지속성: d-resume(영상 표기 기준) 옵션으로 에이전트가 턴 간 문맥을 기억하게 하거나, 원하면 매 메세지마다 초기화하도록 설정 가능.  
- 이메일 에이전트 데모 구성요소
  - 환경변수: Telegram 토큰, 허용 사용자 ID, Gmail 주소, Gmail 앱 비밀번호(전체 설정은 이 4개로 충분).  
  - 워크스페이스: 에이전트가 작동하는 격리된 디렉토리(간단한 데모는 파일 쓰기 없음, 복잡한 에이전트는 코드 작업공간 필요).  
  - 트리거 예: Telegram 메시지로 즉시 실행 또는 매일 오전 9시 cron으로 자동 요약 요청.  
  - 도구/스크립트: fetch_emails.py (IMAP으로 최근 24시간 이메일 조회), 에이전트는 bash 도구를 통해 이 스크립트를 호출해 읽기 전용 데이터 획득.  
  - 보안/정책: 응답은 허용된 사용자 ID로만 처리, 메시지 중복 처리 방지(uniqueness clause), 장애 허용(fault tolerance) 요구.
- 비교 포인트(영상에서 강조한 장점)
  - 비용/속도: 동일 작업을 OpenClaw로 하면 비용(영상: $1~3)과 수 분의 실행 지연 또는 타임아웃 가능성이 있으나, Cloud Code + Claude Max 토큰 조합은 더 저렴·빠름.  
  - 투명성: Cloud Code 방식은 에이전트 로직을 직접 읽고 제어할 수 있어 블랙박스보다 디버깅·유지보수 용이.

## 실무 포인트
- 필수 전제조건
  - 환경변수(토큰·아이디·이메일·앱 비밀번호) 정확히 설정 필요.  
  - 에이전트를 돌릴 호스트(로컬 또는 서버)가 계속 실행 중이어야 함(헤드리스 방식은 실행 환경 의존).  
- 보안 및 안전설정
  - 읽기 전용 접근 권한 권장(예: 이메일은 읽기 전용으로만 가져오기).  
  - 허용 사용자 ID 검증과 메시지 중복 처리로 악용·중복 실행 방지.  
  - 민감정보(앱 비밀번호 등)는 안전하게 보관·관리.  
- 세션·컨텍스트 관리 팁
  - d-resume(세션 유지)로 컨텍스트 편리성 확보, 필요 시 리셋 커맨드로 컨텍스트 로트(context rot) 방지.  
  - 시스템 프롬프트를 덧붙이거나 대체하는 옵션을 적절히 사용해 에이전트 성격을 안정적으로 제어.  
- 운영·유지보수
  - 더 복잡한 자동화는 격리된 워크스페이스에서 파일 읽기/쓰기·코드 생성 허용하도록 설계.  
  - 에이전트가 처리하는 메시지 수/작업 시간에 따라 타임아웃·리트라이 전략 설계 필요.  
  - 로그·요약 출력은 Telegram 같은 채널로 회신해 사용자 확인 루프를 명확히 둠.
- 한계와 주의점
  - 로컬·서버가 계속 가동되어야 하므로 가용성 고려 필요.  
  - 긴 작업이나 외부 API 호출이 많은 경우 모델 응답 지연이나 실패 가능성 존재.  
  - 프롬프트·도구 설정 실수는 의도치 않은 동작을 유발하므로 테스트 환경에서 충분히 검증할 것.

## 한줄 평
이 영상은 OpenClaw 같은 블랙박스 에이전트의 한계를 지적하고, claw-p(Cloud Code)를 이용해 네 가지 존을 명확히 설계함으로써 더 투명하고 비용·성능 효율적인 에이전트 구현 방법을 실제 예제와 함께 보여준다.
