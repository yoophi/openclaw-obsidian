---
title: "How to create JOBS for OpenClaw agents"
source: "https://www.youtube.com/watch?v=uUN1oy2PRHo"
original_url: "https://www.youtube.com/watch?v=uUN1oy2PRHo"
youtube_id: "uUN1oy2PRHo"
playlist: "📙 openclaw"
channel: "Brian Casel"
duration: "20:41"
publish_date: "2026-02-25"
playlist_index: 51
tags:
  - youtube
  - playlist
  - openclaw
  - channel/brian casel
  - playlist/📙 openclaw
generated_by: "OpenClaw summarize skill"
generated_at: "2026-03-23 19:31:13 +0900"
language: "ko"
---

# How to create JOBS for OpenClaw agents

## 영상 정보

- 원본 주소: https://www.youtube.com/watch?v=uUN1oy2PRHo
- 채널: Brian Casel
- 제목: How to create JOBS for OpenClaw agents
- 게시일: 2026-02-25
- 재생시간: 20:41
- 플레이리스트: 📙 openclaw
- 플레이리스트 순서: 51

## 영상 설명

The number one question after my last OpenClaw video was: what are you actually having your agents do? Instead of just listing tasks, this video gives you a framework for hiring agents like real employees. I cover how to identify recurring needs that become real jobs, and the three systems you need so your agents can work without you in the middle of everything.

I also walk through my own setup — the custom dashboard for scheduling and dispatching tasks, how I use Skills for consistent processes, and how I've reorganized my business around markdown files so my agents always have the context they need.

👇 **Your Builder Briefing (free)**
https://buildermethods.com - Your free, 5-minute read to keep up with the latest tools & workflows for building with AI.

👇 **Join Builder Methods Pro**
https://buildermethods.com/pro - The membership for professionals (and soon-to-be-pros) for building with AI.  Private discord.  Video training library.  Official support for Agent OS.

👇 **Try my tools** (free open source):
https://buildermethods.com/agent-os
https://buildermethods.com/design-os

▶️ Related videos:
My Multi-Agent Team with OpenClaw: https://youtu.be/bzWI3Dil9Ig
Claude Code is all you need in 2026: https://youtu.be/0hdFJA-ho3c

💬 Drop a comment with your questions and requests for upcoming videos!

Chapters:

00:00 What should agents do?
01:53 Jobs for agents
05:58 3 systems for agent teams
10:04 Agent instructions (processes & skills)
15:55 Your source of truth (the Brain)

## 요약

## 핵심 요약
- 에이전트 플랫폼을 개인 비서처럼 쓰지 말고, 재현 가능한 '직무(job)'로 구조화해 실제 채용처럼 운영하라.  
- 에이전트 전용 역할은 낮은 시작 비용(작업당 토큰 비용) 덕분에 소규모 반복업무부터 빠르게 확장 가능하다.  
- 생산성 유지에는 세 가지 핵심 시스템(스케줄/디스패치, 프로세스 매뉴얼(스킬), 결과물 저장·검토)이 필요하다.  
- 스킬(문서화된 프로세스)을 단일 소스 오브 트루스로 만들고 반복 개선하면 에이전트 품질이 향상된다.  
- 작업 결과는 마크다운 기반 아티팩트로 저장·조직해 검토와 재활용을 용이하게 하라.

