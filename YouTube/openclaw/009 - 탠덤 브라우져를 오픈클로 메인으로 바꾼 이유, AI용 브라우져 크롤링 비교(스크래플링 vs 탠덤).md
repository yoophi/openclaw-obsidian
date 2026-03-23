---
title: "탠덤 브라우져를 오픈클로 메인으로 바꾼 이유, AI용 브라우져 크롤링 비교(스크래플링 vs 탠덤)"
source: "https://www.youtube.com/watch?v=6S4NXyoxPms"
original_url: "https://www.youtube.com/watch?v=6S4NXyoxPms"
youtube_id: "6S4NXyoxPms"
playlist: "📙 openclaw"
channel: "코난쌤 conanssam"
duration: "9:05"
publish_date: "2026-03-17T14:42:27-07:00"
playlist_index: 9
generated_by: "OpenClaw summarize skill"
generated_at: "2026-03-23 17:47:47 +0900"
---

# 탠덤 브라우져를 오픈클로 메인으로 바꾼 이유, AI용 브라우져 크롤링 비교(스크래플링 vs 탠덤)

## Video Info

- Original URL: https://www.youtube.com/watch?v=6S4NXyoxPms
- Channel: 코난쌤 conanssam
- Title: 탠덤 브라우져를 오픈클로 메인으로 바꾼 이유, AI용 브라우져 크롤링 비교(스크래플링 vs 탠덤)
- Published: 2026-03-17T14:42:27-07:00
- Duration: 9:05
- Playlist: 📙 openclaw
- Playlist Index: 9

## Description

[AIF 오픈클로 캠프]: https://aifrenz.liveklass.com/classes/291947
탠덤브라우져: https://github.com/hydro13/tandem-browser

[신간]선생님의 시간을 지켜주는 생성형AI 활용법:https://www.yes24.com/product/goods/181865567
[8282 업무자동화]: https://www.yes24.com/Product/Goods/143533211
[일잘러의 AI글쓰기]: https://product.kyobobook.co.kr/detail/S000214576577
[초등기적의 AI공부법]:  https://product.kyobobook.co.kr/detail/S000212798500
[오픈채팅방]: https://open.kakao.com/o/gXxFpUnh

#openclaw #crawling #web #agent

## Summary

## 탠덤 브라우저를 오픈클로 메인으로 바꾼 이유·스크래플링 비교 요약

영상은 새로 나온 탠덤(Tandem) 브라우저를 설치해 오픈클로(OpenClo)와 연동해 보고, 기존 스크래플링(스크래플링) 방식과 실사용 크롤링 성능을 비교한 실습 중심 데모입니다. 발표자는 탠덤을 “*AI가 쓰는 브라우저*”로 소개하며 설치와 기본 기능(스텔스 모드, 스크립트 카드, 네트워크 실드, 헤드리스 제어, 윙맨 패널 통한 오픈클로 연동 등)을 보여줍니다. 실제로 네이버 부동산에서 아파트 매물 크롤링을 실행했고, 탠덤은 API 기반 세션 제어로 데이터를 긁어와 요약·정리 파일을 만들어 주었지만 실행 중 불안정(충돌)과 속도 지연이 관찰됐습니다.

핵심 비교 결과는 다음과 같습니다. 스크래플링 쪽은 패치(fetch) 기능을 병행해 빠르게 많은 페이지를 긁어오는 반면, 탠덤은 브라우저 세션을 직접 제어하며 스크롤링으로 정보를 확인하므로 상대적으로 느립니다. 탠덤이 생성한 결과는 요약이 잘 되어 있고 최저가·최고가 등도 정리했으나 항목 수가 제한적(예: 일부 작업에서 60개 정도까지만 확보)이고, 가격 같은 필드에서 일부 부정확성이 발견됐습니다. 발표자는 최종적으로 *"텐덤 브라우저가 괜찮은 결과를 보여줬다"*며 가능성을 인정하되 현재는 안정성과 속도·정확성 보완이 필요하다고 정리합니다.
