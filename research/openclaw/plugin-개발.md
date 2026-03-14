---
tags:
  - openclaw
  - plugin
  - 개발가이드
  - typescript
date: 2026-03-12
---

# OpenClaw Plugin 개발

조사 일자: 2026-03-12

조사 일자: 2026-03-12
목적: OpenClaw Plugin 개발 방법 및 실전 가이드
출처: OpenClaw 공식 문서, skill-creator SKILL.md

---

## 1. 핵심 요약

**OpenClaw Plugin이란:**
- OpenClaw Gateway를 확장하는 작은 코드 모듈
- TypeScript로 작성, 런타임에 jiti로 로드
- Gateway와 동일한 프로세스에서 실행 (신뢰하는 코드)

**Plugin으로 할 수 있는 것:**
1. Agent Tools 등록 — LLM이 호출할 수 있는 함수
2. Gateway RPC methods 등록
3. HTTP routes 등록 — 웹훅, API 엔드포인트
4. CLI commands 등록
5. Background services 실행
6. Context engines 등록
7. Skills 제공 — agent가 사용하는 지식 패키지
8. Auto-reply commands — AI 없이 실행되는 명령

**필수 구성:**
1. `openclaw.plugin.json` — Plugin manifest (필수)
2. `index.ts` 또는 `index.js` — Plugin 진입점
3. `package.json` — npm 패키지 설정

---

## 2. 상세 분석

### 2.1 Plugin 구조

**기본 디렉토리:**
```
my-plugin/
├── openclaw.plugin.json    # Manifest (필수)
├── package.json             # npm 패키지 설정
├── index.ts                 # 진입점
├── src/
│   ├── tools.ts            # Agent tools
│   ├── routes.ts           # HTTP routes
│   ├── hooks.ts            # Lifecycle hooks
│   └── rpc.ts              # RPC methods
└── skills/                  # Skills 디렉토리 (옵션)
    └── my-skill/
        └── SKILL.md
```

---

### 2.2 Manifest (openclaw.plugin.json)

**필수 필드:**
```json
{
  "id": "my-plugin",
  "configSchema": {
    "type": "object",
    "additionalProperties": false,
    "properties": {
      "enabled": {
        "type": "boolean",
        "default": true
      }
    }
  }
}
```

**전체 스키마:**
```json
{
  "id": "activity-tracker",
  "name": "Activity Tracker",
  "description": "Track and visualize agent activity",
  "version": "1.0.0",
  "kind": "monitoring",
  "channels": ["custom-channel"],
  "providers": ["custom-provider"],
  "skills": ["skills/visualizer"],
  "configSchema": {
    "type": "object",
    "additionalProperties": false,
    "properties": {
      "enabled": {
        "type": "boolean",
        "default": true
      },
      "port": {
        "type": "number",
        "default": 18796
      },
      "dbPath": {
        "type": "string",
        "default": "~/.openclaw/activity-tracker/activities.db"
      }
    }
  },
  "uiHints": {
    "port": {
      "label": "Dashboard Port",
      "placeholder": "18796"
    },
    "dbPath": {
      "label": "Database Path",
      "sensitive": false
    }
  }
}
```

**필드 설명:**

| 필드 | 타입 | 필수 | 설명 |
|------|------|------|------|
| `id` | string | ✓ | Plugin ID (unique) |
| `configSchema` | object | ✓ | JSON Schema for config |
| `name` | string | | Display name |
| `description` | string | | Short summary |
| `version` | string | | Plugin version |
| `kind` | string | | Plugin kind (e.g., "memory") |
| `channels` | array | | Channel IDs registered |
| `providers` | array | | Provider IDs registered |
| `skills` | array | | Skill directories to load |
| `uiHints` | object | | Config field labels for UI |

---

### 2.3 Plugin 진입점 (index.ts)

**기본 구조:**
```typescript
import { PluginAPI } from 'openclaw/plugin-sdk/core';

export default function (api: PluginAPI) {
  // 1. Agent tools 등록
  api.registerTool({
    name: 'my_tool',
    description: 'Do something useful',
    parameters: {
      type: 'object',
      properties: {
        input: { type: 'string' },
      },
      required: ['input'],
    },
    async execute(_id, params) {
      return {
        content: [{ type: 'text', text: `Result: ${params.input}` }],
      };
    },
  });

  // 2. HTTP route 등록
  api.registerHttpRoute({
    path: '/my-plugin/webhook',
    auth: 'plugin',
    match: 'exact',
    handler: async (req, res) => {
      res.statusCode = 200;
      res.end('ok');
      return true;
    },
  });

  // 3. Lifecycle hooks
  api.on('gateway:start', () => {
    console.log('Gateway started');
  });

  api.on('gateway:stop', () => {
    console.log('Gateway stopping');
  });
}
```

