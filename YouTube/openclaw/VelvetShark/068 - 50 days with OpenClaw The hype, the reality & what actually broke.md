---
title: "50 days with OpenClaw: The hype, the reality & what actually broke"
source: "https://www.youtube.com/watch?v=NZ1mKAWJPr4"
original_url: "https://www.youtube.com/watch?v=NZ1mKAWJPr4"
youtube_id: "NZ1mKAWJPr4"
playlist: "📙 openclaw"
channel: "VelvetShark"
duration: "47:58"
publish_date: "2026-02-20"
playlist_index: 68
tags:
  - youtube
  - playlist
  - openclaw
  - channel/velvetshark
  - playlist/📙 openclaw
generated_by: "OpenClaw summarize skill"
generated_at: "2026-03-23 19:38:32 +0900"
language: "ko"
---

# 50 days with OpenClaw: The hype, the reality & what actually broke

## 영상 정보

- 원본 주소: https://www.youtube.com/watch?v=NZ1mKAWJPr4
- 채널: VelvetShark
- 제목: 50 days with OpenClaw: The hype, the reality & what actually broke
- 게시일: 2026-02-20
- 재생시간: 47:58
- 플레이리스트: 📙 openclaw
- 플레이리스트 순서: 68

## 영상 설명

This is my 50-day OpenClaw review after running a self-hosted AI agent every single day.

In this video I show:
- 20 real OpenClaw use cases from daily life
- Discord channel architecture + per-channel model routing
- Markdown-first workflows with Obsidian + semantic search
- Background automations and health checks
- Server DevOps and coding from phone
- Cost optimization and multi-model routing
- What actually breaks (memory, compaction, browser automation)
- Security risks and how I mitigate them

This is not a first-week impression. I made the setup video featured in the official OpenClaw docs. I built Clawdiverse.com. I created a skill on ClawHub. This is a real 50-day field report.

All prompts for every workflow (copy-paste ready):
https://gist.github.com/velvet-shark/b4c6724c391f612c4de4e9a07b0a74b6

---

CHAPTERS:

0:00 Nobody has been here for 50 days yet
1:02 What is OpenClaw in 30 seconds
1:49 What 50 days actually looks like (week by week)
4:19 20 use cases across 6 categories

DAILY AUTOMATIONS
4:53 #1 Morning Twitter briefing that organizes my day
5:54 #2 "Moment Before" - daily AI art for my e-ink display
7:30 #3 Self-maintenance: auto-updates and backups while I sleep

ALWAYS-ON CHECKS
8:42 #4 Background health checks that caught my Netflix payment fail

RESEARCH & CONTENT
10:44 #5 Research agent that spawned 5 parallel sub-agents
12:09 #6 YouTube analytics I can query in plain English
14:51 #7 /summarize - any URL summarized in seconds

INFRASTRUCTURE & DEVOPS
15:28 #8 Server migration, zombie processes, and "go fix everything"
16:57 #9 Coding from my phone (but honestly, not for production)

DAILY LIFE
17:35 #10 Email triage in draft-only mode
18:01 #11 Calendar for me and my wife via WhatsApp
18:35 #12 Voice note transcription that actually does something with the note
19:25 #13 Coffee shops, snowboard boots, weather, reminders
20:59 #14 My agent helped my friend set up for 3 hours in Polish

DISCORD, KNOWLEDGE & CREATIVE
23:10 #15 Why I migrated from Telegram to Discord (biggest upgrade)
26:02 #16 Discord bookmarks replaced my Raindrop subscription
27:24 #17 Obsidian + semantic search across 3,000 notes
29:21 #18 The WordPress rickroll honeypot
31:02 #19 Excalidraw diagrams via MCP
31:53 #20 Home automation with Home Assistant (in progress)

COMMUNITY & GETTING STARTED
32:35 What the community is building
33:46 Starter pack: 3 workflows to start with today

