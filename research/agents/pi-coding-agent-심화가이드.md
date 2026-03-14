---
tags:
  - pi
  - coding-agent
  - 오픈소스
  - 플러그인-개발
  - claude-code
  - comparison
date: 2026-03-14
---

# Pi Coding Agent 심화 가이드

조사 일자: 2026-03-14
목적: Pi의 주요 기능, 플러그인 개발, Claude Code/OpenCode와의 차별점
출처: GitHub (badlogic/pi-mono, can1357/oh-my-pi), 공식 문서

---

## 1. 핵심 요약

**Pi Coding Agent란:**
- 오픈소스 AI 코딩 에이전트 (MIT 라이선스)
- Multi-provider LLM 지원 (OpenAI, Anthropic, Google, OpenRouter 등)
- TypeScript + Bun 기반
- 완전히 커스터마이징 가능한 확장 아키텍처

**핵심 차별점:**
1. **Multi-provider** — 벤더 lock-in 없음
2. **오픈소스** — 완전한 제어
3. **Extensible** — Skills, Extensions, Hooks
4. **BYOK** — 자신의 API 키 사용
5. **No telemetry** — 데이터 프라이버시

**Stars:** 23.5k (pi-mono), 1.9k (oh-my-pi)
**최신 버전:** v0.58.0 (2026-03-14)
**개발자:** Mario Zechner (@badlogic) + 147 contributors

---

## 2. 주요 기능

### 2.1 Multi-Provider LLM API

**지원 Provider:**
- **OpenAI** — GPT-4, GPT-5, etc.
- **Anthropic** — Claude 3, Claude 4
- **Google** — Gemini
- **OpenRouter** — 모델 마켓플레이스
- **xAI** — Grok
- **DeepSeek**
- **Mistral**
- **Custom endpoints**

**특징:**
```typescript
import { Chat } from '@mariozechner/pi-ai';

// Provider 교체가 쉬움
const chat = new Chat({
  provider: 'anthropic',  // ← 이것만 바꾸면 됨
  model: 'claude-3-opus-20240229',
  apiKey: process.env.ANTHROPIC_API_KEY,
});
```

**장점:**
- 벤더 종속 없음
- 비용 최적화 가능
- Failover 지원
- 새로운 provider 쉽게 추가

---

### 2.2 Skills (기능 확장)

**개념:** 재사용 가능한 작업 단위

**구조:**
```
.pi/skills/
├── my-skill/
│   ├── SKILL.md          # Skill 정의
│   ├── scripts/          # 실행 스크립트
│   │   ├── setup.sh
│   │   └── execute.sh
│   └── references/       # 참조 문서
│       ├── api-docs.md
│       └── examples.md
```

**SKILL.md 예시:**
```markdown
---
name: code-review
description: Review code for best practices and bugs
triggers:
  - "review"
  - "code review"
---

# Code Review Skill

## When to use
- After completing a feature
- Before committing code
- When reviewing PRs

## Steps
1. Analyze code structure
2. Check for common patterns
3. Identify potential bugs
4. Suggest improvements

## Tools needed
- read_file
- search_files
- bash_execute (optional)
```

**호환성:**
- Claude Code skills와 호환
- Codex CLI skills와 부분 호환

---

### 2.3 Extensions (플러그인)

**개념:** Pi의 기능을 확장하는 TypeScript 모듈

**공식 Extensions (pi-vs-claude-code):**

| Extension | 기능 |
|-----------|------|
| `pure-focus` | Footer/status 제거, 집중 모드 |
| `minimal` | Compact footer with context meter |
| `cross-agent` | Claude/Gemini/Codex 디렉토리 스캔 |
| `purpose-gate` | 시작 시 목적 선언 강제 |
| `tool-counter` | Tool 호출 카운트 표시 |
| `subagent-widget` | Subagent 진행 상황 위젯 |
| `tilldone` | Task 추적 시스템 |
| `agent-team` | Multi-agent orchestration |
| `damage-control` | 실시간 안전 감사 |
| `agent-chain` | 순차 파이프라인 |

