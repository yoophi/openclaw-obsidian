---
tags:
  - openclaw
  - telegram
  - plugin
  - agent
date: 2026-03-15
---

# OpenClaw Agent 간 메시지 공유 방법

조사 일자: 2026-03-15

## 문제 상황

Telegram 그룹 채팅에서 한 agent(예: Kitty)가 작성한 메시지를 다른 agent(예: Hank)가 읽을 수 없음.

## 원인 분석

### Telegram Bot API의 설계적 제약

Telegram Bot API는 **한 bot이 생성한 메시지를 다른 bot에게 전달하지 않음**. 이는 의도적인 설계로, 무한 봇 루프를 방지하기 위함.

### OpenClaw의 Context 격리

각 agent는 독립적인 세션에서 실행되며, 서로의 inbound context는 격리되어 있음:
- Kitty의 메시지 → `agent:kitty:main` 세션에서만 처리
- Hank의 메시지 → `agent:research:main` 세션에서만 처리

## 해결 방안

### 1. sessions_send 사용 (현재 가능)

한 agent가 명시적으로 다른 세션에 메시지 전송:

```typescript
sessions_send({
  sessionKey: "agent:research:main",
  message: "Kitty가 말함: ..."
})
```

**장점:**
- 즉시 사용 가능
- 간단한 구현

**단점:**
- 수동 호출 필요
- 모든 메시지를 전달하면 토큰 비용 증가

### 2. Plugin으로 Hook 등록 (자동화)

Plugin에서 lifecycle hook을 사용해 agent 응답을 자동으로 다른 세션으로 전달:

```typescript
// plugin 예시
export default function register(api) {
  api.on("after_agent_reply", async (event, ctx) => {
    // Kitty가 응답한 후 자동으로 Hank에게 전송
    if (ctx.agentId === "kitty") {
      await api.runtime.sessionsSend({
        sessionKey: "agent:research:main",
        message: `Kitty: ${ctx.replyText}`,
      });
    }
  });
}
```

**장점:**
- 완전 자동화
- 코드 레벨 제어 가능

**단점:**
- Plugin 개발 필요
- Gateway 재시작 필요

### 3. 공유 메모리 파일 사용

Plugin에서 파일에 기록하고 다른 agent가 읽는 방식:

```typescript
// Kitty plugin - 응답을 파일에 기록
api.on("after_agent_reply", async (event, ctx) => {
  const fs = require("fs");
  fs.appendFileSync(
    "/tmp/openclaw-shared/kitty-log.json",
    JSON.stringify({
      timestamp: Date.now(),
      message: ctx.replyText,
      context: ctx.inboundContext
    }) + "\n"
  );
});
```

**장점:**
- 세션 간 완전한 격리 유지
- 필요할 때만 읽기 가능
- 히스토리 보존

**단점:**
- 파일 관리 필요
- 실시간성 떨어짐

### 4. Plugin으로 Tool 등록

Agent가 명시적으로 호출할 수 있는 tool 제공:

```typescript
api.registerTool({
  name: "share_to_hank",
  description: "Share message with Hank agent",
  handler: async (ctx) => {
    await sessions_send({
      sessionKey: "agent:research:main",
      message: ctx.args.message
    });
    return { ok: true };
  }
});
```

**장점:**
- Agent가 선택적으로 사용
- 명시적인 의도 전달

**단점:**
- Agent가 tool 호출해야 함

## 추천 방식

### 가장 실용적인 조합

1. **공유 파일 + Hook**
   - Kitty가 응답할 때 자동으로 공유 파일에 기록
   - Hank가 필요할 때 파일 읽기

2. **명시적 Tool**
   - 중요한 메시지는 `share_to_hank` tool로 명시적 전달

### 장점

- 모든 메시지가 아닌 **중요한 것만** 선택적으로 전달 가능
- 토큰 낭비 최소화
- 보안 격리 유지
- 히스토리 보존

## Plugin 개발 리소스

### Plugin 구조

```
openclaw-agent-bridge/
├── openclaw.plugin.json
├── index.ts
└── package.json
```

### openclaw.plugin.json

```json
{
  "id": "agent-bridge",
  "name": "Agent Bridge",
  "description": "Bridge messages between agents",
  "configSchema": {
    "type": "object",
    "properties": {
      "logPath": { "type": "string" }
    }
  }
}
```

### Plugin 로드 방법

1. **Workspace extensions**: `<workspace>/.openclaw/extensions/*.ts`
2. **Global extensions**: `~/.openclaw/extensions/*.ts`
3. **Config paths**: `plugins.load.paths` 설정

## 참고 자료

- [OpenClaw Plugin 문서](/tools/plugin)
- [Plugin Manifest](/plugins/manifest)
- [Sub-Agents](/tools/subagents)
- [Multi-Agent Sandbox & Tools](/tools/multi-agent-sandbox-tools)

## 관련 설정

### sessions_send 권한

```json5
{
  tools: {
    allow: ["sessions_send"],
    sessions: { visibility: "tree" }
  }
}
```

### Plugin enable

```json5
{
  plugins: {
    entries: {
      "agent-bridge": { enabled: true }
    }
  }
}
```
