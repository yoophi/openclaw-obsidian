---
tags:
  - ACP
  - Agent-Client-Protocol
  - 프로토콜
  - MCP
  - A2A
  - OpenClaw
  - IDE
  - 에이전트
date: 2026-04-11
---

# ACP (Agent Client Protocol) 심층 조사

조사 일자: 2026-04-11

---

## 1. 핵심 요약

**ACP (Agent Client Protocol)** 는 코드 에디터/IDE와 AI 코딩 에이전트 간의 통신을 표준화하는 오픈 프로토콜이다.

**한 줄 비유:** LSP(Language Server Protocol)가 언어 지원을 표준화했다면, ACP는 **에이전트 지원을 표준화**한다.

**핵심 가치:**
- 한 번 ACP를 구현하면 모든 ACP 호환 에디터에서 작동
- 하나의 ACP 에디터는 모든 ACP 호환 에이전트에 접근
- 에디터와 에이전트가 독립적으로 발전 가능

---

## 2. ACP란 무엇인가

### 2.1 배경

AI 코딩 에이전트(Claude Code, Codex, Gemini CLI 등)와 에디터(Zed, VS Code, JetBrains 등)는 긴밀하게 연동되어야 하지만, 기존에는 **에이전트-에디터 조합마다 커스텀 통합이 필요**했다.

이로 인한 문제:
- **통합 오버헤드**: 새로운 에이전트-에디터 조합마다 커스텀 작업 필요
- **제한적 호환성**: 에이전트는 일부 에디터만 지원
- **벤더 락인**: 에이전트 선택 = 사용 가능한 인터페이스 제한

### 2.2 해결책

ACP는 **표준화된 프로토콜**로 이 문제를 해결한다.

> "Agents that implement ACP work with any compatible editor. Editors that support ACP gain access to the entire ecosystem of ACP-compatible agents."

### 2.3 설계 철학

| 원칙 | 설명 |
|------|------|
| **MCP-friendly** | JSON-RPC 기반, MCP 타입 재사용 → 공통 데이터 타입의 중복 구현 불필요 |
| **UX-first** | 에이전트의 의도를 명확하게 렌더링할 수 있을 만큼 유연하되, 불필요한 추상화는 배제 |
| **Trusted** | 사용자가 신뢰하는 모델과 에디터 환경에서 동작. 도구 호출에 대한 제어권 유지 |

---

## 3. 아키텍처

### 3.1 기본 구조

```
┌─────────────┐     JSON-RPC (stdio)     ┌─────────────┐
│   Client     │ ◄──────────────────────► │    Agent     │
│  (에디터)    │                           │  (에이전트)  │
└──────┬───────┘                           └──────┬───────┘
       │                                          │
       │  MCP Server 설정 전달                     │  LLM 호출
       ▼                                          ▼
┌─────────────┐                           ┌─────────────┐
│  MCP Server │                           │     LLM     │
│ (도구/데이터)│                           │  (GPT 등)   │
└─────────────┘                           └─────────────┘
```

### 3.2 통신 방식

| 시나리오 | 전송 계층 | 설명 |
|----------|----------|------|
| **로컬** | stdio (JSON-RPC) | 에디터가 에이전트를 서브프로세스로 실행 |
| **리모트** | HTTP / WebSocket | 클라우드/별도 인프라에 호스팅 (초안 단계) |

**stdio 상세:**
- 클라이언트가 에이전트를 서브프로세스로 실행
- stdin/stdout으로 JSON-RPC 메시지 교환 (줄바꿈으로 구분)
- stderr은 로깅 용도로 사용
- 하나의 연결이 여러 세션을 동시에 지원

### 3.3 메시지 모델

JSON-RPC 2.0 기반:
- **Methods**: 요청-응답 (결과 또는 에러 기대)
- **Notifications**: 단방향 (응답 기대 안 함)

---

## 4. 프로토콜 흐름

### 4.1 전체 라이프사이클

```
1. 초기화 (Initialization)
   Client → Agent: initialize (버전 협상, 기능 교환)
   Client → Agent: authenticate (필요시)

2. 세션 설정 (Session Setup)
   Client → Agent: session/new (새 세션 생성)
   또는
   Client → Agent: session/load (기존 세션 재개)

3. 프롬프트 턴 (Prompt Turn) — 반복
   Client → Agent: session/prompt (사용자 메시지)
   Agent → Client: session/update (진행 상황 스트리밍)
   Agent → Client: session/request_permission (권한 요청)
   Client → Agent: 권한 응답
   Agent → Client: session/prompt 응답 (stopReason)

4. 취소 (언제든 가능)
   Client → Agent: session/cancel
```