**Extension 로드:**
```bash
# 단일 extension
pi -e extensions/minimal.ts

# 여러 extension
pi -e extensions/cross-agent.ts -e extensions/purpose-gate.ts
```

---

### 2.4 Hooks

**개념:** 이벤트 기반 자동화

**Hook 종류:**
- `pre-tool` — Tool 실행 전
- `post-tool` — Tool 실행 후
- `on-message` — 메시지 수신 시
- `on-response` — 응답 생성 시
- `on-session-start` — 세션 시작 시
- `on-session-end` — 세션 종료 시

**예시:**
```typescript
// .pi/hooks/pre-commit.ts
export default function (context) {
  const { files, roleId } = context;

  // 특정 role만 hook 적용
  if (roleId !== 'engineer') return;

  // Lint 실행
  for (const file of files) {
    if (file.endsWith('.ts')) {
      execSync(`eslint --fix ${file}`);
    }
  }

  // Test 실행
  execSync('npm test');

  return { success: true };
}
```

---

### 2.5 Subagents

**개념:** 병렬로 전문화된 에이전트 실행

**Bundled Agents (oh-my-pi):**
- `explore` — 코드베이스 탐색
- `plan` — 작업 계획
- `designer` — 설계
- `reviewer` — 코드 리뷰
- `task` — 작업 실행
- `quick_task` — 빠른 작업

**사용:**
```bash
# Subagent 실행
/sub "Explore the authentication module"

# 병렬 실행
/sub "Analyze database schema" &
/sub "Review API endpoints" &
wait

# Agent Control Center
/agents
```

**특징:**
- Real-time artifact streaming
- Isolation backends (git worktree, fuse-overlay)
- Background jobs (up to 100)

---

### 2.6 LSP Integration (oh-my-pi)

**개념:** IDE 수준의 코드 인텔리전스

**지원 기능:**
- Diagnostics (errors, warnings)
- Go to definition
- Find references
- Hover information
- Rename symbol
- Code actions
- Format on write
- Auto-format

**지원 언어 (40+):**
- Rust, Go, Python
- TypeScript, JavaScript
- Java, Kotlin, Scala
- Haskell, OCaml, Elixir
- Ruby, PHP, C#
- Lua, Nix, etc.

**설정:**
```json
{
  "lsp": {
    "rust": {
      "command": "rust-analyzer",
      "args": []
    },
    "python": {
      "command": "pylsp",
      "args": []
    },
    "typescript": {
      "command": "typescript-language-server",
      "args": ["--stdio"]
    }
  }
}
```

---

### 2.7 Python Kernel (oh-my-pi)

**개념:** 영구 IPython 커널로 Python 코드 실행

**특징:**
- Persistent kernel (세션 간 유지)
- Streaming output
- Rich output (HTML, Markdown, images)
- Prelude helpers (file I/O, search)
- Custom modules
- Mermaid diagrams rendering

**사용:**
```bash
pi
> /python
>>> import pandas as pd
>>> df = pd.read_csv('data.csv')
>>> df.head()
>>> df.describe()
```

---

### 2.8 Model Routing

**개념:** 용도별로 다른 모델 사용

**Roles:**
- `default` — 일반 작업
- `smol` — 빠른 작업, 요약
- `slow` — 복잡한 추론
- `plan` — 계획 수립
- `commit` — 커밋 메시지
- `code-review` — 코드 리뷰

**설정:**
```json
{
  "models": {
    "default": "anthropic:claude-3-opus",
    "smol": "openai:gpt-4o-mini",
    "slow": "anthropic:claude-3-opus",
    "plan": "anthropic:claude-3-sonnet",
    "commit": "openai:gpt-4o-mini",
    "code-review": "anthropic:claude-3-opus"
  }
}
```

**장점:**
- 비용 최적화 (60% 절감 사례)
- 작업별 최적 모델
- 자동 라우팅

