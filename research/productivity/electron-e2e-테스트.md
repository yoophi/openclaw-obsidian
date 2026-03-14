---
tags:
  - electron
  - e2e-테스트
  - playwright
  - webdriverio
  - 테스트자동화
date: 2026-03-14
---

# Electron 앱 E2E 테스트 적용 가이드

조사 일자: 2026-03-14
목적: Electron 기반 애플리케이션의 E2E 테스트 도구 및 방법론 조사
출처: Playwright docs, WebdriverIO docs, Electron 공식 문서

---

## 1. 핵심 요약

**Electron E2E 테스트**란:
- Electron 데스크톱 앱을 실제 사용자 관점에서 테스트
- Renderer 프로세스 (웹) + Main 프로세스 (Node.js) 모두 검증
- Cross-platform (Windows, macOS, Linux) 테스트 가능

**주요 도구 3가지:**
1. **Playwright** — Experimental, 현대적, 빠름
2. **WebdriverIO** — Mature, 풍부한 기능, Chromedriver 기반
3. **Spectron** — Deprecated (2022년 중단), 사용 비권장

**추천 스택:**
- 신규 프로젝트 → **Playwright**
- 기존 WebdriverIO 사용 중 → **WebdriverIO Electron Service**
- Legacy → Spectron 마이그레이션 필요

---

## 2. 상세 분석

### 2.1 Playwright + Electron

**개요:**
- Microsoft에서 개발한 현대적 브라우저 자동화 도구
- v1.9부터 Electron 지원 (Experimental)
- Chromium 기반 Electron 앱 테스트 가능

**지원 버전:**
- Electron v12.2.0+
- Electron v13.4.0+
- Electron v14+

**장점:**
1. **빠른 실행** — 병렬 실행, auto-waiting
2. **강력한 Selector** — text, role, test-id, CSS
3. **Trace Viewer** — 실패 시 전체 컨텍스트 기록
4. **Codegen** — 브라우저 조작 → 코드 자동 생성
5. **TypeScript 네이티브** — 타입 안전

**단점:**
1. **Experimental** — 아직 안정화 단계
2. **Main 프로세스 접근 제한** — Renderer 중심
3. **Native dialog 제한** — 시스템 다이얼로그 처리 어려움

---

### 2.2 기본 사용법

**설치:**
```bash
npm install --save-dev @playwright/test electron
```

**테스트 코드:**
```typescript
import { _electron as electron } from '@playwright/test';
import { test, expect } from '@playwright/test';

test('Electron app launches and shows title', async () => {
  // Electron 앱 실행
  const electronApp = await electron.launch({
    args: ['.', '--no-sandbox'], // main.js 또는 .
  });

  // 첫 번째 윈도우 가져오기
  const window = await electronApp.firstWindow();

  // 제목 확인
  const title = await window.title();
  expect(title).toContain('My App');

  // 스크린샷
  await window.screenshot({ path: 'screenshot.png' });

  // 콘솔 로그 캡처
  window.on('console', console.log);

  // 버튼 클릭
  await window.click('text=Submit');

  // 텍스트 확인
  await expect(window.locator('.status')).toHaveText('Success');

  // 앱 종료
  await electronApp.close();
});
```

---

### 2.3 Main 프로세스 접근

**evaluate() 사용:**
```typescript
test('Access main process', async () => {
  const electronApp = await electron.launch({ args: ['.'] });

  // Main 프로세스에서 코드 실행
  const appPath = await electronApp.evaluate(async ({ app }) => {
    // 이 코드는 Main 프로세스에서 실행됨
    return app.getAppPath();
  });

  console.log('App path:', appPath);

  // Electron API 직접 사용
  const version = await electronApp.evaluate(({ app }) => {
    return app.getVersion();
  });

  expect(version).toBe('1.0.0');

  await electronApp.close();
});
```

---

### 2.4 Playwright Config

**playwright.config.ts:**
```typescript
import { defineConfig } from '@playwright/test';

export default defineConfig({
  testDir: './tests',
  fullyParallel: true,
  forbidOnly: !!process.env.CI,
  retries: process.env.CI ? 2 : 0,
  workers: process.env.CI ? 1 : undefined,
  reporter: 'html',
  use: {
    trace: 'on-first-retry',
    screenshot: 'only-on-failure',
  },
  
  // Electron 특화 설정
  projects: [
    {
      name: 'electron',
      use: {
        // Electron 앱 경로
        launchOptions: {
          args: ['.'],
        },
      },
    },
  ],
});
```

