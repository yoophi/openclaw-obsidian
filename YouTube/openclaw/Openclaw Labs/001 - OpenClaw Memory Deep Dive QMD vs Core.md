---
title: "OpenClaw Memory Deep Dive: QMD vs Core"
source: "https://www.youtube.com/watch?v=4QH0vHr-vFU"
original_url: "https://www.youtube.com/watch?v=4QH0vHr-vFU"
youtube_id: "4QH0vHr-vFU"
playlist: "📙 openclaw"
channel: "Openclaw Labs"
duration: "7:35"
publish_date: "2026-03-22"
playlist_index: 1
tags:
  - youtube
  - playlist
  - openclaw
  - channel/openclaw labs
  - playlist/📙 openclaw
generated_by: "OpenClaw summarize skill"
generated_at: "2026-03-23 19:03:48 +0900"
language: "ko"
---

# OpenClaw Memory Deep Dive: QMD vs Core

## 영상 정보

- 원본 주소: https://www.youtube.com/watch?v=4QH0vHr-vFU
- 채널: Openclaw Labs
- 제목: OpenClaw Memory Deep Dive: QMD vs Core
- 게시일: 2026-03-22
- 재생시간: 7:35
- 플레이리스트: 📙 openclaw
- 플레이리스트 순서: 1

## 영상 설명

🧠 Want the full memory guide + community support?
Join the Skool community here → https://www.skool.com/openclawlabs

Most people think Openclaw memory is a database — it's not. It's Markdown files. And once you understand that, everything changes.
In this video, I break down exactly how Openclaw memory works under the hood: what it actually stores, the difference between memory-core (the default) and QMD (the advanced local-first search engine), and the #1 setup mistake that silently kills your agent's ability to remember anything — your embedding provider.

If your agent keeps forgetting context, losing leads, or giving you stale answers, this video is why.

What you'll learn:
✅ The real structure of Openclaw memory (MEMORY.md + daily notes)
✅ Memory-core vs QMD — which one you actually need
✅ How to enable QMD step-by-step
✅ QMD vs Mem0 — when to use each
✅ Why Anthropic users MUST configure a separate embedding provider
✅ How to verify your memory system is actually working

Chapters:
0:00 - Why most people have Openclaw memory wrong
0:25 - What Openclaw memory actually is (Markdown files)
1:05 - Memory-core: the default retrieval system
2:25 - QMD: advanced local-first search
3:25 - How to set up QMD step-by-step
4:40 - QMD vs Mem0: which one to choose
5:45 - Embedding providers (the hidden requirement)
6:55 - How to verify your setup

#Openclaw #AIAgents #AIAutomation #OpenclawMemory #AIWorkflow

## 요약

## 핵심 요약
- OpenClaw의 메모리는 실제로 마크다운 파일(장기 메모 파일 + 날짜별 메모 폴더)이 소스 오브 트루스다.
- 메모 파일(데이터)과 검색(검색 백엔드)은 분리되어 있으며, 기본은 Memory Core이고 선택적으로 QMD를 사용할 수 있다.
- QMD는 검색 엔진을 교체해 키워드·의미 유사도 등을 결합한 고급 검색을 제공하지만 별도 설치와 설정이 필요하다.
- 의미 기반 검색은 임베딩 제공자가 있어야 작동하며, 제공자가 없으면 검색 기능이 비활성화되어 제한된다.
- Mem(별도 메모 플랫폼)은 QMD와 달리 통합된 메모 저장·검색·서빙 플랫폼으로 더 많은 기능을 제공한다.

*“Your memory is by default not a database or a plugin.”*  
*“QMD is an experimental local first retrieval backend.”*

## 주요 내용
- 메모의 실제 구조
  - 기본적으로 메모는 에이전트 작업공간의 마크다운 파일로 존재: 하나의 장기 메모 파일(주요 노트)과 날짜별로 추가되는 메모 폴더(일간 로그).
  - 이 파일들에 적힌 내용만 에이전트가 '기억'한다. 파일 외의 정보는 기억되지 않는다.
- 검색(리트리벌)과 저장의 분리
  - 마크다운 파일은 소스 오브 트루스(데이터 저장)이며, 검색 방식은 별도의 레이어(백엔드)가 담당.
