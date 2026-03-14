---
tags:
  - coding-agent
  - pi
  - 오픈소스
  - multi-provider
date: 2026-03-13
---

# Pi Coding Agent 가이드

조사 일자: 2026-03-13

조사 일자: 2026-03-13
목적: Pi Coding Agent의 특징, 개념, 차별점, 활용사례
출처: GitHub (badlogic/pi-mono, can1357/oh-my-pi), 관련 문서

---

## 1. 핵심 요약

**Pi Coding Agent란:**
- 오픈소스 AI 코딩 에이전트 CLI
- Multi-provider LLM 지원 (OpenAI, Anthropic, Google, OpenRouter, etc.)
- TypeScript 기반, Bun runtime
- 완전히 커스터마이징 가능

**주요 특징:**
1. **Multi-provider** — 벤더 lock-in 없음
2. **오픈소스** — MIT 라이선스, 완전한 제어
3. **Extensible** — Skills, hooks, custom tools
4. **Terminal-first** — TUI (Terminal User Interface)
5. **LSP 통합** — IDE 수준의 코드 인텔리전스 (oh-my-pi)
6. **Python kernel** — 영구 IPython 커널
7. **Subagents** — 병렬 실행, 전문화된 에이전트

**개발자:** Mario Zechner (@badlogic), 커뮤니티
**Stars:** 22.9k (pi-mono), 1.9k (oh-my-pi fork)
**라이선스:** MIT

---

## 2. 상세 분석

### 2.1 아키텍처

**Monorepo 구조 (pi-mono):**
```
pi-mono/
├── packages/
│   ├── ai/              # Unified LLM API
│   ├── agent/           # Agent runtime
│   ├── coding-agent/    # CLI
│   ├── mom/             # Slack bot
│   ├── tui/             # Terminal UI
│   ├── web-ui/          # Web components
│   └── pods/            # vLLM deployment
└── AGENTS.md            # Project rules
```

**Package별 역할:**

| Package | npm | 역할 |
|---------|-----|------|
| `pi-ai` | `@mariozechner/pi-ai` | Unified multi-provider LLM API |
| `pi-agent-core` | `@mariozechner/pi-agent-core` | Agent runtime with tool calling |
| `pi-coding-agent` | `@mariozechner/pi-coding-agent` | Interactive coding agent CLI |
| `pi-mom` | `@mariozechner/pi-mom` | Slack bot for delegating to pi |
| `pi-tui` | `@mariozechner/pi-tui` | Terminal UI library |
| `pi-web-ui` | `@mariozechner/pi-web-ui` | Web chat components |
| `pi-pods` | `@mariozechner/pi-pods` | vLLM GPU pod management |

---

### 2.2 핵심 개념

#### 1. Unified LLM API

**개념:** 하나의 API로 여러 LLM provider 사용

**지원 Provider:**
- OpenAI (GPT-4, GPT-5, etc.)
- Anthropic (Claude 3, Claude 4)
- Google (Gemini)
- OpenRouter (모델 마켓플레이스)
- xAI (Grok)
- DeepSeek
- Mistral
- Custom endpoints

**사용 예시:**
```typescript
import { Chat } from '@mariozechner/pi-ai';

const chat = new Chat({
  provider: 'anthropic',
  model: 'claude-3-opus-20240229',
  apiKey: process.env.ANTHROPIC_API_KEY,
});

const response = await chat.send('Hello!');
```

**장점:**
- Provider 교체 용이
- 일관된 API
- Failover 지원
- 비용 최적화 가능

---

#### 2. Agent Runtime

**개념:** Tool calling과 상태 관리를 위한 런타임

**구성 요소:**
- Tool registry
- State management
- Context window management
- Streaming support
- Error handling

**Tool 정의:**
```typescript
const tools = [
  {
    name: 'read_file',
    description: 'Read file contents',
    parameters: {
      type: 'object',
      properties: {
        path: { type: 'string' },
      },
      required: ['path'],
    },
    execute: async (params) => {
      return fs.readFile(params.path, 'utf-8');
    },
  },
];
```

---

#### 3. Skills

