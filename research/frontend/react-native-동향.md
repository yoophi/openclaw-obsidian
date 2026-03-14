---
tags:
  - react-native
  - 프론트엔드
  - 모바일
  - new-architecture
  - hermes
date: 2026-03-12
---

# React Native 최신 동향

조사 일자: 2026-03-12
출처: React Native 공식 블로그, GitHub Releases, Expo 블로그

---

## 1. New Architecture 완전 전환 (0.82~)

### React Native 0.82 "A New Era" (2025년 10월 8일)

**의미:** React Native 역사상 가장 중요한 전환점. Legacy Architecture가 완전히 제거되고 New Architecture만 지원.

**주요 변경사항:**
- `newArchEnabled=false` 설정이 무시됨 (Android)
- `RCT_NEW_ARCH_ENABLED=0` 무시됨 (iOS)
- 무조건 New Architecture로 실행

**마이그레이션 가이드:**
1. React Native 0.81 또는 Expo SDK 54로 먼저 업그레이드
2. New Architecture 활성화 후 테스트
3. 0.82로 안전하게 업그레이드

**Interop Layers:**
- 당분간 유지됨
- 3rd party 라이브러리 호환성 보장
- 향후 제거 일정은 별도 공지 예정

**비판적 관점:**
- 강제 마이그레이션은 생태계에 단기적 혼란 초래 가능성
- 하지만 장기적으로는 코드베이스 정리와 번들 크기 감소 효과
- 3rd party 라이브러리 호환성 문제는 여전히 해결 과제

---

## 2. Hermes V1 - 성능 혁신

### React Native 0.84 (2026년 2월 11일)

**Hermes V1 기본 탑재**

### 성능 개선 (Expensify 앱 기준)

| 메트릭 | Android (저사양) | iOS |
|--------|------------------|-----|
| Bundle Load Time | 3.2% 향상 | 9% 향상 |
| Total TTI | 7.6% 향상 | 2.5% 향상 |
| Content TTI | 7.2% 향상 | 7.5% 향상 |

**참고사항:**
- JS-to-native 컴파일 (Static Hermes) 미포함
- JIT 컴파일도 아직 미포함
- 향후 추가 예정

**비판적 관점:**
- 성능 향상은 긍정적이나, 수치는 앱 구조에 따라 편차 클 수 있음
- 실험 단계에서 소스 빌드 필요 → 진입 장벽 존재
- Static Hermes/JIT은 여전히 연구 단계

---

## 3. React 19.x 지원

### React Native 0.83 (2025년 12월 10일)
- React 19.2 지원
- Breaking changes 없음

### React Native 0.82
- React 19.1.1 지원
- Owner stacks 완전 지원 (@babel/plugin-transform-function-name 제약 해제)
- `useDeferredValue`, `startTransition` + Suspense boundary 동작 개선

**DOM Node APIs (0.82~):**
```javascript
const ref = useRef();

useEffect(() => {
  const element = ref.current;
  
  // 새로운 DOM-like 메서드
  element.parentNode;
  element.parentElement;
  element.childNodes;
  element.children;
  element.getBoundingClientRect();
  element.ownerDocument.getElementById('some-view');
  
  // 기존 메서드 여전히 사용 가능
  element.measure((x, y, width, height, pageX, pageY) => { /* ... */ });
}, []);
```

**의의:**
- React Native와 React Web 간 API 일관성 향상
- 크로스 플랫폼 코드 재사용성 증대

---

## 4. Meta Quest 지원 - VR 플랫폼 확장

### React Native on Meta Quest (2026년 2월 24일)

**발표:** React Conf 2025

**기술적 배경:**
- Meta Horizon OS = Android 기반
- 기존 Android 툴링, 빌드 시스템, 디버깅 워크플로우 거의 그대로 사용 가능

**개발 방식:**

1. **Expo Go 사용 (빠른 프로토타이핑)**
   - Meta Horizon Store에서 Expo Go 설치
   - QR 코드 스캔으로 바로 실행
   - Hot reloading 지원

2. **Development Builds (네이티브 모듈 필요 시)**
   - expo-horizon-core 플러그인 사용
   - Meta Quest 전용 빌드 flavor 설정

