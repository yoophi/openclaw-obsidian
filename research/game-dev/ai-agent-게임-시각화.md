---
tags:
  - ai-agent
  - 시각화
  - 게임개발
  - pixijs
  - phaser
date: 2026-03-12
---

# AI Agent 게임 시각화

조사 일자: 2026-03-12
  - pixijs
  - phaser
date: 2026-03-12
---

조사 일자: 2026-03-12
프로젝트: yoophi/pixel-office
출처: GitHub, 공식 문서

---

## 1. 핵심 요약

**유사 프로젝트 발견:**
- **mivirize/claude-office-visualizer** (2일 전 업데이트)
  - "Game-style visualizer for Claude Code AI agent activity"
  - pixel-office와 거의 동일한 컨셉
  - JavaScript 기반

**기술 스택 주요 옵션:**
- **Phaser**: 가장 성숙하고 인기 있는 2D 게임 엔진
- **PixiJS**: 고성능 WebGL 렌더러, React 통합 지원
- **Excalibur.js**: TypeScript-first, 크로스 플랫폼
- **React + Canvas/WebGL**: 직접 구현

---

## 2. 상세 분석

### 2.1 유사 프로젝트

#### mivirize/claude-office-visualizer

**특징:**
- Claude Code AI agent 활동을 게임 스타일로 시각화
- 최근 활발한 개발 (2일 전 업데이트)
- JavaScript 사용

**비교:**
- pixel-office와 컨셉 거의 동일
- 독립적으로 개발된 것으로 보임
- 기술 스택 상세 정보는 README에서 확인 필요

**비판적 관점:**
- 유사 프로젝트가 존재한다는 건 검증된 아이디어라는 의미
- 하지만 차별화 전략 필요
- 어떤 기능을 제공하는지, 어떤 점이 부족한지 분석 필요

---

### 2.2 웹 기반 2D 게임 기술 스택

#### Tier 1: 프로덕션급 엔진

**1. Phaser**

**특징:**
- HTML5 2D 게임 엔진
- 활발한 개발 (Phaser 4 최신)
- GPT 5.4에서 Tactical RPG 제작에 사용됨 (2026년 3월)
- 방대한 커뮤니티와 생태계
- PixUI: Pixel Art 전용 UI 라이브러리 존재

**장점:**
- 완전한 게임 프레임워크
- 물리 엔진, 오디오, 입력 관리 내장
- 방대한 튜토리얼과 예제
- 활발한 커뮤니티 지원

**단점:**
- React와의 통합이 자연스럽지 않음
- 번들 크기가 큼
- 게임 엔진 패러다임 학습 필요

**적합성:**
- 완전한 게임 메커니즘 필요 시 최적
- 복잡한 상호작용, 애니메이션, 물리 시뮬레이션 필요 시

**참고:**
- https://phaser.io/
- https://phaser.io/news/2026/02/phaser-pixel-art-ui-library

---

**2. PixiJS**

**특징:**
- "가장 빠르고 유연한 2D WebGL 렌더러"
- v8.x 최신 버전
- React 통합: @pixi/react
- 렌더링 특화, 게임 로직은 직접 구현 필요

**장점:**
- 최고 성능의 WebGL 렌더링
- React와 자연스러운 통합
- 유연하고 확장 가능
- 렌더링에만 집중 → 필요한 것만 선택 가능

**단점:**
- 게임 로직 직접 구현 필요
- 물리 엔진, 입력 관리 별도 라이브러리 필요
- Phaser에 비해 학습 자료 적음

**적합성:**
- React 기반 프로젝트와 가장 잘 맞음
- 렌더링 성능이 중요한 경우
- 기존 React 생태계 활용 가능

**참고:**
- https://pixijs.com/
- https://github.com/pixijs/pixi-react

---

#### Tier 2: 경량/특화 엔진

**3. Excalibur.js**

**특징:**
- TypeScript-first 게임 엔진
- 크로스 플랫폼 지원
- BSD 2-Clause 라이선스