---

### 2.4 Agent Tools

**기본 Tool:**
```typescript
import { Type } from '@sinclair/typebox';

api.registerTool({
  name: 'search_files',
  description: 'Search for files in the workspace',
  parameters: Type.Object({
    query: Type.String({ description: 'Search query' }),
    maxResults: Type.Optional(Type.Number({ default: 10 })),
  }),
  async execute(_id, params) {
    const results = await searchFiles(params.query, params.maxResults);
    return {
      content: [{ type: 'text', text: JSON.stringify(results, null, 2) }],
    };
  },
});
```

**Optional Tool (opt-in):**
```typescript
api.registerTool(
  {
    name: 'dangerous_operation',
    description: 'Perform a dangerous operation',
    parameters: Type.Object({
      target: Type.String(),
    }),
    async execute(_id, params) {
      // ...
    },
  },
  { optional: true }
);
```

**사용자가 활성화:**
```json5
{
  agents: {
    list: [
      {
        id: 'main',
        tools: {
          allow: [
            'dangerous_operation',  // specific tool
            'my-plugin',            // all tools from plugin
            'group:plugins',        // all plugin tools
          ],
        },
      },
    ],
  },
}
```

---

### 2.5 HTTP Routes

**Webhook 예시:**
```typescript
api.registerHttpRoute({
  path: '/my-plugin/github-webhook',
  auth: 'plugin',
  match: 'exact',
  handler: async (req, res) => {
    const body = await parseBody(req);

    // Process webhook
    console.log('GitHub event:', body);

    res.statusCode = 200;
    res.end(JSON.stringify({ received: true }));
    return true;
  },
});
```

**Auth levels:**
- `"gateway"` — Gateway auth required (normal auth)
- `"plugin"` — Plugin manages auth (webhook verification)

**Match modes:**
- `"exact"` — Exact path match (default)
- `"prefix"` — Prefix match (fallthrough)

**주의사항:**
- Plugin routes must declare `auth` explicitly
- Exact path conflicts are rejected unless `replaceExisting: true`
- One plugin cannot replace another plugin's route

---

### 2.6 Runtime Helpers

**TTS (Text-to-Speech for telephony):**
```typescript
const result = await api.runtime.tts.textToSpeechTelephony({
  text: 'Hello from OpenClaw',
  cfg: api.config,
});

// result: { audio: Buffer, sampleRate: number }
```

**STT (Speech-to-Text):**
```typescript
const { text } = await api.runtime.stt.transcribeAudioFile({
  filePath: '/tmp/audio.ogg',
  cfg: api.config,
  mime: 'audio/ogg', // Optional
});
```

---

### 2.7 Skills 제공

**Plugin manifest에 skills 추가:**
```json
{
  "id": "activity-tracker",
  "skills": ["skills/visualizer"]
}
```

**Skills 디렉토리:**
```
my-plugin/
└── skills/
    └── visualizer/
        ├── SKILL.md
        ├── scripts/
        │   └── generate_report.py
        └── references/
            └── api_reference.md
```

**SKILL.md 예시:**
```markdown
---
name: activity-visualizer
description: Visualize agent activity in real-time. Use when asked to show activity dashboard, generate activity reports, or monitor agent behavior.
---

# Activity Visualizer

This skill provides real-time visualization of OpenClaw agent activity.

## Quick Start

1. Run the dashboard:
   ```bash
   openclaw my-plugin dashboard
   ```

2. Open http://localhost:18796

## Commands

- `/dashboard` — Open activity dashboard
- `/report` — Generate activity report
- `/stats` — Show activity statistics

## Scripts

- `scripts/generate_report.py` — Generate detailed activity report
```

---

### 2.8 Plugin CLI Commands

**Command 등록:**
```typescript
api.registerCommand({
  name: 'my-plugin:status',
  description: 'Show plugin status',
  async execute(args) {
    console.log('Plugin status: active');
    console.log('Config:', api.config);
  },
});
```

