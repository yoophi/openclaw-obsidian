---
title: "PicoClaw + Ollama + GLM-4.7-Flash: Ultra-Efficient Local OpenClaw Fork"
source: "https://www.youtube.com/watch?v=kRoEl9P6-ig"
original_url: "https://www.youtube.com/watch?v=kRoEl9P6-ig"
youtube_id: "kRoEl9P6-ig"
playlist: "📙 openclaw"
channel: "Devs Kingdom"
duration: "7:38"
publish_date: "2026-02-18"
playlist_index: 71
tags:
  - youtube
  - playlist
  - openclaw
  - channel/devs kingdom
  - playlist/📙 openclaw
generated_by: "OpenClaw summarize skill"
generated_at: "2026-03-23 19:39:54 +0900"
language: "ko"
---

# PicoClaw + Ollama + GLM-4.7-Flash: Ultra-Efficient Local OpenClaw Fork

## 영상 정보

- 원본 주소: https://www.youtube.com/watch?v=kRoEl9P6-ig
- 채널: Devs Kingdom
- 제목: PicoClaw + Ollama + GLM-4.7-Flash: Ultra-Efficient Local OpenClaw Fork
- 게시일: 2026-02-18
- 재생시간: 7:38
- 플레이리스트: 📙 openclaw
- 플레이리스트 순서: 71

## 영상 설명

consulting: https://openclaw.productdeploy.com
Tiny, Fast, and Deployable anywhere OpenClaw Fork — automate the mundane, unleash your creativity 

https://github.com/sipeed/picoclaw

OpenClaw Tutorials
https://youtu.be/1n3tcHo1mNs
https://youtu.be/5WIb0RZ_dqY
https://youtu.be/T-1ZMw2p2Yc
https://youtu.be/Nanj16qKSVc
https://youtu.be/Znc46FAIB5w
https://youtu.be/kRoEl9P6-ig
https://youtu.be/gKX4SwpWXi4
https://youtu.be/9CNEpIUZAmY

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
- PicoClaw은 Go로 작성된 OpenClaw의 매우 작고 빠른 포크로, 저사양 기기에서도 동작하도록 설계됨.  
  *"it basically can run on a $10 hardware and 10 megabytes RAM."*
- 설치 순서: Go 설치 → llama(ollama) 설치 → PicoClaw 소스 클론 및 종속성 설치 → 설정(onboard) 후 실행.
- 설정 시 provider를 "openai"로 지정하고 모델을 "GLM-4.7-flash"로 설정해 Ollama/llama 호환 엔드포인트로 동작시킴 (API 키·API base 설정 필요).
- 실행 방식: 단일 명령, 에이전트 모드, 인터랙티브 모드(세션 기반)를 지원하며, 내장된 여러 스킬(예: GitHub, skill creator, weather 등)을 사용하거나 새 스킬을 생성 가능.
- 파일·스킬 생성은 워크스페이스 폴더로 캡슐화되어 보안상 제한됨.  
  *"this actually um only be able to create everything in workspace folder for uh security reason."*

## 주요 내용
- 개발 환경
  - 데모는 Ko 노트북(VS in KGO)에서 진행했지만 로컬 머신에서도 동일하게 동작함.
  - 먼저 Go 바이너리를 다운로드(wget 등)하고 tar로 풀어 환경 변수(PATH 등)를 설정해야 함.
- llama(ollama) 설치
  - PicoClaw와 함께 GLM-4.7-flash 모델을 사용해 테스트함. 영상에서는 "llama" 설치를 별도 단계로 안내함.
- PicoClaw 설치 및 설정
  - Git으로 리포지토리 클론 후 의존성 설치(build) 진행.
  - pico-claw의 onboard 명령으로 설정 파일 생성:
    - provider: openai
    - model: GLM-4.7-flash (또는 원하는 모델)
    - API 키를 llama용으로 설정(호환 엔드포인트 사용)
    - API base 값(영상: "API base should be/1")과 session 키는 상황에 따라 설정 가능
- 실행 방법
  - 단일 명령: pico-claw -m "메시지" 같은 형태로 간단히 호출 가능.
  - 에이전트/인터랙티브 모드: 세션 기반으로 질문 및 여러 스킬 호출 가능.
  - 간단 테스트: 모델에 "hi" 같은 메시지를 보내 정상 응답 확인.
- 스킬 및 워크스페이스
  - built-in 스킬: GitHub 관련 스킬, skill creator, samurai, tool, weather 등 포함.
  - Skill Creator로 새 스킬을 자동 생성하면 skills 폴더에 관련 파일들이 생성됨(예: remote 폴더와 skills.md).
  - 파일 생성·수정은 워크스페이스 폴더 내부에서만 허용되어 작업이 격리됨.
- 데모 예시
  - 워크스페이스에 example.md 파일을 생성하고 내용이 "hello world"로 업데이트되는 것을 확인.
  - "create a skill remotion skill" 같은 요청으로 새 스킬 생성 후 폴더 구조와 스킬 문서 확인.

## 실무 포인트
- 필수 전제조건
  - Go 환경 설정(바이너리 설치, PATH 등)과 llama(또는 Ollama) 설치가 선행되어야 함.
  - GLM-4.7-flash 같은 로컬 모델을 사용하려면 해당 모델이 Ollama/llama에 로드되어 있어야 함.
- 설정 주의사항
  - provider를 "openai"로 설정하는 이유는 Ollama의 호환 엔드포인트를 사용하기 때문이므로, API 키·API base 값을 올바르게 지정해야 함.
  - 영상에서 제시된 API base 값 표기는 다소 축약되어 있으니 실제 환경에 맞게 엔드포인트 경로(/v1 등)를 확인할 것.
- 보안 및 파일 접근
  - 파일 생성 및 편집은 워크스페이스 폴더로 제한되므로, 외부 경로 조작이나 의도치 않은 파일 접근을 방지하는 보안 장점이 있음.
  - 반대로 워크스페이스 외부의 파일을 조작해야 하는 경우 별도 설정이나 권한 변경이 필요함(영상에서는 제한됨).
- 테스트 팁
  - 설치 직후 간단한 "hi" 같은 메시지로 모델 응답을 확인한 뒤 본격적인 에이전트 테스트를 진행하라.
  - 새 스킬을 만들 때 생성된 폴더와 skills.md를 바로 확인하면 필요한 리소스가 제대로 생성되었는지 빠르게 점검할 수 있음.
- 한계
  - 영상은 설치와 간단한 데모 중심이라 운영 환경에서의 성능 최적화, 보안 하드닝, 대규모 동시세션 처리 등은 다루지 않음.

## 한줄 평
저사양 환경에서도 동작하도록 경량화된 OpenClaw 포크인 PicoClaw을 Go 기반으로 빠르게 설치하고, Ollama/GLM-4.7-flash와 연동해 기본 동작과 스킬 생성 흐름을 확인하기 좋은 실습형 안내 영상입니다.
