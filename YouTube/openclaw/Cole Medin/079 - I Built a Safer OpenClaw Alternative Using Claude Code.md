---
title: "I Built a Safer OpenClaw Alternative Using Claude Code"
source: "https://www.youtube.com/watch?v=XmweZ4fLkcI"
original_url: "https://www.youtube.com/watch?v=XmweZ4fLkcI"
youtube_id: "XmweZ4fLkcI"
playlist: "📙 openclaw"
channel: "Cole Medin"
duration: "15:14"
publish_date: "2026-02-11"
playlist_index: 79
tags:
  - youtube
  - playlist
  - openclaw
  - channel/cole medin
  - playlist/📙 openclaw
generated_by: "OpenClaw summarize skill"
generated_at: "2026-03-23 19:43:51 +0900"
language: "ko"
---

# I Built a Safer OpenClaw Alternative Using Claude Code

## 영상 정보

- 원본 주소: https://www.youtube.com/watch?v=XmweZ4fLkcI
- 채널: Cole Medin
- 제목: I Built a Safer OpenClaw Alternative Using Claude Code
- 게시일: 2026-02-11
- 재생시간: 15:14
- 플레이리스트: 📙 openclaw
- 플레이리스트 순서: 79

## 영상 설명

OpenClaw is the fastest-growing open-source AI project in recent memory - 185,000 GitHub stars already! A legitimately impressive personal AI assistant that can manage your life and you can talk to it anywhere. But it has serious security issues - the docs literally say "there is no perfectly secure setup."

So I took the core genius ideas from OpenClaw - the memory system, the proactive heartbeat, the multi-platform adapters, the extensibility through skills - and I built my own version using just Claude Code. It took me two days. 

The result is simpler, more secure, and tailored exactly to what I need. I'll introduce you to how I did this now and more content on this coming soon!

~~~~~~~~~~~~~~~~~~~~~~~~~~

- The Dynamous Agentic Coding Course is now FULLY released - learn how to build reliable and repeatable systems for AI coding: 
https://dynamous.ai/agentic-coding-course

- The Excalidraw diagram I cover in this video:
https://drive.google.com/file/d/1s97vx40pWb2kSH-rfdbzoqIESbX9lKg5/view

- Second Brain Skills Collection (open source):
https://github.com/coleam00/second-brain-skills

- OpenClaw Repository:
https://github.com/openclaw/openclaw

~~~~~~~~~~~~~~~~~~~~~~~~~~

Sources for the OpenClaw security issues:

- CVE-2026-25253 - One-click RCE via WebSocket origin bypass (CVSS 8.8, discovered by Mav Levin at depthfirst):
https://thehackernews.com/2026/02/openclaw-bug-enables-one-click-remote.html

- depthfirst original writeup of the RCE chain:
https://depthfirst.com/post/1-click-rce-to-steal-your-moltbot-data-and-keys

- CVE-2026-25157 - OS command injection in macOS SSH handling:
https://www.securityweek.com/vulnerability-allows-hackers-to-hijack-openclaw-ai-assistant/

- 230-414+ malicious skills published to ClawHub registry (76 confirmed malware payloads, 91% used hybrid attacks):
https://www.bleepingcomputer.com/news/security/malicious-moltbot-skills-used-to-push-password-stealing-malware/

- 42,665 publicly exposed OpenClaw instances (Censys scan: 21,000+):
https://www.darkreading.com/application-security/openclaw-ai-runs-wild-business-environments

- Cisco AI Defense: "Absolute nightmare" + Skill Scanner released:
https://blogs.cisco.com/ai/personal-ai-agents-like-openclaw-are-a-security-nightmare

- Researcher hijacked OpenClaw in 1 hour 40 minutes:
https://thenewstack.io/openclaw-moltbot-security-concerns/

~~~~~~~~~~~~~~~~~~~~~~~~~~

0:00 OpenClaw - The Magical AI Assistant
2:10 The Major Security Risks
5:16 4 Core Components of OpenClaw
8:21 Replicating the Memory System
10:31 The Heartbeat & Proactive Tasks
11:22 Channel Adapters & Interfaces
12:17 Building Secure Custom Skills
13:38 Step-by-Step Build Process (Simple, High Level)

~~~~~~~~~~~~~~~~~~~~~~~~~~

Join me as I push the limits of what is possible with AI. I'll be uploading videos weekly - at least every Wednesday at 7:00 PM CDT!

## 요약

## 핵심 요약
- OpenClaw는 개인 AI 어시스턴트로서 매우 강력하고 인기 있지만, 아키텍처와 권한 설계 때문에 심각한 보안 이슈를 안고 있음.  
- 영상 제작자는 OpenClaw의 핵심 아이디어(메모리, 프로액티브 심장(heartbeat), 채널 어댑터, 스킬 레지스트리)를 그대로 참고해 보다 안전한 자체 시스템을 Claude Code로 빠르게 재구현함.  
- 자체 구현은 Markdown 기반 메모리 + SQLite/Postgres RAG, Claude Agent SDK(Cloud Code)를 활용한 스케줄러, 최소화한 어댑터(예: Slack/터미널), 자체 스킬 구현으로 구성되어 있음.  
- 공개 레지스트리(Claw Hub)와 평문 자격증명 저장, 원클릭 원격 코드 실행 취약성 등으로 인해 기본 OpenClaw 배포는 데이터 및 키 탈취 위험이 큼.  
- 자체 빌드는 비용 효율적이며(개인 구독 활용), 권한·구성에 대한 완전한 이해와 제어를 가능하게 함.

