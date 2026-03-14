---
tags:
  - openclaw
  - 시각화
  - agent
  - hook
date: 2026-03-12
---

# OpenClaw Agent 활동 시각화

조사 일자: 2026-03-12

조사 일자: 2026-03-12
목적: OpenClaw 내 에이전트 활동 시각화 방법 및 구현 설계
출처: GitHub, OpenClaw 공식 문서

---

## 1. 핵심 요약

**OpenClaw Agent 시각화란:**
- 에이전트의 도구 사용, 파일 조작, 명령 실행 등을 실시간으로 시각화
- 멀티 에이전트 환경에서 각 에이전트의 활동 추적
- 토큰 사용량, 상태, 감정 등 메타데이터 표현

**주요 접근 방식:**
1. **Hook 기반 이벤트 수집** — OpenClaw 플러그인 훅 활용
2. **WebSocket 실시간 스트리밍** — Gateway WebSocket API 사용
3. **픽셀 아트 게임 스타일** — 몰입형 시각화
4. **대시보드 스타일** — 분석 중심 시각화

**검증된 구현체:**
- ActivityClaw — OpenClaw 전용 (7 ⭐)
- codemap — Cursor & Claude Code용 (104 ⭐)
- rockpile — MacBook 노치용 (10 ⭐)

---

## 2. 상세 분석

### 2.1 OpenClaw 아키텍처 이해

#### Gateway 구조

```
┌─────────────────────────────────────┐
│         Gateway (daemon)            │
│  - WebSocket Server (18789)         │
│  - Provider Connections             │
│  - Event Broadcasting               │
└──────────────┬──────────────────────┘
               │
    ┌──────────┴──────────┐
    │                     │
┌───▼────┐          ┌────▼────┐
│ Clients│          │  Nodes  │
│ (mac,  │          │(mobile, │
│  CLI,  │          │ desktop)│
│  web)  │          │         │
└────────┘          └─────────┘
```

**주요 컴포넌트:**
- **Gateway** — 모든 메시징 서피스 관리, WebSocket 서버
- **Clients** — macOS 앱, CLI, 웹 UI
- **Nodes** — 모바일/데스크톱 디바이스

**Wire Protocol:**
- Transport: WebSocket, JSON payloads
- Request/Response: `{type:"req", id, method, params}`
- Events: `{type:"event", event, payload}`
- 인증: `OPENCLAW_GATEWAY_TOKEN` 필요

---

#### Hook 시스템

**OpenClaw Plugin Hooks:**

| Hook | 발생 시점 | 데이터 |
|------|----------|--------|
| `tool_result_persist` | 도구 실행 후 | tool name, args, result, session ID |
| `message_received` | 메시지 수신 시 | sender, content, metadata |
| `message_sent` | 메시지 전송 시 | recipient, content |
| `agent_started` | 에이전트 시작 시 | session ID, agent label |
| `agent_stopped` | 에이전트 종료 시 | session ID, summary |

**Hook 등록:**
```typescript
// OpenClaw plugin
export function register(hooks: HookRegistry) {
  hooks.on('tool_result_persist', (event) => {
    const { tool, args, result, sessionId, agentLabel } = event;
    // 활동 로깅
  });
}
```

---

### 2.2 기존 구현체 분석

#### Case 1: ActivityClaw (OpenClaw 전용)

**개요:**
- OpenClaw 전용 실시간 활동 추적 및 시각화
- 7 stars, 23일 전 업데이트
- 이벤트 기반, 실시간, 경량

**아키텍처:**
```
OpenClaw Agent
      ↓
tool_result_persist hook
      ↓
Activity Tracker (SQLite)
      ↓
Dashboard Server (Express, port 18796)
      ↓
Browser UI (polls every 5s)
```

**핵심 기능:**

1. **실시간 모니터링**
   - 모든 에이전트 활동 추적
   - 메인 에이전트 + 서브 에이전트 자동 감지

2. **활동 유형 분류:**
   - 📝 File Operations — 생성, 편집, 읽기
   - ⚡ Commands — Shell 실행
   - 🔍 Web Activity — 검색, 페이지 가져오기
   - 💬 Messages — 아웃바운드 메시지
   - 🚀 Sub-agents — 스폰된 에이전트 세션

3. **대시보드:**
   - Activity Feed — 실시간 스트림
   - Statistics — 총 활동, 최근 1시간, 활성 에이전트
   - Filters — 유형별 필터링
   - Auto-refresh — 5초마다 자동 갱신

