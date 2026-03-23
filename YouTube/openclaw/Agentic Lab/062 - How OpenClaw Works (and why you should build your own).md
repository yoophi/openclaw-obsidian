---
title: "How OpenClaw Works (and why you should build your own)"
source: "https://www.youtube.com/watch?v=Bo4Shk2FCvk"
original_url: "https://www.youtube.com/watch?v=Bo4Shk2FCvk"
youtube_id: "Bo4Shk2FCvk"
playlist: "📙 openclaw"
channel: "Agentic Lab"
duration: "10:59"
publish_date: "2026-02-23"
playlist_index: 62
tags:
  - youtube
  - playlist
  - openclaw
  - channel/agentic lab
  - playlist/📙 openclaw
generated_by: "OpenClaw summarize skill"
generated_at: "2026-03-23 19:35:57 +0900"
language: "ko"
---

# How OpenClaw Works (and why you should build your own)

## 영상 정보

- 원본 주소: https://www.youtube.com/watch?v=Bo4Shk2FCvk
- 채널: Agentic Lab
- 제목: How OpenClaw Works (and why you should build your own)
- 게시일: 2026-02-23
- 재생시간: 10:59
- 플레이리스트: 📙 openclaw
- 플레이리스트 순서: 62

## 영상 설명

🧠 FREE Skool Community (become AI native): https://www.skool.com/agentic

How OpenClaw works under the hood, and why you should build your own personal AI assistant.
In this video, I break down OpenClaw's architecture, how it handles security, context rot, memory, tool use, and the agentic loop. Then I explain why understanding these principles matters more than just installing someone else's setup.
🔥 What you'll learn:

How OpenClaw actually works (gateway, agents, skills, channels)
Security risks of running an AI assistant on your own devices
What context rot is and how it degrades agent performance over time
Why building your own personal AI assistant is the real move
The agentic coding principles behind OpenClaw's design

Whether you're using OpenClaw with WhatsApp, Telegram, Slack, or Discord — or building something custom with Claude Code — this video gives you the foundations to actually understand what's happening under the hood.

0:00 Intro
0:45 "AGI" usecase
1:07 How Openclaw actually works
6:30 The 4 key principles to building an AI agent
7:37 Why you should build your own


#openclaw #aiagent #personalaiassistant #claudecode #agenticcoding #aitools #opensource #contextengineering #llm #artificialintelligence #buildwithAI #aicoding #molty

## 요약

## 핵심 요약
- OpenClaw는 LLM을 중심으로 한 '하네스(harness)' 구조로, 외부 도구·메모리·트리거를 붙여 자율 행동을 가능하게 한다.  
- 세션 지속성은 JSONL 대화 기록과 요약(컴팩션)으로 관리하며, 컨텍스트가 커지면 LLM으로 요약해 용량을 줄인다.  
- 핵심 자율성 메커니즘은 하트비트(heartbeat), 크론(cron), 웹훅으로 에이전트를 깨우는 방식이며, 에이전트가 스스로 미래 행동을 기록할 수 있다.  
- OpenClaw는 브라우저·컴퓨터 제어 같은 강력한 도구 접근이 가능하지만, 이로 인한 보안 위험·비용·컨텍스트 부풀림 문제가 심각하다.  
- 저자는 범용(OpenClaw)보다 특정 목적의 '스나이퍼 에이전트'를 직접 만들면 성능과 비용에서 크게 이득 본다고 주장한다.  
- *OpenClaw is an AI agent that's taken the world by storm.*  
- *At its core, it's a set of building blocks around an LLM.*

## 주요 내용
- 아키텍처 개요
  - LLM이 '두뇌' 역할을 하고, 웹소켓/HTTP 게이트웨이가 24/7 접속을 유지하며 채팅 인터페이스(텔레그램 등)와 연결한다.
  - 에이전트는 툴 호출(tool calls)을 통해 외부 행동(코드 작성, 브라우저 조작 등)을 실행하고, 결과를 받아 다음 행동을 결정하는 에이전틱 루프(agentic loop)를 형성한다.
- 대화·세션 관리
  - 모든 메시지를 JSONL에 한 줄씩 append하고, API 호출 시 파일을 파싱해 messages 배열로 전달한다.
  - 컨텍스트가 모델 한계를 넘으면 컴팩션 시스템이 LLM으로 과거 메시지 청크를 요약·병합해 컨텍스트를 줄인다(목표: 컨텍스트 50% 이하).
