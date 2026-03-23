---
title: "I Built an OpenClaw Mission Control You Can Talk To (Raspberry Pi)"
source: "https://www.youtube.com/watch?v=OI-rYcaM9LQ"
original_url: "https://www.youtube.com/watch?v=OI-rYcaM9LQ"
youtube_id: "OI-rYcaM9LQ"
playlist: "📙 openclaw"
channel: "Mayukh Builds"
duration: "13:32"
publish_date: "2026-03-18"
playlist_index: 5
tags:
  - youtube
  - playlist
  - openclaw
  - channel/mayukh builds
  - playlist/📙 openclaw
generated_by: "OpenClaw summarize skill"
generated_at: "2026-03-23 19:05:21 +0900"
language: "ko"
---

# I Built an OpenClaw Mission Control You Can Talk To (Raspberry Pi)

## 영상 정보

- 원본 주소: https://www.youtube.com/watch?v=OI-rYcaM9LQ
- 채널: Mayukh Builds
- 제목: I Built an OpenClaw Mission Control You Can Talk To (Raspberry Pi)
- 게시일: 2026-03-18
- 재생시간: 13:32
- 플레이리스트: 📙 openclaw
- 플레이리스트 순서: 5

## 영상 설명

I built an AI command center on a Raspberry Pi 5 with a 7" touchscreen that you can actually talk to. It has three AI agents — Jansky (the boss), Orbit (the coder), and Nova (the researcher) — each with their own voice, living in a pixel art office. There's an animated crab mascot with 7 emotions, real-time system monitoring, and a visual command terminal. All powered by OpenClaw.

Detailed video on setting up Openclaw with Raspberry Pi 5:
https://youtu.be/KjxYpRkPT48

Things you will need:

1. Raspberry Pi 5 8GB: https://amzn.to/4bkHe1b
2. 32 GB microSD card: https://amzn.to/3OZTdse
3. 25W power adapter: https://amzn.to/47pAr3P
4. 7 inch touch display: https://amzn.to/4rMU8uD
5. USB microphone for Pi: https://amzn.to/40b4Fnm
6. USB speaker for Pi: https://amzn.to/4rMUSjp

🔗 Links & Resources:
- My command center code: https://github.com/mayukh4/openclaw-command-center
- OpenClaw: https://openclaw.ai/



⏱️ Timestamps:
0:00  Intro
1:18  OpenClaw mission control
2:39  The hardware 
3:51  Installing OpenClaw
6:30  Setting up the mission control 
7:53  Mission control overview + demo 
10:27 Openclaw+Home Assistant
11:47 Outro

🏷️ Tags:
openclaw raspberry pi, openclaw command center, raspberry pi ai terminal, ai desk companion, openclaw voice, pixel art ai agents, raspberry pi touchscreen, openclaw cyberdeck, ai tamagotchi, local ai agent, diy alexa replacement, raspberry pi project 2026, openclaw tutorial, ai command center, raspberry pi 5 project

#OpenClaw #RaspberryPi #AICommandCenter

## 요약

## 핵심 요약
- 라즈베리 파이(권장 Pi 5, 8GB) + 7" 터치스크린, USB 마이크·스피커로 24/7로 동작하는 OpenClaw(또는 OpenCloud) 음성 기반 미션 컨트롤을 구현함.  
- 세 명의 에이전트(총괄 Jansky, 기술 Orbit/Arbit, 리서치 Nova)가 역할 분담해 음성으로 지시·작업 수행하고 픽셀 아트 오피스와 활동 로그로 실시간 상태를 시각화함.  
- 설치는 오픈소스 기반이며 GitHub 저장소·OpenClaw 설치 절차·텔레그램 연동을 따라하면 로컬 Pi에서 구동 가능.  
- 음성 입출력은 OpenAI(음성/STT) 등을 활용하고, 브레이브 API 등 추가 키로 웹 스크래핑·오케스트레이션을 분리해 비용·성능을 관리함.  
- *Everything is free. Everything is open source.*  
- *This OpenCloud agent running on my Raspberry Pi just checked my email, told me what's important, and I did it all through natural voice.*

