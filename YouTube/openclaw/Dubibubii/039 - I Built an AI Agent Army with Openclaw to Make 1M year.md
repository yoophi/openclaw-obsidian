---
title: "I Built an AI Agent Army with Openclaw to Make 1M/year"
source: "https://www.youtube.com/watch?v=3hgXhB_Wy2U"
original_url: "https://www.youtube.com/watch?v=3hgXhB_Wy2U"
youtube_id: "3hgXhB_Wy2U"
playlist: "📙 openclaw"
channel: "Dubibubii"
duration: "13:56"
publish_date: "2026-02-28"
playlist_index: 39
tags:
  - youtube
  - playlist
  - openclaw
  - channel/dubibubii
  - playlist/📙 openclaw
generated_by: "OpenClaw summarize skill"
generated_at: "2026-03-23 19:26:19 +0900"
language: "ko"
---

# I Built an AI Agent Army with Openclaw to Make 1M/year

## 영상 정보

- 원본 주소: https://www.youtube.com/watch?v=3hgXhB_Wy2U
- 채널: Dubibubii
- 제목: I Built an AI Agent Army with Openclaw to Make 1M/year
- 게시일: 2026-02-28
- 재생시간: 13:56
- 플레이리스트: 📙 openclaw
- 플레이리스트 순서: 39

## 영상 설명

AUTO APP FACTORY SIGN UP: https://manalabs.wtf/appfactory
LARRYBRAIN: https://larrybrain.com/dubi-k

In this video, I break down the exact autonomous AI app factory I built using OpenClaw, Claude Code, and 11 specialized AI agents running 24/7.

This system researches app ideas, validates them, builds the apps, reviews the code, adds monetization, designs the icon, creates screenshots, generates promo videos, and prepares everything for App Store submission with almost no manual input.

Just recently, it built 7 apps in a single afternoon while using less than 5% of my OpenClaw context window.

Inside this breakdown, I cover:

• how my 11-agent system is structured
• why I rebuilt my OpenClaw setup 3 times before it finally worked
• how I solved context bloat by turning OpenClaw into an orchestrator instead of the builder
• the 9-step framework every app goes through from idea to App Store
• the exact AI models I use for building, reviewing, routing, and logging
• how the factory handles quality control and rejection prevention
• how each app gets monetized with StoreKit
• how I plan to automate the marketing engine using Larry and niche content accounts
• how promo videos are generated automatically with Remotion inside Claude Code

This is not about building one perfect app.

It is about building a pipeline that ships fast, learns fast, and improves with every release.

If you are interested in AI agents, OpenClaw, Claude Code, autonomous businesses, or building profitable apps with AI, this video will show you the blueprint I am using right now.

I’m Dubi, a former marketer turned AI builder, and I’m documenting my challenge to reach $100K using AI.

If you want early access to the autonomous app factory, use the first link above.

If you want Larry and the skills stack behind the marketing engine, use the Larrybrain link above.

Join my community here:
https://discord.gg/e2J2cnDymf

Follow me on X: https://x.com/Dubibubiii

Watch my other video on how OpenClaw agents are already making real money: https://www.youtube.com/watch?v=v2cPHF5oXcI&t=118s

Subscribe if you want more videos on:
AI agents, OpenClaw, Claude Code, autonomous app businesses, AI monetization, vibecoding, and building with AI in public.

#OpenClaw #AIAgents #ClaudeCode #Vibecoding #BuildInPublic #AIApps #Automation #IndieHacker #AppBusiness #Entrepreneurship

## 요약

## 핵심 요약
- 자동화된 에이전트 군으로 iOS 앱 기획·개발·검수·배포·마케팅까지 파이프라인화해 다량 출시에 초점.
- 중앙 오케스트레이터(OpenClaw Sheldon)가 전문 서브 에이전트들을 조율해 작업별 컨텍스트를 분리해 효율화.
- 모델 조합(빌더, 리뷰어, 라우터 등)과 엄격한 품질 게이트로 앱 스토어 승인 확률 및 안정성 확보.
- 마케팅도 자동화해 앱 출시와 동시에 프로모션 영상·SNS 콘텐츠로 유입을 만들 계획.
- *I have 11 AI agents running 24/7* / *the entire factory runs on less than 5% of Sheldon's context window.*