### 4.2 프롬프트 턴 상세

프롬프트 턴은 사용자 메시지로 시작하여 에이전트가 응답을 완료할 때까지의 전체 주기:

1. **사용자 메시지** — `session/prompt`로 텍스트, 이미지, 파일 등 전송
2. **에이전트 처리** — LLM이 응답 생성 (텍스트, 도구 호출, 또는 둘 다)
3. **출력 스트리밍** — `session/update`로 실시간 업데이트:
   - 실행 계획 (Plan)
   - 메시지 청크 (agent_message_chunk)
   - 도구 호출 상태 (tool_call / tool_call_update)
4. **권한 요청** — 도구 실행 전 사용자 승인 가능 (`session/request_permission`)
5. **완료** — `stopReason`과 함께 턴 종료

### 4.3 주요 Agent 메서드

| 메서드 | 유형 | 설명 |
|--------|------|------|
| `initialize` | 필수 | 버전 협상, 기능 교환 |
| `authenticate` | 필수 | 인증 (필요시) |
| `session/new` | 필수 | 새 세션 생성 |
| `session/prompt` | 필수 | 사용자 프롬프트 전송 |
| `session/load` | 선택 | 기존 세션 재개 |
| `session/set_mode` | 선택 | 에이전트 모드 전환 |
| `session/cancel` | 알림 | 실행 취소 |

### 4.4 주요 Client 메서드

| 메서드 | 유형 | 설명 |
|--------|------|------|
| `session/request_permission` | 필수 | 도구 호출 권한 요청 |
| `fs/read_text_file` | 선택 | 파일 읽기 |
| `fs/write_text_file` | 선택 | 파일 쓰기 |
| `terminal/create` | 선택 | 터미널 생성 |
| `session/update` | 알림 | 세션 상태 업데이트 |

---

## 5. 기존 기술과의 비교

### 5.1 ACP vs MCP vs A2A

현재 AI 에이전트 생태계의 3대 프로토콜 비교:

| 항목 | **MCP** (Model Context Protocol) | **ACP** (Agent Client Protocol) | **A2A** (Agent-to-Agent) |
|------|------|------|------|
| **개발사** | Anthropic | IBM → Linux Foundation | Google → Linux Foundation |
| **목적** | AI 모델에 **도구/데이터** 제공 | 에디터와 에이전트 **통신** | 에이전트 간 **협업** |
| **비유** | USB 포트 (외부 기기 연결) | 디스플레이 케이블 (UI-에이전트) | 네트워크 프로토콜 (서버 간) |
| **통신** | JSON-RPC (stdio, HTTP/SSE) | JSON-RPC (stdio, HTTP/WS) | HTTP (REST + SSE) |
| **상태** | 기본적으로 무상태 | 세션 기반 (상태 유지) | 태스크 기반 (상태 유지) |
| **스트리밍** | 제한적 | 네이티브 지원 | 지원 |
| **메모리** | 단일 서버 내만 | 세션 간 메모리 지원 | 태스크 컨텍스트 |
| **비동기** | 제한적 | 네이티브 지원 (Human-in-the-loop) | 장기 실행 태스크 지원 |
| **주요 사용** | Claude, Cursor, VS Code | Zed, JetBrains, Codex, Claude Code | 다중 에이전트 오케스트레이션 |

### 5.2 핵심 차이점 분석

**MCP = 도구 제공 프로토콜**
- AI 모델이 외부 데이터 소스(DB, 파일시스템, API)에 접근할 수 있게 함
- 간단하고 채택이 빠름
- 스트리밍, 메모리, 비동기 실행이 약함

**ACP = 에이전트-클라이언트 통신 프로토콜**
- 에디터가 AI 에이전트와 대화하는 방식을 표준화
- LSP와 유사한 패턴 (한 번 구현, 어디서나 작동)
- 스트리밍, 메모리, 비동기 실행을 네이티브로 지원
- MCP 타입을 재사용하여 호환성 유지

**A2A = 에이전트 간 협업 프로토콜**
- 서로 다른 에이전트가 태스크를 위임하고 협업
- 장기 실행 태스크, 에이전트 발견(Discovery) 지원
- 멀티 에이전트 시스템에 특화

### 5.3 보완 관계

세 프로토콜은 경쟁보다 **보완** 관계:

```
에디터 ←── ACP ──→ 에이전트 ←── MCP ──→ 도구/데이터
                        ↕
                       A2A
                        ↕
                     다른 에이전트
```

ACP의 아키텍처 문서에서도 MCP 서버 설정을 에이전트에 전달하는 패턴을 명시적으로 다룬다.

---

## 6. ACP 생태계

### 6.1 지원 에이전트 (30+)

