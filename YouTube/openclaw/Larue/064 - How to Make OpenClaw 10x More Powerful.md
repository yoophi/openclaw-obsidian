---
title: "How to Make OpenClaw 10x More Powerful"
source: "https://www.youtube.com/watch?v=0soFIReWb1w"
original_url: "https://www.youtube.com/watch?v=0soFIReWb1w"
youtube_id: "0soFIReWb1w"
playlist: "📙 openclaw"
channel: "Larue"
duration: "6:04"
publish_date: "2026-02-23"
playlist_index: 64
tags:
  - youtube
  - playlist
  - openclaw
  - channel/larue
  - playlist/📙 openclaw
generated_by: "OpenClaw summarize skill"
generated_at: "2026-03-23 19:36:49 +0900"
language: "ko"
---

# How to Make OpenClaw 10x More Powerful

## 영상 정보

- 원본 주소: https://www.youtube.com/watch?v=0soFIReWb1w
- 채널: Larue
- 제목: How to Make OpenClaw 10x More Powerful
- 게시일: 2026-02-23
- 재생시간: 6:04
- 플레이리스트: 📙 openclaw
- 플레이리스트 순서: 64

## 영상 설명

OpenClaw is the most powerful AI tool ever created, but most people are using it like ChatGPT. In this video I'm showing you 5 techniques to make OpenClaw 10x more powerful and turn it into a fully autonomous AI employee.

How I Make OpenClaw 90% Cheaper (Feels Illegal): https://youtu.be/5BmB-KymwCI

Social:
Twitter: https://twitter.com/larue_ai
Telegram: https://t.me/LarueAI

📧 For Partnerships: laruedotai@gmail.com

┈┈┈┈┈┈┈┈┈┈✄┈┈┈┈┈┈┈┈┈┈
Timestamps:
00:00 – intro
00:20 – sub-agents
01:54 – skills
03:08 – proactive agent
04:13 – memory
05:05 – self-improving

Music:
https://youtu.be/zJ8xF1rSUZQ?si=ZizDZRlvwkMLkCou
https://youtu.be/N6zrPDQ1XVA?si=nCxO__EVBrT4YhAl
https://youtu.be/jKU7gfanbrg?si=vos66Xyqz__ev5zk
https://youtu.be/jIbhQOZ7H7k?si=03tuRbp2xfHe6cac
https://youtu.be/-3EE_ZCpMzk?si=CBgkgvRMNnffFrxM
https://youtu.be/bNrnq4IW1yg?si=kfd2fBxn4LWGXaJg

Prompts:

⚠️ IMPORTANT:
These prompts were created and tested using GPT-5.3-Codex. If you're using a less capable model, it may not produce the same results and could even break your setup.
┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈
Create a new persistent agent named Samantha (samantha) and make her my dedicated coding assistant. Set openai-codex/gpt-5.3-codex as her primary model, and use Samantha for all coding-related tasks. Leave my main agent (you) unchanged, and tell me when Samantha is ready.
┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈
I want to set up a morning brief. Every morning at 8:00 AM, send me a report that includes:

1. Latest news about AI, startups and tech
2. Content ideas I can create today
3. Tasks I need to complete today pulled from my to-do list
4. Recommendations for tasks you can complete for me today

For the content ideas, write full draft scripts or outlines, not just titles.
┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈
Every day, I want you to work on your own to iterate and improve. Surprise me daily [insert time] with a new task/project you completed to improve my pre-existing workflows.
┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈
Enable memory flush before compaction and session memory search in my OpenClaw config. Set compaction.memoryFlush.enabled to true and set memorySearch.experimental.sessionMemory to true with sources including both memory and sessions. Apply the config changes.
┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈
I want you to become a self-improving assistant for me. From now on, learn only from explicit corrections and clear preferences I give you (for example: “No, do it this way”, “I prefer X”, “Always do Y”). Don’t guess preferences from silence. Create a simple memory system in local files with 3 layers:

1. Hot memory for important confirmed rules (always loaded)
2. Context memory for project/domain-specific rules
3. Archive for old inactive patterns

Each time I correct you:

- log it with timestamp and context,
- track repetition,
- and if the same correction appears 3 times, ask me whether to make it a permanent rule (global, domain, or project).

Every week, run a maintenance review:

- remove duplicates,
- keep confirmed rules concise,
- move stale items to archive,
- and send me a short “what changed” digest.

When you apply a learned rule, tell me where it came from (file + line). Never store sensitive data (passwords, tokens, financial or health data, private info about other people). If I say “forget X,” delete it everywhere and confirm. If I say “forget everything,” wipe this memory system and start fresh. Ask before making high-impact workflow changes.

#openclaw #clawdbot #ai

## 요약

## 핵심 요약
- OpenClaw를 단일 챗봇처럼 쓰면 성능을 못 끌어내며, 여러 역할별 하위 에이전트를 만들어야 강력해진다.
- 클로우허브(ClawHub) 같은 스킬 마켓을 통해 에이전트에 기능을 추가하면 검색·코드·웹 연동 등 다양한 작업을 자동화할 수 있다.
- 에이전트를 주기적·자율적으로 동작하게 설정하면(예: 매일 아침 리포트, 자율 개선 과제) 사람이 개입하지 않아도 유용한 결과를 생성한다.
- 메모리 압축(compaction)으로 인해 중요한 정보가 사라질 수 있으므로, 압축 직전에 핵심을 메모리 파일로 저장하는 프롬프트로 보완해야 한다.
- 자체 개선 루프(수정 로그, 핫 메모리 등)를 구축하면 사용자가 교정할수록 에이전트가 점점 더 맞춤화된다.