4. **프라이버시:**
   - 모든 데이터는 로컬 SQLite에 저장
   - 외부 전송 없음

**설치 및 사용:**
```bash
# 설치
npm install -g @rmruss2022/activityclaw
openclaw plugins install @rmruss2022/activityclaw

# 설정
openclaw activityclaw setup

# 대시보드 실행
openclaw activityclaw start
openclaw activityclaw dashboard
# http://localhost:18796

# 상태 확인
openclaw activityclaw status

# 데이터 정리
openclaw activityclaw clean --days 30
```

**데이터베이스 스키마 (추정):**
```sql
CREATE TABLE activities (
  id INTEGER PRIMARY KEY,
  timestamp DATETIME,
  session_id TEXT,
  agent_label TEXT,
  tool_name TEXT,
  tool_args JSON,
  result_summary TEXT,
  activity_type TEXT -- 'file', 'command', 'web', 'message', 'subagent'
);
```

**장점:**
- OpenClaw에 완전히 통합
- 이벤트 기반 → 실시간
- 경량, 최소 오버헤드
- CLI 제공

**단점:**
- 시각화가 단순 (대시보드 스타일)
- 게임적 요소 없음
- 모바일 미지원

**비판적 관점:**
- ActivityClaw는 기본적인 활동 추적에는 충분
- 하지만 pixel-office 같은 몰입형 시각화에는 부족
- 데이터 수집 레이어로 활용 가능

---

#### Case 2: codemap (Cursor & Claude Code용)

**개요:**
- 픽셀 아트 호텔 스타일 시각화
- 104 stars, 1월 업데이트
- Cursor & Claude Code 지원

**아키텍처:**
```
AI Agent (Claude/Cursor)
      ↓
Hook Scripts (capture)
      ↓
Server (port 5174, WebSocket)
      ↓
Browser (render, port 5173)
```

**핵심 기능:**

1. **라이브 시각화:**
   - 에이전트가 방 사이를 이동하며 작업
   - 폴더 → 방, 파일 → 책상

2. **스마트 레이아웃:**
   - 폴더 구조를 기반으로 방 배치
   - Git 활동 기반 정렬

3. **멀티 에이전트:**
   - 최대 10개 에이전트 동시 표시

4. **시각적 피드백:**
   - 💬 Speech Bubbles — 작업 중인 tool, file 표시
   - 🦘 Stuck Detection — 입력 대기 시 바운스
   - 🎨 Themed Rooms — Components (파랑), Server (초록), Tests (복숭아)
   - 💻 Computer screens — 파일 접근 시 켜짐
   - 🟡 Yellow glow — 파일 읽기
   - 🟢 Green glow — 코드 작성
   - 💭 Thinking indicator — 처리 중
   - 🚶 Walking animations — 방 간 이동
   - ☕ Coffee shop — 대기 에이전트

5. **동적 리프레시:**
   - Git commit 시 호텔 재구성

**설치 및 사용:**
```bash
# 원커맨드 설치
npx github:JamsusMaximus/codemap

# 또는 수동
git clone https://github.com/JamsusMaximus/codemap
cd codemap
npm install
npm run dev
# http://localhost:5173/hotel
```

**Server API (Port 5174):**
- `POST /api/activity` — 파일 읽기/쓰기 이벤트
- `POST /api/thinking` — 에이전트 상태
- `GET /api/graph` — 파일 트리 데이터
- `GET /api/hot-folders` — Git 랭킹 폴더
- WebSocket `/ws` — 실시간 업데이트

**Hook Scripts:**
- `file-activity-hook.sh` — 파일 작업 캡처
- `thinking-hook.sh` — 에이전트 상태, 모델, 지속 시간
- `cursor-stop-hook.sh` — Cursor 완료 상태
- `git-post-commit.sh` — 레이아웃 리프레시 트리거

**장점:**
- 높은 몰입도
- 직관적인 시각화
- 다양한 애니메이션
- Git 연동

**단점:**
- Claude Code, Cursor 전용
- OpenClaw와 직접 통합 안 됨
- 별도 서버 실행 필요

**비판적 관점:**
- pixel-office의 직접적인 영감
- 하지만 OpenClaw 전용이 아니라 адаптация 필요
- Hook 방식은 차용 가능

---

#### Case 3: rockpile (MacBook 노치용)

**개요:**
- MacBook 노치에 사는 픽셀 아트 가재
- 10 stars, 4시간 전 업데이트
- Claude Code, OpenClaw 등 지원

