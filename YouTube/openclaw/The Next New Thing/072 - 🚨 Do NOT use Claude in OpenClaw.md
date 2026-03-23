---
title: "🚨 Do NOT use Claude in OpenClaw"
source: "https://www.youtube.com/watch?v=7DNlQgl2Kk0"
original_url: "https://www.youtube.com/watch?v=7DNlQgl2Kk0"
youtube_id: "7DNlQgl2Kk0"
playlist: "📙 openclaw"
channel: "The Next New Thing"
duration: "8:07"
publish_date: "2026-02-18"
playlist_index: 72
tags:
  - youtube
  - playlist
  - openclaw
  - channel/the next new thing
  - playlist/📙 openclaw
generated_by: "OpenClaw summarize skill"
generated_at: "2026-03-23 19:40:28 +0900"
language: "ko"
---

# 🚨 Do NOT use Claude in OpenClaw

## 영상 정보

- 원본 주소: https://www.youtube.com/watch?v=7DNlQgl2Kk0
- 채널: The Next New Thing
- 제목: 🚨 Do NOT use Claude in OpenClaw
- 게시일: 2026-02-18
- 재생시간: 8:07
- 플레이리스트: 📙 openclaw
- 플레이리스트 순서: 72

## 영상 설명

We used these 2 commands:
First:
openclaw onboard --auth-choice openai-codex

Second:
openclaw models set openai-codex/gpt-5.3-codex

openclaw models status --plain


Presented by Zapier
https://zapier.com/

Anthropic made it official: you can’t use a Claude subscription to power OpenClaw anymore.

So what’s the cheapest, compliant way to run top-tier models inside OpenClaw today?

In this episode of The Next New Thing, Andrew Warner brings back Caleb Hodges, founder of God Mode, to show exactly how to switch OpenClaw from per-API billing to your ChatGPT (OpenAI) subscription — step by step.

This update follows two previous videos:

One showing how advanced users build OpenClaw swarms
https://youtu.be/_ISs5FavbJ4

Another showing how to use a Claude subscription to avoid API fees
https://youtu.be/I7KFOhjmM1M

Now that Anthropic has clarified its terms, that workaround is off the table. But according to OpenClaw’s founder, OpenAI subscriptions are allowed — and Caleb walks through the exact terminal command and authentication flow to make the switch.

If you’re running OpenClaw for agents, workflows, or personal AI infrastructure, this episode could save you significant API costs and prevent configuration headaches.


Episode Highlights / Timestamps
00:00 Anthropic clarifies subscription policy
00:18 The API cost problem for OpenClaw users
00:36 Why OpenAI subscriptions are now the best option
01:12 Confirmation from OpenClaw’s founder
01:30 Bringing Caleb Hodges back
01:57 Switching from Claude to ChatGPT
02:33 The one-line auth command
03:18 Authenticating with Codex
04:12 Verifying OpenAI access inside OpenClaw
05:06 Why to use VS Code instead of in-app edits
05:51 Setting OpenAI as the default model
06:54 When subscription beats API billing
07:03 What God Mode installs for entrepreneurs


If you’re building AI systems instead of just chatting with AI, this is required viewing.

👉 Join us: https://thenextnewthing.ai/

## 요약

## 핵심 요약
- 특정 AI 모델 제공업체의 유료 구독을 이용하면 외부 API 과금 없이 고성능 모델을 더 저렴하게 쓸 수 있다는 방법을 소개한다.  
- 다만 일부 모델 제공업체는 외부 도구에서 구독을 사용하는 것을 금지하는 약관 변경이 공식화되었으므로 주의해야 한다.  
- 영상은 터미널(또는 외부 코드 에디터)을 통해 인증 공급자를 전환하는 실제 명령/절차를 단계별로 시연한다.  
- 설정 변경은 툴 내부가 아니라 외부(터미널/코드 에디터)에서 수행하는 것이 안전하다는 실무 팁을 강조한다.

## 주요 내용
- 상황 배경
  - 원래 많은 사용자가 툴 사용 시 API 호출별 과금을 내는 대신 자신이 가진 구독을 연결해 비용을 절감하려 했다.
  - 그러나 최근 일부 제공업체가 외부 도구에서의 구독 사용을 허용하지 않기로 공식 방침을 발표했다(변경일 언급).
- 준비사항
  - 구독 계정(유료 계층)이 있어야 하며, 영상에서는 월정액 계층(저가/고가 두 레벨)을 예로 든다.
  - OpenAI/유사 플랫폼 로그인 상태에서 인증 진행이 필요하며, 이미 로그인되어 있어도 재인증을 요구할 수 있다.
- 실제 전환 절차(요약)
  - 툴이 설치된 머신에서 터미널을 연다(또는 외부 코드 에디터의 터미널 창 사용).
  - 제공된 인증 전환 명령을 붙여넣고 실행한다(프롬프트에 따라 진행).
  - 웹 인증 창에서 구독 계정으로 로그인/연결을 완료한다.
  - 터미널에서 설정이 완료되면 툴에 접속해 구독이 연결되었는지 확인하고 기본 모델을 필요에 따라 변경한다.
- 사용 시 인터페이스 선택 이유
  - 툴 내부 UI에서 직접 설정 변경하면 자체 수정으로 인해 문제가 생기거나 잠기는 사례가 있으므로 외부에서 변경하는 편이 안전하다.
  - 외부 편집기(또는 터미널)로 파일을 가리켜 설정을 적용하면 복구·디버깅이 쉬워진다.
- 검증
  - 설정 후 툴에 연결된 모델/구독 상태를 질의해 연결 여부와 기본 모델이 원하는 값으로 설정되었는지 확인한다.
- 발언 인용(강조 문구)
  - *"It's official."*
  - *"People love that too."*

## 실무 포인트
- 약관 검토 필수: 특정 제공업체가 외부 도구에서 구독 사용을 금지했으므로, 변경 여부를 항상 확인해야 한다. 약관 변경 시 즉시 대응해야 비용/법적 리스크를 줄일 수 있다.
- 외부에서 설정 변경: 운영 중인 시스템 내부에서 직접 셀프-업데이트를 하지 말고 터미널이나 외부 코드 에디터로 설정을 적용·검증할 것.
- 인증 흐름 주의: 이미 로그인되어 있어도 재인증을 요구하거나 다단계 인증이 필요할 수 있으니 계정 접근 수단(비밀번호, MFA 등)을 준비하라.
- 기본 모델 확인: 전환 후에도 기본 모델이 이전 값으로 남아 있을 수 있으므로 명시적으로 모델을 세팅/확인하라.
- 구독 레벨 확인: 일부 기능이나 안정성은 높은 구독 레벨에서만 보장될 수 있으니, 필요한 기능에 맞춰 구독 등급을 선택하라.
- 백업과 롤백 계획: 설정 변경 전 기존 설정을 백업하고, 문제가 생길 경우 원복할 수 있는 절차를 마련해두자.

## 한줄 평
외부 구독을 활용해 운영비를 줄이는 실용적 방법과, 약관 변경에 따른 주의사항·안전한 설정 절차를 빠르게 익히고 싶은 사람에게 유용한 실습형 가이드.