## 주요 내용
- 서브 에이전트 구성
  - 메인 에이전트는 사고·결정 파트너로 두고, 실제 작업은 역할별 서브 에이전트(예: 코딩 전담 Samantha)에게 위임.
  - 각 서브 에이전트는 별도 모델, 컨텍스트 창, 메모리를 가질 수 있어 메인 에이전트의 오버로드를 방지.
  - 생성 방법: 게이트웨이의 Agents 탭에서 새 에이전트를 만들거나, 텔레그램에 특정 프롬프트를 붙여 생성(예시 프롬프트에서는 gpt-5.3-codex를 코딩 모델로 지정).
- 스킬(기능) 추가
  - ClawHub는 에이전트용 스킬을 찾아 설치·업데이트하는 마켓플레이스 역할.
  - 예: 최근 30일간의 웹·레딧·유튜브 트렌드를 수집하는 스킬(Last 30 Days), 웹 검색·GitHub 상호작용 스킬 등.
  - 원하는 스킬이 없으면 에이전트에게 검색 또는 직접 제작을 지시할 수 있음.
  - 주의: 커뮤니티 제공 스킬에는 악의적 코드가 포함될 가능성이 있으므로 신중히 설치해야 함.
- 자율성과 스케줄링
  - OpenClaw는 적절히 설정하면 사람이 매번 프롬프트하지 않아도 자율적으로 리포트·작업을 수행.
  - 예시: *"Every morning at 8 AM, my agent sends me a morning brief"* — 매일 오전 8시 자동으로 최신 뉴스, 콘텐츠 아이디어, 오늘 할 일, 에이전트가 대신 수행할 작업 등을 전송.
  - 더 적극적 설정: 매일 특정 시간에 에이전트가 스스로 개선 작업을 수행하고 결과를 보고하도록 지시 가능.
- 메모리 관리와 압축 문제
  - 사용 중 컨텍스트 창이 차면 OpenClaw가 비용 절감과 창 공간 유지를 위해 오래된 대화를 요약(압축)함.
  - 압축 후 중요한 사실이 누락되는 문제가 발생하므로, 압축 직전에 핵심 내용을 별도 메모리 파일로 저장하도록 하는 프롬프트로 보완 권장.
  - 더 깊은 메모리 최적화 방법은 추가 자료(레딧 글 등)를 통해 기술적 설명이 존재함.
- 자기개선 루프
  - ClawHub의 Self-Improving Agent 스킬은 핫 메모리, 교정 로그, 컨텍스트 패턴 등을 저장하는 폴더 구조를 생성해 지속 학습을 지원.
  - 스킬 설치를 원치 않으면 제공된 프롬프트로 유사한 자동 개선 시스템을 에이전트가 직접 구축하게 할 수 있음.
  - 설치 대신 에이전트에게 스킬을 직접 만들어 달라고 요청하면 악성 코드 위험을 줄일 수 있음.

*OpenClaw is the most powerful AI tool ever created*

## 실무 포인트
- 역할 분리: 메인 에이전트는 지휘·의사결정, 서브 에이전트는 실행 담당으로 설계하면 효율성과 안정성이 높아짐.
- 모델/메모리 설정: 코딩 등 특정 작업은 전용 모델(gpt-5.3-codex 등)을 할당하고, 서브 에이전트에 별도 컨텍스트·메모리를 부여할 것.
- 스킬 설치 시 검증: ClawHub의 편의성은 크지만 커뮤니티 스킬은 코드 검증이 필요하니 신뢰할 수 있는 출처거나 에이전트가 직접 생성하도록 유도.
- 자동화 규칙 작성: 정기 리포트나 자율 개선 지시는 구체적 시간·내용을 명시해야 원하는 결과를 얻기 쉬움(예: 매일 8시, 포함 항목 명시).
- 메모리 보존: 압축 전에 중요한 정보를 별도 메모리 파일로 저장하는 프롬프트를 꼭 적용해 정보 손실을 방지.
- 비용·토큰 관리: 컨텍스트 압축은 토큰 비용 절감 수단이나 정보 손실을 초래하므로 절충점을 찾아 적용.
- 안전 대안: 커뮤니티 스킬 설치가 꺼려진다면, 같은 기능을 에이전트에게 "구축"하게 해 설치 리스크를 낮출 수 있음.
- 대시보드 반영: 에이전트 생성 후 게이트웨이 대시보드 새로고침으로 정상 생성 여부 확인.

*Every morning at 8 AM, my agent sends me a morning brief*

## 한줄 평
OpenClaw를 단일 챗봇으로만 쓰지 말고, 역할별 서브 에이전트·스킬·자율 스케줄·메모리 보존을 결합하면 개인용 자율 AI 직원처럼 활용할 수 있다.