**아키텍처:**
```
Mode A: Local
Agent (same Mac) → Unix Socket → Rockpile (Notch)

Mode B: Monitor
Agent (remote Mac) → Gateway WebSocket → Rockpile (Notch)

Mode C: Server
Agent (remote) → TCP:18790 → Rockpile (local)
```

**핵심 기능:**

1. **상태 매핑:**
   - 💤 Idle — 에이전트 작업 완료
   - 🧠 Thinking — LLM 추론
   - 🔨 Working — 도구 호출 / 코드 생성
   - ⏳ Waiting — 사용자 입력 대기
   - ❌ Error — 도구 호출 실패
   - 🌀 Compacting — 컨텍스트 압축
   - 😴 Sleeping — 5분 비활성

2. **감정 분석:**
   - Claude Haiku가 사용자 메시지 감정 분석
   - 😐 😊 😢 😠 variants
   - 60초 자연스러운 감정 decay

3. **토큰 시각화:**
   - O₂ 메터 (체력바 스타일)
   - 100-60% → 🟢 초록, 맑은 물
   - 60-30% → 🟡 노랑, 어두운 물
   - 30-10% → 🔴 빨강, 혼탁한 물
   - 0% → 💀 K.O., 뒤집힌 가재

4. **듀얼 크리처:**
   - 🦀 Hermit Crab — 로컬 AI (Unix Socket)
   - 🦞 Crawfish — 원격 AI (Gateway WebSocket)

5. **상호작용:**
   - Click — 점프 + 텍스트
   - Double-click — 하트 파티클
   - Long press — 정보 카드
   - Right-click — 먹이 (+O₂)

6. **세션 히스토리:**
   - 타임스탬프 (스마트 포맷)
   - 토큰 소비 (1.2K / 2.1M)
   - 도구 호출 요약 (bash·edit·grep +2)
   - 확장 가능한 토큰 분석

**기술 스택:**
- Language: Swift 6.0 (100%)
- Files: 63 Swift files, ~12,600+ LOC
- Assets: 34 sprite sets (41 images)
- Min Deployment: macOS 15.0 Sequoia
- Hardware: MacBook with Notch (2021+)

**설치:**
```bash
# Releases에서 다운로드
# https://github.com/ar-gen-tin/rockpile/releases
```

**Gateway WebSocket 연결:**
- `ws://localhost:18789`
- 실시간 세션, 토큰, 건강 상태
- 역방향 명령 — 노치에서 원격 에이전트로 메시지 전송
- 자동 재연결 (1s → 30s exponential backoff)
- 토큰 인증 (HMAC-SHA256)

**장점:**
- 독창적이고 귀여운 시각화
- 토큰 소비 직관적 표현
- 감정 분석
- Gateway WebSocket 직접 연결

**단점:**
- MacBook 노치 하드웨어 필요 (2021+)
- macOS 15.0+ 필요
- 모바일 미지원
- Swift 전용

**비판적 관점:**
- 노치 활용은 창의적이지만 범용성 낮음
- 하지만 감정 분석, 토큰 시각화 아이디어는 차용 가능
- Gateway WebSocket 연결 방식은 참고 가치 있음

---

### 2.3 데이터 수집 방법 비교

| 방법 | 지연 | 구현 복잡도 | OpenClaw 호환 | 데이터 품도 |
|------|------|------------|---------------|------------|
| Hook 기반 | 실시간 | 낮음 | ✓ 완벽 | 높음 |
| WebSocket 구독 | 실시간 | 중간 | ✓ 완벽 | 높음 |
| Transcript 폴링 | 3-5초 | 낮음 | △ 가능 | 중간 |
| Gateway API | 실시간 | 중간 | ✓ 완벽 | 높음 |

**ActivityClaw vs 기존 폴링:**

| 항목 | Polling (Old) | Event-driven (ActivityClaw) |
|------|--------------|----------------------------|
| 지연 | 3초 | 즉시 (실시간) |
| 데이터 | 전체 transcript 읽기 | 이벤트 직접 수신 |
| 프로세스 | 별도 프로세스 | OpenClaw에 통합 |
| 설정 | 수동 LaunchAgent | 플러그인으로 자동 시작 |
| CLI | 없음 | 풀 CLI 제공 |

---

### 2.4 구현 설계 방안

#### Design A: Hook 기반 (ActivityClaw 스타일)