| 카테고리 | 에이전트 |
|----------|---------|
| **주요 코딩** | Claude Agent, Codex CLI, Cursor, GitHub Copilot, Gemini CLI |
| **오픈소스** | OpenClaw, OpenCode, Cline, Goose, Pi, OpenHands |
| **기업용** | Augment Code, Factory Droid, Junie (JetBrains), Kiro |
| **기타** | Blackbox AI, fast-agent, Kimi CLI, Qwen Code, Mistral Vibe |

### 6.2 지원 클라이언트

**에디터/IDE:**
- Zed (최초 도입)
- JetBrains
- VS Code (확장)
- Neovim (CodeCompanion, agentic.nvim, avante.nvim)
- Emacs (agent-shell)
- Obsidian (Agent Client 플러그인)
- Unity (Unity Agent Client)

**모바일:**
- Agmente (iOS)
- Happy (iOS, Android, Web)
- Mobvibe (iOS, Android, Web)

**메시징:**
- Telegram (Telegram ACP Bot, Telegram-ACP)
- Discord (ACP Discord)
- Slack (duckdb-claude-slack, Juan)
- WeChat (WeChat ACP)

**프레임워크:**
- LangChain/LangGraph (Deep Agents ACP)
- LlamaIndex (workflows-acp)
- JetBrains Koog

### 6.3 언어별 라이브러리

- TypeScript, Python, Java, Kotlin, Rust

---

## 7. OpenClaw와 함께 사용하기

OpenClaw에서 ACP는 **두 가지 방향**으로 작동한다.

### 7.1 방향 A: 에디터 → OpenClaw (브릿지 모드)

에디터/IDE가 ACP 클라이언트로 동작하고, **OpenClaw가 ACP 서버**로 동작:

```
Zed / VS Code / JetBrains
       ↓ ACP (stdio)
  openclaw acp (브릿지)
       ↓ WebSocket
  OpenClaw Gateway
```

**설정 (Zed 예시):**
```json
{
  "agent_servers": {
    "OpenClaw": {
      "type": "custom",
      "command": "openclaw",
      "args": ["acp"]
    }
  }
}
```

**특징:**
- `openclaw acp` 명령으로 실행
- 에디터의 ACP 통신을 Gateway로 라우팅
- 세션 관리, 프롬프트 전달, 기본 스트리밍 지원
- MCP 서버, 파일시스템, 터미널은 아직 미지원

### 7.2 방향 B: OpenClaw → 외부 에이전트 (하네스 모드)

OpenClaw가 채팅에서 외부 코딩 에이전트를 ACP를 통해 실행:

```
사용자 (Telegram/Discord/채팅)
       ↓ 메시지
  OpenClaw Gateway
       ↓ acpx 플러그인
  Codex / Claude Code / Gemini CLI
```

**사용 명령어:**

| 명령 | 설명 |
|------|------|
| `/acp spawn codex --bind here` | 현재 대화에 Codex 세션 바인딩 |
| `/acp spawn claude --thread auto` | 스레드에 Claude 세션 생성 |
| `/acp spawn gemini --mode oneshot` | 일회성 Gemini 실행 |
| `/acp spawn codex --cwd /path` | 작업 디렉토리 지정 |
| `/acp doctor` | ACP 상태 진단 |
| `/acp status` | 실행 중인 세션 확인 |
| `/acp steer <id> <메시지>` | 실행 중인 세션에 지시 |
| `/acp cancel` | 현재 턴 취소 |
| `/acp close` | 세션 종료 |
| `/acp model <모델>` | 모델 변경 |
| `/acp permissions <프로필>` | 권한 설정 |
| `/acp timeout <초>` | 타임아웃 설정 |

### 7.3 실제 워크플로우 예시

**시나리오 1: Discord에서 Codex로 코드 작성**
```
사용자: /acp spawn codex --mode persistent --thread auto
Bot: ✅ Codex 세션 생성됨 (스레드에 바인딩)
사용자: 이 리포지토리의 테스트 커버리지를 높여줘
Codex: [파일 탐색 → 테스트 작성 → 실행 결과 보고]
```

**시나리오 2: Zed에서 OpenClaw 사용**
```
Zed 에디터 → Agent Panel → OpenClaw 선택
→ OpenClaw 에이전트와 대화하며 코드 수정
→ 파일 읽기/쓰기는 Gateway를 통해 처리
```

**시나리오 3: Telegram에서 Claude Code로 디버깅**
```
사용자: /acp spawn claude --bind here --cwd ~/project
사용자: auth.ts에서 403 에러가 나는데 원인 찾아줘
Claude Code: [코드 분석 → 원인 파악 → 수정 제안]
```