- 프롬프트·정체성·툴 스키마
  - 시스템 프롬프트(예: soul.md, personality 파일)와 스킬 메타데이터, 툴 스키마를 주입해 모델이 자신이 가진 도구와 행동 규칙을 알게 한다.
  - 런타임·안전 프롬프트로 안전 조치 삽입.
- 메모리 구조
  - 중요 정보는 memory.mmd 파일에 기록해 장기기억처럼 사용.
  - RAG 스타일의 하이브리드 검색 메모리를 두어 많은 이전 대화와 핵심 정보를 저장·검색 가능하게 함.
  - 모델은 메모리 툴을 호출해 관련 정보를 검색한다.
- 컴퓨터·브라우저 제어
  - 크롬 확장 리레이를 통해 로그인 상태 유지가 가능한 브라우저 제어를 제공.
  - 터미널·카메라 등 시스템 전반 제어도 가능하지만 보안 리스크가 크다.
- 자율 트리거
  - 하트비트: 기본 30분 타이머가 heartbeat.mmd를 참고해 에이전트 행동을 유도(에이전트가 자신에게 쓸 수 있음).
  - 크론: 에이전트가 생성·수정·삭제 가능한 스케줄된 작업(크론 표현식, 일회성, 인터벌).
  - 웹훅: 외부 이벤트가 발생하면 컨텍스트와 함께 에이전트가 깨워짐.
- 한계 및 성능/비용 문제
  - 초기 고정 오버헤드 약 7,000 토큰(시스템·워크스페이스·스킬 설명 등). 사용·플러그인 증가로 월별 누적 시 수만 토큰으로 증가.
  - 예시: 한 달 사용 후 고정 오버헤드 약 45,000 토큰, 성능 저하(컨텍스트 로트) 최대 40% 또는 더 심함. 특정 상황에서는 50–90% 성능 저하와 메시지당 약 $0.52 추가 비용이 발생할 수 있음(영상 수치).
  - 일부 플랫폼(예: Anthropic)의 상위 플랜에서 사용 차단 사례와 큰 보안 취약점 보고.
- 설계 원칙(영상 정리)
  - 에이전트 구성 4요소: 무엇이 트리거하는가, 매 턴 무엇을 주입하는가, 어떤 툴을 호출하는가, 무엇을 출력하는가.
  - 이 네 가지를 잘 설계하면 단일 목적 에이전트가 더 효율적.

## 실무 포인트
- 목표 좁히기: 범용 에이전트보다 단일 목적(예: 이메일 파서, 리서처) 에이전트가 토큰 오버헤드·비용·성능 면에서 유리하다.
- 컨텍스트 위생 유지
  - 불필요한 시스템/스킬 설명을 줄이고, 대화·워크스페이스 파일을 주기적으로 요약·정리해 컴팩션을 적극 사용하라.
  - 플러그인·스킬은 최소한으로 제한해 토큰 부풀림을 방지.
- 메모리 관리
  - memory.mmd와 RAG 인덱스의 성장 속도를 모니터링하고, 오래된 정보는 주기적으로 요약·아카이빙하거나 삭제하라.
  - 모델이 '중요'로 판단해 계속 저장하도록 방치하지 말 것.
- 보안·샌드박스
  - 브라우저·시스템 제어 기능은 최소 권한 원칙 적용, 샌드박스와 철저한 권한 분리 필요.
  - 민감 계정·자격증명은 에이전트에 직접 노출하지 말 것.
- 자동화 트리거 설계
  - 하트비트·크론 주기를 실제 작업량과 리스크에 맞춰 조정. 에이전트가 스스로 행동을 추가로 생성하도록 과도하게 열어두지 말 것.
  - 웹훅의 컨텍스트 페이로드를 제한해 불필요한 과부하 방지.
- 비용 모니터링
  - 토큰 오버헤드가 비용으로 직결되므로 대시보드로 고정 오버헤드 토큰 수치를 추적하고, 모델 호출 빈도·입력 크기를 통제하라.
- 디자인 권장
  - 먼저 '스나이퍼 에이전트'로 프로토타입을 만들고, 필요하면 점진적으로 기능을 확장하라(범용으로 시작하지 말 것).
  - 툴 호출 결과를 검증하는 피드백 루프와 실패 처리 로직을 반드시 넣어라.

## 한줄 평
OpenClaw의 내부 구조(하네스, 메모리·툴·트리거, 에이전틱 루프)를 실무 관점에서 해부해 보여주며, 범용 에이전트의 한계와 목적 특화 에이전트 설계의 실전적 이점을 명확히 설명한다. 이 영상을 보면 에이전트 설계의 핵심 구성요소와 실무 적용 시 주의점을 빠르게 이해할 수 있다.