THE HONEST PART
34:29 Memory loss and context compaction
35:59 The cost reality
36:47 The "what do I use it for?" problem
37:49 Tasks that still need babysitting
39:20 Security is real (and here's how I handle it)
40:24 My own failures and what went wrong
42:03 My 50-day scorecard
43:43 What surprised me after 50 days
45:37 The verdict: should you use OpenClaw?

---

MY TOOLS & RESOURCES:
- Clawdiverse.com (community use case directory): https://clawdiverse.com
- OpenClaw cost calculator: https://calculator.vlvt.sh
- OpenClaw official docs: https://docs.openclaw.ai
- OpenClaw security guide: https://docs.openclaw.ai/gateway/security
- ClawHub security check skill: https://clawhub.ai/TheSethRose/clawdbot-security-check

MY OTHER OPENCLAW VIDEOS:
- Full setup video (in official docs): https://www.youtube.com/watch?v=SaWSPZoPX34
- I cut my API bill by 80% with one config change: https://www.youtube.com/watch?v=fkT41ooKBuY

---

Drop your favorite use case in the comments. I want to hear what you're building.

---

OpenClaw review, OpenClaw tutorial, OpenClaw setup, self-hosted AI agent, always-on AI agent, AI agent workflows, OpenClaw Discord setup, OpenClaw Obsidian, AI agent security, AI agent cost optimization, ClawHub, ClawdBot, MoltBot

## 요약

## 핵심 요약
- 항상 켜져 있는 개인 AI 에이전트 OpenClaw를 50일간 운영한 실사용 사례와 장단점 정리.  
- 마크다운 우선 저장(Obsidian), 채널별 컨텍스트 분리(Discord), 작업별 모델 매칭(Opus vs 저비용 모델)이 핵심 운영 원칙.  
- 매일 자동 브리핑·하트비트·백업·업데이트로 일상 업무·리서치·인프라 관리를 자동화해 시간 절약과 누적된 지식 베이스 구축.  
- 한계: 컨텍스트 압축(메모리 손실), 복잡한 브라우저 자동화의 불안정성, 비용(특히 Opus) 관리 필요.  
- 시작 권장 항목: 드래프트 전용 이메일·일일 마크다운 브리핑·디스코드 인박스 채널·북마크 자동화.

## 주요 내용
- 기본 개념 및 아키텍처
  - OpenClaw: 서버(VPS/Mac Mini/Raspberry Pi 등)에서 24/7로 작동하는 개인 AI 에이전트. 메시지 앱(Discord/Telegram/WhatsApp 등)과 연동.
  - 마크다운 우선(plain text) 전략: 모든 출력과 데이터는 Obsidian의 마크다운 파일로 저장 — *No lock-in, just files.*  
  - 채널별 컨텍스트 분리(Discord): 작업별로 채널을 분리해 리서치/애널리틱스/북마크/일일 어시스턴트 등 각 채널에 고유 컨텍스트 유지.
  - 모델 라우팅: 어렵고 깊은 사고는 Opus, 루틴·하트비트 등은 저비용 모델로 분배해 비용 절감.

- 자동화·루틴 예시 (매일/무감시)
  - 오전 7시 트윗 스캔 → 상위 10개 요약을 Obsidian에 저장 + 영상 아이디어 추가.
  - 위키피디아 'On This Day' 기반 일일 이미지 생성 및 e-ink 디스플레이 푸시(퀴즈형 모드).
  - 매일 4AM 스킬 업데이트와 패키지 재시작, 실패 시 알림; 반시간 뒤 전체 설정 백업(cron).
  - 30분 간격 하트비트(이메일/캘린더/서비스 상태 등 점검)로 놓치는 사건 포착(결제 실패, 도메인 갱신 등).

- 리서치·콘텐츠 제작
  - 병렬 서브 에이전트(트위터/레딧/Hacker News/유튜브/포럼 스크래핑)로 대규모 구조화된 리서치 생성(몇 분 내, 수십 페이지).
  - 유튜브 전용 채널: (1) 애널리틱스 채널 — API 연동 자연어 쿼리 및 인사이트 도출, (2) 아이디어 리서치 채널 — 링크/생각 누적 후 에이전트가 확장·정리.
  - 요약 기능: 기사/영상/PDF 등 URL 입력시 핵심·숫자·실무 단계를 요약하고 Obsidian에 저장 가능.

- 인프라·DevOps 기능
  - 서버 API 연동으로 서비스 상태 점검, 프로세스 종료, 크론 잡 고치기 등 원격 제어. 허용/차단 명령 목록으로 보안 통제.
  - 코드 작업 지원: 휴대폰에서 버그 수정·PR 생성·간단한 기능 구현 등 가능하나 본인 주 업무용으로는 데스크탑 기반 툴을 여전히 병행.

- 개인생활·가족 관리
  - 이메일 트리아지(읽기·중요표시·초안작성, 전송은 사용자가 승인) — *draft only* 모드 권장.
  - 캘린더·가족 그룹 채팅(WhatsApp) 연동: 일정 추가·리마인더·음성메모 자동 전사(Whisper) 및 텍스트 응답.
  - 장소 검색(구글 플레이스 API), 쇼핑 보조(사이즈·재고 확인) 등 실생활 도움.

- 지식 베이스·검색
  - Obsidian + QMD 임베딩으로 매일 밤 색인 재생성(초기 색인 시간 이후엔 빠름), 의미 기반(semantic) 검색 제공.
  - 북마크 대체: 링크를 디스코드 인박스에 던지면 요약·태깅·마크다운 생성하여 지식 그래프 형성(예: Raindrop 대체).

- 부가기능 및 커뮤니티
  - Excalidraw 통합으로 자동 다이어그램/아키텍처 시각화 생성.
  - 홈 오토메이션 연동(홈 어시스턴트 음성 프리뷰 에디션)으로 조명·기기 제어 목표.
  - 커뮤니티(ClawHub/Clawdiverse)에서 다양한 스킬·비즈니스 사례 공유.

## 실무 포인트
- 초기 설정 원칙
  - 처음부터 마크다운(Obsidian)으로 모든 데이터 저장: 읽기·이동·백업이 쉬워 락인 방지.
  - 컨텍스트 분리 설계: 채널(또는 대화 단위)을 워크플로우별로 나누고 필요시 채널 추가.
  - 모델 매칭: 비용·성능 목적에 따라 채널별 모델을 설정(Opus는 깊은 사고용, 저비용 모델은 루틴용).

- 보안·권한 관리
  - 이메일·외부 입력은 잠재적 악성 프롬프트로 간주 — 드래프트 모드 유지, 자동 전송 금지.
  - 네트워크는 외부 노출 최소화(예: Tailscale 사용 권장). 명령 허용/거부 목록(allow/deny list) 설정.
  - 정기 보안 점검(ClawHub/공식 문서 기반 항목 수행)으로 설정 검증.

- 운영·복구
  - 정기 백업(cron)으로 설정·스킬·메모리 파일 모두 저장하면 서버 손상 시 30분 내 복구 가능.
  - 컨텍스트 사용량 모니터링: 세션이 길어지면 수동으로 새 세션 시작 또는 서브에이전트로 분리.
  - 복잡한 멀티스텝 브라우저 자동화는 불안정하니 중간중간 확인(베이비시팅)이 필요.

- 비용 관리
  - Opus 같은 고성능 모델은 비싸므로 멀티 모델 라우팅 전략으로 하트비트·단순 작업은 저비용 모델 배정.
  - 비용 계산기(영상에서 언급된 도구)로 시나리오별 예산 계획을 세울 것.

- 실전 팁(빠른 스타터)
  - 우선순위 3가지: (1) 드래프트 전용 이메일 트리아지, (2) 일일 마크다운 브리핑 자동화, (3) 디스코드 인박스 채널.  
  - 추가로 (4) 북마크 자동화로 지식베이스 마련 — 일주일 정도면 효과 체감 가능.

- 한계와 주의점
  - 컨텍스트 압축(메모리 손실)이 가장 빈번한 문제: OpenClaw은 길어지면 조용히 요약/압축해 중요한 정보가 사라질 수 있음.
  - 복잡한 자동화는 실패 확률↑, 에이전트는 현재 '어시스턴트'로서 보조 역할이 더 안정적.
  - 설정 난이도는 중간~상급(약 7/10) — 터미널 사용·보안 인지·비용 이해가 필요.

## 한줄 평
개인 서버에서 항상 켜두고 쓰는 AI 에이전트로서 일상·리서치·인프라 자동화에 큰 가치를 주지만, 보안·컨텍스트 관리와 비용 계획을 염두에 둔 실무적 접근이 필수다.  
*It just runs.*