### 7.4 권한 관리

| 권한 프로필 | 동작 |
|-------------|------|
| `approve-all` | 모든 파일 쓰기/셸 명령 자동 승인 |
| `approve-reads` | 읽기만 자동 승인, 쓰기/실행은 승인 요청 |
| `deny-all` | 모든 권한 요청 거부 |

비대화형 세션에서 권한 프롬프트 처리:
| 값 | 동작 |
|----|------|
| `fail` | 세션 중단 (기본값) |
| `deny` | 권한 거부하고 계속 진행 |

### 7.5 ACP vs 서브에이전트 (OpenClaw 내)

| 항목 | ACP 세션 | 서브에이전트 |
|------|---------|-------------|
| 런타임 | acpx 플러그인 | OpenClaw 네이티브 |
| 외부 에이전트 | Codex, Claude, Gemini 등 | OpenClaw 자체 에이전트 |
| 세션 키 | `agent:<id>:acp:<uuid>` | `agent:<id>:subagent:<uuid>` |
| 명령어 | `/acp ...` | `/subagents ...` |
| 샌드박스 | 미지원 (호스트 실행) | 지원 |

---

## 8. 장단점

### 8.1 장점

- **표준화**: 한 번 구현으로 모든 ACP 에디터/에이전트와 호환
- **LSP 성공 모델**: 검증된 패턴 (LSP가 언어 지원을 표준화한 것과 동일)
- **MCP 호환**: MCP 타입을 재사용하여 학습 비용 최소화
- **풍부한 생태계**: 30+ 에이전트, 다수 에디터, 모바일/메시징 클라이언트
- **스트리밍/비동기**: 실시간 업데이트, Human-in-the-loop 지원
- **Linux Foundation 거버넌스**: 오픈 거버넌스로 벤더 중립성 보장

### 8.2 단점 / 한계

- **아직 성숙 단계 아님**: 리모트 에이전트, 일부 기능은 초안/부분 구현
- **에디터 의존적**: 주로 Zed가 주도, 다른 에디터는 확장 수준
- **MCP와의 혼란**: 유사한 이름(ACP vs Agent Communication Protocol)으로 혼란 가능
- **보안 모델**: "신뢰하는 모델" 전제 → 샌드박스 격리가 약함
- **리소스 소모**: 에이전트를 서브프로세스로 실행 → 메모리/CPU 부담

---

## 9. 결론

ACP는 **에디터-에이전트 통합의 LSP**다. LSP가 "하나의 언어 서버로 모든 에디터에서 코드 인텔리센스"를 가능하게 한 것처럼, ACP는 "하나의 에이전트로 모든 에디터에서 AI 코딩"을 가능하게 한다.

MCP(도구 제공), A2A(에이전트 협업)와 보완 관계이며, 세 프로토콜이 함께 AI 에이전트 생태계의 인프라를 구성한다.

OpenClaw는 ACP를 양방향으로 활용 — 에디터에서 OpenClaw를 사용할 수도 있고, 채팅에서 외부 에이전트를 실행할 수도 있다.

---

## 10. 참고 자료

- ACP 공식 사이트: https://agentclientprotocol.com/
- ACP 문서 인덱스: https://agentclientprotocol.com/llms.txt
- ACP 아키텍처: https://agentclientprotocol.com/get-started/architecture
- ACP 프로토콜 개요: https://agentclientprotocol.com/protocol/overview
- ACP 프롬프트 턴: https://agentclientprotocol.com/protocol/prompt-turn
- ACP 지원 에이전트 목록: https://agentclientprotocol.com/get-started/agents
- ACP 지원 클라이언트 목록: https://agentclientprotocol.com/get-started/clients
- OpenClaw ACP 브릿지 문서: `/opt/homebrew/lib/node_modules/openclaw/docs/cli/acp.md`
- OpenClaw ACP 에이전트 문서: `/opt/homebrew/lib/node_modules/openclaw/docs/tools/acp-agents.md`
- MCP vs ACP vs A2A 비교 (Niklas Heidloff): https://heidloff.net/article/mcp-acp-a2a-agent-protocols/
- MCP vs ACP vs A2A 비교 (Sandi Besen): https://medium.com/@sandibesen/an-unbiased-comparison-of-mcp-acp-and-a2a-protocols-0b45923a20f3
- ACP 심층 비교 (inovaqo): https://inovaqo.com/2025/08/11/mcp-vs-a2a-vs-agp-vs-acp/
- 에이전트 프로토콜 서베이 (arXiv): https://arxiv.org/abs/2505.02279
- LSP (참고): https://microsoft.github.io/language-server-protocol/

---

_조사: Research Agent (행크)_