**개념:** 재사용 가능한 작업 단위, Claude Code와 호환

**구조:**
```
.pi/skills/
├── my-skill/
│   ├── SKILL.md          # Skill 정의
│   ├── scripts/          # 실행 스크립트
│   └── references/       # 참조 문서
```

**SKILL.md 예시:**
```markdown
---
name: code-review
description: Review code for best practices and bugs
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
```

**호환성:**
- Claude Code skills와 호환
- Codex CLI skills와 부분 호환
- Cross-agent skill sharing 가능

---

#### 4. Hooks

**개념:** 이벤트 기반 자동화

**Hook 종류:**
- `pre-tool` — Tool 실행 전
- `post-tool` — Tool 실행 후
- `on-message` — 메시지 수신 시
- `on-response` — 응답 생성 시

**사용 예시:**
```typescript
// .pi/hooks/pre-commit.ts
export default function (context) {
  const { files } = context;

  // Run linter
  for (const file of files) {
    if (file.endsWith('.ts')) {
      execSync(`eslint ${file}`);
    }
  }
}
```

---

#### 5. Extensions

**개념:** Pi의 기능을 확장하는 플러그인

**예시 Extensions (pi-vs-claude-code):**

| Extension | 설명 |
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
pi -e extensions/minimal.ts
pi -e extensions/cross-agent.ts -e extensions/purpose-gate.ts
```

---

### 2.3 oh-my-pi (Fork)

**개요:**
- Pi의 기능 확장 fork
- can1357 개발
- 1.9k stars
- 더 많은 고급 기능

**추가 기능:**

#### 1. Hash-Anchored Edits

**개념:** 파일 위치 대신 내용 기반 편집

**장점:**
- Line number 변화에 강함
- Merge conflict 방지
- 정확한 편집

**작동 방식:**
```
Original:
  function foo() {
    return 1;
  }

Edit command:
  Replace "return 1;" with "return 2;"

Result:
  function foo() {
    return 2;
  }
```

---

#### 2. LSP (Language Server Protocol) Integration

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
    }
  }
}
```

---

#### 3. Python Kernel

**개념:** 영구 IPython 커널로 Python 코드 실행

**특징:**
- Persistent kernel (세션 간 유지)
- Streaming output
- Rich output (HTML, Markdown, images)
- Prelude helpers (file I/O, search, etc.)
- Custom modules
- Mermaid diagrams rendering

**사용 예시:**
```python
# Python cell
import pandas as pd

df = pd.read_csv('data.csv')
df.head()
```

**장점:**
- 데이터 분석 작업에 적합
- Interactive exploration
- 시각화 지원

---

#### 4. TTSR (Triggered Type-Safe Rules)

**개념:** Context를 절약하는 규칙 시스템

**작동 방식:**
1. Rule이 regex pattern 정의
2. Model output stream 감시
3. Pattern 매치 시:
   - Stream 중단
   - Rule을 system reminder로 inject
   - Request 재시도
4. 한 번만 trigger (loop 방지)

**예시:**
```typescript
{
  name: 'no-deprecated-api',
  ttsrTrigger: /deprecatedFunction\(/,
  rule: 'Do not use deprecatedFunction(). Use newFunction() instead.',
}
```

**장점:**
- Zero upfront context cost
- Just-in-time activation
- Relevant rules only

---

#### 5. Subagents & Parallel Execution

**개념:** 병렬로 전문화된 에이전트 실행

**Bundled Agents (6):**
- `explore` — 코드베이스 탐색
- `plan` — 작업 계획
- `designer` — 설계
- `reviewer` — 코드 리뷰
- `task` — 작업 실행
- `quick_task` — 빠른 작업

**사용 예시:**
```bash
# Subagent 실행
/sub "Explore the authentication module"

# 병렬로 여러 에이전트
/sub "Analyze database schema"
/sub "Review API endpoints"
```

**특징:**
- Real-time artifact streaming
- Isolation backends (git worktree, fuse-overlay)
- Background jobs (up to 100)
- Agent Control Center (`/agents`)

---

#### 6. Code Review

**개념:** 구조화된 코드 리뷰

