---
title: "You’re Using OpenClaw Wrong - Copy These 14 Prompts (ClawdBot)"
source: "https://www.youtube.com/watch?v=4bbVi5P0JT4"
original_url: "https://www.youtube.com/watch?v=4bbVi5P0JT4"
youtube_id: "4bbVi5P0JT4"
playlist: "📙 openclaw"
channel: "Jordan Rafealov"
duration: "27:43"
publish_date: "2026-02-25"
playlist_index: 54
tags:
  - youtube
  - playlist
  - openclaw
  - channel/jordan rafealov
  - playlist/📙 openclaw
generated_by: "OpenClaw summarize skill"
generated_at: "2026-03-23 19:32:33 +0900"
language: "ko"
---

# You’re Using OpenClaw Wrong - Copy These 14 Prompts (ClawdBot)

## 영상 정보

- 원본 주소: https://www.youtube.com/watch?v=4bbVi5P0JT4
- 채널: Jordan Rafealov
- 제목: You’re Using OpenClaw Wrong - Copy These 14 Prompts (ClawdBot)
- 게시일: 2026-02-25
- 재생시간: 27:43
- 플레이리스트: 📙 openclaw
- 플레이리스트 순서: 54

## 영상 설명

👉 FREE Skool (SOP Here): https://www.skool.com/dopaminedigital/about
👉 Work With Me: https://form.typeform.com/to/n0a0HYkd

This video shows how to significantly improve an AI agent like Open Claw, also known as Clawdbot or Moltbot, by using specific prompt engineering techniques. We detail 14 prompts that enhance the agent's ability to think, remember, and function efficiently, moving it beyond basic chatbot capabilities. Learn how to leverage these ai tools for effective ai automation and better artificial intelligence performance.

## 요약

## 핵심 요약
- OpenClaw을 제대로 쓰려면 핵심 14개 프롬프트로 에이전트의 성격, 기억, 행위 지침, 비용 최적화 등을 명확히 설정해야 한다.
- 가장 중요한 항목은 'soul'(영구적 성격/행동 규칙)과 'memory protocol'으로, 이를 통해 에이전트의 일관성·기억 유지·장기 학습이 가능해진다.
- 토큰/비용 절감은 시스템 감사와 멀티모델 전략(비싼 모델은 복잡한 작업만 사용)으로 크게 개선할 수 있다.
- 스킬(특화 모듈), 병렬 처리, 응답 최적화, 프로액티브/하트비트(정기 트리거) 등으로 생산성과 자동화를 높일 수 있다.
- 보안(노출된 API 키·권한 과다 등)과 공개 스킬의 안전성은 반드시 점검해야 한다.

*you absolutely 100% positively need to give it a soul.*

## 주요 내용
- Soul 파일(영구 성격)
  - 에이전트의 일관된 톤·우선순위·행동규칙을 정의. 없으면 답변이 기업형·일관성 없는 스타일로 흩어짐.
  - 세션·스킬·메모리 간 충돌 시 우선순위 규정 포함.
- System audit (시스템 감사)
  - 항상 로드할 필요 없는 컨텍스트를 스킬로 분리, 오래된 항목 삭제, 장황한 문구 축소로 토큰 절감.
  - 감사 후 토큰 사용 통계(절감량) 제공.
- Identity anchor (정체성 앵커)
  - 사용자·비즈니스 정보(이름, 역할, 우선순위, 의사결정 스타일 등)를 한 번 입력해 메모리에 저장하면 반복 질문을 방지.
  - 'CEO frame' 같은 개인 목표 필터로 의사결정 기준 적용 가능.
- Memory protocol (메모리 규약)
  - 과거 결정·선호·프로젝트 관련 질문에 답하기 전 항상 메모리 검색을 먼저 수행하도록 강제.
  - 저장할 항목과 저장 방식(빌드 로그 등)을 규정해 장기적 컨텍스트 축적.
- Context loader (세션 초기화 템플릿)
  - 세션 시작 시 현재 작업, 최근 변경사항, 관련 배경을 불러와 확인. 성공 기준(what good looks like)을 명시해 불필요한 상세화를 줄임.
- Response optimizer (응답 구조화)
  - 모든 작업성 요청에 대해 "요점(한 문장) / 이유 / 다음 행동(단계별) / 주의사항 / 간단 모드" 형식으로 응답하도록 지시.
  - 간단 질문은 1–3문장, 선택지 1개 제시, 불필요한 서두 생략.
