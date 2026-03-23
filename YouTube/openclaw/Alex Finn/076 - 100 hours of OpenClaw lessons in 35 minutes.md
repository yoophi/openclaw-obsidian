---
title: "100 hours of OpenClaw lessons in 35 minutes"
source: "https://www.youtube.com/watch?v=_kZCoW-Qxnc"
original_url: "https://www.youtube.com/watch?v=_kZCoW-Qxnc"
youtube_id: "_kZCoW-Qxnc"
playlist: "📙 openclaw"
channel: "Alex Finn"
duration: "35:35"
publish_date: "2026-02-15"
playlist_index: 76
tags:
  - youtube
  - playlist
  - openclaw
  - channel/alex finn
  - playlist/📙 openclaw
generated_by: "OpenClaw summarize skill"
generated_at: "2026-03-23 19:42:26 +0900"
language: "ko"
---

# 100 hours of OpenClaw lessons in 35 minutes

## 영상 정보

- 원본 주소: https://www.youtube.com/watch?v=_kZCoW-Qxnc
- 채널: Alex Finn
- 제목: 100 hours of OpenClaw lessons in 35 minutes
- 게시일: 2026-02-15
- 재생시간: 35:35
- 플레이리스트: 📙 openclaw
- 플레이리스트 순서: 76

## 영상 설명

I've spent 100 hours with OpenClaw. Here is EVERYTHING I know about it. Feel free to skip around to relevant chapters.

FULL OpenClaw bootcamp in the Vibe Coding Academy: https://vibecodingacademy.dev
Sign up for my free newsletter: https://www.alexfinn.ai/subscribe
Follow my X: https://x.com/AlexFinn
My $300k/yr AI app: https://www.creatorbuddy.io/

OpenClaw:
https://openclaw.ai/

PROMPTS:

Please schedule a morning brief for me every day at 8am. Send it to my Telegram. In this morning brief I want:
1. The weather in San Francisco
2. Top news stories in AI
3. Any tasks I have in my todo list on Things 3
4. Tasks you can complete for me today that bring me closer to my goals

I want you to set up a Mission Control. This is a custom place for us to build out any tools we need to be more productive. Please build this using NextJS and host it locally.

Timestamps:
0:00 Intro
0:53 What is OpenClaw
4:33 Where to host OpenClaw
8:12 Setting up OpenClaw
13:23 First things to do with OpenClaw
17:01 OpenClaw Use Cases
23:09 Brains and muscles
26:55 OpenClaw Mindset
30:32 Another advanced workflow
31:44 Security

## 요약

## 핵심 요약
- *"Open Claw is a 247 AI employee"* — 사용자의 컴퓨터에서 24/7 작동하며 인간이 하는 거의 모든 작업을 자동으로 수행하는 자율 에이전트다.  
- 설치와 온보딩은 웹의 한 줄 명령으로 매우 간단하며, 로컬 실행을 권장한다(보안·통합성 우수).  
- 모델 구조를 ‘브레인(의사결정)’과 ‘머슬(실행·전문화된 모델)’로 분리해 비용과 성능을 최적화할 수 있다.  
- 미션 컨트롤(커스텀 대시보드), 모닝 브리프(매일 자동 리포트) 등 실무용 워크플로우를 오토메이션할 수 있다.  
- 보안 위험이 크므로 API 키·계정 노출과 그룹 채팅 공개를 엄격히 통제해야 한다.

## 주요 내용
- 설치 및 온보딩
  - openclaw.ai의 Quick Start 한 줄 명령을 터미널/명령프롬프트에 붙여넣어 설치. 온보딩 화면에서 모델과 메시징 채널 선택.
  - Anthropic, OpenAI, Miniax 등 모델 제공자 선택 가능. Miniax는 저비용 대안(예: 약 $10/월). Opus 4.6은 성능 최상이나 비용 높음(예: 약 $200/월).
  - Anthropic 토큰 얻을 때 줄바꿈 주의: 토큰을 노트에 붙여 한 줄로 정리한 뒤 OpenClaw에 입력해야 함.
- 인터페이스 및 메시징
  - 웹 게이트웨이(대시보드)와 텔레그램/디스코드/iMessage 등 기존 메시지 앱으로 상호작용 가능. 텔레그램 추천(스레딩·청킹 유리).