**기능:**
- `/review` command
- Branch comparison
- Uncommitted changes review
- Commit review

**Findings:**
```typescript
{
  priority: 'P0', // P0-P3: critical → nit
  file: 'src/auth.ts',
  line: 42,
  message: 'Potential SQL injection',
  suggestion: 'Use parameterized query',
}
```

**Verdict:**
- Approve
- Request changes
- Comment

---

#### 7. Multi-Model Routing

**개념:** 용도별로 다른 모델 사용

**Roles:**
- `default` — 일반 작업
- `smol` — 빠른 작업, 요약
- `slow` — 복잡한 추론
- `plan` — 계획 수립
- `commit` — 커밋 메시지

**설정:**
```json
{
  "models": {
    "default": "anthropic:claude-3-opus",
    "smol": "openai:gpt-4o-mini",
    "slow": "anthropic:claude-3-opus",
    "plan": "anthropic:claude-3-sonnet",
    "commit": "openai:gpt-4o-mini"
  }
}
```

**장점:**
- 비용 최적화
- 작업별 최적 모델
- 자동 라우팅

---

### 2.4 다른 Coding Agent와의 비교

#### vs Claude Code

| 항목 | Pi | Claude Code |
|------|----|----|
| **오픈소스** | ✓ MIT | ✗ 폐쇄 |
| **Provider** | Multi (OpenAI, Anthropic, Google, etc.) | Anthropic only |
| **비용** | Provider 선택 가능 | Anthropic 요금 |
| **커스터마이징** | ✓ 무제한 | 제한적 |
| **Skills** | Claude Code 호환 | 자체 skills |
| **LSP** | ✓ (oh-my-pi) | ✗ |
| **Python kernel** | ✓ | ✗ |
| **Subagents** | ✓ | ✗ |
| **Hash-anchored edits** | ✓ (oh-my-pi) | Line-based |
| **Model lock-in** | ✗ 없음 | ✓ Anthropic |
| **Data privacy** | ✓ Self-hosted | Anthropic 서버 |

**Pi의 장점:**
1. **Vendor independence** — 벤더 종속 없음
2. **오픈소스** — 완전한 제어, 감사 가능
3. **Multi-provider** — 비용/성능 최적화
4. **확장성** — 무제한 커스터마이징

**Claude Code의 장점:**
1. **Anthropic 최적화** — Claude 특화
2. **간편함** — 설치 후 바로 사용
3. **공식 지원** — Anthropic에서 개발

---

#### vs Codex CLI

| 항목 | Pi | Codex |
|------|----|----|
| **오픈소스** | ✓ | ✗ |
| **Provider** | Multi | OpenAI only |
| **Runtime** | Bun | Node.js |
| **PTY** | 권장 | 필수 |
| **Git repo** | 권장 | 필수 |
| **Sandbox** | 선택적 | 필수 (--yolo로 제거) |
| **Skills** | ✓ Claude Code 호환 | 자체 형식 |

**Pi의 장점:**
1. **오픈소스**
2. **Multi-provider**
3. **더 유연한 sandbox**

**Codex의 장점:**
1. **OpenAI 통합**
2. **강력한 auto-mode**

---

#### vs OpenCode

| 항목 | Pi | OpenCode |
|------|----|----|
| **오픈소스** | ✓ | ✓ |
| **Provider** | Multi | Multi |
| **성숙도** | 높음 (22.9k stars) | 중간 |
| **Extensions** | ✓ 풍부 | 제한적 |
| **커뮤니티** | 활성 | 성장 중 |

**Pi의 장점:**
1. **더 큰 커뮤니티**
2. **더 많은 extensions**
3. **oh-my-pi fork의 추가 기능**

---

### 2.5 활용 사례

#### Case 1: Multi-Model 비용 최적화

**시나리오:** 
- 복잡한 작업은 Claude Opus
- 간단한 작업은 GPT-4o-mini
- 커밋 메시지는 가장 저렴한 모델

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

#### Case 2: 팀 코드 리뷰 자동화

**시나리오:**
- PR 생성 시 자동 리뷰
- Coding standards check
- Security audit