*OpenClaw is the personal AI assistant right now*  
*I was able to replicate everything that's powerful about OpenClaw in just a couple of days.*

## 주요 내용
- 보안 문제(핵심)
  - 원클릭 원격 코드 실행 취약점: 악성 링크 클릭만으로 O 토큰 전송 → 인스턴스 접근 및 평문으로 저장된 API 키/시크릿 탈취 가능.  
  - Claw Hub의 악성 패키지: 공개 스킬(패키지) 중 다수가 키/지갑/SSH 등을 훔치도록 설계되어 있음.  
  - 코드베이스 규모와 에이전트 권한의 조합이 추가적인 위험을 만듦(무분별한 권한 부여 위험).
- OpenClaw의 핵심 설계 요소(재현 포인트)
  - 메모리 시스템: Markdown 기반 파일 구조(예: soul.md, user.md, memory.md, agents.mmd, session 로그) + SQLite를 이용한 경량 RAG 구현.  
  - Heartbeat(프로액티브 에이전트): heartbeat.md를 참조해 주기적으로(예: 30분) 자동으로 작업 제안/실행(알림, 초안 작성 등)을 수행.  
  - 채널 어댑터: WhatsApp/Telegram/Slack/Discord 등 다양한 플랫폼 연동 구조—단, 실제로는 한두 플랫폼만 사용해도 충분.  
  - 스킬 레지스트리: 단일 파일로 기능을 추가/확장할 수 있는 구조(공개 레지스트리는 보안 위험).
- 저자의 재구현 스택 및 방식
  - 코드 에이전트: Claude Code(Claude Agent SDK)를 사용해 OpenClaw 리포지토리를 학습시키고 자체 구현을 자동 생성/적용.  
  - 스토리지/DB: 로컬은 Markdown + SQLite(RAG), 원격 배포 시 Postgres 사용. Obsidian으로 마크다운 동기화해 로컬 빠른 검색 유지.  
  - 실행 방식: Python 스크립트에서 Claude Code(Cloud Code)를 호출해 heartbeat를 스케줄(현재 30분)로 실행.  
  - 어댑터는 최소화(예: Slack + 터미널)하고 필요 시 코드 에이전트로 새 어댑터를 원샷 생성 가능.  
  - 스킬은 로컬로 직접 작성·관리하여 공개 레지스트리의 악성 패키지 위험을 회피.
- 복제 방법(요약된 절차)
  - OpenClaw 리포지토리(MIT)를 로컬로 클론.  
  - 코드 에이전트에 리포지토리를 분석하도록 지시(메모리 시스템·heartbeat 등 구조 설명 요청).  
  - 에이전트가 생성한 설계/코드를 자신 환경(데이터베이스·동기화·어댑터)에 맞춰 구현.  
  - 각 구성 요소(메모리, heartbeat, 어댑터, 스킬)를 반복적으로 동일 방식으로 재구성.

## 실무 포인트
- 보안/권한 관리
  - 절대 평문으로 API 키나 시크릿을 저장하지 말 것(환경 변수, 시크릿 매니저 사용 권장).  
  - 공개 스킬/패키지 설치 전 코드 검토 필수. 외부 레지스트리는 신뢰할 수 없다고 가정하라.  
  - 에이전트에 부여하는 권한을 최소화(원격 코드 실행·시스템 명령 등 민감 권한은 제한).  
- 운영·비용
  - 개인 Claude(Anthropic) 구독으로 Cloud Code를 직접 호출하면 비용 효율적(단, TOS 준수 확인 필요).  
  - 로컬 개발용은 SQLite+Obsidian 동기화로 빠른 검색, 원격 배포는 Postgres로 확장성 확보.  
- 설계/운영 팁
  - 우선 하나의 채널 어댑터만 선택해 운영하고 필요 시 확장. 복수 채널보다 단일 채널 집중이 관리/보안 측면에서 유리.  
  - heartbeat 주기와 자동화 수준은 단계적으로 올리기(먼저 알림·초안 생성으로 시작 후, 자동 실행 권한 확대).  
  - 코드 에이전트를 활용할 때는 명확한 예제와 제약을 주어 원치 않는 동작을 방지.  
- 한계·주의사항
  - 대형 오픈소스 프로젝트를 무비판적으로 배포하면 심각한 보안 사고 발생 가능.  
  - 제작자가 말한 대로 OpenClaw의 기능적 우수성은 인정되지만, 그대로 운영하는 것은 높은 위험을 수반.

## 한줄 평
OpenClaw의 '개인화·프로액티브' 설계를 안전하게 복제하는 실무 가이드 — 보안·권한 관리를 강화해 자신만의 두뇌(Second Brain)를 빠르게 구축하고자 할 때 필수적으로 볼 영상.