**사용:**
```bash
openclaw my-plugin:status
```

---

### 2.9 Hook 시스템

**Lifecycle hooks:**
```typescript
api.on('gateway:start', async () => {
  console.log('Gateway started');
  await initializeDatabase();
});

api.on('gateway:stop', async () => {
  console.log('Gateway stopping');
  await cleanup();
});
```

**Custom hooks (ActivityClaw 예시):**
```typescript
// tool_result_persist hook
api.on('tool_result_persist', async (event) => {
  const { tool, args, result, sessionId, agentLabel, timestamp } = event;

  const activity = {
    id: generateId(),
    timestamp: timestamp || new Date(),
    sessionId,
    agentLabel,
    type: classifyActivity(tool),
    tool,
    args,
    result: summarizeResult(result),
  };

  await storeActivity(activity);
  broadcastActivity(activity);
});
```

---

### 2.10 Plugin SDK Import Paths

**권장 import 경로:**
```typescript
// Core APIs
import { PluginAPI } from 'openclaw/plugin-sdk/core';

// Channel-specific
import { TelegramAPI } from 'openclaw/plugin-sdk/telegram';
import { DiscordAPI } from 'openclaw/plugin-sdk/discord';
import { SlackAPI } from 'openclaw/plugin-sdk/slack';
import { SignalAPI } from 'openclaw/plugin-sdk/signal';
import { WhatsAppAPI } from 'openclaw/plugin-sdk/whatsapp';

// Extension-specific
import { VoiceCallAPI } from 'openclaw/plugin-sdk/voice-call';
import { MemoryAPI } from 'openclaw/plugin-sdk/memory-core';
```

---

## 3. 장단점

### 3.1 Plugin 방식

**장점:**
1. Gateway와 동일한 프로세스에서 실행 → 빠름
2. OpenClaw 코어 API에 직접 접근
3. Agent tools, HTTP routes, CLI commands 통합
4. Skills 제공 가능
5. TypeScript/JavaScript 생태계 활용

**단점:**
1. Gateway와 동일한 프로세스 → 버그 시 Gateway 영향
2. TypeScript/JavaScript만 지원
3. 배포 시 npm 패키지 필요
4. 디버깅이 복잡할 수 있음

---

### 3.2 Skill 방식 vs Plugin 방식

| 항목 | Skill | Plugin |
|------|-------|--------|
| 목적 | 지식, 가이드 제공 | 기능 확장 |
| 실행 시점 | Agent가 호출 | Gateway 시작 시 |
| 코드 | 없음 (Markdown) | TypeScript/JavaScript |
| 접근 권한 | Agent context만 | Gateway API 전체 |
| 배포 | .skill 파일 | npm 패키지 |
| 적합한 용도 | 가이드, 참조, 워크플로우 | Tools, Routes, Hooks |

**추천:**
- 지식 제공 → Skill
- 기능 확장 → Plugin
- 둘 다 → Plugin + Skills

---

## 4. 결론

### 4.1 pixel-office를 위한 추천 접근

**Plugin + Skills 하이브리드:**

```
openclaw-plugin-pixel-office/
├── openclaw.plugin.json
├── package.json
├── index.ts                  # Plugin 진입점
├── src/
│   ├── tools/
│   │   ├── get_activity.ts   # Agent tool
│   │   ├── get_stats.ts      # Agent tool
│   │   └── replay_session.ts # Agent tool
│   ├── routes/
│   │   └── api.ts            # REST API
│   ├── hooks/
│   │   └── activity.ts       # tool_result_persist hook
│   ├── server/
│   │   ├── api.ts            # Express server
│   │   └── websocket.ts      # WebSocket server
│   └── data/
│       └── store.ts          # SQLite interface
└── skills/
    └── visualizer/
        ├── SKILL.md          # Game view 사용 가이드
        ├── scripts/
        │   └── generate_report.py
        └── references/
            └── api_reference.md
```

---

### 4.2 Manifest 예시