---

### 2.5 WebdriverIO + Electron

**개요:**
- Mature한 E2E 테스트 프레임워크
- `wdio-electron-service` 제공
- Chromedriver 기반

**장점:**
1. **자동 Chromedriver 설정** — 버전 매칭 자동화
2. **자동 경로 탐지** — Electron Forge/Builder 지원
3. **Electron API 접근** — Main 프로세스 직접 호출
4. **Mocking 지원** — Vitest-like API

**단점:**
1. **느린 실행** — Playwright보다 느림
2. **복잡한 설정** — WebdriverIO 설정 필요
3. **큰 번들** — 의존성 많음

---

### 2.6 WebdriverIO 설치 및 설정

**설치:**
```bash
npm create wdio@latest ./
# 또는
npm install --save-dev wdio-electron-service
```

**wdio.conf.ts:**
```typescript
export const config: WebdriverIO.Config = {
  runner: 'local',
  
  specs: ['./tests/**/*.spec.ts'],
  
  capabilities: [{
    browserName: 'electron',
    'wdio:electronServiceOptions': {
      appEntryPoint: './dist/main.js',
      appArgs: ['--dev-tools'],
    },
  }],
  
  services: [
    ['electron', {
      appEntryPoint: './dist/main.js',
      appArgs: [],
    }],
  ],
  
  framework: 'mocha',
  reporters: ['spec'],
  
  mochaOpts: {
    ui: 'bdd',
    timeout: 60000,
  },
};
```

---

### 2.7 WebdriverIO 테스트 코드

```typescript
describe('My Electron App', () => {
  it('should launch and show title', async () => {
    // 윈도우 가져오기
    const window = await browser.getWindowHandle();
    
    // 타이틀 확인
    const title = await browser.getTitle();
    expect(title).toContain('My App');
  });

  it('should click button', async () => {
    // 버튼 클릭
    const button = await $('button=Submit');
    await button.click();

    // 결과 확인
    const status = await $('.status');
    await expect(status).toHaveText('Success');
  });

  it('should access Electron APIs', async () => {
    // Electron API 직접 호출
    const version = await browser.electron.app('getVersion');
    expect(version).toBe('1.0.0');

    // IPC 호출
    const result = await browser.electron.invoke('my-channel', 'arg1', 'arg2');
    expect(result).toBe('expected');
  });

  it('should mock Electron API', async () => {
    // Dialog API mock
    await browser.electron.mock('dialog', 'showOpenDialog').mockResolvedValue({
      filePaths: ['/path/to/file.txt'],
      canceled: false,
    });

    // 버튼 클릭 → mock된 dialog 사용
    await $('button=Open File').click();

    // 결과 확인
    const filePath = await $('.file-path');
    await expect(filePath).toHaveText('/path/to/file.txt');
  });
});
```

---

### 2.8 Spectron (Deprecated)

**상태:** ❌ 더 이상 사용하지 않음

**Deprecation 사유:**
- 2022년 2월부터 개발 중단
- Electron v20+ 미지원
- 보안 업데이트 없음

**마이그레이션 필요:**
- Spectron → Playwright 또는 WebdriverIO

---

## 3. 도구 비교

### 3.1 기능 비교

| 기능 | Playwright | WebdriverIO | Spectron |
|------|------------|-------------|----------|
| **상태** | Experimental | Stable | ❌ Deprecated |
| **실행 속도** | ⚡ 빠름 | 🐢 느림 | 🐢 느림 |
| **Main 프로세스 접근** | ✓ evaluate() | ✓ 직접 호출 | ✓ 제한적 |
| **Auto-waiting** | ✓ | ✓ | ✗ |
| **Trace Viewer** | ✓ | ✗ | ✗ |
| **Codegen** | ✓ | ✗ | ✗ |
| **Mocking** | △ 제한적 | ✓ 강력 | ✗ |
| **Cross-platform** | ✓ | ✓ | ✓ |
| **TypeScript** | ✓ 네이티브 | ✓ | △ |
| **커뮤니티** | 🌟 활성 | 🌟 활성 | ❌ 없음 |

