---
tags:
  - frontend
  - spec-driven
  - development
  - methodology
date: 2026-03-15
---

# 프론트엔드에서 Spec-Driven Development 적용 사례

조사 일자: 2026-03-15

## 핵심 요약

프론트엔드에서 완전한 spec-first는 어렵지만, **부분적 spec-driven**은 실제로 널리 사용된다. 시각적 요소보다는 동작, API, 상태 관리에 집중하는 것이 현실적이다.

## 왜 프론트엔드에서 Spec-First가 힘든가

### 텍스트와 시각의 근본적 불일치

| 영역 | Spec 표현 | 모호함 |
|------|----------|--------|
| 백엔드 API | "input X → output Y" | 거의 없음 |
| 비즈니스 로직 | "조건 A면 에러" | 거의 없음 |
| UI 동작 | "버튼 클릭 → 모달 오픈" | 적음 |
| 시각 디자인 | "자연스럽게 배치" | 매우 높음 |

스펙에 "오른쪽에 버튼"이라고 써도:
- 여백 (margin, padding)
- 정렬 (alignment)
- 크기 (size, scale)
- 반응형 동작 (responsive)
- 애니메이션 (transition)

등 텍스트로 표현 불가능한 차원이 너무 많다.

### 프론트엔드의 반복적 본질

```
보고 → 고치고 → 다시 보고 → 미세 조정 → 반복
```

이 사이클이 자연스러운 워크플로우인데, spec-first는 이걸 거스른다.

## 현실적 접근: Spec의 역할 재정의

### 1. Spec은 "동작"만 정의

**Spec으로 잘 정의되는 것:**
- "X를 클릭하면 Y가 열린다"
- "목록은 페이지네이션된다 (10개씩)"
- "폼 제출 시 validation 메시지를 표시한다"
- "에러 시 toast notification을 띄운다"

**Spec으로 정의하기 어려운 것:**
- "버튼이 적당한 크기여야 한다"
- "카드 배치가 깔끔해야 한다"
- "애니메이션이 부드러워야 한다"

### 2. 시각적 부분은 레퍼런스 기반

- 스크린샷
- 와이어프레임
- 기존 컴포넌트 참조
- 디자인 시스템

### 3. 구현 후 빠른 피드백 루프

```
spec → 초안 → 대화형 수정 → 완성
```

spec대로 한번에 완성하려 하지 말고, 대략 만들고 → 보고 → 직접 수정 지시

## 실제 적용 사례

### 1. Storybook + Component Story Format (CSF)

**접근:** 컴포넌트의 동작을 story로 문서화

```typescript
// Button.stories.tsx
export default {
  title: 'Button',
  component: Button,
  argTypes: {
    variant: {
      control: 'select',
      options: ['primary', 'secondary', 'danger'],
    },
    disabled: { control: 'boolean' },
  },
};

export const Primary = {
  args: {
    variant: 'primary',
    children: 'Click me',
  },
};

export const Disabled = {
  args: {
    variant: 'primary',
    disabled: true,
    children: 'Cannot click',
  },
};
```

**장점:**
- 컴포넌트 API를 명확히 정의
- 동작을 시각적으로 확인 가능
- 문서화와 구현이 동시에

**한계:**
- 여전히 시각적 디테일은 수동 조정

### 2. Design Tokens + CSS Variables

**접근:** 디자인 결정을 코드로 표현

```css
:root {
  --color-primary-500: #3b82f6;
  --spacing-4: 1rem;
  --radius-md: 0.375rem;
  --font-size-sm: 0.875rem;
}
```

```json
// tokens.json
{
  "color": {
    "primary": {
      "500": { "value": "#3b82f6" }
    }
  },
  "spacing": {
    "4": { "value": "1rem" }
  }
}
```

**장점:**
- 디자인 결정을 버전 관리
- 일관성 유지
- Figma ↔ Code 동기화 가능

**한계:**
- 토큰 값 자체는 여전히 "왜 이 값인가?"에 대한 답이 없음

### 3. Figma Dev Mode + Codegen

**접근:** 디자인 도구에서 직접 코드 생성

- Figma에서 컴포넌트 spec을 정의
- Dev Mode에서 CSS, React 코드 생성
- 디자인-코드 일치 보장

**장점:**
- 시각적 디자인이 곧 spec
- 수동 변환 오류 감소

**한계:**
- 복잡한 동작은 여전히 수동
- 생성된 코드 품질 이슈