**openclaw.plugin.json:**
```json
{
  "id": "pixel-office",
  "name": "Pixel Office",
  "description": "Real-time agent activity visualization with game-style pixel art office",
  "version": "1.0.0",
  "skills": ["skills/visualizer"],
  "configSchema": {
    "type": "object",
    "additionalProperties": false,
    "properties": {
      "enabled": {
        "type": "boolean",
        "default": true
      },
      "apiPort": {
        "type": "number",
        "default": 18796
      },
      "wsPort": {
        "type": "number",
        "default": 18797
      },
      "dbPath": {
        "type": "string",
        "default": "~/.openclaw/pixel-office/activities.db"
      },
      "gameViewEnabled": {
        "type": "boolean",
        "default": true
      },
      "dashboardEnabled": {
        "type": "boolean",
        "default": true
      }
    }
  },
  "uiHints": {
    "apiPort": {
      "label": "API Server Port",
      "placeholder": "18796"
    },
    "wsPort": {
      "label": "WebSocket Port",
      "placeholder": "18797"
    },
    "dbPath": {
      "label": "Database Path"
    },
    "gameViewEnabled": {
      "label": "Enable Game View"
    },
    "dashboardEnabled": {
      "label": "Enable Dashboard"
    }
  }
}
```

---

### 4.3 Plugin 진입점 예시

**index.ts:**
```typescript
import { PluginAPI } from 'openclaw/plugin-sdk/core';
import { registerActivityHook } from './hooks/activity';
import { registerTools } from './tools';
import { registerRoutes } from './routes';
import { startServer } from './server/api';
import { startWebSocket } from './server/websocket';

export default function (api: PluginAPI) {
  const config = api.config.plugins?.entries?.['pixel-office'] || {};

  // 1. Register hooks
  registerActivityHook(api);

  // 2. Register agent tools
  registerTools(api);

  // 3. Register HTTP routes
  registerRoutes(api);

  // 4. Start servers on gateway:start
  api.on('gateway:start', async () => {
    if (config.apiPort) {
      await startServer(config.apiPort, config.dbPath);
    }
    if (config.wsPort) {
      await startWebSocket(config.wsPort);
    }
  });

  // 5. Cleanup on gateway:stop
  api.on('gateway:stop', async () => {
    // Close servers, cleanup
  });
}
```

---

### 4.4 Hook 구현 예시

**src/hooks/activity.ts:**
```typescript
import { PluginAPI } from 'openclaw/plugin-sdk/core';
import { ActivityStore } from '../data/store';
import { broadcastActivity } from '../server/websocket';

export function registerActivityHook(api: PluginAPI) {
  const store = new ActivityStore();

  api.on('tool_result_persist', async (event) => {
    const { tool, args, result, sessionId, agentLabel, duration, tokens } = event;

    const activity = {
      id: generateId(),
      timestamp: new Date(),
      sessionId,
      agentLabel,
      type: classifyActivity(tool),
      tool,
      args: sanitizeArgs(args),
      result: summarizeResult(result),
      duration,
      tokens,
    };

    await store.logActivity(activity);
    broadcastActivity(activity);
  });
}

function classifyActivity(tool: string): string {
  if (['read', 'write', 'edit'].includes(tool)) return 'file';
  if (['exec', 'process'].includes(tool)) return 'command';
  if (['web_search', 'web_fetch', 'browser'].includes(tool)) return 'web';
  if (['message', 'sessions_send'].includes(tool)) return 'message';
  if (['sessions_spawn', 'subagents'].includes(tool)) return 'subagent';
  return 'command';
}

function sanitizeArgs(args: any): any {
  // Remove sensitive data
  const sanitized = { ...args };
  if (sanitized.token) sanitized.token = '***';
  if (sanitized.password) sanitized.password = '***';
  return sanitized;
}

function summarizeResult(result: any): string {
  if (!result) return '';
  if (typeof result === 'string') return result.substring(0, 200);
  return JSON.stringify(result).substring(0, 200);
}
```

---

### 4.5 Agent Tool 구현 예시

**src/tools/get_activity.ts:**
```typescript
import { Type } from '@sinclair/typebox';
import { ActivityStore } from '../data/store';

export function registerGetActivityTool(api: PluginAPI) {
  const store = new ActivityStore();

  api.registerTool({
    name: 'get_activity',
    description: 'Get recent agent activity',
    parameters: Type.Object({
      sessionId: Type.Optional(Type.String()),
      agentLabel: Type.Optional(Type.String()),
      type: Type.Optional(Type.String()),
      limit: Type.Optional(Type.Number({ default: 100 })),
    }),
    async execute(_id, params) {
      const activities = await store.getActivities(params);

      return {
        content: [
          {
            type: 'text',
            text: JSON.stringify(activities, null, 2),
          },
        ],
      };
    },
  });
}
```

