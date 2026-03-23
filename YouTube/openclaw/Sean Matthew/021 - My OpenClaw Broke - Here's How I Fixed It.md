---
title: "My OpenClaw Broke - Here's How I Fixed It"
source: "https://www.youtube.com/watch?v=UTztjR4o7Y8"
original_url: "https://www.youtube.com/watch?v=UTztjR4o7Y8"
youtube_id: "UTztjR4o7Y8"
playlist: "📙 openclaw"
channel: "Sean Matthew"
duration: "11:23"
publish_date: "2026-03-11"
playlist_index: 21
tags:
  - youtube
  - playlist
  - openclaw
  - channel/sean matthew
  - playlist/📙 openclaw
generated_by: "OpenClaw summarize skill"
generated_at: "2026-03-23 19:17:16 +0900"
language: "ko"
---

# My OpenClaw Broke - Here's How I Fixed It

## 영상 정보

- 원본 주소: https://www.youtube.com/watch?v=UTztjR4o7Y8
- 채널: Sean Matthew
- 제목: My OpenClaw Broke - Here's How I Fixed It
- 게시일: 2026-03-11
- 재생시간: 11:23
- 플레이리스트: 📙 openclaw
- 플레이리스트 순서: 21

## 영상 설명

A few weeks ago, my OpenClaw agent kept failing.  It was forgetting everything after long conversations. Skills broke, cron jobs stopped running correctly, and I kept getting error messages in Telegram about running out of context. I thought it was the model, but it turns out it was how OpenClaw handles memory and context behind the scenes. Here's exactly what was broken and how I fixed it.

🛠️ RELEVANT DOCS & PROMPTS:
All relevant docs, instructions, and prompts from this video can be found here: https://x.com/_sean_matthew/status/2031800232569102610

📋 TIMESTAMPS:
00:00 Intro
00:33 Why Memory Breaks
01:39 Fix 1: Memory Flush
04:21 Fix 2: Search & Retrieval
06:25 Fix 3: The Heartbeat Cost Trap
08:48 Fix 4: System Prompt Audit
10:45 Recap
11:09 Outro

💾 MENTIONED IN THIS VIDEO:
→ Article on OpenClaw memory debugging (credit: code_rams on X): https://x.com/i/article/2025615759771123712
→ QMD by Tobi Lutke: https://github.com/tobi/qmd

For more OpenClaw content:
→ 3 Tools That Make OpenClaw Actually Useful: https://youtu.be/QvfqAMUJTT4
→ I Gave OpenClaw Its Own Computer: https://youtu.be/QCf8BCT-Kzo

## 요약

## 핵심 요약
- OpenClaw의 문제는 모델이 아니라 백그라운드의 메모리/컨텍스트 관리 방식에 있음 — 장시간 대화에서 중요한 정보가 압축(compaction)되어 사라짐.
- 해결책은 'memory flush'로 중요한 사실을 디스크에 기록하고, 컨텍스트 정리(context pruning)로 오래된 컨텍스트를 주기적으로 제거하는 것.
- 검색·회수(retrieval)를 개선하려면 QMD 하이브리드 검색을 쓰고, agents.md에 "작업 전 반드시 로그와 learnings.md를 검색"하도록 지시해야 함.
- 심장박동(heartbeat) 동작은 기본값이 토큰을 많이 소모하므로 활성 시간 제한, light context, 저비용/로컬 모델 사용 등으로 비용을 크게 줄일 수 있음.
- 시스템 프롬프트와 에이전트 파일을 감사(audit)·정리하면 컨텍스트 낭비가 사라지고 안정성이 크게 향상됨.  
  *it kept forgetting everything*  
  *memory and context management is key.*

## 주요 내용
- 컨텍스트 윈도우와 compaction
  - OpenClaw는 한정된 컨텍스트 윈도우를 갖고 오래된 대화를 요약(압축)해 공간을 만듦.
  - 문제: 모든 항목을 동일하게 요약해서 중요한 이름·숫자·결정이 희석됨.