**장점:**
- TypeScript 네이티브
- 문서화가 잘 되어 있음
- 크로스 플랫폼 (Cordova, Electron 등)

**단점:**
- 커뮤니티 규모가 Phaser/PixiJS보다 작음
- 생태계가 덜 발달

**적합성:**
- TypeScript 프로젝트에 적합
- 중간 규모의 게임

**참고:**
- https://excaliburjs.com/

---

**4. Kontra.js**

**특징:**
- js13kGames 게임 잼용으로 개발
- 초경량, 모듈화된 마이크로 라이브러리
- ES modules 지원

**장점:**
- 매우 가벼움
- 모듈화 → 필요한 것만 사용
- 빠르고 메모리 효율적

**단점:**
- 기능이 제한적
- 대규모 게임에는 부적합

**적합성:**
- 프로토타이핑
- 파일 크기 제한이 있는 경우
- 간단한 게임 메커니즘

**참고:**
- https://straker.github.io/kontra/

---

**5. react-game-kit**

**특징:**
- Formidable Labs 제작
- React & React Native용 게임 컴포넌트 라이브러리
- Matter.js 물리 엔진 사용

**장점:**
- React/React Native 네이티브
- 컴포넌트 기반 아키텍처
- 물리 엔진 내장

**단점:**
- 유지보수 상태 불확실
- 기능이 제한적
- 커뮤니티가 작음

**적합성:**
- React Native도 지원해야 하는 경우
- React 패러다임 유지

**참고:**
- https://github.com/FormidableLabs/react-game-kit

---

**6. Kaboom.js** ❌

**상태:** 더 이상 유지보수되지 않음 (2026년 3월 확인)

**비권장 사유:**
- 공식적으로 개발 중단
- 보안 업데이트 미제공

---

### 2.3 기술 스택 비교

| 기술 | 렌더링 | 게임 로직 | React 통합 | 커뮤니티 | 학습 곡선 | 적합성 |
|------|--------|----------|-----------|---------|----------|--------|
| Phaser | Canvas/WebGL | ✓ 포함 | ✗ 제한적 | 매우 큼 | 중간 | 게임 특화 |
| PixiJS | WebGL | ✗ 별도 | ✓ @pixi/react | 큼 | 낮음 | React 친화적 |
| Excalibur | Canvas/WebGL | ✓ 포함 | △ 가능 | 중간 | 중간 | TS 프로젝트 |
| Kontra | Canvas | △ 기본 | ✗ | 작음 | 낮음 | 프로토타입 |
| react-game-kit | Canvas | ✓ 기본 | ✓ 네이티브 | 작음 | 낮음 | React/RN |

---

### 2.4 pixel-office 기술 스택 분석

**현재:**
- React + Vite + TypeScript

**추천 옵션:**

**Option A: PixiJS + React**
- 장점: 기존 React 생태계 활용, 성능 우수
- 단점: 게임 로직 직접 구현
- 적합: agent 상태 시각화에 집중, 복잡한 게임 메커니즘 불필요

**Option B: Phaser + React**
- 장점: 완전한 게임 엔진, 물리/애니메이션 내장
- 단점: React와 통합 복잡, 학습 곡선
- 적합: 복잡한 게임 메커니즘, 캐릭터 움직임, 충돌 감지 필요

**Option C: Canvas API 직접 구현**
- 장점: 완전한 제어, 의존성 최소화
- 단점: 모든 것을 직접 구현
- 적합: 단순한 시각화, 높은 커스터마이징 필요

---

## 3. 장단점

### 3.1 PixiJS + React (추천)

**장점:**
1. React 생태계와 자연스러운 통합
2. 높은 렌더링 성능 (WebGL)
3. 유연한 구조
4. 활발한 개발 (v8.x)
5. TypeScript 지원

**단점:**
1. 게임 로직 직접 구현 필요
2. 물리 엔진 별도 필요시 추가 설정
3. Phaser에 비해 게임 관련 기능 적음

---

### 3.2 Phaser