---

## 3. 사용 사례

### 3.1 일반적인 사용 패턴

**Pattern 1: 기본 코딩**
```bash
pi "Build a REST API with Express"
pi "Add authentication middleware"
pi "Write tests for user endpoints"
```

**Pattern 2: 코드 리뷰**
```bash
pi -e extensions/damage-control.ts
pi "Review the changes in src/auth/"
```

**Pattern 3: 리팩토링**
```bash
pi "Refactor the database layer"
pi "Extract common utilities"
```

**Pattern 4: 문서화**
```bash
pi "Generate API documentation"
pi "Update README with new features"
```

---

### 3.2 Multi-Model 비용 최적화

**시나리오:**
- 복잡한 작업 → Claude Opus ($$$)
- 간단한 작업 → GPT-4o-mini ($)
- 커밋 메시지 → GPT-3.5 ($)

**설정:**
```json
{
  "models": {
    "default": "anthropic:claude-3-sonnet",
    "smol": "openai:gpt-4o-mini",
    "slow": "anthropic:claude-3-opus",
    "commit": "openai:gpt-3.5-turbo"
  }
}
```

**결과:**
- 비용 60% 절감
- 성능 유지

---

### 3.3 팀 코드 리뷰 자동화

**시나리오:**
- PR 생성 시 자동 리뷰
- Coding standards check
- Security audit

**Workflow:**
```bash
# Git hook
cat > .git/hooks/pre-push << 'EOF'
#!/bin/bash
pi review --uncommitted
EOF
chmod +x .git/hooks/pre-push
```

**Extension 활용:**
```bash
pi -e extensions/damage-control.ts
pi "Review all TypeScript files"
```

---

### 3.4 데이터 분석 프로젝트

**시나리오:**
- Python 데이터 분석
- Interactive exploration
- 시각화

**사용:**
```bash
pi
> /python
>>> import pandas as pd
>>> import matplotlib.pyplot as plt
>>> df = pd.read_csv('sales.csv')
>>> df.groupby('region').sum().plot(kind='bar')
>>> plt.show()
```

---

### 3.5 대규모 리팩토링

**시나리오:**
- 대규모 코드베이스
- 여러 모듈 동시 작업

**Subagents 활용:**
```bash
/sub "Refactor authentication module"
/sub "Refactor database layer"
/sub "Refactor API endpoints"

# 모니터링
/agents
```

---

## 4. 플러그인 개발 가이드

### 4.1 Extension 개발

**기본 구조:**
```typescript
// extensions/my-extension.ts
import type { Extension } from '@mariozechner/pi-coding-agent';

export const extension: Extension = {
  name: 'my-extension',
  version: '1.0.0',
  
  // Extension 초기화
  async initialize(context) {
    console.log('Extension initialized');
    
    // Hook 등록
    context.registerHook('pre-tool', async (event) => {
      console.log(`Tool about to execute: ${event.toolName}`);
    });
    
    // Command 등록
    context.registerCommand('my-cmd', async (args) => {
      console.log('Custom command executed', args);
    });
  },
  
  // Extension 정리
  async cleanup() {
    console.log('Extension cleaned up');
  },
};
```

---

### 4.2 Extension API

**Context API:**
```typescript
interface ExtensionContext {
  // Hook 등록
  registerHook(event: HookEvent, handler: HookHandler): void;
  
  // Command 등록
  registerCommand(name: string, handler: CommandHandler): void;
  
  // Tool 등록
  registerTool(tool: ToolDefinition): void;
  
  // UI 표시
  showMessage(message: string): void;
  showError(error: string): void;
  
  // 상태 접근
  getState(): ExtensionState;
  setState(state: Partial<ExtensionState>): void;
  
  // 설정 접근
  getConfig(): Record<string, unknown>;
  setConfig(key: string, value: unknown): void;
}
```

---

### 4.3 실제 Extension 예시

