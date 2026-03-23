---
title: "3 Tools That Make OpenClaw Actually Useful"
source: "https://www.youtube.com/watch?v=QvfqAMUJTT4"
original_url: "https://www.youtube.com/watch?v=QvfqAMUJTT4"
youtube_id: "QvfqAMUJTT4"
playlist: "📙 openclaw"
channel: "Sean Matthew"
duration: "13:56"
publish_date: "2026-03-03"
playlist_index: 33
tags:
  - youtube
  - playlist
  - openclaw
  - channel/sean matthew
  - playlist/📙 openclaw
generated_by: "OpenClaw summarize skill"
generated_at: "2026-03-23 19:23:41 +0900"
language: "ko"
---

# 3 Tools That Make OpenClaw Actually Useful

## 영상 정보

- 원본 주소: https://www.youtube.com/watch?v=QvfqAMUJTT4
- 채널: Sean Matthew
- 제목: 3 Tools That Make OpenClaw Actually Useful
- 게시일: 2026-03-03
- 재생시간: 13:56
- 플레이리스트: 📙 openclaw
- 플레이리스트 순서: 33

## 영상 설명

Three tools that turn a basic OpenClaw install into a fully capable AI agent — with its own email, upgraded memory, and agentic web browsing.

📋 TIMESTAMPS:
00:00 Intro
00:24 What We're Upgrading Today
01:17 Tool 1: Give Your Agent Email
02:48 Side Note: API Keys vs. Subscriptions
06:19 Tool 2: Upgrade the Agent's Memory
08:27 Tool 3: Give the Agent a Better Browser
13:02 Recap
13:36 Outro

💾 MENTIONED IN THIS VIDEO:
→ AgentMail: https://agentmail.to
→ AgentMail skill on ClawHub: https://clawhub.ai/adboio/agentmail
→ QMD by Tobi Lutke: https://github.com/tobi/qmd
→ OpenClaw Memory Docs (QMD): https://docs.openclaw.ai/concepts/memory#qmd-backend-experimental
→ Agent-Browser by Vercel Labs: https://github.com/vercel-labs/agent-browser
→ OpenClaw Skills Docs: https://docs.openclaw.ai/tools/skills
→ ClawHub (skill registry): https://clawhub.ai
→ OpenClaw: https://github.com/openclaw/openclaw

🛠️ SETUP GUIDE + PROMPTS:
→ All copy-paste prompts from this video can be found here: https://x.com/_sean_matthew/status/2028902126005653889

For more OpenClaw content:
→ I Gave OpenClaw Its Own Computer: https://www.youtube.com/watch?v=QCf8BCT-Kzo

## 요약

## 핵심 요약
- OpenClaw 기본 설치는 이메일, 신뢰할 수 있는 장기 메모리, 효율적 웹 브라우징 기능이 부족하다.  
- Agent Mail, QMD, Agent Browser 세 가지 도구를 추가하면 OpenClaw를 실사용 가능한 에이전트로 크게 업그레이드할 수 있다.  
- QMD(로컬 하이브리드 검색)는 메모리 성능을 가장 크게 향상시키는 필수 업그레이드다.  
- Cloud Code(Claude Code)를 사용해 스킬을 설치하면 OpenClaw 자체가 많은 토큰을 소모하지 않도록 설계할 수 있다.  

*Agent Mail gives your agent its own dedicated inbox.*  
*QMD gives your agent real memory and agent browser gives your agent a better and faster way to browse the web.*

## 주요 내용
- Agent Mail
  - 목적: 에이전트 전용 이메일 인박스를 프로그램적으로 보내고 받게 함(일반 Gmail 계정 사용으로 인한 차단 위험 회피).  
  - 설정 요약: agentmail.to에서 계정/인박스 생성 → 인박스 이름과 API 키 확보 → Cloud Code(또는 Clawed Code)로 Agent Mail 스킬 설치 및 API 키 입력.  
  - 통합: OpenClaw과 연동해 수신 이메일을 Telegram 등으로 알림받고 요약·액션 생성 가능.  
  - 활용 사례: 개인 이메일 요약·청구서 포워딩, 비즈니스 지원용 1차 응답 처리 등.  