**아키텍처:**
```
┌─────────────────────────────────────────┐
│        OpenClaw Agent Activity          │
│  - tool calls (read, write, exec, etc.) │
│  - agent spawn/stop                     │
│  - message send/receive                 │
└───────────────┬─────────────────────────┘
                ↓
┌─────────────────────────────────────────┐
│     tool_result_persist Hook            │
│  - Captures: tool, args, result,        │
│    sessionId, agentLabel, timestamp     │
└───────────────┬─────────────────────────┘
                ↓
┌─────────────────────────────────────────┐
│      Activity Store (SQLite)            │
│  - activities table                     │
│  - sessions table                       │
│  - agents table                         │
└───────────────┬─────────────────────────┘
                ↓
        ┌───────┴───────┐
        ↓               ↓
┌───────────────┐ ┌─────────────────┐
│ API Server    │ │ WebSocket       │
│ (Express)     │ │ Server          │
│ GET /activity │ │ /ws (real-time) │
│ GET /stats    │ │                 │
└───────┬───────┘ └────────┬────────┘
        └─────────┬────────┘
                  ↓
      ┌───────────────────────┐
      │  Visualization Layer  │
      │  - Dashboard (React)  │
      │  - Game (PixiJS)      │
      │  - Notch (Swift)      │
      └───────────────────────┘
```

**데이터 모델:**
```typescript
interface Activity {
  id: string;
  timestamp: Date;
  sessionId: string;
  agentLabel: string;
  type: 'file' | 'command' | 'web' | 'message' | 'subagent' | 'thinking';
  tool: string;
  args: Record<string, any>;
  result?: string;
  duration?: number;
  tokens?: {
    input: number;
    output: number;
    cacheRead: number;
    cacheWrite: number;
  };
}

interface Session {
  id: string;
  agentId: string;
  agentLabel: string;
  startedAt: Date;
  endedAt?: Date;
  status: 'active' | 'idle' | 'waiting' | 'error' | 'completed';
  totalTokens: number;
  activityCount: number;
}

interface Agent {
  id: string;
  label: string;
  type: 'main' | 'sub';
  parentAgentId?: string;
  createdAt: Date;
  totalSessions: number;
  totalTokens: number;
}
```

**Hook 구현 예시:**
```typescript
// openclaw-plugin-activity-tracker/src/hooks/activity.ts
import { HookRegistry, ToolResultEvent } from '@openclaw/types';

export function registerActivityHook(store: ActivityStore) {
  return (hooks: HookRegistry) => {
    hooks.on('tool_result_persist', async (event: ToolResultEvent) => {
      const activity: Activity = {
        id: generateId(),
        timestamp: new Date(),
        sessionId: event.sessionId,
        agentLabel: event.agentLabel,
        type: classifyActivity(event.tool),
        tool: event.tool,
        args: event.args,
        result: summarizeResult(event.result),
        duration: event.duration,
        tokens: event.tokens,
      };

      await store.logActivity(activity);

      // WebSocket broadcast
      broadcastActivity(activity);
    });
  };
}

function classifyActivity(tool: string): ActivityType {
  if (['read', 'write', 'edit'].includes(tool)) return 'file';
  if (['exec', 'process'].includes(tool)) return 'command';
  if (['web_search', 'web_fetch', 'browser'].includes(tool)) return 'web';
  if (['message', 'sessions_send'].includes(tool)) return 'message';
  if (['sessions_spawn', 'subagents'].includes(tool)) return 'subagent';
  return 'command';
}
```

**API Server:**
```typescript
// server.ts
import express from 'express';
import { ActivityStore } from './store';

const app = express();
const store = new ActivityStore();

// GET /api/activities
app.get('/api/activities', async (req, res) => {
  const { sessionId, agentLabel, type, limit = 100, offset = 0 } = req.query;
  const activities = await store.getActivities({
    sessionId: sessionId as string,
    agentLabel: agentLabel as string,
    type: type as ActivityType,
    limit: Number(limit),
    offset: Number(offset),
  });
  res.json(activities);
});

// GET /api/stats
app.get('/api/stats', async (req, res) => {
  const stats = await store.getStats();
  res.json(stats);
});

// GET /api/sessions/:id
app.get('/api/sessions/:id', async (req, res) => {
  const session = await store.getSession(req.params.id);
  res.json(session);
});

// GET /api/agents
app.get('/api/agents', async (req, res) => {
  const agents = await store.getAgents();
  res.json(agents);
});

app.listen(18796, () => {
  console.log('Activity API server running on port 18796');
});
```