## 주요 내용
- 필요한 하드웨어
  - 라즈베리 파이 5(8GB 권장, 더 낮은 사양도 가능), NVMe SSD(또는 SD 카드), 7" LCD 터치스크린, USB 마이크, USB 스피커.
- 소프트웨어·설치 흐름(요약)
  - Pi에 SSH 접속 → openclaw.ai의 설치 섹션에서 GitHub 레포를 사용한 hackable 설치 진행(시간 소요) → 설치 완료 후 openclaw onboard로 온보딩 실행.
  - 온보딩 과정에서 주요 API 키 입력: 메인 에이전트(예: Kimmy K2.5), OpenAI(음성·STT), Brave(스크래핑) 등.
  - Telegram 봇 생성(BotFather)으로 고유 ID 받아 OpenClaw에 붙여 텔레그램 채널 연동(페어링 코드 사용).
  - OpenAI 키 등 일부 키는 로컬 환경에 추출·설정(설치 단계에서 가능, 이후에도 변경 가능).
- 웹 기반 커맨드센터 구성
  - OpenClaw와 websocket 브리지로 연결되는 웹 대시보드를 제공. 좌측에 감정 변화하는 게(마스코트), 우측에 픽셀 아트 오피스(3명 에이전트), 하단에 실시간 활동 로그 표시.
  - 각 에이전트는 터치로 직접 호출 가능(항상 Jansky를 거치지 않아도 됨). 서로 다른 음성·성격을 가짐.
- 에이전트 역할
  - Jansky: 총괄 오케스트레이터(명령을 수신하고 작업 위임).
  - Orbit/Arbit: 기술·코딩·명령 실행 담당.
  - Nova: 웹 리서치·정보 수집 담당.
- 통합 사례
  - Home Assistant 연동으로 집안 기기 음성 제어(예: LED 켜기) 구현. Home Assistant는 오래된 안드로이드 기기에서도 구동 가능하다고 설명.
- 운영/비용 관리
  - 모든 코드 오픈소스/GitHub 공개(클론하면 10분 내 세팅 가능하다고 안내).  
  - API 제공자는 최소 1개로도 가능하지만, 역할 분리(Orchestrator·STT·스크래핑 등)로 비용·성능 분리 권장.  
  - 작성자는 비용 절감용 프롬프트(청구 최적화)를 제공한다고 언급(레포/프롬프트 복사·붙여넣기 방식).

## 실무 포인트
- 설치 팁
  - 설치는 SSH로 진행하고, openclaw GitHub 레포 기반 'hackable' 설치는 시간이 걸리니 여유를 두고 진행할 것.
  - 텔레그램 연동은 BotFather에서 봇 ID를 받아 페어링 코드로 OpenClaw에 붙이는 방식(절차를 정확히 따라야 함).
  - 음성 품질·속도를 위해 OpenAI 기반 STT/음성 사용을 권장(빠르고 성능이 좋다고 설명).
- 하드웨어 선택
  - Pi 5(8GB) 권장, NVMe SSD가 속도 면에서 유리하지만 SD 카드로도 동작 가능.
  - 마이크·스피커는 USB 방식 권장(양방향 음성 인터랙션 필요).
- 운영·비용 주의
  - API 키는 최소 하나로도 가능하지만, 역할별 분리해 쓰면 비용 추적·장애 격리가 쉬움.
  - 설치 직후와 운영 중 로그·활동을 대시보드로 실시간 모니터링해 에이전트 동작 확인.
- 확장·통합
  - Home Assistant 등 스마트홈과 연동하면 실제 장치 제어(음성→행동)까지 확장 가능.
  - 커맨드센터 코드는 포크·풀리퀘스트로 개선 가능하므로 필요에 따라 맞춤 수정 권장.
- 한계·전제조건
  - 설치·초기 설정(키 발급, 봇 생성, 온보딩 등) 절차가 필요하며 일부 단계는 수동 입력 요구.
  - Pi와 로컬 네트워크 환경에 따라 성능·반응속도가 달라질 수 있으니 테스트 필요.

## 한줄 평
라즈베리 파이에서 완전 오픈소스 음성 기반 미션 컨트롤을 직접 구축해 보고싶은 사람에게 실용적인 가이드와 바로 쓸 수 있는 구현체를 제공하는 영상입니다.