**Example 1: Tool Counter**
```typescript
// extensions/tool-counter.ts
export const extension = {
  name: 'tool-counter',
  
  async initialize(context) {
    let toolCount = 0;
    
    context.registerHook('post-tool', async (event) => {
      toolCount++;
      context.showMessage(`Tools called: ${toolCount}`);
    });
    
    context.registerCommand('tool-count', async () => {
      context.showMessage(`Total tools called: ${toolCount}`);
    });
  },
};
```

**Example 2: Purpose Gate**
```typescript
// extensions/purpose-gate.ts
export const extension = {
  name: 'purpose-gate',
  
  async initialize(context) {
    const state = context.getState();
    
    if (!state.purposeDeclared) {
      const purpose = await context.promptInput(
        'What is your purpose for this session?'
      );
      
      context.setState({ purposeDeclared: true, purpose });
      context.showMessage(`Purpose: ${purpose}`);
    }
  },
};
```

**Example 3: Damage Control**
```typescript
// extensions/damage-control.ts
const DANGEROUS_PATTERNS = [
  /rm\s+-rf/,
  /DROP\s+TABLE/i,
  /DELETE\s+FROM/i,
  /format\s+C:/i,
];

export const extension = {
  name: 'damage-control',
  
  async initialize(context) {
    context.registerHook('pre-tool', async (event) => {
      if (event.toolName === 'bash_execute') {
        const command = event.params.command;
        
        for (const pattern of DANGEROUS_PATTERNS) {
          if (pattern.test(command)) {
            const confirmed = await context.promptConfirm(
              `Dangerous command detected: ${command}\nProceed anyway?`
            );
            
            if (!confirmed) {
              throw new Error('Command blocked by damage-control');
            }
          }
        }
      }
    });
  },
};
```

---

### 4.4 Skill 개발

**디렉토리 구조:**
```
.pi/skills/
└── my-skill/
    ├── SKILL.md
    ├── scripts/
    │   ├── setup.sh
    │   └── execute.sh
    └── references/
        └── docs.md
```

**SKILL.md:**
```markdown
---
name: deploy
description: Deploy application to production
triggers:
  - "deploy"
  - "ship it"
  - "release"
---

# Deploy Skill

## Prerequisites
- Docker installed
- AWS CLI configured
- Environment variables set

## Steps
1. Build Docker image
2. Run tests
3. Push to ECR
4. Update ECS service
5. Verify deployment

## Scripts
- `scripts/setup.sh` — Install dependencies
- `scripts/execute.sh` — Run deployment

## References
- [[AWS ECS docs]]
- [[Docker best practices]]
```

**scripts/execute.sh:**
```bash
#!/bin/bash
set -e

# Build
docker build -t myapp:latest .

# Test
docker run --rm myapp:latest npm test

# Push
docker tag myapp:latest 123456789.dkr.ecr.us-east-1.amazonaws.com/myapp:latest
docker push 123456789.dkr.ecr.us-east-1.amazonaws.com/myapp:latest

# Deploy
aws ecs update-service --cluster prod --service myapp --force-new-deployment
```

---

### 4.5 Hook 개발

**Hook 종류:**
```typescript
type HookEvent =
  | 'pre-tool'      // Tool 실행 전
  | 'post-tool'     // Tool 실행 후
  | 'on-message'    // 사용자 메시지 수신
  | 'on-response'   // AI 응답 생성
  | 'on-session-start'
  | 'on-session-end'
  | 'on-error';
```

**예시:**
```typescript
// .pi/hooks/auto-format.ts
export default async function (context) {
  const { event, data } = context;

  if (event === 'post-tool') {
    if (data.toolName === 'write_file') {
      const filePath = data.params.path;
      
      // TypeScript 파일이면 자동 포맷
      if (filePath.endsWith('.ts')) {
        execSync(`prettier --write ${filePath}`);
        console.log(`Formatted: ${filePath}`);
      }
    }
  }
}
```

---

### 4.6 Custom Tool 개발