**WebSocket Server:**
```typescript
// websocket.ts
import WebSocket from 'ws';

const wss = new WebSocket.Server({ port: 18797 });

const clients = new Set<WebSocket>();

wss.on('connection', (ws) => {
  clients.add(ws);

  ws.on('close', () => {
    clients.delete(ws);
  });
});

export function broadcastActivity(activity: Activity) {
  const message = JSON.stringify({
    type: 'activity',
    payload: activity,
  });

  clients.forEach((client) => {
    if (client.readyState === WebSocket.OPEN) {
      client.send(message);
    }
  });
}

export function broadcastSessionUpdate(session: Session) {
  const message = JSON.stringify({
    type: 'session',
    payload: session,
  });

  clients.forEach((client) => {
    if (client.readyState === WebSocket.OPEN) {
      client.send(message);
    }
  });
}
```

---

#### Design B: Gateway WebSocket 구독 (rockpile 스타일)

**아키텍처:**
```
┌─────────────────────────────────────────┐
│        OpenClaw Gateway                 │
│  - WebSocket Server (port 18789)        │
│  - Event Broadcasting                   │
└───────────────┬─────────────────────────┘
                ↓
┌─────────────────────────────────────────┐
│   Visualization Client (WebSocket)      │
│  - Connect to Gateway                   │
│  - Subscribe to agent events            │
│  - Real-time rendering                  │
└─────────────────────────────────────────┘
```

**WebSocket 연결:**
```typescript
// gateway-client.ts
import WebSocket from 'ws';

interface GatewayConfig {
  url: string; // ws://localhost:18789
  token?: string;
}

class GatewayClient {
  private ws: WebSocket;
  private reconnectAttempts = 0;
  private maxReconnectAttempts = 30;
  private reconnectDelay = 1000; // Start with 1s

  constructor(private config: GatewayConfig) {
    this.connect();
  }

  private connect() {
    this.ws = new WebSocket(this.config.url);

    this.ws.on('open', () => {
      console.log('Connected to Gateway');
      this.reconnectAttempts = 0;
      this.reconnectDelay = 1000;

      // Authenticate
      this.send('connect', {
        auth: { token: this.config.token },
      });

      // Subscribe to agent events
      this.subscribe(['agent', 'chat', 'presence']);
    });

    this.ws.on('message', (data) => {
      const message = JSON.parse(data.toString());
      this.handleMessage(message);
    });

    this.ws.on('close', () => {
      this.reconnect();
    });

    this.ws.on('error', (error) => {
      console.error('WebSocket error:', error);
    });
  }

  private reconnect() {
    if (this.reconnectAttempts < this.maxReconnectAttempts) {
      this.reconnectAttempts++;
      const delay = Math.min(this.reconnectDelay * Math.pow(2, this.reconnectAttempts - 1), 30000);
      console.log(`Reconnecting in ${delay}ms (attempt ${this.reconnectAttempts})`);
      setTimeout(() => this.connect(), delay);
    }
  }

  private send(method: string, params: any) {
    const message = JSON.stringify({
      type: 'req',
      id: generateId(),
      method,
      params,
    });
    this.ws.send(message);
  }

  private subscribe(events: string[]) {
    this.send('subscribe', { events });
  }

  private handleMessage(message: any) {
    if (message.type === 'event') {
      switch (message.event) {
        case 'agent':
          this.handleAgentEvent(message.payload);
          break;
        case 'chat':
          this.handleChatEvent(message.payload);
          break;
        case 'presence':
          this.handlePresenceEvent(message.payload);
          break;
      }
    }
  }

  private handleAgentEvent(payload: any) {
    // Process agent activity
    const { sessionId, agentLabel, tool, args, result } = payload;
    // Update visualization
  }

  private handleChatEvent(payload: any) {
    // Process chat message
  }

  private handlePresenceEvent(payload: any) {
    // Process presence update
  }
}
```

---

#### Design C: 하이브리드 (Hook + WebSocket + Visualization)

