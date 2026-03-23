---
title: "New OpenClaw Update: Heartbeat + Subagents"
source: "https://www.youtube.com/watch?v=uKzcoFaaAhc"
original_url: "https://www.youtube.com/watch?v=uKzcoFaaAhc"
youtube_id: "uKzcoFaaAhc"
playlist: "📙 openclaw"
channel: "Julian Goldie SEO"
duration: "10:38"
publish_date: "2026-02-26"
playlist_index: 47
tags:
  - youtube
  - playlist
  - openclaw
  - channel/julian goldie seo
  - playlist/📙 openclaw
generated_by: "OpenClaw summarize skill"
generated_at: "2026-03-23 19:29:35 +0900"
language: "ko"
---

# New OpenClaw Update: Heartbeat + Subagents

## 영상 정보

- 원본 주소: https://www.youtube.com/watch?v=uKzcoFaaAhc
- 채널: Julian Goldie SEO
- 제목: New OpenClaw Update: Heartbeat + Subagents
- 게시일: 2026-02-26
- 재생시간: 10:38
- 플레이리스트: 📙 openclaw
- 플레이리스트 순서: 47

## 영상 설명

Want to make money and save time with AI? Get AI Coaching, Support & Courses 👉 https://www.skool.com/ai-profit-lab-7462/about

Get a FREE AI Course + 1000 NEW AI Agents + Video Notes  👉 https://www.skool.com/ai-seo-with-julian-goldie-1553/about

Want to know how I make videos like these? Join the AI Profit Boardroom → https://www.skool.com/ai-profit-lab-7462/about

Get a FREE AI SEO Strategy Session: https://go.juliangoldie.com/strategy-session?utm=julian

Get the AI Client Acquisition Engine: https://www.skool.com/the-content-clone-9266/about

OpenClaw Update: Heartbeat DMs & Sub-Agent Fixes (Feb 25)

Discover everything new in the latest OpenClaw update, including the return of heartbeat DMs and a complete overhaul of sub-agent messaging. We walk through a live update demonstration and explain how these security and performance fixes improve your AI assistant's reliability.

00:00 - Intro: OpenClaw Update
01:24 - Exploring the Change Log
02:03 - How to Update OpenClaw
03:32 - Verifying the New Version
04:53 - What is OpenClaw?
05:28 - Heartbeat DM & Sub-Agents
08:30 - AI Automation Community

## 요약

## 핵심 요약
- OpenClaw 2025(2025년 2월 25일) 업데이트로 핵심 알림인 하트비트(heartbeat) DM 전달이 복구됨.
- 서브에이전트(subagents)의 메시지 전달 로직을 전면 재구축해 누락·중복·정합성 문제를 해결함.
- 슬랙 쓰레드, 안드로이드/채팅 스트리밍, 마크다운 처리 등 대화·UI 관련 안정성 및 성능 개선이 포함됨.
- 보안 패치가 다수 적용되어 Slack/Discord/Telegram 연동 환경이 더 안전해짐.

## 주요 내용
- 하트비트(Heartbeat)
  - 하트비트는 에이전트가 "작동 중"임을 주기적으로 알리는 DM(체크인) 메시지.
  - 이전 버전에서는 기본 설정이 하트비트 DM을 차단해 사용자에게 전달되지 않음. 이번 업데이트로 다시 기본적으로 전달되도록 복구됨.
  - 하트비트 비활성화는 설정 파일 편집이나 에이전트별 설정으로 제어 가능(영상에서 명령어 직접 제시됨).
  - *Heartbeat DM deliveries back on.*

- 서브에이전트(subagents) 메시지 전달 재설계
  - 서브에이전트가 작업 완료 후 결과를 보고하는 과정에서 메시지 유실, 잘못된 라우팅, 전송 성공 플래그 오작동(특히 Telegram) 문제가 있었음.
  - 전달 로직을 상태기계(state machine)로 재구현하여 단계별 확인(전송 시도 → 백업 경로 → 실제 수신 확인 후 완료 표시) 방식 적용.
  - 이로 인해 전달 신뢰성 및 정리(cleanup) 과정이 안정화됨.
  - *The whole delivery process was rebuilt from scratch using what's called a state machine.*

- 슬랙 관련 개선
  - 슬랙의 쓰레드를 각각 별도의 섹션(session)으로 처리하면서 발생하던 컨텍스트 상속 오류, 잘못된 라우팅, 페이지 오버플로우 문제 수정.
  - 쓰레드 기반 대화가 끊기거나 에러가 발생하던 현상이 줄어들고, 스레드별로 올바른 계정/대화에 전달되도록 개선됨.

- 기타 기능/버그 픽스
  - 안드로이드와 채팅에서 스트리밍 전달 및 마크다운 처리 개선.
  - 시작 성능(startup performance), UI 채팅 컴포즈 개선, 에이전트 설정(agent config) 구현, 브랜디드 문서 개선 등 포함.
  - 전체 변경 내역은 OpenClaw 내 체인지로그와 GitHub에서 확인 가능.

- 업데이트 방법(영상에서 시연된 절차)
  - OpenClaw 설정 → All settings → Updates에서 자동 업데이트(auto update) 활성화.
  - 업데이트는 GitHub에서 새 릴리스 받아 적용되며, 적용 과정에서 일시적으로 게이트웨이가 응답을 멈출 수 있음.

## 실무 포인트
- 업데이트 적용 시 주의
  - 자동 업데이트를 켜면 새 버전으로 자동 갱신되지만, 갱신 직후 게이트웨이가 잠시 응답하지 않는 건 정상적일 수 있음.
  - 만약 완전히 응답하지 않으면 재설치(uninstall/reinstall)하거나 OpenCore 데몬을 재시작해야 할 수 있음(영상에서 실제 문제가 발생했을 때 제시된 해결 흐름).
- 서브에이전트 검증
  - 업데이트 후 서브에이전트가 생성하는 결과물 및 전달 로그(특히 Telegram, Slack)를 실제로 테스트해 정상 전달이 이뤄지는지 확인할 것.
- 하트비트 설정 관리
  - 하트비트가 다시 기본으로 활성화되므로, 필요 시 에이전트별로 로그량이나 알림 빈도를 고려해 설정을 조정할 것.
- 에러 노출 개선은 모니터링에 유리
  - 업데이트로 에러 처리와 로그 노출이 개선되어 문제 원인 추적이 쉬워졌음. 발생하는 에러는 로그로 확인하고 단계별로 대응할 것.
- 보안 관련
  - 보안 패치가 포함되었으므로, 외부 메시징 서비스 연동을 사용하는 환경에서는 업데이트 적용 권장.

## 한줄 평
이번 업데이트는 하트비트 복구와 서브에이전트 전달 신뢰성 개선이라는 핵심 문제를 해결해 OpenClaw을 실사용 환경에서 훨씬 안정적으로 만든다. 업데이트 적용 후 전달·쓰레드 동작을 꼭 검증해 보길 권장한다.