### 4. Visual Regression Testing (Percy, Chromatic)

**접근:** 시각적 변경을 자동 감지

```
1. 기준 스냅샷 저장 (spec 역할)
2. 코드 변경 시 새 스냅샷 캡처
3. diff 자동 감지
4. 승인/거부로 새 기준 설정
```

**장점:**
- 의도치 않은 시각적 변경 방지
- 시각적 spec을 이미지로 관리

**한계:**
- "올바른" 디자인인지는 여전히 사람이 판단

### 5. E2E 테스트로 동작 Spec 정의 (Playwright, Cypress)

**접근:** 사용자 동작을 테스트로 문서화

```typescript
// playwright spec
test('장바구니에 상품 추가', async ({ page }) => {
  await page.goto('/products');
  await page.click('[data-testid="add-to-cart-1"]');
  await expect(page.locator('[data-testid="cart-count"]')).toHaveText('1');
  await page.click('[data-testid="cart-icon"]');
  await expect(page.locator('[data-testid="cart-item-1"]')).toBeVisible();
});
```

**장점:**
- 사용자 동작을 명확히 정의
- 회귀 방지

**한계:**
- 시각적 디테일은 테스트하지 않음

### 6. Accessibility Spec (WCAG)

**접근:** 접근성 요구사항을 명확한 기준으로 정의

- WCAG 2.1 AA 준수
- 키보드 네비게이션
- 스크린 리더 지원
- 색상 대비 (4.5:1 이상)

**장점:**
- 명확하고 측정 가능한 기준
- 자동화 도구로 검증 가능 (axe, Lighthouse)

### 7. State Machines (XState)

**접근:** 컴포넌트 상태를 유한 상태 머신으로 정의

```typescript
const toggleMachine = createMachine({
  initial: 'inactive',
  states: {
    inactive: {
      on: { TOGGLE: 'active' }
    },
    active: {
      on: { TOGGLE: 'inactive' }
    }
  }
});
```

**장점:**
- 상태 전이를 명확히 정의
- 불가능한 상태 방지
- 시각화 가능

## AI 시대의 새로운 가능성

### Spec → Visual Generation

최근 도구들:
- **v0.dev**: 텍스트 설명 → React 컴포넌트 생성
- **Galileo AI**: 텍스트 → Figma 디자인
- **Uizard**: 와이어프레임 → 고해상도 디자인

이들은 spec을 시각적 결과로 변환하는 새로운 패턴을 보여준다.

### 대화형 수정 워크플로우

```
텍스트 spec → AI 초안 생성 → 시각 확인 → 대화형 수정 → 완성
```

이게 유박사가 제안한 "spec → 초안 → 대화형 수정"과 정확히 일치한다.

## 결론

### 프론트엔드에서 Spec-Driven의 현실

| 부분 | Spec-Driven 가능성 | 권장 접근 |
|------|-------------------|----------|
| 컴포넌트 API | 높음 | TypeScript, Storybook |
| 상태 관리 | 높음 | XState, 상태 다이어그램 |
| 동작/인터랙션 | 중간 | E2E 테스트, 유저 스토리 |
| 접근성 | 높음 | WCAG, 자동화 도구 |
| 시각 디자인 | 낮음 | 레퍼런스 기반, 반복 수정 |
| 반응형 | 중간 | 브레이크포인트 정의 후 구현 |

### 현실적 권장사항

1. **동작은 spec으로** — 사용자 인터랙션, 상태 전이, API 계약
2. **시각은 레퍼런스로** — 스크린샷, 디자인 시스템, 기존 컴포넌트
3. **빠른 피드백 루프** — spec → 초안 → 대화형 수정
4. **AI 활용** — 텍스트 spec에서 초안 생성, 시각적 판단은 사람이

### 핵심 통찰

> UI는 "spec → 완성"이 아니라 "spec → 초안 → 대화형 수정"이 맞는 워크플로우다.

프론트엔드에서 spec-driven을 적용할 때는 **무엇을 spec으로 정의할지** 선택적으로 접근해야 한다.

---

## 참고 자료

- [Storybook - Component Story Format](https://storybook.js.org/docs/react/api/csf)
- [Design Tokens W3C Community Group](https://www.w3.org/community/design-tokens/)
- [XState - State Machines for UI](https://xstate.js.org/)
- [WCAG 2.1 Guidelines](https://www.w3.org/TR/WCAG21/)
- [Figma Dev Mode](https://www.figma.com/developers)
