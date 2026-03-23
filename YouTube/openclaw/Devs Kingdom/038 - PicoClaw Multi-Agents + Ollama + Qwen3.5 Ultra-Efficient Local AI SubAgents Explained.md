---
title: "PicoClaw Multi-Agents + Ollama + Qwen3.5: Ultra-Efficient Local AI SubAgents Explained"
source: "https://www.youtube.com/watch?v=9CNEpIUZAmY"
original_url: "https://www.youtube.com/watch?v=9CNEpIUZAmY"
youtube_id: "9CNEpIUZAmY"
playlist: "📙 openclaw"
channel: "Devs Kingdom"
duration: "11:03"
publish_date: "2026-02-28"
playlist_index: 38
tags:
  - youtube
  - playlist
  - openclaw
  - channel/devs kingdom
  - playlist/📙 openclaw
generated_by: "OpenClaw summarize skill"
generated_at: "2026-03-23 19:25:58 +0900"
language: "ko"
---

# PicoClaw Multi-Agents + Ollama + Qwen3.5: Ultra-Efficient Local AI SubAgents Explained

## 영상 정보

- 원본 주소: https://www.youtube.com/watch?v=9CNEpIUZAmY
- 채널: Devs Kingdom
- 제목: PicoClaw Multi-Agents + Ollama + Qwen3.5: Ultra-Efficient Local AI SubAgents Explained
- 게시일: 2026-02-28
- 재생시간: 11:03
- 플레이리스트: 📙 openclaw
- 플레이리스트 순서: 38

## 영상 설명

consulting: https://openclaw.productdeploy.com
This video explained how PicoClaw SubAgents work and showed configuration examples that is not documented on the github yet

links:
https://github.com/sipeed/picoclaw/tree/main
https://github.com/sipeed/picoclaw/tree/main/pkg/tools

OpenClaw Tutorials
https://youtu.be/1n3tcHo1mNs
https://youtu.be/5WIb0RZ_dqY
https://youtu.be/T-1ZMw2p2Yc
https://youtu.be/Nanj16qKSVc
https://youtu.be/Znc46FAIB5w
https://youtu.be/kRoEl9P6-ig
https://youtu.be/gKX4SwpWXi4
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
- PicoClaw에 추가된 SubAgent 기능을 설명하고 설정 및 테스트 과정을 시연함.  
- 설정은 config.json에서 restrict_to_workspace, provider, 모델명, subagent 목록 및 각 agent의 default 설정을 조정하는 방식임.  
- 데모에서는 Ollama(로컬)와 Qwen 3.5 27B 모델을 사용해 테스트했음.  
- 동작 관찰 결과, 서브에이전트는 비동기적으로 스폰되지만 현재는 부모 대화에서 결과를 직접 회수하지 못하는 제한이 있음.  
- 다중 독립 에이전트(spawn one-by-one)는 작동하지만, 에이전트 A가 B를 호출하고 B가 다시 C를 호출하는 중첩 호출은 제대로 결과를 반환하지 않음.

## 주요 내용
- 사전요건
  - Go 설치 필요 (PicoClaw이 Go 기반).  
  - 로컬 모델 엔드포인트(예: Ollama) 설치 및 Qwen 3.5 27B 준비.  
  - PicoClaw 저장소 git clone 후 make install로 바이너리 설치.
- config.json에서 변경할 주요 항목
  - restrict_to_workspace: 기본 true(보안 목적). 테스트 시 false로 변경하면 더 자유롭게 동작 확인 가능.  
  - provider: OpenAI 호환 엔드포인트를 사용하도록 설정(로컬 Ollama를 OpenAI 호환 엔드포인트로 사용).  
  - model: Qwen 3.5 27B 등 사용 모델명 설정 및 API base를 localhost, API 키 설정.  
  - sub_agent 리스트: 각 서브에이전트(profile) 정의(예: researcher, fast, summarizer).  
  - 각 에이전트에 대해 default=true를 리드(lead) 에이전트에 반드시 설정해야 함(안그러면 작동하지 않음).
- 테스트 시나리오
  - CLI로 에이전트 메시지 전송(예시: picoClaw agent -m "프롬프트")로 동작 확인.  
  - 예제 프롬프트: 리서치 에이전트가 fast 프로필의 서브에이전트를 스폰해 DDG에서 시애틀 현재 기온을 섭씨로 가져와 요약을 반환하도록 지시.  
  - 로그 관찰: "async tool completed" 등으로 서브에이전트가 스폰된 것은 확인되나 결과 회수용 툴이 없어 부모 대화에서 결과를 받지 못함.
- 코드/참고 위치
  - SubAgent 구현은 패키지 경로(package.tools)의 subagent 파일에 추가되어 있음(최근에 추가된 기능).  
  - 예제 구성 및 테스트는 configure_test 파일에 샘플로 존재(리드미/테스트 참조).

## 실무 포인트
- 테스트 환경: 처음에는 restrict_to_workspace를 false로 설정해 기능을 확인한 후 보안 요구사항에 맞게 다시 true로 조정할 것.  
- 리드 에이전트 지정: 하나의 에이전트에 반드시 default=true를 설정해야 정상 동작.  
- 로컬 모델 설정: Ollama 등 로컬 서비스의 API base를 localhost로, 키를 설정해 PicoClaw이 호출 가능하도록 구성해야 함.  
- 한계와 우회
  - 현재 서브에이전트는 비동기 스폰은 되지만 부모 컨텍스트에서 직접 결과를 회수하는 메커니즘이 부족함. 따라서 서브에이전트 간 중첩 호출에는 제한이 있음.  
  - 다수의 독립 에이전트를 순차적으로 스폰해 각자 작업시키는 방식은 동작하므로 복잡한 워크플로우는 상위 레벨에서 분리해 처리하는 설계를 권장.  
- 디버깅 팁
  - 에이전트 로그와 워크스페이스 디렉토리(클라이 툴로 ls 등) 확인.  
  - 패키지의 subagent 구현과 configure_test 사례를 보고 최신 변경사항을 확인할 것(최근에 기능이 추가되어 변경될 가능성 높음).

## 한줄 평
- PicoClaw의 SubAgent는 로컬 멀티에이전트 워크플로우 실험에 유용하지만, 현재 서브에이전트의 결과 회수 및 중첩 호출 제한을 고려해 설계해야 한다.  
- 실습 중심으로 설정과 로그 확인 방법을 보여줘 바로 테스트해보기 좋다.

*“successfully spawn a sub aent using the fast profile and”*  
*“it cannot really find anything for that specific sub aent task.”*