## 주요 내용
- 직무 vs. 작업: 단발 업무(일회성 지시)를 위임하는 대신, 정기적으로 발생하는 필요를 찾아 직무로 정의해야 채용(대행)이 의미가 있음.  
- 에이전트의 경제성: 사람을 채용할 때 필요한 최소 업무량 제약이 없어, 1~2개의 반복작업만으로도 에이전트를 도입할 수 있음(토큰 비용 기준).  
- 직무 분류 예시: (1) 현재 자신이 수행 중이라 빼내고 싶은 반복업무, (2) 지금은 안 하고 있어 놓치는 기회들.  
- 세 가지 핵심 시스템
  - 스케줄·디스패치 시스템: 에이전트가 스스로 언제 어떤 작업을 수행할지 결정하도록 예약·배포하는 시스템 필요. 플랫폼 내 빌트인 크론은 멀티에이전트 환경에서 제한적일 수 있어 커스텀 큐/대시보드를 사용.  
  - 스킬(Skill) 시스템: 각 직무의 운영매뉴얼. 폴더 하나에 skill.md(마크다운) + 참고파일/스크립트로 구성. 작업 템플릿은 스킬을 가리키도록 하여 스킬 업데이트만으로 프로세스 개선 가능.  
  - 결과물 저장·검토 시스템: 에이전트가 생성한 아티팩트(마크다운 파일 등)를 중앙에서 열람·편집하고, 알림(메시지)과 연계해 리뷰하는 환경 필요.  
- 구현 세부 포인트
  - 작업 보드: 캔반 형태로 에이전트별 반복 작업을 관리. 작업 템플릿, 스케줄(일·주·월 등), 사전지시(pre-instructions)를 설정.  
  - 디스패치 로직: 스케줄에 따라 작업을 조립해 에이전트 플랫폼 게이트웨이로 전송하고, 완료 시 알림을 받도록 연결.  
  - 실행 로그 보관: 에이전트 실행 로그를 저장해 문제 발생 시 원인 추적·디버깅 가능하게 함.  
  - 스킬 관리 워크플로: 스킬은 파일시스템(예: 동기화 폴더)에 보관해 에이전트와 빌더가 동시에 접근·수정. 버전 관리·동기화(예: 드롭박스 등)를 통해 여러 머신에서 공유.  
  - 에이전트-인간 협업: 일상 알림은 메시지(예: 텔레그램)로 받고, 상세 아티팩트는 마크다운 뷰어/에디터로 연결해 빠르게 검토·편집.  
- 개선 사이클: 초기 버전은 완벽하지 않으므로 출력물을 보고 스킬을 지속 개량하여 품질을 높여감. 개발자 도구(Codex/Cloud Code 등)를 통해 스킬 업데이트를 자동화할 수 있음.

*“a job is a recurring need.”*  
*“you're literally making your team of agents better at their jobs.”*

## 실무 포인트
- 작은 반복업무(1~2개)로 시작하라: 인간 채용의 문턱 없이 바로 운용해 경험을 쌓고 확장하자.  
- 스킬을 단일 소스 오브 트루스로 유지: 작업 지침을 작업 템플릿에 직접 넣지 말고 스킬 파일을 참조하게 해 수정·배포 비용을 줄임.  
- 자동 디스패치 구축이 핵심: 매일 수동으로 작업을 띄우면 사용자가 병목이 된다. 예약·배포 로직을 먼저 자동화하라.  
- 실행 로그와 작업별 기록 보관: 문제 발생 시 로그로 재현·디버그 가능하게 하자.  
- 파일 동기화·권한 관리: 에이전트가 접근하는 파일은 별도 사용자·제한된 경로로 관리해 보안 사고를 줄여야 함.  
- 반복 테스트 기간 예상: 초기 몇 주간 버그·quirk를 다듬는 시간이 필요하다.  
- 비용 감시: 에이전트는 작업당 토큰 비용이 발생하므로 대량 스케줄 시 비용이 누적될 수 있음(예상 비용 모델링 필요).  
- 도구 개발은 여전히 가치 있음: 에이전트를 운영할 대시보드·에디터 구축은 초기 투자 필요—직접 빌드가 비용 대비 효율적일 수 있음.  
- 한계 인지: 에이전트는 규칙화된 반복업무와 정보 수집·정리 등에 강하지만 복잡한 판단·전략 수립은 인간 개입과 도구 개선이 병행되어야 함.

## 한줄 평
에이전트를 단순 보조가 아니라 재현 가능한 '직무'로 설계하고, 스케줄·스킬·아티팩트 시스템을 갖추면 소규모 반복업무부터 안전하게 자동화하고 빠르게 확장할 수 있다는 실무 가이드.