- Memory Core(기본)
  - 기본 내장 검색 시스템으로 설치 없이 즉시 작동.
  - 메모를 스캔·조직화하여 색인화하고, 빠른 검색을 위해 결과를 랭킹.
  - 두 가지 도구 제공: 
    - search: 의미 기반으로 관련 메모를 찾는 용도.
    - get: 특정 메모 파일 또는 파일 내 섹션을 정확히 불러오는 용도.
  - 메모 파일 변경을 감시하여 색인을 자동 갱신.
- QMD(선택적 고급 백엔드)
  - 메모 파일 자체를 바꾸지 않고 "검색 엔진"만 교체하는 역할.
  - 키워드 매칭, 의미 유사도 등 여러 접근법을 결합해 결과를 재정렬하고 높은 품질의 매치를 상위에 올림.
  - 기본 비활성화 상태이며 수동으로 활성화해야 함(설치 및 설정 필요).
  - 설치 요구사항: QMD 도구를 별도 설치, OpenClaw 게이트웨이가 실행되는 동일 머신에서 사용 가능해야 하고 SQL 라이트 지원 필요.
  - 설정 예: OpenClaw 설정 파일에서 memory.backend를 QMD로 변경하거나 에이전트에서 켜기.
- QMD vs Mem(외부 메모 플랫폼)
  - QMD: OpenClaw의 마크다운 메모를 더 잘 검색하게 해주는 검색 백엔드(내부 고도화).
  - Mem: 메모 저장·검색을 독립적인 레이어로 제공하는 플랫폼(API/SDK, 메타데이터 필터, 그래프 스타일 등 광범위한 기능).
  - 선택 기준: OpenClaw 네이티브 마크다운을 유지하면서 검색만 향상하고 싶으면 QMD, 메모를 도구 간에 공유하거나 별도 플랫폼으로 관리하고 싶으면 Mem 고려.
- 임베딩 제공자(embedding provider) 중요성
  - 의미 기반 검색(semantic recall)은 임베딩 제공자가 필요.
  - OpenClaw은 자동으로 임베딩 제공자를 탐색해 선택하려 시도하지만, 해당 제공자가 없으면 의미 검색이 비활성화된다.
  - 채팅 모델과 임베딩 제공자는 별개이므로, 사용 중인 채팅 모델이 임베딩을 제공하지 않으면 별도 임베딩 제공자를 추가해야 함.

## 실무 포인트
- QMD 적용 시 체크리스트
  - QMD를 켜기 전에: 메모 파일은 그대로 유지된다는 점(검색 레이어만 바뀜)을 이해할 것.
  - 설정: OpenClaw.json 또는 에이전트 설정에서 memory.backend를 QMD로 변경.
  - 설치: QMD 바이너리/도구를 별도 설치하고 OpenClaw 게이트웨이와 동일 머신에서 접근 가능해야 함.
  - 환경: 로컬 DB 지원(예: SQLite) 등 요구조건을 충족하는지 확인.
  - 검증: 설정 후 에이전트에게 QMD 사용 여부를 확인시키고 검색 동작을 테스트할 것.
- 임베딩 관련 주의사항
  - 의미 검색이 필요하면 임베딩 제공자를 반드시 구성. 구성되지 않으면 메모는 존재하지만 의미 기반 검색 불가.
  - 채팅 모델이 자동으로 임베딩을 제공한다고 가정하지 말고, 별도 설정을 확인할 것.
- 운영상 고려사항
  - QMD는 고급 검색 품질을 제공하지만 초기 설정과 운영 부담(설치, 리소스, 유지관리)이 있음.
  - 메모가 작을 때는 기본 Memory Core가 충분히 빠르고 안정적일 수 있음. 메모량이 커지거나 검색 품질이 중요해질 때 QMD가 더 가치 있음.
  - Mem 같은 별도 플랫폼으로 옮기면 도구 간 메모 공유가 수월하지만 통합 작업과 추가 비용/복잡성이 발생할 수 있음.
- 기능 이해
  - search(발견)와 get(정확 호출)의 역할을 구분해 설계하면 에이전트가 더 정확하게 필요한 정보를 불러오게 할 수 있음.

## 한줄 평
OpenClaw 메모의 본질(마크다운 파일)과 검색 레이어의 차이를 명확히 설명하며, QMD 활성화 방법과 임베딩 필요성을 실무 관점에서 정리해주는 실용적 가이드다.
