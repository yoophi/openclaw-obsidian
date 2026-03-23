---
title: "NEW OpenClaw Update is MASSIVE! (Sub-agent Flow)"
source: "https://www.youtube.com/watch?v=sCPjeu7mpOU"
original_url: "https://www.youtube.com/watch?v=sCPjeu7mpOU"
youtube_id: "sCPjeu7mpOU"
playlist: "📙 openclaw"
channel: "BoxminingAI"
duration: "10:57"
publish_date: "2026-02-25"
playlist_index: 48
tags:
  - youtube
  - playlist
  - openclaw
  - channel/boxminingai
  - playlist/📙 openclaw
generated_by: "OpenClaw summarize skill"
generated_at: "2026-03-23 19:29:56 +0900"
language: "ko"
---

# NEW OpenClaw Update is MASSIVE! (Sub-agent Flow)

## 영상 정보

- 원본 주소: https://www.youtube.com/watch?v=sCPjeu7mpOU
- 채널: BoxminingAI
- 제목: NEW OpenClaw Update is MASSIVE! (Sub-agent Flow)
- 게시일: 2026-02-25
- 재생시간: 10:57
- 플레이리스트: 📙 openclaw
- 플레이리스트 순서: 48

## 영상 설명

OpenClaw just dropped version 2026.2.25 and it's a big one. We tested it in real-world use before making this video so you get actual experience, not just patch notes. The two standout features: sub-agent delivery is completely overhauled (no more silent timeouts), and heartbeat DM delivery is finally working properly. We also cover cron job tracking improvements, what still needs work, and how to get the most out of sub-agents right now.

🔥 Check out our Community Website: https://boxminingai.com/
📚 Join our Discord: https://discord.com/invite/boxtrading
👉🏼 Zeabur Server: https://zeabur.com/ (Save $5 use code: boxmining)
👉🏼 Minimax 10% Off: https://platform.minimax.io/subscribe/coding-plan?code=5GYCNOeSVQ&source=link
👉🏼 Kimi AI: https://www.kimi.com/kimiplus/sale?activity_enter_method=h5_share&invitation_code=Y4JW7Y
📖 Read more AI News: https://www.boxmining.com/

Partnership/Collaboration Email: boxminingai@gmail.com

00:00 OpenClaw 2026.2.25 — What's New?
00:45 Sub-Agent Delivery Overhaul Explained
01:45 Why Sub-Agents Are Powerful (Clean Context = Smarter Results)
02:45 Live Demo — Stark Using Sub-Agents to Build a Presentation
04:00 Sub-Agent Timeouts Are Now Visible (No More Disappearing Agents)
05:00 Cron Job Tracking Improvements
05:45 What Still Needs Work (Sub-Agent Names, Large Tasks)
06:45 Heartbeat DM Delivery + Other Updates
07:30 Strong Open Source Community — Why OpenClaw Moves So Fast

## 요약

## 핵심 요약
- OpenClaw 225의 핵심 업데이트는 서브에이전트(sub-agent) 전달 방식의 대대적 개선과 상태 가시성 향상(타임아웃·크론 작업 추적 등)이다.  
- 서브에이전트는 별도, 깨끗한 컨텍스트로 연구·문서 갱신 등 복잡한 작업을 분할 처리하도록 활용하는 것이 권장된다.  
- 보안(게이트웨이 하드닝)과 통신 가시성(텔레그램·디스코드 개선) 업데이트도 포함되어 있음.  
- *One is heartbeat DM delivery.*  
- *I would say the sub aent feature is still not fully fully baked yet.*

## 주요 내용
- 서브에이전트 동작 방식
  - 일부 상황에서 자동으로 서브에이전트를 스폰하지만, 에이전트에 명시적으로 지시해야 더 자주 실행된다.  
  - 서브에이전트는 메인 에이전트보다 "깨끗한 컨텍스트"만 가지고 작업하므로 리서치·슬라이드 업데이트 같은 독립 작업에 유리하다.
  - 대형 작업은 여러 서브에이전트로 분할(예: 리서치, 슬라이드 작성, QA, 아트)하는 편이 효율적이다.
- 가시성·에러 처리 개선
  - 이전에는 서브에이전트가 사라지거나 응답이 없어 추적하기 어려웠으나, 이번 버전에서 타임아웃이나 작업 완료 알림 등 상태 메시지가 더 잘 표시된다.
  - 크론(cron) 작업의 실행 여부와 시점(타임존 문제 포함)을 추적하고 실패 원인을 파악할 수 있는 개선이 들어감.
  - 클린업 시스템(실패 시 정리 등) 개선이 병행됨.
- 한계 및 내부 동작
  - 모델 자체의 지능 향상(모델 업그레이드)은 이번 릴리즈에서 이루어지지 않았음 — 주로 프로세스/절차·가시성 개선에 집중.
  - 파일이 중간에 잘리거나(truncated) 타임아웃으로 작업이 완전하게 끝나지 않는 사례는 여전히 보고됨.
  - 기술적으로 모든 서브에이전트는 동일한 백엔드 모델(예: 동일한 버전의 모델)을 사용하므로 '다른 인격'이 아니라 역할 분할에 가깝다.
- 기타 업데이트
  - 게이트웨이 하드닝(보안) 및 문서 업데이트가 포함됨.
  - Android 관련 업데이트가 있으나 발표자는 직접 테스트하지 않음.
  - 이전 릴리즈에서 소개된 킬로(kilo) 프로바이더(비용 절감용 대체 제공자)와 비전(영상 이해) 기능은 별도 테스트 예정.

## 실무 포인트
- 즉시 업데이트 후 서브에이전트 동작을 테스트하라: 업데이트 직후 바로 서브에이전트를 실행해 상태 알림·타임아웃 동작을 확인해야 문제를 조기에 발견할 수 있다.
- 큰 작업은 분할해서 맡겨라: 발표자는 슬라이드 갱신 작업을 여러 서브에이전트(리서치·작성·검수)로 나누는 것을 권장함.
- QA 서브에이전트 추가: 슬라이드가 중간에 잘리는 문제를 방지하기 위해 산출물 검수용 서브에이전트를 별도로 두는 것이 도움이 된다.
- 서브에이전트 실행은 명시적으로 지시: 자동 스폰이 항상 일어나지 않으므로 필요 시 "서브에이전트로 실행"을 명확히 지시하라.
- 크론 작업 타임존 확인: 크론 실패는 타임존 설정 문제일 수 있으므로 VPS/로컬 시간 설정과 함께 로그를 점검하라.
- 기대 수준 설정: 이번 업데이트는 프로세스·가시성 개선 중심이므로 '지능 향상'을 기대하면 안 된다.
- 에이전트 식별성 향상: 발표자는 서브에이전트에 이름을 붙여 활성화 여부를 파악하는 방법을 제안했으니, 운영상 가시성이 필요하면 이름 부여를 고려하라.
- 새 기능(안드로이드/비전 등)은 직접 테스트 후 도입 결정: 발표자는 일부 기능을 직접 사용하지 않았으므로 도입 전 검증 필요.

## 한줄 평
실사용 관점에서 OpenClaw 225는 서브에이전트의 실행·상태 가시성을 크게 개선해 복잡한 작업을 분할 처리하기 쉬워졌지만, 지능 자체 향상은 없어 여전히 분할·검수 전략이 필요하다는 현실적인 안내를 제공한다.