**아키텍처:**
```
┌──────────────────────────────────────────┐
│         OpenClaw Agent Activity          │
└───────────────┬──────────────────────────┘
                ↓
┌──────────────────────────────────────────┐
│    Plugin Layer (Multiple Hooks)         │
│  - tool_result_persist                   │
│  - agent_started / agent_stopped         │
│  - message_received / message_sent       │
└───────────────┬──────────────────────────┘
                ↓
┌──────────────────────────────────────────┐
│   Activity Engine                        │
│  - Event Processing                      │
│  - State Management                      │
│  - Token Tracking                        │
│  - Emotion Analysis (optional)           │
└───────┬──────────────┬───────────────────┘
        │              │
        ↓              ↓
┌───────────────┐ ┌────────────────────┐
│  Data Layer   │ │  Real-time Layer   │
│  - SQLite     │ │  - WebSocket       │
│  - Queries    │ │  - Broadcasting    │
└───────┬───────┘ └────────┬───────────┘
        └─────────┬────────┘
                  ↓
      ┌───────────────────────┐
      │  Visualization Layer  │
      │  ┌─────────────────┐  │
      │  │ Dashboard       │  │
      │  │ (React + REST)  │  │
      │  └─────────────────┘  │
      │  ┌─────────────────┐  │
      │  │ Game View       │  │
      │  │ (PixiJS + WS)   │  │
      │  └─────────────────┘  │
      │  ┌─────────────────┐  │
      │  │ Compact View    │  │
      │  │ (Notch/Widget)  │  │
      │  └─────────────────┘  │
      └───────────────────────┘
```

**컴포넌트 구조:**
```
openclaw-plugin-activity-visualizer/
├── src/
│   ├── index.ts              # Plugin entry
│   ├── hooks/
│   │   ├── tool-activity.ts  # Tool calls
│   │   ├── agent-lifecycle.ts # Start/stop
│   │   └── messages.ts       # Messages
│   ├── engine/
│   │   ├── processor.ts      # Event processing
│   │   ├── state.ts          # State management
│   │   ├── tokens.ts         # Token tracking
│   │   └── emotions.ts       # Emotion analysis
│   ├── data/
│   │   ├── store.ts          # SQLite interface
│   │   └── migrations.ts     # DB migrations
│   ├── server/
│   │   ├── api.ts            # REST API
│   │   └── websocket.ts      # WebSocket
│   └── types.ts              # Type definitions
├── dashboard/
│   ├── src/
│   │   ├── App.tsx
│   │   ├── components/
│   │   ├── hooks/
│   │   └── utils/
│   └── public/
├── game-view/
│   ├── src/
│   │   ├── scenes/
│   │   ├── entities/
│   │   └── renderers/
│   └── assets/
│       ├── sprites/
│       └── audio/
└── package.json
```

---

### 2.5 시각화 레이어 설계

#### Option A: Dashboard (분석 중심)

**기술 스택:** React + TypeScript + Chart.js/D3

**레이아웃:**
```
┌──────────────────────────────────────────┐
│  ActivityClaw Dashboard                  │
├─────────────────────┬────────────────────┤
│  Activity Feed      │  Statistics        │
│  ┌───────────────┐  │  ┌──────────────┐  │
│  │ 09:32:15      │  │  │ Total: 1,247 │  │
│  │ 📝 edit       │  │  │ Last Hour: 89│  │
│  │ research.md   │  │  │ Agents: 3    │  │
│  ├───────────────┤  │  └──────────────┘  │
│  │ 09:32:10      │  │                     │
│  │ ⚡ exec       │  │  Filters           │
│  │ npm test      │  │  [All] [Files]     │
│  ├───────────────┤  │  [Commands] [Web]  │
│  │ 09:31:45      │  │                     │
│  │ 🔍 web_fetch  │  │  Active Agents     │
│  │ docs.claw.ai  │  │  ┌──────────────┐  │
│  └───────────────┘  │  │ 🟢 research  │  │
│                     │  │ 🟡 main       │  │
│                     │  │ 🔵 sub-1      │  │
│                     │  └──────────────┘  │
└─────────────────────┴────────────────────┘
```

**장점:**
- 구현 용이
- 분석에 적합
- 확장성

**단점:**
- 몰입도 낮음
- 게임적 요소 없음

---

#### Option B: Game View (몰입형)

**기술 스택:** PixiJS + React + TypeScript

**레이아웃 (codemap 스타일):**
```
┌──────────────────────────────────────────┐
│  pixel-office                            │
├──────────────────────────────────────────┤
│  ┌──────────┐  ┌──────────┐              │
│  │ Research │  │  Coding  │              │
│  │  Room    │  │  Room    │              │
│  │  ┌────┐  │  │  ┌────┐  │              │
│  │  │🤖 │  │  │  │🤖 │  │              │
│  │  │AI1 │  │  │  │AI2 │  │              │
│  │  └────┘  │  │  └────┘  │              │
│  │  💭 read │  │  💬 edit │              │
│  │  file.md │  │  code.ts │              │
│  └──────────┘  └──────────┘              │
│                                          │
│  ┌──────────────────────────┐            │
│  │     Coffee Break Area    │            │
│  │         ┌────┐           │            │
│  │         │🤖 │ (idle)    │            │
│  │         │AI3 │           │            │
│  │         └────┘           │            │
│  └──────────────────────────┘            │
│                                          │
│  Token Usage: [████████░░] 80%           │
└──────────────────────────────────────────┘
```

