---
title: "OpenClaw Multi-Agent + Ollama: 10X Productivity with SubAgent Team"
source: "https://www.youtube.com/watch?v=5WIb0RZ_dqY"
original_url: "https://www.youtube.com/watch?v=5WIb0RZ_dqY"
youtube_id: "5WIb0RZ_dqY"
playlist: "📙 openclaw"
channel: "Devs Kingdom"
duration: "11:39"
publish_date: "2026-02-24"
playlist_index: 55
tags:
  - youtube
  - playlist
  - openclaw
  - channel/devs kingdom
  - playlist/📙 openclaw
generated_by: "OpenClaw summarize skill"
generated_at: "2026-03-23 19:32:53 +0900"
language: "ko"
---

# OpenClaw Multi-Agent + Ollama: 10X Productivity with SubAgent Team

## 영상 정보

- 원본 주소: https://www.youtube.com/watch?v=5WIb0RZ_dqY
- 채널: Devs Kingdom
- 제목: OpenClaw Multi-Agent + Ollama: 10X Productivity with SubAgent Team
- 게시일: 2026-02-24
- 재생시간: 11:39
- 플레이리스트: 📙 openclaw
- 플레이리스트 순서: 55

## 영상 설명

consulting: https://openclaw.productdeploy.com
this video demonstrated what is openclaw subagents and how to setup and operate openclaw multi agents team with OpenClaw CLI and Ollama Qwen3
 
Sub-agents are background agent runs spawned from an existing agent run but in their own session and when finished, announce their result back to the requester session

session key examples:
agent:(sub_agentId) :subagent: (session_uuid) 
agent:(agentId) : (session) 

https://docs.openclaw.ai/tools/subagents
https://docs.openclaw.ai/concepts/multi-agent

OpenClaw Tutorials
https://youtu.be/1n3tcHo1mNs
https://youtu.be/T-1ZMw2p2Yc
https://youtu.be/Nanj16qKSVc
https://youtu.be/Znc46FAIB5w
https://youtu.be/kRoEl9P6-ig
https://youtu.be/gKX4SwpWXi4
https://youtu.be/9CNEpIUZAmY
https://youtu.be/PMkgPhcXYjQ

Unlock premium AI powerhouses like GPT, Gemini, Nano Banana Pro, and more — with just one affordable, one-time payment (no endless subscriptions!) 
Book a free discovery call now 👉 https://cal.com/productdeploy

Kaggle notebooks:
Notebook is only created for demonstration and serve as a guidance for those who were interested using similar methods to build projects.  It is NOT a free giveaway for a few reasons. 1. it works while the video is recorded, However it does not guarantee to work at a later date as tech communities make code changes all the time. Please follow the tutorial and create your own version of it if needed. 2. If you have any questions or need help, please join the discord server community to discuss or subscribe to the channel. 3. if you need further professional assistance, please feel to book a consulting call. Thanks for understanding

Discuss:
https://discord.gg/EXjaZnudHu

Discovery Call: 
https://cal.com/productdeploy

Follow me on x.com:
https://x.com/jacobcdev


[Helpful links]:

[Must Watch]:
How to Setup OIlama On Kaggle
https://youtu.be/W6nMkzVcELQ

How to setup Ollama with multi GPUs on Kaggle 
https://youtu.be/In8jMEXRDwA

How to Use Free GPU on Kaggle:  
https://www.youtube.com/watch?v=djbjDOBkz1k

How to Setup Visual Studio Code Web on Kaggle
https://youtu.be/tGKz3zLwnd0

Transform Kaggle Notebook to Virtual Machine with Good GPU, CPU and RAM
https://www.youtube.com/watch?v=n-USPtP9H3I

How to Setup VLLM On Kaggle Notebook
https://www.youtube.com/watch?v=Quwf1TBycgM

How to Setup OpenWebUI On Kaggle Notebook
https://youtu.be/0jAhK3hlIbM

How to Setup the Best Open Source Manus AI Agent (Kortix Suna) Locally
https://youtu.be/q9xeHfdTcdQ?si=4q4zZ8sGqc39GlMq

How to Setup ComfyUI on Kaggle Free GPU
https://youtu.be/orhLPlVRUMc?si=MH9BcAijVPf-FYFJ

How to Setup Gradio Tunnel on Kaggle
https://youtu.be/vmPYKWRV4xo?t=206

[You might also like]:

PlayList
https://www.youtube.com/playlist?list=PLn32cjH9B2Bqub_kg74d-U4EfiexZ6ILi
https://www.youtube.com/playlist?list=PLn32cjH9B2BoiOj_qYE1o-WFzyLdLb3Hr
https://www.youtube.com/playlist?list=PLn32cjH9B2Bqc9iRDrq2uDGBZmxljsAvT
https://www.youtube.com/playlist?list=PLn32cjH9B2BoU8393rCUbqbKLFb4Oc4Op
https://www.youtube.com/playlist?list=PLn32cjH9B2Bp_rSIQRt8V37XISvZ_WjEq
https://www.youtube.com/playlist?list=PLn32cjH9B2Bqp27lvFGzCBKyZaJg9mljY
https://www.youtube.com/playlist?list=PLn32cjH9B2BpbOu1M1C8zyNPel2eYrdLB