**설정 예시:**
```json
{
  "expo": {
    "plugins": [
      [
        "expo-horizon-core",
        {
          "horizonAppId": "your-horizon-app-id",
          "defaultHeight": "640dp",
          "defaultWidth": "1024dp",
          "supportedDevices": "quest2|quest3|quest3s",
          "disableVrHeadtracking": false,
          "allowBackup": false
        }
      ]
    ]
  }
}
```

**제약사항:**
- Google Play Services 미지원 (AOSP 기반)
- 셀룰러 기능, GPS 등 모바일 전용 하드웨어 미지원
- 일부 권한 제한됨

**라이브러리 호환성 가이드라인:**
- 표준 React Native/Android API만 사용 → 대부분 작동
- 터치 전용, 모바일 하드웨어, GMS 의존 → 수정 필요
- 제한된 권한/기능 의존 → 미지원

**플랫폼 감지:**
```javascript
import ExpoHorizon from 'expo-horizon-core';

if (ExpoHorizon.isHorizonDevice) {
  console.log('Meta Horizon OS에서 실행 중');
}

if (ExpoHorizon.isHorizonBuild) {
  console.log('Horizon 빌드 변환');
}
```

**비판적 관점:**
- VR 플랫폼 확장은 전략적으로 유의미
- 하지만 Meta 생태계 종속성 우려
- 실제 사용 사례는 모바일에 비해 제한적일 것
- UX 패러다임이 완전히 다름 → 단순 포팅은 부적절

---

## 5. Expo Agent (2026년 3월 10일)

**개요:** AI를 활용해 네이티브 앱 빌드

**특징:**
- 앱을 설명하면 Expo Agent가 빌드
- iOS, Android, Web 모두 지원
- 실제 배포 가능한 앱 생성
- 현재 베타 (대기열 등록 필요)

**비판적 관점:**
- AI 기반 코드 생성의 품질 검증 필요
- 복잡한 앱에서는 한계가 있을 것
- 프로토타이핑에는 유용할 수 있으나, 프로덕션용 코드는 검토 필수

---

## 6. 최신 버전 현황

| 버전 | 릴리즈 날짜 | 주요 특징 |
|------|------------|----------|
| 0.85.0-rc.0 | 2026-03-04 | Pre-release |
| 0.84 | 2026-02-11 | Hermes V1 기본 탑재 |
| 0.83.3 | 2026-03-05 | 최신 stable |
| 0.83 | 2025-12-10 | React 19.2, DevTools 개선 |
| 0.82 | 2025-10-08 | New Architecture Only |

---

## 7. 커뮤니티 동향

### React Native Core Contributor Summit 2024 (2025년 2월 3일 회고)
- Callstack HQ, Wrocław에서 개최
- React Universe Conf 전 2일간 진행
- 핵심 기여자들과 방향성 논의

### 생태계 성숙도
- New Architecture 전환 완료로 프레임워크 안정화
- 다중 플랫폼 지원 (iOS, Android, Web, macOS, Windows, VR)
- Expo와의 협업 강화

---

## 8. 종합 평가

### 긍정적 측면
1. **아키텍처 안정화** - New Architecture 전환으로 기술 부채 해소
2. **성능 개선** - Hermes V1으로 실질적 향상
3. **플랫폼 확장** - VR 지원으로 새로운 영역 개척
4. **React 생태계 통합** - React 19.x 지원으로 일관성 확보

### 우려사항
1. **강제 마이그레이션** - 생태계 혼란 가능성
2. **라이브러리 호환성** - 여전히 일부 라이브러리 New Architecture 미지원
3. **플랫폼 파편화** - 너무 많은 플랫폼 지원 → 유지보수 부담
4. **AI 도구 검증** - Expo Agent 등 AI 기반 도구의 실제 유용성 미검증

### 권장사항
1. 새 프로젝트: React Native 0.84+ 사용
2. 기존 프로젝트: 0.81에서 New Architecture 테스트 후 0.84로 업그레이드
3. 3rd party 라이브러리 의존도가 높은 경우: 호환성 확인 후 진행
4. VR 타겟: Expo Go로 프로토타이핑 후 feasibility 검토

---

_작성자: 행크_
_조사 방법: 공식 소스 직접 확인 (웹 검색 API 미설정)_
