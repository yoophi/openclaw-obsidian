---
title: "Openclaw Henry - My 24/7 Agent on Mac Mini (Detailed Setup)"
source: "https://www.youtube.com/watch?v=ad_OU6jZXbI"
original_url: "https://www.youtube.com/watch?v=ad_OU6jZXbI"
youtube_id: "ad_OU6jZXbI"
playlist: "📙 openclaw"
channel: "Vibe with AI"
duration: "16:47"
publish_date: "2026-02-27"
playlist_index: 43
tags:
  - youtube
  - playlist
  - openclaw
  - channel/vibe with ai
  - playlist/📙 openclaw
generated_by: "OpenClaw summarize skill"
generated_at: "2026-03-23 19:27:54 +0900"
language: "ko"
---

# Openclaw Henry - My 24/7 Agent on Mac Mini (Detailed Setup)

## 영상 정보

- 원본 주소: https://www.youtube.com/watch?v=ad_OU6jZXbI
- 채널: Vibe with AI
- 제목: Openclaw Henry - My 24/7 Agent on Mac Mini (Detailed Setup)
- 게시일: 2026-02-27
- 재생시간: 16:47
- 플레이리스트: 📙 openclaw
- 플레이리스트 순서: 43

## 영상 설명

Today marks the beginning of something completely new: building a dedicated AI agent server that runs 24/7. Meet Henry, my AI chief of staff powered by Claude Opus 4.6, living on a Mac Mini and accessible anywhere through Telegram.

In this episode, you'll learn how to set up your own AI agent infrastructure with proper security from day one. We're using Tailscale for encrypted connections, Docker for sandboxed execution, and OpenClaw as the orchestration layer.

📚 CHAPTERS:
00:00 Introduction to Henry
02:18 Mac Mini Unboxing
02:51 Mac Mini Setup & Screen Sharing
06:38 Installing Tailscale for Remote Access
09:02 Setting Up Development Tools
10:02 Docker Installation for Security
11:04 OpenClaw Setup & Configuration
12:21 Telegram Bot Creation
14:18 First Conversation with Henry
15:42 What's Next - Building the Agent Team

This is just the foundation. Next episode, we're giving Henry a research agent, coding agent, and building a complete AI team with specialized roles and permissions.

🎯RESOURCES:
- OpenClaw: https://openclaw.ai
- Tailscale: https://tailscale.com
- Docker Desktop: https://docker.com

🚀 FREE 30-MIN AI CONSULTATION
Book a free call to discuss AI implementation for your business:
→ https://vibewith-ai.com

🛠️ MY APPS:
https://www.vibe-thumbnails.com
Code: VIBE100

## 요약

## 핵심 요약
- Mac Mini에 24/7으로 동작하는 개인 AI 비서(Chief of Staff) 'Henry'를 구축하는 과정으로, Claude Opus 4.6을 뇌로 사용하고 Telegram으로 접근한다.
- 핵심 구성 요소: 화면 공유(원격 제어), Tailscale(안전한 원격 접속), Docker(에이전트 실행의 샌드박스), OpenClaw(오케스트레이션 및 권한 관리).
- 보안 설계: 별도 사용자 계정 + 암호, 네트워크 터널링, 컨테이너 격리로 프롬프트 인젝션 등 문제 발생 시 피해를 컨테이너 내부로 제한.
- 인프라는 확장 가능하게 설계되어 이후 리서치, 코딩, 보안 등 역할 기반 에이전트 팀을 추가할 계획.
- *"Henry is here, chief of staff, friendly online, and ready to roll."*

## 주요 내용
- 초기 하드웨어/계정 설정
  - Mac Mini를 헤드리스로 운영하되 초기 설정 시 화면, 키보드, 마우스로 접속해 새 사용자 계정(예: Henry)을 생성.
  - iCloud 등 개인 계정과 연결하지 않는 '완전히 새로운 계정' 생성 권장.
- 원격 제어(화면 공유)
  - 시스템 설정 → 일반 → 공유에서 Screen Sharing 활성화.
  - VNC 뷰어 접근 허용 및 계정 비밀번호로 제어 권한 부여.
  - Mac의 IP 주소 확인 후 다른 Mac에서 Finder → Go → Connect to Server에 vnc://<IP>로 연결.
- 항상 접속 가능한 원격 네트워크(Tailscale)
  - Tailscale 설치 및 동일한 계정으로 로그인해 개인 IP 확보.
  - 라우터 포트포워딩 없이도 외부에서 안전하게 Mac Mini에 접속 가능.
- 개발/실행 환경 준비
  - Xcode 커맨드라인 툴 설치로 Git 사용 가능하게 함.
  - Docker Desktop 설치: 에이전트 실행은 각각의 컨테이너에서 수행되어 호스트 시스템 접근 제한.
  - Homebrew 설치(추후 OpenClaw 설치를 위해 필요).
- OpenClaw 설치 및 설정
  - OpenClaw의 설치용 one-liner를 터미널에 실행해 설치 진행.
  - 모델 API 키(Claude Opus 4.6) 입력으로 에이전트의 '브레인' 연결.
  - OpenClaw는 네이티브로 동작하며 에이전트 권한 관리, 자동 시작 등을 담당.
- Telegram 봇 연동
  - BotFather로 Telegram 봇 생성 후 토큰 복사.
  - OpenClaw에 Telegram 토큰 입력해 Henry와 Telegram을 통해 메시지 주고받음.
- 동작 확인 및 향후 계획
  - 초기 상태는 기억/정체성 없음(빈 워크스페이스) → 사용자가 프로필/지시를 입력해 에이전트에 역할 부여.
  - 다음 에피소드에서 리서치 에이전트, 코딩 에이전트 등 역할별 에이전트 추가 예정.
  - *"A dedicated Mac Mini separate account encrypted firewalled nothing personal on it."*

## 실무 포인트
- 계정 분리: 에이전트 전용 사용자 계정을 만들고 개인 데이터·iCloud 연동을 하지 말 것(격리 원칙).
- VNC 보안: VNC 접근은 반드시 비밀번호 설정 후 사용, 가능한 Tailscale 등 터널링과 함께 사용해 공개 IP 노출 최소화.
- 원격 접속 유지: Tailscale을 통해 장소에 상관없이 안정적으로 접속 가능—항상 로그인 상태로 두어야 접근 편의성 확보.
- 샌드박스 실행: 에이전트가 코드 실행/웹 액세스할 때 Docker 컨테이너에서 실행되도록 구성해 호스트 손상 위험을 줄임.
- API 키 관리: 각 에이전트가 필요로 하는 키만 컨테이너에 제공하고, 호스트에는 민감 키 저장을 최소화.
- 점진적 권한 부여: 초기에는 최소 권한으로 시작(스킬/연동은 나중에 추가)하고 필요 시 확장.
- 주의사항과 한계
  - 컨테이너 격리가 피해를 줄이지만, 완전한 보안 보장은 아니므로 모니터링과 정기 감사 필요.
  - 초기 상태는 에이전트에 기억이나 정체성이 없으므로 실제 업무에 투입하려면 사용자 프로필과 지시를 명확히 입력해야 함.
  - macOS 특정 경로(스크린 공유 설정 위치 등)는 OS 버전에 따라 차이 발생 가능—문구와 UI 위치를 확인할 것.

## 한줄 평
실전 중심의 단계별 가이드로, 개인용 Mac Mini에서 안전하게 24/7 자율 에이전트 서버를 구축해 Telegram으로 제어할 수 있게 해준다. 설치·보안·오케스트레이션 구조를 한 번에 보여줘 실무 적용에 바로 쓸 수 있다.