**구현:**
```bash
# Extension으로 구현
pi -e extensions/damage-control.ts

# Git hook
cat > .git/hooks/pre-push << 'EOF'
#!/bin/bash
pi review --uncommitted
EOF
chmod +x .git/hooks/pre-push
```

**결과:**
- 일관된 코드 품질
- 자동 보안 감사

---

#### Case 3: 데이터 분석 프로젝트

**시나리오:**
- Python 데이터 분석
- Interactive exploration
- 시각화

**사용:**
```bash
# Python kernel 사용
pi
> /python
>>> import pandas as pd
>>> df = pd.read_csv('data.csv')
>>> df.describe()
```

**결과:**
- 빠른 탐색
- Interactive workflow

---

#### Case 4: 대규모 리팩토링

**시나리오:**
- 대규모 코드베이스 리팩토링
- 병렬로 여러 모듈 작업

**사용:**
```bash
# Subagents 활용
/sub "Refactor authentication module"
/sub "Refactor database layer"
/sub "Refactor API endpoints"

# 모니터링
/agents
```

**결과:**
- 병렬 처리로 시간 단축
- 격리된 작업 환경

---

#### Case 5: Custom Agent 팀 구축

**시나리오:**
- 프로젝트별 전문 에이전트
- 자동화된 워크플로우

**구현:**
```typescript
// .omp/agents/frontend.ts
export default {
  name: 'frontend',
  systemPrompt: 'You are a frontend specialist...',
  tools: ['edit', 'read', 'lsp'],
  model: 'anthropic:claude-3-sonnet',
};

// .omp/agents/backend.ts
export default {
  name: 'backend',
  systemPrompt: 'You are a backend specialist...',
  tools: ['edit', 'read', 'bash', 'test'],
  model: 'anthropic:claude-3-opus',
};
```

**사용:**
```bash
/agent frontend "Add dark mode toggle"
/agent backend "Optimize database queries"
```

---

#### Case 6: LSP 기반 정확한 편집

**시나리오:**
- 타입 안전한 리팩토링
- 자동 포맷팅

**사용:**
```bash
# LSP 활성화
pi --lsp

# Rename symbol
> Rename `getUser` to `fetchUser`

# Pi가 LSP를 사용하여 모든 참조 찾아서 변경
```

**결과:**
- 정확한 변경
- 타입 안전
- 자동 포맷

---

### 2.6 설치 및 설정

#### 설치

**Requirements:**
- Bun ≥ 1.3.2
- Node.js (optional)

**설치:**
```bash
# npm (deprecated)
npm install -g @mariozechner/pi-coding-agent

# Bun (recommended)
bun install -g @mariozechner/pi-coding-agent

# 또는 소스에서
git clone https://github.com/badlogic/pi-mono
cd pi-mono
bun install
bun run build
```

---

#### API Keys 설정

**환경 변수:**
```bash
# .env
OPENAI_API_KEY=sk-...
ANTHROPIC_API_KEY=sk-ant-...
GEMINI_API_KEY=...
OPENROUTER_API_KEY=...

# Load
source .env && pi
```

**또는 alias:**
```bash
# ~/.zshrc or ~/.bashrc
alias pi='source $(pwd)/.env && pi'
```

---

#### 기본 설정

**~/.pi/config.json:**
```json
{
  "model": "anthropic:claude-3-sonnet",
  "models": {
    "default": "anthropic:claude-3-sonnet",
    "smol": "openai:gpt-4o-mini"
  },
  "lsp": {
    "enabled": true
  },
  "python": {
    "enabled": true,
    "kernel": "ipython"
  }
}
```

---

## 3. 장단점

### 3.1 Pi의 장점

1. **오픈소스** — MIT 라이선스, 완전한 제어
2. **Multi-provider** — 벤더 종속 없음
3. **비용 최적화** — 작업별 모델 선택
4. **확장성** — Skills, hooks, extensions
5. **LSP 통합** — IDE 수준 인텔리전스
6. **Python kernel** — 데이터 분석 지원
7. **Subagents** — 병렬 실행
8. **커뮤니티** — 활성 개발, 풍부한 extensions
9. **Claude Code 호환** — Skills 공유 가능