**에이전트 상태 애니메이션:**
- 🚶 Walking — 방 간 이동
- 🪑 Sitting — 파일 읽기/쓰기
- 💭 Thinking — LLM 추론
- ⌨️ Typing — 코드 작성
- ☕ Idle — 대기
- 🦘 Bouncing — 입력 대기

**방 테마:**
- Research — 파랑, 책장, 화이트보드
- Coding — 초록, 모니터, 키보드
- Testing — 복숭아, 체크마크
- Deployment — 보라, 서버 랙

**장점:**
- 높은 몰입도
- 직관적
- 재미있음

**단점:**
- 구현 복잡
- 에셋 제작 필요
- 성능 고려 필요

---

#### Option C: Compact View (노치/위젯)

**기술 스택:** Swift (macOS) / Electron (크로스 플랫폼)

**레이아웃 (rockpile 스타일):**
```
┌────────────────────────┐
│  MacBook Notch         │
│  ┌──────────────────┐  │
│  │  🦞              │  │
│  │  (thinking)      │  │
│  │  💭 read file... │  │
│  │  [████░░░░] 65%  │  │
│  └──────────────────┘  │
└────────────────────────┘
```

**상태 표시:**
- 🦞 애니메이션 — 활동 상태
- 💭 말풍선 — 현재 작업
- [████░░░░] — 토큰 사용량

**장점:**
- 언제나 보임
- 비침습적
- 빠른 확인

**단점:**
- 공간 제한
- 하드웨어 의존 (노치)
- 세부 정보 표시 어려움

---

### 2.6 pixel-office 구현 로드맵

**Phase 1: Foundation (Week 1-2)**

**목표:** 데이터 수집 및 저장

**작업:**
1. OpenClaw 플러그인 스캐폴드 생성
2. `tool_result_persist` hook 구현
3. SQLite 데이터베이스 설정
4. 기본 API server (GET /activities, /stats)

**산출물:**
```bash
openclaw-plugin-pixel-office/
├── src/
│   ├── index.ts
│   ├── hooks/
│   │   └── activity.ts
│   ├── data/
│   │   └── store.ts
│   └── server/
│       └── api.ts
└── package.json
```

---

**Phase 2: Real-time Layer (Week 3-4)**

**목표:** 실시간 스트리밍

**작업:**
1. WebSocket server 구현
2. Activity 브로드캐스팅
3. Session 상태 관리
4. React Dashboard 기본 구조

**산출물:**
```bash
├── src/
│   └── server/
│       ├── api.ts
│       └── websocket.ts  # NEW
├── dashboard/
│   ├── src/
│   │   ├── App.tsx       # NEW
│   │   ├── components/
│   │   │   ├── ActivityFeed.tsx
│   │   │   └── Stats.tsx
│   │   └── hooks/
│   │       └── useWebSocket.ts
│   └── package.json      # NEW
```

---

**Phase 3: Game View (Week 5-8)**

**목표:** PixiJS 기반 게임 뷰

**작업:**
1. PixiJS 캔버스 설정
2. 에이전트 스프라이트 애니메이션
3. 방 레이아웃 시스템
4. 상태별 애니메이션
5. WebSocket 통합

**산출물:**
```bash
├── game-view/
│   ├── src/
│   │   ├── main.ts
│   │   ├── scenes/
│   │   │   └── OfficeScene.ts
│   │   ├── entities/
│   │   │   ├── Agent.ts
│   │   │   ├── Room.ts
│   │   │   └── Desk.ts
│   │   └── renderers/
│   │       └── SpriteRenderer.ts
│   ├── assets/
│   │   ├── sprites/
│   │   │   ├── agent-idle.png
│   │   │   ├── agent-walk.png
│   │   │   └── agent-work.png
│   │   └── tilesets/
│   │       └── office-tiles.png
│   └── package.json      # NEW
```

---

**Phase 4: Polish & Features (Week 9-12)**

**목표:** UX 개선 및 고급 기능

**작업:**
1. Stuck detection (바운스 애니메이션)
2. Speech bubbles (tool, file 표시)
3. 토큰 사용량 시각화
4. 감정 분석 (옵션)
5. 히스토리 재생
6. 커스터마이징 (방 배치, 테마)