---

### 3.2 성능 비교

| 항목 | Playwright | WebdriverIO |
|------|------------|-------------|
| **테스트 실행 시간** | 1x (기준) | 2-3x |
| **Setup 시간** | 빠름 | 느림 |
| **메모리 사용** | 적음 | 많음 |
| **병렬 실행** | ✓ 효율적 | △ |

---

## 4. 구현 가이드

### 4.1 Playwright 프로젝트 설정

**Step 1: 프로젝트 생성**
```bash
mkdir my-electron-app-tests
cd my-electron-app-tests
npm init -y
```

**Step 2: 의존성 설치**
```bash
npm install --save-dev @playwright/test electron
npx playwright install
```

**Step 3: 폴더 구조**
```
my-electron-app-tests/
├── playwright.config.ts
├── package.json
├── tests/
│   ├── app.spec.ts
│   ├── login.spec.ts
│   └── features/
│       ├── export.spec.ts
│       └── settings.spec.ts
└── test-results/
```

**Step 4: 첫 테스트 작성**
```typescript
// tests/app.spec.ts
import { _electron as electron } from '@playwright/test';
import { test, expect } from '@playwright/test';

test.describe('My Electron App', () => {
  let electronApp;
  let window;

  test.beforeAll(async () => {
    electronApp = await electron.launch({
      args: ['../my-electron-app/.'],  // Electron 앱 경로
    });
    window = await electronApp.firstWindow();
  });

  test.afterAll(async () => {
    await electronApp.close();
  });

  test('should launch', async () => {
    const title = await window.title();
    expect(title).toBeTruthy();
  });

  test('should have correct version', async () => {
    const version = await electronApp.evaluate(({ app }) => app.getVersion());
    expect(version).toMatch(/^\d+\.\d+\.\d+$/);
  });
});
```

**Step 5: 실행**
```bash
npx playwright test
```

---

### 4.2 WebdriverIO 프로젝트 설정

**Step 1: 설치 마법사**
```bash
cd my-electron-app
npm create wdio@latest ./
```

**선택 옵션:**
1. What type of testing would you like to do?
   → **Desktop Testing - of Electron Applications**
2. Where is your compiled Electron app located?
   → `./dist` 또는 `./out`
3. Framework?
   → **Mocha** 또는 **Cucumber**
4. Reporter?
   → **spec**, **allure**

**Step 2: 자동 생성된 설정 확인**
```typescript
// wdio.conf.ts (자동 생성)
export const config: WebdriverIO.Config = {
  runner: 'local',
  specs: ['./test/**/*.spec.ts'],
  capabilities: [{
    browserName: 'electron',
    'wdio:electronServiceOptions': {
      appEntryPoint: './dist/main.js',
    },
  }],
  services: ['electron'],
  framework: 'mocha',
  // ...
};
```

**Step 3: 테스트 작성**
```typescript
// test/login.spec.ts
describe('Login', () => {
  it('should login successfully', async () => {
    await $('#email').setValue('test@example.com');
    await $('#password').setValue('password123');
    await $('button[type="submit"]').click();

    await expect($('.welcome')).toBeDisplayed();
  });
});
```

**Step 4: 실행**
```bash
npm run wdio
```

---

### 4.3 CI/CD 통합

**GitHub Actions + Playwright:**
```yaml
# .github/workflows/test.yml
name: Electron E2E Tests

on: [push, pull_request]

jobs:
  test:
    runs-on: ${{ matrix.os }}
    strategy:
      matrix:
        os: [macos-latest, windows-latest, ubuntu-latest]
    
    steps:
      - uses: actions/checkout@v4
      
      - uses: actions/setup-node@v4
        with:
          node-version: 20
      
      - name: Install dependencies
        run: npm ci
      
      - name: Build Electron app
        run: npm run build
      
      - name: Run Playwright tests
        run: npx playwright test
      
      - uses: actions/upload-artifact@v4
        if: always()
        with:
          name: playwright-report-${{ matrix.os }}
          path: playwright-report/
          retention-days: 30
```

---

### 4.4 Native Dialog 처리

**문제:** 시스템 다이얼로그 (file open, save)는 자동화 어려움