Music from #Uppbeat (free for Creators!):
https://uppbeat.io/t/21-on-the-block/...
License code: MKM7BDGHR8BXIH2S

Music from #Uppbeat (free for Creators!):
https://uppbeat.io/t/theo-gerard/the-good-life
License code: ATVBJRKCLBUUMZYA

Music from #Uppbeat (free for Creators!):
https://uppbeat.io/t/rahul-popawala/vacay-vibes
License code: KMBSTRNDE4NR5A9I

## 요약

## 핵심 요약
- Sub-agent(서브 에이전트)는 기존 에이전트 실행에서 스폰된 백그라운드 에이전트로, 호출한 에이전트 세션 내에서 실행되고 결과를 되돌려준다.
- OpenClaw 설정 파일에서 에이전트 리스트 순서로 기본 에이전트를 정하고, 각 에이전트에 허용된 서브에이전트 목록(sub_agent_list)을 명시해야 한다.
- TUI(터미널 UI)를 통해 간단히 서브에이전트를 스폰하거나 에이전트를 전환할 수 있으며, 서브에이전트 최대 스폰 깊이(sub_agent_max_spawn_depth)를 설정해 계층을 제한한다.

## 주요 내용
- 정의 및 동작
  - *"it is a background agent that runs spawned from an existing agent run"* — 서브에이전트는 호출 에이전트와 같은 세션에서 생성되어 작업을 수행한 뒤 요청자에게 결과를 반환한다.
  - 세션/ID 구조: 호출자(agent ID)와 서브에이전트 UUID가 세션 식별에 포함된다.
  - 결과 반환: *"when finished announce their result back to the requesttor chat channel."*
- 설정 파일(OpenCore JSON) 관련
  - 에이전트 리스트 상단 항목이 기본 에이전트가 된다.
  - 각 에이전트 설정에 반드시 sub_agent_list를 넣어야 해당 에이전트 세션에서 특정 서브에이전트를 스폰할 수 있다.
  - sub_agent_max_spawn_depth로 서브에이전트 계층(예: 레벨1 → 레벨2)을 제한한다.
- 에이전트 정의 및 커스터마이즈
  - 에이전트별로 soul(정체성) 마크다운과 agents 마크다운(플레이북, 규칙)을 작성하여 역할과 행동 지침을 구체화한다.
  - 워크스페이스 구조: agents 폴더, bootstrap, identity, tools, workflow-auto 등 파일/폴더로 구성됨.
- TUI(터미널 UI) 사용법
  - openclaw tui 커맨드로 인터랙티브 세션 시작.
  - 슬래시 명령어로 도움말/명령 목록 호출(예: /sub agent).
  - 주요 명령: sub agent list, sub agent spawn <agent_id>, agent switch(또는 agent picker) 등.
  - 예: 기본 orchestrator(리드 에이전트) 세션에서 writer/researcher/coder를 spawn하여 같은 세션 내에서 작업 수행.
- 실행 흐름 예시
  - 오케스트레이터(기본 에이전트) 세션에서 "spawn writer" 명령을 실행하면 writer가 서브에이전트로 생성되고, 작업 완료 후 오케스트레이터 채널로 결과가 돌아온다.

## 실무 포인트
- 필수 전제조건: OpenClaw과 개발 환경(VStudio 등)이 사전에 설정되어 있어야 하며, 에이전트 폴더 구조가 자동 생성됨을 확인할 것.
- sub_agent_list를 누락하면 해당 에이전트를 세션 내에서 스폰할 수 없음 — 호출자 설정에 반드시 허용 에이전트 목록을 추가하라.
- 스폰 깊이 제한(sub_agent_max_spawn_depth)을 현실적인 값으로 설정해 무한 재귀나 복잡한 계층을 방지할 것.
- 에이전트 역할은 soul 및 플레이북(agents 마크다운)에 구체적으로 문서화해 예측 가능한 동작을 유도하라.
- TUI에서 슬래시 명령어 사용법과 agent picker를 익혀 빠르게 테스트 및 디버깅하라.
- 한계: 서브에이전트는 호출 에이전트의 같은 세션 내에서만 동작하며, 호출 허용 목록과 깊이 설정에 의해 제약을 받는다.

## 한줄 평
OpenClaw의 서브에이전트 기능은 에이전트 팀을 같은 세션에서 계층적으로 운영하게 해 생산성을 높이며, 설정 파일의 sub_agent_list와 깊이 설정이 핵심이다.