**산출물:**
- Stuck detection 로직
- Speech bubble 컴포넌트
- Token meter UI
- Emotion analyzer (옵션)
- History playback controls
- Settings panel

---

**Phase 5: Integration & Testing (Week 13-14)**

**목표:** 통합 및 안정화

**작업:**
1. OpenClaw 플러그인 최종 통합
2. 성능 최적화
3. 버그 수정
4. 문서화
5. 배포

**산출물:**
- npm 패키지 배포
- README.md
- API 문서
- 사용 예제

---

## 3. 장단점

### 3.1 Hook 기반 접근

**장점:**
1. OpenClaw에 완전히 통합
2. 실시간, 이벤트 기반
3. 모든 도구 호출 캡처
4. 세션, 에이전트 메타데이터 접근
5. 최소 오버헤드

**단점:**
1. OpenClaw 플러그인 개발 필요
2. 데이터베이스 유지보수
3. 서버 실행 필요

---

### 3.2 Gateway WebSocket 구독

**장점:**
1. 별도 플러그인 불필요
2. Gateway 이벤트 직접 수신
3. 클라이언트 독립적

**단점:**
1. Gateway에 의존
2. 인증/토큰 관리
3. 연결 안정성 고려

---

### 3.3 하이브리드

**장점:**
1. 유연성
2. 다양한 시각화 옵션
3. 확장성

**단점:**
1. 구현 복잡도 증가
2. 컴포넌트 간 동기화
3. 유지보수 부담

---

## 4. 결론

### 4.1 추천 접근: Hook 기반 + Game View

**이유:**
1. **Hook 기반** — OpenClaw에 완전히 통합, 실시간, 신뢰성
2. **Game View** — 몰입도, 재미, 직관성
3. **선택적 Dashboard** — 분석 필요 시

**아키텍처:**
```
OpenClaw Plugin (Hook)
  → Activity Store (SQLite)
  → WebSocket Server
  → Game View (PixiJS)
```

---

### 4.2 핵심 기능 우선순위

**Must Have (Phase 1-2):**
1. Hook 기반 데이터 수집
2. SQLite 저장
3. REST API
4. 기본 Dashboard

**Should Have (Phase 3):**
1. WebSocket 실시간
2. PixiJS Game View
3. 에이전트 애니메이션
4. 방 레이아웃

**Could Have (Phase 4):**
1. Stuck detection
2. Speech bubbles
3. 토큰 시각화
4. 감정 분석

**Nice to Have (Phase 5+):**
1. 히스토리 재생
2. 커스터마이징
3. 노치 뷰
4. 모바일

---

### 4.3 기술 스택 최종 권장

**Backend:**
- Node.js + TypeScript
- SQLite (better-sqlite3)
- Express (REST API)
- ws (WebSocket)

**Frontend:**
- React + TypeScript
- PixiJS (Game View)
- Chart.js (Dashboard, 옵션)
- Tailwind CSS

**플러그인:**
- @openclaw/types
- OpenClaw Plugin API

**빌드:**
- Vite (Frontend)
- tsup (Backend)
- esbuild (플러그인)

---

### 4.4 ActivityClaw 활용 전략

**옵션 A: ActivityClaw 기반 확장**
- ActivityClaw를 fork
- Game View 레이어 추가
- PixiJS 통합
- 커스터마이징

**장점:**
- 이미 검증된 데이터 수집
- 빠른 시작
- 커뮤니티 기여 가능

**옵션 B: 새로 작성**
- 처음부터 설계
- pixel-office 요구사항에 맞춤
- 완전한 제어

**추천:** 옵션 A (MVP), 옵션 B (장기)

---

## 5. 참고 자료

### 구현체
- ActivityClaw: https://github.com/rmruss2022/ActivityClaw
- codemap: https://github.com/JamsusMaximus/codemap
- rockpile: https://github.com/ar-gen-tin/rockpile
- thegrid: https://github.com/Kvadratni/thegrid

### OpenClaw 문서
- Architecture: https://docs.openclaw.ai/concepts/architecture
- Plugin Development: https://docs.openclaw.ai/plugins
- Gateway Protocol: https://docs.openclaw.ai/gateway/protocol

### 기술 스택
- PixiJS: https://pixijs.com/
- React: https://react.dev/
- SQLite: https://www.sqlite.org/
- WebSocket: https://developer.mozilla.org/en-US/docs/Web/API/WebSocket

---

_작성자: Hank McCoy_
_조사 방법: GitHub, OpenClaw 공식 문서, 관련 프로젝트 분석_