- QMD (로컬 하이브리드 검색)
  - 문제점: OpenClaw 기본 메모리는 키워드 기반 검색으로, 표현이 달라진 과거 작업을 제대로 찾아내지 못함. 컨텍스트가 많아질수록 비용과 실패 가능성 증가.  
  - QMD 역할: 마크다운 파일에 대해 키워드 검색 + 벡터 검색 + LLM 재랭커 결합한 하이브리드 검색을 제공.  
  - 장점: 로컬 실행(API 키 불필요), 소형 로컬 모델 사용으로 자원 효율적, 검색 정확도·회상 능력 크게 향상.  
  - 설치: OpenClaw 문서 참조 또는 Cloud Code에 설치 프롬프트를 넣어 자동 구성.  

- Agent Browser
  - 기능: 명령줄 기반 브라우저 자동화(클릭, 스크린샷, 폼 작성 등) — Playwright 등과 달리 토큰 사용량을 크게 줄여 효율적 처리(제작자 측 비교: 약 93% 적은 토큰 사용).  
  - 설치 및 설정: 로컬에 Agent Browser 설치 명령 실행 → Cloud Code로 에이전트 스킬(깃허브 기반) 가져와 OpenClaw에서 브라우징 시 Agent Browser 사용하도록 설정.  
  - 데모: Hacker News 접속, 스크린샷 캡처 후 요약 반환(명령줄 → OpenClaw 연동 가능).  
  - 활용 사례: API 없는 웹 대시보드 자동화, 변경 검증(스샷 기반), 웹 페이지 모니터링(가격·상품변화), Electron 앱 제어(예: 데스크탑 앱 자동화).  
  - 보안: 프롬프트 인젝션 방어 기능이 일부 내장되어 있으나 완벽하지 않음.

- 스킬 추가 방식
  - 수동: skill.md 파일을 만들어 OpenClaw에 가르침.  
  - Claw Hub(Clawub): 스킬 저장소에서 설치 가능하지만 악성코드 보고 사례가 있어 주의 필요.  
  - 권장: Cloud Code를 '엔지니어'로 사용해 필요한 스크립트·스킬을 설치·구성하면 OpenClaw 자체 토큰 소비를 줄일 수 있음.

## 실무 포인트
- 준비물 및 순서: Agent Mail 인박스 이름과 API 키를 반드시 저장 → Claw Hub 설치(npm) 또는 Cloud Code 프롬프트로 스킬 적용 → 테스트(이메일 포워딩, Telegram 알림 등).  
- 우선순위: QMD가 메모리 품질을 가장 크게 올려주므로 먼저 설치하는 것을 권장. 이후 Agent Mail, Agent Browser를 추가.  
- 보안·프라이버시: 에이전트에 이메일·웹 제어 권한을 주는 것은 민감함 — 테스트용 계정으로 먼저 시험하고 권한 범위를 최소화할 것.  
- Claw Hub 주의: 커뮤니티 스킬에 악성 코드 보고가 있으므로 다운받기 전 출처 확인, 필요시 수동 검토 필요.  
- 리소스·비용: QMD는 로컬 모델로 비용 절감 가능하지만 로컬 자원(CPU/RAM/스토리지)을 사용함. OpenClaw 운영에 필요한 API 키(Anthropic 등)는 별도 비용 발생 가능.  
- 안정성 제한: Agent Browser의 보안 가드·자동화는 유용하지만 모든 사이트에서 완벽하게 동작하는 것은 아니므로 중요한 작업은 검증 단계 필요.  
- 백업 및 관리: 메모리(DB/마크다운)와 인박스 설정은 정기 백업 권장 — 장기 기억·검색 품질 유지에 중요.

## 한줄 평
OpenClaw 기본 한계를 빠르게 보완해 실사용 가능한 개인 에이전트로 바꿔주는 간단하고 강력한 3가지 도구 활용 가이드입니다. QMD부터 도입하면 즉시 회상·검색 품질이 크게 개선됩니다.
