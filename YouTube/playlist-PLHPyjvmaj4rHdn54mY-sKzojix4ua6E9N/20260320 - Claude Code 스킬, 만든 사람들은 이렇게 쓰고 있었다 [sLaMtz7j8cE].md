---
youtube_id: "sLaMtz7j8cE"
title: "Claude Code 스킬, 만든 사람들은 이렇게 쓰고 있었다"
channel: "AgentOS"
publish_date: "2026-03-20T11:25:01-07:00"
original_url: "https://www.youtube.com/watch?v=sLaMtz7j8cE"
thumbnail: "https://i.ytimg.com/vi/sLaMtz7j8cE/maxresdefault.jpg"
playlist_url: "https://www.youtube.com/playlist?list=PLHPyjvmaj4rHdn54mY-sKzojix4ua6E9N"
tags:
  - youtube-summary
  - channel/agentos
  - date/2026-03-20
  - topic/tools
---

# Claude Code 스킬, 만든 사람들은 이렇게 쓰고 있었다

## 영상 정보
- 채널: AgentOS
- 게시일: 2026-03-20T11:25:01-07:00
- 원본 URL: https://www.youtube.com/watch?v=sLaMtz7j8cE
- 썸네일: https://i.ytimg.com/vi/sLaMtz7j8cE/maxresdefault.jpg

## 한글 요약
핵심 요약 — 클로드 코드 스킬 설계와 운영법
*스킬은 파일이 아니라 폴더예요.* 엔스로픽(영상 출처)은 강력한 스킬이 단일 마크다운이 아니라 메인 지시문(MD)과 레퍼런스(API·코드 예제), 검증 스크립트, 출력 템플릿 등 여러 파일로 구성된 폴더 형태라고 정리합니다. 클로드는 폴더 안을 탐색해 필요한 파일만 읽기 때문에 ‘밀키트’처럼 재료와 도구를 함께 제공하면 바로 실행 가능해지고, 스킬을 만들 때는 내부 규칙·예외·함정 같은 조직 고유 정보를 명확히 담아야 효율적입니다. 영상은 엔스로픽이 수백 개 스킬을 분류해 도출한 9가지 유형(라이브러리 레퍼런스, 제품 검증, 데이터 조회·모니터링, 비즈니스 자동화, 코드 스캐폴딩, 코드 리뷰, CICD·PR 모니터링·롤백, 장애 조사·보고, 인프라 운영)을 체크리스트로 활용하라고 권합니다.

운영 원칙은 실용적이고 점진적입니다: 클로드가 이미 아는 일반적 내용은 반복하지 말고, 클로드가 반복해서 실패하는 지점을 모아두는 ‘가차스(gachas)’를 스킬의 핵심 가치로 삼아 실사용 중 발견할 때마다 보완하라(초기에는 몇 줄로 시작해 점차 확장). 스킬 MD엔 개요와 파일 목록만 두고 세부는 별도 파일로 분리해 ‘점진적 공개’로 컨텍스트 폭주를 막으세요. 디스크립션은 사람이 읽는 요약이 아니라 클로드의 트리거 조건으로 작성해 언제 이 스킬을 써야 하는지 명확히 알리며, 스크립트(헬퍼 함수)와 온디맨드 훅(예: 안전 모드, 동결 모드)을 넣어 세션별 가드레일을 자동으로 켜고 끄면 실수와 범용성 문제를 크게 줄일 수 있다고 정리합니다.