**src/tools/get_stats.ts:**
```typescript
import { Type } from '@sinclair/typebox';
import { ActivityStore } from '../data/store';

export function registerGetStatsTool(api: PluginAPI) {
  const store = new ActivityStore();

  api.registerTool({
    name: 'get_stats',
    description: 'Get activity statistics',
    parameters: Type.Object({}),
    async execute(_id, _params) {
      const stats = await store.getStats();

      return {
        content: [
          {
            type: 'text',
            text: JSON.stringify(stats, null, 2),
          },
        ],
      };
    },
  });
}
```

---

### 4.6 HTTP Route 구현 예시

**src/routes/api.ts:**
```typescript
import { PluginAPI } from 'openclaw/plugin-sdk/core';
import { ActivityStore } from '../data/store';

export function registerRoutes(api: PluginAPI) {
  const store = new ActivityStore();

  // GET /pixel-office/activities
  api.registerHttpRoute({
    path: '/pixel-office/activities',
    auth: 'gateway',
    match: 'exact',
    handler: async (req, res) => {
      const url = new URL(req.url || '', 'http://localhost');
      const sessionId = url.searchParams.get('sessionId');
      const limit = parseInt(url.searchParams.get('limit') || '100');

      const activities = await store.getActivities({ sessionId, limit });

      res.statusCode = 200;
      res.setHeader('Content-Type', 'application/json');
      res.end(JSON.stringify(activities));
      return true;
    },
  });

  // GET /pixel-office/stats
  api.registerHttpRoute({
    path: '/pixel-office/stats',
    auth: 'gateway',
    match: 'exact',
    handler: async (_req, res) => {
      const stats = await store.getStats();

      res.statusCode = 200;
      res.setHeader('Content-Type', 'application/json');
      res.end(JSON.stringify(stats));
      return true;
    },
  });
}
```

---

### 4.7 개발 워크플로우

**1. Plugin 스캐폴드 생성:**
```bash
mkdir openclaw-plugin-pixel-office
cd openclaw-plugin-pixel-office
npm init -y
```

**2. Dependencies 설치:**
```bash
npm install openclaw @sinclair/typebox better-sqlite3 express ws
npm install -D typescript @types/node @types/better-sqlite3 @types/express @types/ws
```

**3. 파일 구조 생성:**
```bash
mkdir -p src/{tools,routes,hooks,server,data}
mkdir -p skills/visualizer/{scripts,references}
```

**4. 코드 작성:**
- openclaw.plugin.json
- index.ts
- src/ 하위 파일들
- skills/visualizer/SKILL.md

**5. 로컬 테스트:**
```bash
npm run build
openclaw plugins install -l .
openclaw gateway restart
```

**6. 디버깅:**
```bash
# Plugin 로그 확인
tail -f ~/.openclaw/logs/gateway.log

# 상태 확인
openclaw plugins list
```

**7. 배포:**
```bash
npm publish
```

---

## 5. 참고 자료

### 공식 문서
- Plugins: https://docs.openclaw.ai/plugins
- Plugin Manifest: https://docs.openclaw.ai/plugins/manifest
- Plugin Agent Tools: https://docs.openclaw.ai/plugins/agent-tools

### 예시 Plugin
- ActivityClaw: https://github.com/rmruss2022/ActivityClaw
- Voice Call: `@openclaw/voice-call`
- Memory (Core): bundled
- Memory (LanceDB): bundled

### SDK
- `openclaw/plugin-sdk/core`
- `openclaw/plugin-sdk/compat`
- Channel-specific subpaths (telegram, discord, slack, etc.)

### 커뮤니티 Plugin
- DingTalk: https://github.com/soimy/openclaw-channel-dingtalk
- WeCom: https://github.com/sunnoy/openclaw-plugin-wecom
- QQ Bot: https://github.com/tencent-connect/openclaw-qqbot
- Memory LanceDB Pro: https://github.com/CortexReach/memory-lancedb-pro

---

_작성자: Hank McCoy_
_조사 방법: OpenClaw 공식 문서, skill-creator SKILL.md, GitHub 리포지토리 분석_