**Tool 정의:**
```typescript
// tools/my-tool.ts
import { ToolDefinition } from '@mariozechner/pi-agent-core';

export const myTool: ToolDefinition = {
  name: 'my_custom_tool',
  description: 'A custom tool for specific tasks',
  input_schema: {
    type: 'object',
    properties: {
      input: {
        type: 'string',
        description: 'Input for the tool',
      },
      options: {
        type: 'object',
        properties: {
          verbose: { type: 'boolean' },
          format: { type: 'string', enum: ['json', 'text'] },
        },
      },
    },
    required: ['input'],
  },
  
  async execute(params, context) {
    const { input, options = {} } = params;
    
    // Tool 로직
    const result = await processData(input, options);
    
    return {
      success: true,
      data: result,
    };
  },
};
```

**Tool 등록:**
```typescript
// extension.ts
import { myTool } from './tools/my-tool';

export const extension = {
  name: 'my-extension',
  
  async initialize(context) {
    context.registerTool(myTool);
  },
};
```

---

## 5. Claude Code vs OpenCode vs Pi 비교

### 5.1 기능 비교

| 항목 | Pi | Claude Code | OpenCode |
|------|----|----|----------|
| **오픈소스** | ✓ MIT | ✗ 폐쇄 | ✓ Apache 2.0 |
| **Multi-Provider** | ✓ | ✗ Anthropic only | ✓ |
| **LSP** | ✓ (oh-my-pi) | ✗ | △ |
| **Python Kernel** | ✓ | ✗ | ✗ |
| **Subagents** | ✓ | ✗ | ✗ |
| **Extensions** | ✓ 무제한 | ✗ 제한적 | ✓ |
| **Skills** | ✓ Claude Code 호환 | ✓ | ✓ |
| **Hash-anchored edits** | ✓ (oh-my-pi) | ✗ Line-based | ✗ |
| **Model Routing** | ✓ | ✗ | △ |
| **TTSR** | ✓ (oh-my-pi) | ✗ | ✗ |
| **Code Review** | ✓ (oh-my-pi) | △ | △ |
| **Cost Tracking** | ✓ | ✗ | ✗ |
| **No Telemetry** | ✓ | ✗ | ✓ |
| **BYOK** | ✓ | ✗ | ✓ |

---

### 5.2 아키텍처 비교

**Pi:**
```
Multi-Provider API (pi-ai)
    ↓
Agent Runtime (pi-agent-core)
    ↓
Coding Agent CLI (pi-coding-agent)
    ↓
Extensions + Skills + Hooks
```

**Claude Code:**
```
Anthropic API
    ↓
Claude Code CLI
    ↓
Skills (제한적)
```

**OpenCode:**
```
Multi-Provider API
    ↓
OpenCode Agent
    ↓
Plugins
```

---

### 5.3 벤더 종속성

**Pi:**
- ✅ **No vendor lock-in**
- 언제든 provider 교체 가능
- 새로운 provider 쉽게 추가
- API 키 직접 관리

**Claude Code:**
- ❌ **Anthropic only**
- 다른 provider 사용 불가
- 가격 정책에 종속
- API 키 Anthropic 관리

**OpenCode:**
- ✅ **Multi-provider**
- Pi와 유사
- 커뮤니티 주도

---

### 5.4 비용 비교

**Pi:**
- Provider 선택 → 비용 최적화
- Model routing → 작업별 최적 모델
- 예: 60% 비용 절감 사례

**Claude Code:**
- Anthropic 요금 고정
- 비용 최적화 제한적
- Opus 사용 시 비용 높음

**OpenCode:**
- Multi-provider → 비용 최적화 가능
- Pi와 유사

---

### 5.5 커뮤니티 및 생태계

**Pi:**
- Stars: 23.5k (pi-mono) + 1.9k (oh-my-pi)
- Contributors: 147+
- Extensions: 10+ (공식)
- Discord: 활성
- 개발 속도: 빠름 (170+ releases)

**Claude Code:**
- 회사: Anthropic
- 공식 지원
- 안정성: 높음
- 생태계: 성장 중

