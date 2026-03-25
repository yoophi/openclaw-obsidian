---
youtube_id: "4QH0vHr-vFU"
title: "OpenClaw Memory Deep Dive: QMD vs Core"
channel: "Openclaw Labs"
publish_date: "2026-03-22T15:30:01-07:00"
original_url: "https://www.youtube.com/watch?v=4QH0vHr-vFU"
thumbnail: "https://i.ytimg.com/vi/4QH0vHr-vFU/maxresdefault.jpg"
playlist_url: "https://www.youtube.com/playlist?list=PLHPyjvmaj4rGje-pPUojFDK5cF8Ql9OBo"
tags:
  - youtube-summary
  - openclaw
  - channel/openclaw-labs
  - topic/memory
  - topic/comparison
  - date/2026-03-22
---

# OpenClaw Memory Deep Dive: QMD vs Core

## 영상 정보
- 채널: Openclaw Labs
- 게시일: 2026-03-22T15:30:01-07:00
- 원본 URL: https://www.youtube.com/watch?v=4QH0vHr-vFU
![OpenClaw Memory Deep Dive: QMD vs Core](https://i.ytimg.com/vi/4QH0vHr-vFU/maxresdefault.jpg)

## 한글 요약
## OpenClaw 메모리: Core vs QMD 핵심 정리

이 영상은 OpenClaw의 메모리 저장 방식과 검색 계층이 어떻게 분리되어 있는지를 설명합니다. OpenClaw는 기본적으로 장기 메모리 파일과 날짜별 메모리 폴더를 **일반 Markdown 파일**로 저장하고, 그 위에서 검색 레이어가 따로 동작합니다. 영상에서 강조하는 핵심은 *"메모리 파일 자체와 메모리 검색은 완전히 다른 문제"*라는 점입니다. 기본값인 **Memory Core**는 이 파일들을 스캔하고, 관련도를 계산하고, 파일 변경을 감시하면서 `memory_search`와 `memory.get` 같은 기능을 제공합니다. 대부분의 사용자에게는 별도 설정 없이도 충분히 빠르고 안정적인 기본 검색 계층이라는 설명입니다.

반면 **QMD**는 저장소를 바꾸는 기능이 아니라 **검색 엔진만 교체하는 옵션**입니다. 키워드 매칭, 의미 기반 유사도 검색, 리랭킹을 조합해 더 정교한 결과를 찾도록 설계되어 있어서, 메모리 양이 많거나 검색 품질이 중요한 경우에 더 적합하다고 설명합니다. QMD를 쓰려면 `memory.backend`를 QMD로 바꾸고, 게이트웨이와 같은 호스트에 QMD 도구를 설치해야 하며, SQLite와 임베딩 제공자도 제대로 준비되어 있어야 합니다. 결론적으로 영상은 **대부분은 Memory Core로 시작하고, 검색 품질이나 규모 문제가 생길 때 QMD를 고려하는 것이 현실적**이라고 정리합니다.