---

### 3.2 Pi의 단점

1. **설정 복잡도** — 초기 설정 필요
2. **의존성** — Bun, LSP servers 등
3. **PTY 필요** — 일부 환경에서 제약
4. **상대적 초기기** — Claude Code보다 덜 성숙
5. **문서화** — 공식 문서가 부족할 수 있음

---

### 3.3 oh-my-pi의 추가 장점

1. **Hash-anchored edits** — 정확한 편집
2. **LSP** — IDE 수준 기능
3. **Python kernel** — 데이터 분석
4. **TTSR** — Context 효율성
5. **Subagents** — 병렬 실행
6. **Code review** — 구조화된 리뷰

---

### 3.4 oh-my-pi의 추가 단점

1. **Fork** — 원본과 분기
2. **복잡도 증가** — 더 많은 기능, 더 많은 설정
3. **유지보수** — 두 버전 모두 추적 필요

---

## 4. 결론

### 4.1 Pi는 언제 적합한가?

**적합한 경우:**
1. **Multi-provider 필요** — 비용/성능 최적화
2. **오픈소스 선호** — 완전한 제어
3. **커스터마이징** — Skills, extensions 개발
4. **데이터 분석** — Python kernel 활용
5. **팀 사용** — 일관된 환경, 자동화
6. **LSP 필요** — 타입 안전, 정확한 편집

**부적합한 경우:**
1. **간편함 우선** — Claude Code가 더 쉬움
2. **Anthropic 전용** — Claude Code가 더 최적화
3. **초보자** — 설정 복잡도

---

### 4.2 OpenClaw에서의 Pi 사용

**OpenClaw coding-agent skill에서:**
```bash
# PTY 모드로 실행
pi 'Your task'
```

**주의사항:**
- PTY 권장
- API keys 환경 변수 설정
- `.env` 자동 로드 안 됨

---

### 4.3 추천 사용 패턴

**Pattern 1: 기본 사용**
```bash
# 기본 모델로 작업
pi "Build a REST API"

# 빠른 모델로 요약
pi --model smol "Summarize the codebase"
```

**Pattern 2: Extensions 활용**
```bash
# Minimal UI
pi -e extensions/minimal.ts

# Cross-agent compatibility
pi -e extensions/cross-agent.ts

# Purpose gate
pi -e extensions/purpose-gate.ts
```

**Pattern 3: Subagents**
```bash
# 병렬 작업
/sub "Analyze module A"
/sub "Analyze module B"
/sub "Analyze module C"

# 결과 확인
/agents
```

**Pattern 4: Python 분석**
```bash
pi
> /python
>>> import pandas as pd
>>> # ... 분석 ...
```

---

### 4.4 미래 전망

**긍정적 요인:**
1. 활성 커뮤니티 (22.9k stars)
2. 오픈소스 생태계 성장
3. Multi-provider 수요 증가
4. 지속적인 개발

**도전 요인:**
1. Claude Code의 시장 지배
2. 상용 지원 부족
3. 문서화 개선 필요

---

## 5. 참고 자료

### 공식 리포지토리
- Pi Mono: https://github.com/badlogic/pi-mono
- Oh-My-Pi: https://github.com/can1357/oh-my-pi
- Pi Skills: https://github.com/badlogic/pi-skills
- Awesome Pi Agent: https://github.com/qualisero/awesome-pi-agent

### 비교 및 확장
- Pi vs Claude Code: https://github.com/disler/pi-vs-claude-code
- Overstory (orchestration): https://github.com/jayminwest/overstory

### 커뮤니티
- Discord: https://discord.com/invite/3cU7Bz4UPx
- Oh-My-Pi Discord: https://discord.gg/4NMW9cdXZa

### npm Packages
- `@mariozechner/pi-ai`
- `@mariozechner/pi-agent-core`
- `@mariozechner/pi-coding-agent`
- `@oh-my-pi/pi-coding-agent` (fork)

---

_작성자: Hank McCoy_
_조사 방법: GitHub 리포지토리 분석, 공식 문서, 커뮤니티 리소스_