**장점:**
1. 완전한 게임 프레임워크
2. 물리 엔진, 오디오, 애니메이션 내장
3. 방대한 커뮤니티와 자료
4. Pixel Art UI 라이브러리 존재

**단점:**
1. React와 통합이 어색
2. 게임 엔진 패러다임 학습 필요
3. 번들 크기가 큼

---

### 3.3 Canvas 직접 구현

**장점:**
1. 완전한 제어
2. 의존성 최소화
3. 가벼움

**단점:**
1. 모든 것을 직접 구현
2. 성능 최적화 복잡
3. 유지보수 부담

---

## 4. 결론

### 4.1 추천 기술 스택

**1차 추천: PixiJS + React + TypeScript**

**이유:**
- pixel-office가 이미 React + Vite + TypeScript 기반
- @pixi/react로 자연스러운 통합
- agent 활동 시각화는 게임보다는 데이터 시각화에 가까움
- WebGL 성능으로 부드러운 애니메이션 가능
- 필요한 만큼만 사용하는 유연성

**구조:**
```
React (상태 관리, UI)
  └─ PixiJS (렔더링, 애니메이션)
      └─ Agent entities
      └─ Office environment
```

---

**2차 옵션: Phaser (독립적 게임)**

**적합한 경우:**
- 완전한 게임 메커니즘 필요
- 캐릭터 움직임, 충돌, 물리 시뮬레이션 중요
- React와 분리된 독립적 게임 앱

---

### 4.2 아키텍처 제안

**컴포넌트 구조:**
```
App
├─ AgentStateManager (React Context)
│   └─ Agent 상태 수신 및 관리
├─ GameCanvas (PixiJS Stage)
│   ├─ OfficeMap (배경, 책상, 의자)
│   ├─ AgentSprites (agent 캐릭터들)
│   └─ UI Overlay (React)
└─ ControlPanel (React)
    ├─ Agent 목록
    ├─ 필터링
    └─ 설정
```

**데이터 흐름:**
```
AI Agent 활동
  → 이벤트 스트림
  → AgentStateManager
  → React state update
  → PixiJS re-render
```

---

### 4.3 차별화 전략

**vs claude-office-visualizer:**

1. **다중 Agent 지원**
   - 여러 agent 동시 시각화
   - agent 간 상호작용 표현

2. **실시간 협업 시각화**
   - agent들이 파일, 코드 블록을 주고받는 것 시각화
   - 작업 큐, 우선순위 표현

3. **커스터마이징 가능한 오피스**
   - 사용자가 방 배치 변경
   - agent별 개성 부여

4. **히스토리 재생**
   - 과거 작업 세션 재생
   - 타임라인 탐색

5. **성능 메트릭**
   - 각 agent의 작업량, 속도 시각화
   - 병목 구간 식별

---

### 4.4 구현 우선순위

**Phase 1: MVP**
1. PixiJS + React 통합
2. 단일 agent 시각화
3. 기본 오피스 배경
4. agent 움직임 애니메이션

**Phase 2: 확장**
1. 다중 agent 지원
2. agent 간 상호작용 시각화
3. 실시간 이벤트 스트림 연동

**Phase 3: 고급 기능**
1. 히스토리 재생
2. 커스터마이징
3. 성능 메트릭

---

## 5. 참고 자료

### 공식 문서
- PixiJS: https://pixijs.com/
- Phaser: https://phaser.io/
- Excalibur: https://excaliburjs.com/
- Kontra: https://straker.github.io/kontra/

### GitHub
- 유사 프로젝트: https://github.com/mivirize/claude-office-visualizer
- pixel-office: https://github.com/yoophi/pixel-office
- @pixi/react: https://github.com/pixijs/pixi-react
- react-game-kit: https://github.com/FormidableLabs/react-game-kit

### 튜토리얼
- Phaser Pixel Art UI: https://phaser.io/news/2026/02/phaser-pixel-art-ui-library
- PixiJS React 통합: https://pixijs.com/8.x/guides/getting-started/intro

---

_작성자: Hank McCoy_
_조사 방법: 공식 문서 및 GitHub 레포지토리 직접 확인_
