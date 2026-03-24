---
youtube_id: "5WIb0RZ_dqY"
title: "OpenClaw Multi-Agent + Ollama: 10X Productivity with SubAgent Team"
channel: "Devs Kingdom"
publish_date: "2026-02-24T18:51:13-08:00"
original_url: "https://www.youtube.com/watch?v=5WIb0RZ_dqY"
thumbnail: "https://i.ytimg.com/vi/5WIb0RZ_dqY/maxresdefault.jpg"
playlist_url: "https://www.youtube.com/playlist?list=PLHPyjvmaj4rGje-pPUojFDK5cF8Ql9OBo"
tags:
  - youtube-summary
  - openclaw
---

# OpenClaw Multi-Agent + Ollama: 10X Productivity with SubAgent Team

## 영상 정보
- 채널: Devs Kingdom
- 게시일: 2026-02-24T18:51:13-08:00
- 원본 URL: https://www.youtube.com/watch?v=5WIb0RZ_dqY
- 썸네일: https://i.ytimg.com/vi/5WIb0RZ_dqY/maxresdefault.jpg

## 한글 요약
## OpenClaw 멀티에이전트 + Ollama: 서브에이전트 팀으로 생산성 높이기

이 영상은 OpenClaw의 **서브에이전트 구조가 무엇이고 어떻게 쓰는지**를 설명합니다. 서브에이전트는 같은 세션 안에서 기존 에이전트가 백그라운드로 생성하는 하위 실행 단위이며, 역할상 부모·자식 관계처럼 보이지만 본질적으로는 호출 순서에 따라 관계가 정해지는 에이전트입니다. 각 서브에이전트 실행에는 별도 세션 ID가 붙고, 작업이 끝나면 다시 요청을 보낸 채널로 결과를 돌려준다는 점이 핵심입니다. 즉 OpenClaw는 하나의 에이전트가 모든 일을 직접 처리하기보다, 필요한 역할을 나눠 여러 에이전트가 병렬로 일하게 만들 수 있습니다.

영상은 설정 방법도 구체적으로 다룹니다. 워크스페이스에 에이전트를 등록하고, 기본 오케스트레이터 에이전트를 상단에 두며, 각 에이전트 설정에 어떤 서브에이전트를 생성할 수 있는지 지정합니다. 또한 `openclaw.json`에서 서브에이전트 최대 생성 깊이를 설정하고, soul/playbook/도구/워크플로우 폴더를 통해 각 에이전트 역할을 세밀하게 조정하는 방식을 설명합니다. 전체적으로 이 영상은 OpenClaw를 단일 에이전트 도구가 아니라, **여러 역할이 협업하는 팀형 자동화 시스템**으로 확장하는 방법을 보여줍니다.