- 기본 워크플로우
  - 브레인덤프(소개): 사용자 배경·선호·목표를 OpenClaw에 한 번에 알려 메모리에 저장하게 함(모든 대화의 컨텍스트에 포함).
  - 모닝 브리프: cron(스케줄)으로 매일 자동 발송. 예: 날씨, 관심 분야 뉴스, 할 일 리스트(Things 3 연동 등), 당장 할 수 있는 추천 작업.
  - 미션 컨트롤: Next.js 기반 로컬 대시보드(또는 사용자 맞춤 대시보드)를 OpenClaw에게 만들어 달라 요청 가능. 승인 큐, 투두, 시각화 등 커스텀 툴 생성.
- 브레인 vs 머슬(모델 분리)
  - 브레인: 고수준 의사결정 모델(opus 등).  
  - 머슬: 실제 작업에 특화된 저비용 모델/API(코딩엔 Codeex, 웹검색엔 Brave API, 트렌드 파악엔 X API 등)를 연결해 비용·성능 최적화.
- 로컬 모델과 하드웨어
  - 로컬 모델(예: MiniAX 2.5)로 특정 머슬을 돌리면 토큰 비용을 크게 절감 가능. 로컬 실행을 위해 Mac Mini(가성비) → Mac Studio(고성능) 순으로 점진적 업그레이드 권장.
  - 로컬 모델의 장점: 토큰 제약 완화, 개인정보·맞춤 지능 유지(오프라인 실행).
- 고급 사용법·사고방식
  - Reverse prompting(역질문): “우리가 목표를 달성하려면 무엇을 만들어야 하나?”처럼 질문형으로 지시해 OpenClaw에게 스스로 설계·구현하게 함.
  - 구성 파일을 직접 건드리지 말고 원하는 최종 상태(목표)를 지시하면 OpenClaw가 스스로 수정·구축하도록 함.
  - 실패 시엔 “멈추고 이 문제를 해결할 스킬을 만들어라”라고 시켜 자체 개선 유도.
- 디스코드 워크플로우 예시
  - 채널 분리: alerts(트렌드 탐지), research(심층 조사), scripts(유튜브 스크립트 자동작성) 등으로 자동화된 파이프라인 구성.
- 보안 포인트
  - *"It is completely free and open source"* — 소스는 공개되어 커스터마이징 가능하지만, 능력치가 강력해 잘못 설정하면 위험.  
  - OpenClaw은 로컬에서 사용자의 컴퓨터(로그인·계정 포함)에 광범위한 접근 권한을 가짐(이메일·SNS·API키 등).  
  - 그룹 채팅·공개 노출 금지 권장(프롬프트 인젝션·비밀 유출 위험). 개인 전용으로 운영하고, 외부 접근은 엄격 차단.  
  - 중요한 행동 전에 단계별 실행 계획을 요구하여 위험 점검 권장.

## 실무 포인트
- 시작 접근법
  - 기존에 있는 오래된 노트북이나 라즈베리파이 등으로 로컬에서 먼저 실행해 보고, 필요 시 점진적으로 하드웨어 업그레이드(맥미니→맥스튜디오).
  - 설치는 한 줄 명령으로 가능하니 VPS에 먼저 올리려는 복잡한 생각은 피하고 로컬로 시작.
- 비용 관리
  - Opus 같은 고성능 모델은 브레인으로만 쓰고, 실행 작업은 저비용 머슬 모델로 분리해 토큰·비용 절감.
  - 로컬 모델을 일부 워크플로우(예: 코딩)로 전환하면 지속비용을 크게 낮출 수 있음.
- 보안·운영 주의
  - 절대로 API 키나 민감 계정 정보를 공개 그룹에 연결하지 말 것. OpenClaw이 접근 가능한 계정에 대해선 최소 권한 원칙 적용.
  - Anthropic 등 공급사 약관 위반 가능성(계정 정지 사례 보고 있음)을 인지하고 사용 정책 검토 필요.
  - 설정 변경은 OpenClaw에게 목표로 지시하고 스스로 수정하게 하라(직접 config 편집은 오류 유발 가능).
- 활용 팁
  - 매일 모닝 브리프와 미션 컨트롤을 우선 구축하면 생산성·아이디어 흐름이 빠르게 개선된다.
  - 승인 큐(approval terminal)를 만들어 자동 생성 콘텐츠를 검수 후 발행하는 워크플로우로 위험 통제.
  - 자주 “무엇을 만들어야 하나?”, “오늘 내가 해야 할 가장 가치 있는 일은 무엇인가?” 같은 역질문을 반복해 역량을 극대화.

## 한줄 평
OpenClaw은 개인화된 24/7 자율 AI 비서로, 로컬 실행·브레인·머슬 분리·미션 컨트롤로 실무 생산성을 대폭 올릴 수 있지만, 강력한 권한 때문에 보안·운영 책임을 반드시 지켜야 한다.
