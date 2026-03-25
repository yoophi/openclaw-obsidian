---
youtube_id: "LsHgkoxLpMU"
title: "Claude Code의 '/loop' 기능은 게임 체인저입니다"
channel: "Tech Bridge"
publish_date: "2026-03-07T22:30:17-08:00"
original_url: "https://www.youtube.com/watch?v=LsHgkoxLpMU"
thumbnail: "https://i.ytimg.com/vi/LsHgkoxLpMU/maxresdefault.jpg"
playlist_url: "https://www.youtube.com/playlist?list=PLHPyjvmaj4rHdn54mY-sKzojix4ua6E9N"
tags:
  - youtube-summary
  - channel/tech-bridge
  - date/2026-03-07
  - topic/general
---

# Claude Code의 "/loop" 기능은 게임 체인저입니다

## 영상 정보
- 채널: Tech Bridge
- 게시일: 2026-03-07T22:30:17-08:00
- 원본 URL: https://www.youtube.com/watch?v=LsHgkoxLpMU
![Claude Code의 '/loop' 기능은 게임 체인저입니다](https://i.ytimg.com/vi/LsHgkoxLpMU/maxresdefault.jpg)

## 한글 요약
Claude Code의 루프(Loop) 기능 요약
Claude Code의 루프 기능은 같은 세션 안에서 반복 작업을 자연어로 예약·실행하는 신규 도구입니다. 간격(예: 5분·10분·매시간 등)을 지정하면 클론(크론) 작업을 만들어 주기적으로 스킬이나 프롬프트를 보냅니다. *첫 번째 큰 제한 사항은 3일 루프 만료입니다.* 루프는 최대 3일 동안만 유지되고, 자동으로 삭제되며 터미널/앱이 열린 세션에서만 동작합니다.

핵심 제약과 운영 방식은 다음과 같습니다. 루프는 세션 단위로 관리되어 다른 세션의 작업은 보이지 않고, 세션을 닫으면 해당 크론도 종료됩니다( *세션을 닫으면 그 크론도 자동으로 종료된다는 것입니다.* ). 실행 간격이 짧으면 토큰이 누적되어 컨텍스트가 빠르게 커질 수 있고, 루프에는 결석(캐치업) 기능이 없어 데스크톱 예약 작업의 지속성·캐치업 기능과는 차별화됩니다. 취소는 크란 딜리트 명령이나 터미널 닫기로 가능하며, 환경 변수로 스케줄링을 비활성화할 수 있습니다. 실사용 예: 5분 간격 이메일 확인, 3일 스프린트 상태 체크, 로그/테스트 모니터링 등 즉시 반복 관찰이 필요한 단기 자동화에 적합합니다.