- memory flush 프로토콜
  - compaction 실행 전에 'silent turn'을 트리거해 중요한 학습·결정 사항을 파일(예: daily log, memory.md)에 기록.
  - 기록된 파일은 디스크에 남아 compaction 후에도 보존됨.
  - 설정은 openclaw.json에 관련 설정을 추가하거나 Claude Code 등으로 자동 수정 가능.
- 컨텍스트 프루닝(context pruning)
  - 긴 세션(예: 4시간 이상)에서 compaction이 여러 번 실행될 수 있으므로, 기간 기반 프루닝을 설정해 오래된 컨텍스트를 정리하고 최근 보조 응답 3개 등은 보존하도록 함.
- 검색(검색·회수) 개선
  - 기본 검색은 순수 의미유사도만 사용해 잘못된 결과를 반환할 수 있음.
  - QMD(하이브리드 검색)를 도입하면 의미유사도 + 정확매칭을 결합해 관련성 높은 결과를 얻음.
  - 에이전트가 실제로 검색을 수행하도록 agents.md에 "작업 전 daily logs와 learnings.md를 검색하라"는 명시적 지침 추가 필요.
- learnings.md와 memory.md의 역할 분리
  - raw memory는 memory.md에 쌓이지만 매우 비대해질 수 있음.
  - learnings.md에는 실수 발생 시 이를 방지하기 위한 1~2줄 규칙(원칙)을 기록해 빠르게 참조하게 함.
- heartbeat(심장박동) 비용 문제
  - 기본 heartbeat는 약 30분마다 전체 에이전트 턴을 실행하고, 이때 system prompt와 모든 메타파일을 API로 보냄 → 토큰 과다 사용.
  - 비용 절감 방법:
    - 활성 시간(active hours)을 지정해 비작업 시간에 heartbeat 중지.
    - openclaw.json에서 light context 활성화: heartbeat 시 전체 시스템 프롬프트 대신 heartbeat.md만 로드.
    - heartbeat에 저비용 모델(또는 로컬 모델) 사용: 예시로 저비용 모델을 heartbeat에 할당하거나 로컬 Qwen 모델 사용.
- 시스템 프롬프트 감사(audit)
  - 에이전트·스킬 파일에 불필요하거나 중복된 내용이 많으면 매 턴마다 컨텍스트를 낭비.
  - Claude Code 같은 도구로 파일들을 분석·정리해 중복 제거 및 불필요한 문장 축소.
  - 결과: 시스템 프롬프트가 작아지고 컨텍스트 오류(메모리 가득참) 사라짐.

## 실무 포인트
- 설정 우선순위
  - 1) memory flush 활성화, 2) QMD 도입 및 agents.md에 검색 규칙 추가, 3) heartbeat 최적화(활성시간/라이트컨텍스트/저비용 모델), 4) 시스템 프롬프트 감사.
- openclaw.json 수정
  - memory flush, context pruning, heartbeat light context, heartbeat 모델 등은 openclaw.json에서 설정 가능. 변경 전 파일 백업 권장.
- 장시간 세션 주의
  - compaction이 여러 차례 일어나는 긴 세션에서는 flush가 첫 compaction에만 적용될 수 있으니 pruning 설정으로 보완해야 함.
- 파일 관리
  - memory.md는 자동으로 커지므로 주기적 정리 필요. learnings.md는 수동으로 간결한 규칙만 남겨 효율적 참조 보장.
- 비용 관리
  - heartbeat 빈도와 로드되는 컨텐츠를 제한해 불필요한 API 호출을 줄일 것. 로컬 모델 사용 가능 시 비용 절감 효과 큼.
- 한계와 전제조건
  - compaction 알고리즘 자체를 완전히 바꿀 수 없다면 '쓰기-검색' 패턴(memory flush + 검색)이 핵심 보완책임.
  - 로컬 모델은 자원 요구량(메모리·GPU 등)을 고려해야 함.
  - 에이전트가 검색을 실행하도록 유도하는 프롬프트 설계가 항상 완벽히 동작하지 않을 수 있음—지속적 모니터링 필요.

## 한줄 평
OpenClaw을 장기간 안정적으로 운용하려면 단순 모델 교체가 아니라 메모리 플러시, 검색 개선, heartbeat 최적화, 시스템 프롬프트 감사 같은 컨텍스트 엔지니어링이 필수라는 실무 가이드.
