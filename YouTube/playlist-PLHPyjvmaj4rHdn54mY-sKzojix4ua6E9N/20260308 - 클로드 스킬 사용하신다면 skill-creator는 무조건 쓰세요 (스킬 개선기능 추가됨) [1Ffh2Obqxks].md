---
youtube_id: "1Ffh2Obqxks"
title: "클로드 스킬 사용하신다면 skill-creator는 무조건 쓰세요 (스킬 개선기능 추가됨)"
channel: "스테판초 StefanCho"
publish_date: "2026-03-08T09:27:38-07:00"
original_url: "https://www.youtube.com/watch?v=1Ffh2Obqxks"
thumbnail: "https://i.ytimg.com/vi/1Ffh2Obqxks/maxresdefault.jpg"
playlist_url: "https://www.youtube.com/playlist?list=PLHPyjvmaj4rHdn54mY-sKzojix4ua6E9N"
tags:
  - youtube-summary
  - channel/스테판초-stefancho
  - date/2026-03-08
  - topic/tools
---

# 클로드 스킬 사용하신다면 skill-creator는 무조건 쓰세요 (스킬 개선기능 추가됨)

## 영상 정보
- 채널: 스테판초 StefanCho
- 게시일: 2026-03-08T09:27:38-07:00
- 원본 URL: https://www.youtube.com/watch?v=1Ffh2Obqxks
- 썸네일: https://i.ytimg.com/vi/1Ffh2Obqxks/maxresdefault.jpg

## 한글 요약
클로드 스킬 개선: skill-creator 요약

핵심 주장: 엔트로픽(Claude)용 플러그인 'skill-creator'가 이제 스킬 생성뿐 아니라 기존 스킬의 자동 개선·평가에 쓰입니다. 설치는 플러그인 인스톨러로 하고, 워크스페이스를 만들어 기존(Old) 버전과 새(With/New) 버전을 반복(iteration) 구조로 놓고 테스트케이스를 돌려 비교·평가합니다. *"스킬 크리에이터로 스킬을 이제 개선을 할 수 있게 되었습니다."*

주요 근거와 기능: 자동화 루프에서 세 에이전트(Grader, Comparator, Analyzer)가 각각 채점, 블라인드 비교, 원인 분석을 맡고 그레이더는 항상 실행됩니다. 테스트는 보통 여러 프롬프트 케이스(예: 3개)×버전(Old/New)으로 구성해 총 산출물을 만들고, 패스율(pass rate)로 성능을 계량화합니다. 영상용 예제로는 '리무브 사일런스' 스킬을 개선했는데, 문제 원인은 CFR/VFR 프레임 타임 처리 차이에서 오는 싱크 붕괴로 분석됐고 코드 수정 전후를 자동으로 비교·채점해 새 스킬이 모든 테스트를 패스한 반면 기존 스킬은 실패한 사례가 보고됐습니다. *"그레이더는 항상 이제 실행이 됩니다."*

실무 팁: 긴 영상 처리처럼 리소스 많이 드는 테스트는 병렬로 한꺼번에 돌리면 IO/CPU 경쟁으로 지연되므로 순차 실행 권장. 워크스페이스 내부의 iteration 폴더, grading.json, feedback.json 등을 직접 열어 결과·피드백을 확인하고 수동 검토(리뷰·피드백 작성)를 거쳐 반복 개선하면 방향성 잃는 수정 실수를 줄일 수 있습니다.