**해결 1: Mocking (WebdriverIO)**
```typescript
it('should handle file open dialog', async () => {
  // Dialog mock
  await browser.electron.mock('dialog', 'showOpenDialog').mockResolvedValue({
    filePaths: ['/path/to/file.txt'],
    canceled: false,
  });

  await $('button=Open File').click();

  // 파일 로드 확인
  await expect($('.file-content')).toBeDisplayed();
});
```

**해결 2: Main 프로세스 직접 호출 (Playwright)**
```typescript
test('File open', async () => {
  const electronApp = await electron.launch({ args: ['.'] });
  const window = await electronApp.firstWindow();

  // Main 프로세스에서 직접 파일 경로 전달
  await electronApp.evaluate(async ({ BrowserWindow }) => {
    const win = BrowserWindow.getAllWindows()[0];
    win.webContents.send('file-opened', '/path/to/file.txt');
  });

  // 결과 확인
  await expect(window.locator('.file-content')).toBeVisible();

  await electronApp.close();
});
```

---

## 5. Best Practices

### 5.1 테스트 구조

**Good:**
```typescript
// ✅ 기능별로 그룹화
test.describe('Export Feature', () => {
  test.describe('PDF Export', () => {
    test('should export single page', async () => { /* ... */ });
    test('should export multiple pages', async () => { /* ... */ });
  });

  test.describe('Image Export', () => {
    test('should export as PNG', async () => { /* ... */ });
    test('should export as JPEG', async () => { /* ... */ });
  });
});
```

**Bad:**
```typescript
// ❌ 모든 테스트가 하나의 파일에
test('test1', async () => { /* ... */ });
test('test2', async () => { /* ... */ });
test('test3', async () => { /* ... */ });
```

---

### 5.2 Selector 전략

**우선순위:**
1. **test-id** — `data-testid="submit-button"`
2. **role + name** — `getByRole('button', { name: 'Submit' })`
3. **text** — `getByText('Submit')`
4. **CSS** — `.submit-button` (마지막 수단)

**Playwright 예시:**
```typescript
// ✅ Good
await window.getByTestId('submit-button').click();
await window.getByRole('button', { name: 'Submit' }).click();

// ❌ Bad — brittle
await window.click('.btn.btn-primary.submit');
```

---

### 5.3 Wait 전략

**Playwright Auto-waiting:**
```typescript
// ✅ Playwright이 자동으로 대기
await window.click('button');
await expect(window.locator('.result')).toHaveText('Success');
```

**WebdriverIO:**
```typescript
// ✅ waitForDisplayed 사용
await $('button').click();
await $('.result').waitForDisplayed({ timeout: 5000 });
await expect($('.result')).toHaveText('Success');
```

---

### 5.4 Isolation

**각 테스트는 독립적이어야 함:**
```typescript
test.describe('Settings', () => {
  let electronApp;
  let window;

  test.beforeEach(async () => {
    // 각 테스트마다 새 앱 인스턴스
    electronApp = await electron.launch({ args: ['.'] });
    window = await electronApp.firstWindow();
  });

  test.afterEach(async () => {
    // 정리
    await electronApp.close();
  });

  test('should save theme preference', async () => {
    // 테스트 코드
  });
});
```

---

### 5.5 테스트 데이터

**Fixture 사용:**
```typescript
// fixtures.ts
import { test as base } from '@playwright/test';

export const test = base.extend({
  // 각 테스트에 주입될 fixture
  authenticatedWindow: async ({ }, use) => {
    const electronApp = await electron.launch({ args: ['.'] });
    const window = await electronApp.firstWindow();

    // 로그인 상태 설정
    await window.evaluate(() => {
      localStorage.setItem('token', 'test-token');
    });

    await use(window);

    await electronApp.close();
  },
});

// test.spec.ts
test('should show dashboard', async ({ authenticatedWindow }) => {
  // 이미 인증된 상태로 시작
  await expect(authenticatedWindow.locator('.dashboard')).toBeVisible();
});
```

---

## 6. 문제 해결

### 6.1 Timeout 문제

**증상:** 테스트가 timeout으로 실패