**OpenCode:**
- Stars: ~5k
- Contributors: ~20
- 커뮤니티: 성장 중
- 생태계: 초기 단계

---

### 5.6 적합한 사용 시나리오

**Pi가 적합한 경우:**
1. ✅ Multi-provider 필요
2. ✅ 비용 최적화 중요
3. ✅ 오픈소스 선호
4. ✅ 커스터마이징 필요
5. ✅ LSP, Python kernel 필요
6. ✅ Subagents 활용

**Claude Code가 적합한 경우:**
1. ✅ Anthropic 전용 환경
2. ✅ 간편함 우선
3. ✅ 공식 지원 필요
4. ✅ 안정성 중요
5. ✅ 복잡한 설정 피하고 싶음

**OpenCode가 적합한 경우:**
1. ✅ 오픈소스 선호
2. ✅ Multi-provider
3. ✅ 가벼운 솔루션
4. ✅ 커뮤니티 기여 의향

---

### 5.7 차별화 요소

**Pi의 핵심 차별점:**

1. **Multi-Provider + Model Routing**
   - 비용 최적화
   - 작업별 최적 모델
   - Vendor independence

2. **oh-my-pi Fork의 고급 기능**
   - LSP (40+ 언어)
   - Python kernel
   - Hash-anchored edits
   - TTSR
   - Subagents

3. **오픈소스 + 활성 커뮤니티**
   - MIT 라이선스
   - 147+ contributors
   - 170+ releases

4. **확장성**
   - Extensions
   - Skills (Claude Code 호환)
   - Hooks
   - Custom tools

---

## 6. 결론

### 6.1 Pi 선택 가이드

**Pi를 선택해야 할 때:**
- Multi-provider 필요
- 비용 최적화 중요
- 오픈소스 선호
- LSP, Python kernel 필요
- Subagents 활용
- 완전한 제어 필요

**다른 도구를 고려할 때:**
- Claude Code → Anthropic 전용, 간편함
- OpenCode → 가벼운 오픈소스

---

### 6.2 시작하기

**설치:**
```bash
# Bun (recommended)
bun install -g @mariozechner/pi-coding-agent

# 또는 소스에서
git clone https://github.com/badlogic/pi-mono
cd pi-mono
npm install && npm run build
./pi-test.sh
```

**기본 설정:**
```bash
# .env
ANTHROPIC_API_KEY=sk-ant-...
OPENAI_API_KEY=sk-...
```

**첫 실행:**
```bash
pi "Build a simple REST API"
```

---

### 6.3 확장하기

**Extension 개발:**
```bash
mkdir -p extensions
touch extensions/my-extension.ts
pi -e extensions/my-extension.ts
```

**Skill 추가:**
```bash
mkdir -p .pi/skills/my-skill
touch .pi/skills/my-skill/SKILL.md
```

**Custom tool:**
```typescript
// tools/my-tool.ts
export const myTool = {
  name: 'my_tool',
  // ...
};
```

---

## 7. 참고 자료

### 공식 리포지토리
- Pi Mono: https://github.com/badlogic/pi-mono
- Oh-My-Pi: https://github.com/can1357/oh-my-pi
- Pi Skills: https://github.com/badlogic/pi-skills

### Extensions
- Pi vs Claude Code: https://github.com/disler/pi-vs-claude-code
- Awesome Pi Agent: https://github.com/qualisero/awesome-pi-agent

### 커뮤니티
- Discord: https://discord.com/invite/3cU7Bz4UPx
- Oh-My-Pi Discord: https://discord.gg/4NMW9cdXZa

### npm Packages
- `@mariozechner/pi-ai`
- `@mariozechner/pi-agent-core`
- `@mariozechner/pi-coding-agent`
- `@oh-my-pi/pi-coding-agent`

---

_작성자: Hank McCoy_
_조사 방법: GitHub 리포지토리, 공식 문서, 커뮤니티 리소스_