## 주요 내용
- 전체 구조
  - 중앙 오케스트레이터(이름: Sheldon)가 프로젝트 상태를 읽고 각 단계별 전문 에이전트를 호출·조정.
  - 연구→검증→빌드→리뷰→품질게이트→결제 연동→스토어 패키징→프로모션 비디오→업로드의 9단계 프레임워크.
  - 아이디어는 연구 에이전트(Shan)가 Reddit/X, 앱스토어 카테고리, 기술적 실현 가능성 등을 크롤링해 생성된 뒤 아이디어 큐에 적재.
- 에이전트 및 모델 구성
  - Claude Opus 4.6: 빌더(모바일 앱 전체 Swift/SwiftUI 코드 생성, 권한/화면 구조 지시).
  - Codex 5.3: 리뷰어(작성된 파일을 읽어 충돌 위험·권한 버그·기능 누락·코드 품질 점검).
  - Sonet 4.6: 라우팅, 로깅, 메타데이터 처리, 빠른 의사결정용.
  - Claude Code(OpenClaw/claude code)를 이용해 단계별 세션을 스폰하고 필요한 프롬프트로 작업 수행.
- 컨텍스트 관리와 상태 저장
  - 단일 에이전트 컨텍스트 과부하 문제 해결: 각 서브 에이전트가 자체 컨텍스트로 작업하고 결과를 파일(state file)에 기록.
  - 중요한 상태는 대화 이력에 의존하지 않고 파일에 항상 쓰도록 설계(콘텍스트 낭비 방지).
- 품질 관리와 자동 검증
  - 자동 코드 리뷰 이후 6개의 자동화된 체크를 포함한 품질 게이트로 점수(0–10)를 부여.
  - 통과 기준: 최소 8점 이상. 실패가 3번 연속되면 수동 검토 플래그.
  - 앱스토어 승인 비율을 높이기 위한 반복 학습 루프(에이전트 재시도·조정).
- 결제·수익 모델
  - Apple StoreKit 사용 권장(Stripe 대신). 소규모 개발자 프로그램: 최초 $1M까지 수수료 15%.
  - 자동 분석 결과에 따라 무료 체험(7일) 또는 프리미엄 모델 선택. 연구에 따르면 무료 체험이 하드 페이월보다 전환율이 약 6배 높음.
- 앱 스토어 패키징 및 스크린샷 생성
  - 앱스토어 설명, 키워드, 스크린샷, 아이콘(자동 생성)까지 자동 생성.
  - AI가 앱을 열어 모든 버튼을 누르며 화면을 캡처하도록 자동화해서 스크린샷을 확보.
- 마케팅 자동화(계획)
  - 여러 틱톡/인스타 계정을 카테고리별로 운영해 네이티브 콘텐츠로 팔로워를 늘리고, 관련 앱이 출시되면 노출.
  - Larry 스킬 같은 에이전트를 사용해 자동으로 이미지·후크 생성, 성과에 따른 반복 최적화(오디언스 정렬).
  - Votion(비디오 생성 도구)을 통해 앱별 프로모 영상 자동 생성.

## 실무 포인트
- 필수 전제조건
  - 에이전트별로 분리된 컨텍스트 설계와 상태 파일화가 핵심(대화 히스토리만 의존하면 곧 한계).
  - 모델별 강점에 맞는 역할 분담(빌드·리뷰 분리)으로 편향·생략 방지.
- 운영 팁
  - 최대 동시 프로젝트 수를 제한하고(예: 5개), 크론으로 주기 실행해 자원 낭비 최소화.
  - 템플릿을 미리 준비해 공통 기능(결제, 온보딩, AI 래퍼 등)을 재사용하면 전체 개발 시간 단축.
  - 자동 품질 게이트의 임계값과 재시도 로직을 명확히 설정해 불필요한 수동 개입을 줄일 것.
- 주의점·한계
  - 앱스토어 심사 규정 변경, API(예: StoreKit) 요구사항, 개인정보/권한 규제에 따라 자동화가 실패할 수 있음.
  - AI가 생성한 코드의 논리적 결함이나 보안 취약성은 자동 검증으로 완전히 대체되지 않음—민감한 부분은 수동 검토 필요.
  - 초기 수립(프롬프트, 템플릿, 체크리스트)에 상당한 시행착오와 시간(제작자는 100시간 이상 테스트)을 투자해야 함.
  - 마케팅 자동화(계정 운영, 플랫폼 정책 준수)는 아직 완성된 상태가 아니며 별도 작업·감시 필요.

## 한줄 평
AI 에이전트를 역할별로 나눠 중앙에서 조율하면 iOS 앱의 대량 생산과 자동화된 검증·배포 파이프라인을 실현할 수 있다는 실무적 청사진을 제시하는 영상입니다.