**해결:**
```typescript
// playwright.config.ts
export default defineConfig({
  timeout: 60000,  // 전체 테스트 타임아웃
  expect: {
    timeout: 10000,  // expect 타임아웃
  },
  use: {
    actionTimeout: 10000,  // click, fill 등 타임아웃
  },
});
```

---

### 6.2 Electron 버전 불일치

**증상:** `Chromium version mismatch`

**해결:**
```bash
# Electron 버전 확인
npx electron --version

# Playwright 브라우저 재설치
npx playwright install chromium
```

---

### 6.3 Node CLI Inspect Fuse 문제

**증상:** Playwright가 Electron 실행 실패

**해결:**
```javascript
// electron-builder.yml 또는 forge config
fuses:
  - nodeCliInspect: true  // false로 설정되어 있으면 변경
```

---

### 6.4 CI에서 실행 안 됨

**증상:** 로컬에서는 잘 되지만 CI에서 실패

**해결:**
```yaml
# GitHub Actions
- name: Run tests
  run: npx playwright test
  env:
    # Headless 모드
    HEADLESS: true
    # Linux에서 필요
    DISPLAY: :99
```

---

## 7. 장단점

### 7.1 E2E 테스트 장점

1. **실제 사용자 경험 테스트** — 실제 앱 실행
2. **Cross-platform 검증** — Windows, macOS, Linux
3. **통합 테스트** — 모든 컴포넌트가 함께 작동
4. **Regression 방지** — 기능 손상 조기 발견
5. **자동화** — CI/CD 통합

---

### 7.2 E2E 테스트 단점

1. **느린 실행** — Unit/Integration보다 느림
2. **Flaky** — 환경에 따라 불안정
3. **유지보수 비용** — Selector 변경 시 수정 필요
4. **디버깅 어려움** — 실패 원인 파악 복잡

---

### 7.3 Electron E2E 특유의 어려움

1. **Native dialog** — 시스템 다이얼로그 자동화 어려움
2. **Main 프로세스** — Node.js 코드 테스트 복잡
3. **Cross-platform** — OS별 동작 차이
4. **Setup 복잡도** — 빌드된 앱 필요

---

## 8. 결론

### 8.1 도구 선택 가이드

**Playwright 선택:**
- ✅ 새 프로젝트
- ✅ 빠른 실행 필요
- ✅ TypeScript 친화적
- ✅ Modern한 툴링

**WebdriverIO 선택:**
- ✅ 기존 WebdriverIO 사용 중
- ✅ Mature한 기능 필요
- ✅ 강력한 Mocking 필요
- ✅ BDD (Cucumber) 사용

**Spectron:**
- ❌ 사용 금지

---

### 8.2 구현 로드맵

**Phase 1: Setup (1-2일)**
1. Playwright 또는 WebdriverIO 설치
2. 기본 설정
3. 첫 테스트 작성

**Phase 2: 핵심 테스트 (1주)**
1. 로그인/인증
2. 핵심 기능 (CRUD)
3. Navigation

**Phase 3: 확장 (지속)**
1. Export/Import
2. Settings
3. Error handling
4. Cross-platform

**Phase 4: CI/CD (2-3일)**
1. GitHub Actions 설정
2. 병렬 실행
3. Report 생성

---

### 8.3 성공 요인

1. **적절한 도구 선택** — 프로젝트에 맞는 도구
2. **명확한 Selector 전략** — 유지보수 가능한 테스트
3. **Isolation** — 독립적인 테스트
4. **CI 통합** — 자동화
5. **Flaky 테스트 관리** — 안정성 확보

---

## 9. 참고 자료

### 공식 문서
- Playwright Electron: https://playwright.dev/docs/api/class-electron
- WebdriverIO Electron: https://webdriver.io/docs/desktop-testing/electron
- Electron Testing: https://www.electronjs.org/docs/latest/tutorial/automated-testing

### 예제 프로젝트
- Playwright Electron Example: https://github.com/microsoft/playwright/tree/main/examples/electron
- WebdriverIO Electron Demo: https://github.com/webdriverio/electron-boilerplate

### 커뮤니티
- Playwright Discord: https://aka.ms/playwright/discord
- WebdriverIO Discord: https://discord.webdriver.io

---

_작성자: Hank McCoy_
_조사 방법: 공식 문서, GitHub 리포지토리, 커뮤니티 리소스 종합_