- Parallel worker (병렬 작업)
  - 독립 작업은 병렬로 실행해 속도 3배 향상. 단계별 의존성이 있을 때는 순차 실행.
- Skill activator (스킬 활성화)
  - 도메인별 전문 스킬(.md 파일)을 만들어 필요 시 불러와 적용. 여러 스킬이 적용될 때는 가장 구체적인 것을 선택.
  - 공개 스킬 저장소(예: clawhub 등) 활용 가능하지만 악성 스킬 경고(지갑 소모 등).
- Multimodel setup (멀티모델 전략)
  - 작업 유형에 따라 모델을 분배(복잡한 사고: Opus, 단순·빠른 작업: Haiku/Sonnet 등) — '브레인 vs 근육' 비유.
  - agents.mmd 파일에 모델 전환 규칙과 API키 질문 포함.
- Proactivity dial (자발성 설정)
  - 초기에는 보수적으로(사용자 확인 기반) 시작하고 신뢰 쌓이면 작은 행동·중간 행동을 자동으로 수행하게 확장.
  - 중요한 조치(전송·삭제 등)는 항상 확인 요구.
- Heartbeat / Cron (정기 트리거)
  - 일정 간격으로 자동 리포트·검토·브리핑 생성(예: 매일 아침 캘린더 체크, 우선순위 3개 추출, 150단어 내 전달).
  - 하트비트는 저렴한 모델로 돌려 비용 절감 가능.
- Security audit (보안 점검)
  - 공개 저장소에 노출된 API키, 권한 과다, 프롬프트 인젝션 등 점검. 취약점 우선순위별 수정 지침 포함.
- Voice cloner (음성/스타일 일관화)
  - 모든 출력(이메일·트윗 등)이 사용자 스타일로 나오게 성격·문체 규칙 설정(직설적·간결한 문장 등).
- Master system prompt (메타 시스템)
  - 전체 프롬프트(1–13)를 통합·우선순위화. 우선순위 예: 현재 대화의 명시적 지시 > 스킬 지침 > soul > 에이전트 설정 > 일반 판단.
  - 운영 철학: 정확성 우선, 실행 가능성 우선, 솔직함 우선 등.

*accuracy over being complete, actionable over informative*

## 실무 포인트
- 우선순위와 단계적 적용: 처음부터 모든 자동화·자율 권한을 주지 말고, 프로액티비티 다이얼을 낮게 시작해 신뢰 기반으로 올리기.
- 비용 관리: 시스템 감사로 불필요한 컨텍스트 제거 후, 멀티모델 전략으로 단순 작업에 저비용 모델 사용.
- 기억 체계 필수: 메모리 프로토콜을 설정하지 않으면 에이전트가 '기억 못하는 채팅봇'으로 남음. 질문 전에 항상 메모리 검색을 수행하도록 강제.
- 스킬 보안 주의: 공개 스킬은 편리하지만 악성/과금 유발 스킬이 있으니 검증하거나 직접 스킬을 만들어 사용.
- 병렬화의 조건 분명히: 병렬 실행은 독립 작업에만 적용, 단계 의존성이 있는 작업은 순차 처리로 제한.
- 하트비트(스케줄) 활용: 아침·저녁 브리핑, 주간 리뷰 등 정기 리포트를 통해 자동 모니터링과 책임감을 확보하되 비용을 고려해 모델 선택.
- 보안 점검 필수: API 키·퍼블릭 접근 여부·권한 설정을 정기 점검하고 우선순위별 수정 지침을 갖추기.
- 응답 템플릿 적용: "요점/이유/다음 행동/주의사항" 구조를 기본으로 하면 실무에서 바로 실행 가능한 결과를 얻기 쉬움.
- 마스터 프롬프트로 충돌 해결: 여러 규칙이 충돌할 때 우선순위를 명확히 해 일관된 행동을 보장.

## 한줄 평
OpenClaw을 단순 챗봇에서 실무형 에이전트로 바꾸려면 14개 핵심 프롬프트로 성격·기억·스킬·보안·비용을 체계적으로 설정하는 것이 가장 효과적이다. 이 영상은 그 설정 항목과 실무 적용 포인트를 단계별로 정리해 준다.
