---
youtube_id: "oU-BbX0Om4I"
title: "Claude Code + GSD — 기획부터 검증까지 자동화하는 법"
channel: "AgentOS"
publish_date: "2026-03-23T05:28:30-07:00"
original_url: "https://www.youtube.com/watch?v=oU-BbX0Om4I"
thumbnail: "https://i.ytimg.com/vi/oU-BbX0Om4I/maxresdefault.jpg"
playlist_url: "https://www.youtube.com/playlist?list=PLHPyjvmaj4rHdn54mY-sKzojix4ua6E9N"
tags:
  - youtube-summary
  - channel/agentos
  - date/2026-03-23
  - topic/general
---

# Claude Code + GSD — 기획부터 검증까지 자동화하는 법

## 영상 정보
- 채널: AgentOS
- 게시일: 2026-03-23T05:28:30-07:00
- 원본 URL: https://www.youtube.com/watch?v=oU-BbX0Om4I
- 썸네일: https://i.ytimg.com/vi/oU-BbX0Om4I/maxresdefault.jpg

## 한글 요약
## 요약
*클로드 코드가 작업할수록 멍청해지는 현상.* 발표자는 Claude Code(코딩용 LLM)가 시간이 지날수록 이전에 정한 규칙과 파일 구조를 잊고 품질이 떨어지는 근본 원인을 “컨텍스트 롯(context rot)”이라고 정의합니다. GSD(개치던)는 Claude Code 위에 얹는 메타프롬프팅 시스템으로, 질문→논의→계획→실행→검증의 사이클로 프로젝트를 구조화하고 각 계획서를 독립 서브 에이전트가 처리하도록 해 컨텍스트 윈도우를 분산시킵니다. 핵심 기술적 포인트는 각 서브 에이전트에 신선한 컨텍스트(예: 20만 토큰)를 할당해 메인 컨텍스트가 30–40%만 차게 유지하고, 플랜 문서는 XML/마크다운 형태로 작업 단위·수정 파일·검증 방법까지 명시해 자동 커밋과 자동 검증(테스트 통과 여부, 기능 확인)까지 연결하는 점입니다. 또한 문제가 생기면 디버그 에이전트를 띄워 원인 분석과 수정 계획을 자동으로 만듭니다.

*컨텍스트가 썩는 거예요.* 실용적 교훈은 GSD 자체를 쓰지 않더라도 바로 적용할 수 있습니다: (1) 채팅 지시를 줄이고 구조화된 문서로 컨텍스트 품질을 올릴 것, (2) 큰 작업은 원자적 단위로 쪼개서 각 단위가 자체 검증을 포함하도록 할 것, (3) 검증을 자동화해 테스트 기반으로 구현을 맡길 것. 발표자는 이 접근을 ‘컨텍스트 엔지니어링’—무엇을, 언제, 어떤 형태로 AI에 전달할지 설계하는 기술—이라고 규정하며, 컨텍스트 윈도우가 커져도 쓰레기 입력은 여전히 문제라면서 이 원칙의 지속적 유효성을 강조합니다.
