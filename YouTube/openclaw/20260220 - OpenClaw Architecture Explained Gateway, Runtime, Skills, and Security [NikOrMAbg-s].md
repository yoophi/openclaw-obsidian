---
youtube_id: "NikOrMAbg-s"
title: "OpenClaw Architecture Explained: Gateway, Runtime, Skills, and Security"
channel: "scrollypedia"
publish_date: "2026-02-20T07:00:45-08:00"
original_url: "https://www.youtube.com/watch?v=NikOrMAbg-s"
thumbnail: "https://i.ytimg.com/vi/NikOrMAbg-s/maxresdefault.jpg?sqp=-oaymwEmCIAKENAF8quKqQMa8AEB-AH-CYAC0AWKAgwIABABGH8gFigTMA8=&rs=AOn4CLANx5w3Eh635pQfow_h9spWtaIn0A"
playlist_url: "https://www.youtube.com/playlist?list=PLHPyjvmaj4rGje-pPUojFDK5cF8Ql9OBo"
tags:
  - youtube-summary
  - openclaw
  - channel/scrollypedia
  - topic/security
  - topic/tools
  - topic/architecture
  - date/2026-02-20
---

# OpenClaw Architecture Explained: Gateway, Runtime, Skills, and Security

## 영상 정보
- 채널: scrollypedia
- 게시일: 2026-02-20T07:00:45-08:00
- 원본 URL: https://www.youtube.com/watch?v=NikOrMAbg-s
- 썸네일: https://i.ytimg.com/vi/NikOrMAbg-s/maxresdefault.jpg?sqp=-oaymwEmCIAKENAF8quKqQMa8AEB-AH-CYAC0AWKAgwIABABGH8gFigTMA8=&rs=AOn4CLANx5w3Eh635pQfow_h9spWtaIn0A

## 한글 요약
## OpenClaw 아키텍처 설명: 게이트웨이, 런타임, 스킬, 그리고 보안

이 영상은 OpenClaw가 어떤 구조로 동작하는지 큰 그림부터 설명합니다. OpenClaw는 로컬에서 실행되는 오픈소스 AI 에이전트로, 여러 메시징 플랫폼을 하나의 **WebSocket 게이트웨이**에 연결하고, 그 위에서 세션 해석 → 워크스페이스 준비 → 컨텍스트 조립 → LLM 호출 → 도구 실행으로 이어지는 런타임 단계를 거칩니다. 게이트웨이는 다양한 이벤트를 처리하고, 채널마다 다른 에이전트를 연결할 수 있으며, 런타임은 의미 검색과 키워드 검색을 함께 쓰는 하이브리드 메모리 검색을 사용합니다. 또한 브라우저 자동화, Canvas UI, 모바일/데스크톱 컴패니언, 음성 웨이크 같은 확장 기능도 함께 소개됩니다.

영상의 후반부는 특히 **보안 문제**를 강하게 강조합니다. OpenClaw와 Claw Hub 생태계가 빠르게 커지면서 스킬 공급망 위험도 함께 커졌고, 실제 스캔 결과 상당수 스킬에서 취약점이 발견됐다는 점을 설명합니다. 스킬은 기본적으로 에이전트 권한을 그대로 상속받기 때문에, 악성 스킬이 프롬프트 인젝션뿐 아니라 자격 증명 탈취, API 키 수집, 메모리 오염 같은 전통적인 악성 행위를 함께 수행할 수 있다는 경고입니다. 결론적으로 영상은 **강력한 로컬 에이전트 생태계는 매우 유용하지만, 메모리와 스킬 확장 구조 때문에 보안 우선 설계가 필수**라고 정리합니다.
