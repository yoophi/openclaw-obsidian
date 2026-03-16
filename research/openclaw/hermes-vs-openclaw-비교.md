---
tags:
  - openclaw
  - hermes
  - ai-agent
  - comparison
  - architecture
date: 2026-03-16
---

# Hermes vs OpenClaw 비교 분석

조사 일자: 2026-03-16

## 핵심 요약

두 가지 프로덕션급 오픈소스 AI 에이전트 비교:
- **OpenClaw**: TypeScript/Node.js 기반 통합 게이트웨이 플랫폼
- **Hermes**: Python 기반 자기 개선형 에이전트

---

## 1. 아키텍처 비교

### OpenClaw

| 특징 | 설명 |
|------|------|
| **기반** | TypeScript/Node.js (pi-mono 기반) |
| **구조** | 이벤트 스트리밍, 멀티채널 라우팅 |
| **도구 시스템** | Plugin SDK, phase-tracked, 병렬 실행 지원 |
| **핵심 철학** | 통합 플랫폼, 다중 채널/디바이스 |
| **세션 관리** | Gateway 소유, JSONL 트랜스크립트 저장 |

### Hermes

| 특징 | 설명 |
|------|------|
| **기반** | Python |
| **구조** | 단일 에이전트 루프, 단일 파일 |
| **도구 시스템** | Registry 기반, 병렬 실행 |
| **핵심 철학** | 학습과 투명성, 자기 개선 |
| **세션 관리** | SQLite DB + 의미 검색 |

---

## 2. 상세 비교

### 2-1. 아키텍처

| 항목 | OpenClaw | Hermes |
|------|----------|--------|
| **기반 언어** | TypeScript/Node.js | Python |
| **구조** | 이벤트 스트리밍 | 단일 에이전트 루프 |
| **도구 호출** | Phase-tracked | 병렬 실행 |
| **확장성** | Plugin SDK | Registry 기반 |
| **프로바이더** | 광범위한 장애 조치 | Anthropic API, 프롬프트 캐싱 |
| **세션 저장** | `~/.openclaw/agents/<id>/sessions/*.jsonl` | SQLite DB |

### 2-2. 메모리 시스템

#### OpenClaw 메모리

| 항목 | 설명 |
|------|------|
| **저장소** | Plain Markdown 파일 |
| **계층** | `MEMORY.md` (장기) + `memory/YYYY-MM-DD.md` (일일) |
| **검색** | 벡터 검색 (OpenAI, Gemini, Voyage, Mistral, Ollama, Local) |
| **압축** | 청크 요약, 자동 메모리 플러시 |
| **하이브리드 검색** | BM25 + 벡터 결합 |
| **QMD 백엔드** | 실험적 지원 (BM25 + 벡터 + 리랭킹) |
| **세션 검색** | 선택적 (실험적) |

```json5
// OpenClaw 메모리 설정 예시
{
  agents: {
    defaults: {
      memorySearch: {
        provider: "openai",
        model: "text-embedding-3-small",
        query: {
          hybrid: {
            enabled: true,
            vectorWeight: 0.7,
            textWeight: 0.3,
            mmr: { enabled: true, lambda: 0.7 },
            temporalDecay: { enabled: true, halfLifeDays: 30 }
          }
        }
      }
    }
  }
}
```

#### Hermes 메모리

| 항목 | 설명 |
|------|------|
| **저장소** | 계층형 (MD 파일 + SQLite) |
| **주입** | MD 파일을 시스템 프롬프트에 주입 |
| **검색** | SQLite 세션 DB + 의미 검색 |
| **압축** | protect-first/last 알고리즘 |
| **외부 메모리** | 선택적 외부 메모리 서비스 |

### 2-3. 학습 능력

| 항목 | OpenClaw | Hermes |
|------|----------|--------|
| **자율 스킬 생성** | ❌ | ✅ |
| **스킬 편집** | 수동 | 자율 + 수동 |
| **스킬 재사용** | ✅ | ✅ |
| **비용 최적화** | 일반적 | 프롬프트 캐시 재사용 |
| **절차적 메모리** | Skills (SKILL.md) | 자율 생성 스킬 |

**Hermes 학습 특징:**
- 복잡한 문제 해결 후 자율적으로 스킬 생성
- "The agent creates skills autonomously after solving complex problems"
- 스킬은 편집 및 재사용 가능
- 반복 작업 효율 향상
- 프롬프트 캐시 재사용으로 토큰 비용 절감

### 2-4. 보안 모델

| 항목 | OpenClaw | Hermes |
|------|----------|--------|
| **신뢰 모델** | 개인 비서 모델 | 패턴 기반 탐지 |
| **인증** | 페어링 (pairing) | - |
| **샌드박싱** | 선택적 (`agents.defaults.sandbox`) | - |
| **위험 명령 탐지** | - | 패턴 기반 |
| **프롬프트 인젝션** | - | 탐지기 내장 |
| **메모리 쓰기** | - | 안전하지 않은 쓰기 차단 |
| **파일 스캔** | - | 스킬/컨텍스트 파일 스캔 |

**OpenClaw 보안:**
- `dmPolicy: "pairing"` — 1:1 채팅에서 페어링 필요
- `sandbox` — 샌드박스 모드로 실행 가능
- 파일 시스템 접근 제어

### 2-5. 확장성

#### OpenClaw Plugin 시스템

```typescript
// 플러그인으로 확장 가능한 것들
- Agent Tools (api.registerTool)
- Messaging Channels (api.registerChannel)
- Model Providers (api.registerProvider)
- HTTP Routes (api.registerHttpRoute)
- CLI Commands (api.registerCli)
- Slash Commands (api.registerCommand)
- Gateway RPC (api.registerGatewayMethod)
- Background Services (api.registerService)
- Lifecycle Hooks (api.on, api.registerHook)
- Context Engine (api.registerContextEngine)
```

#### Hermes Registry 시스템

- Registry 기반 도구 등록
- 병렬 실행 지원
- Python 네이티브 확장

---

## 3. 워크스페이스 구조

### OpenClaw 워크스페이스

```
~/.openclaw/workspace/
├── AGENTS.md        # 운영 지침 + 메모리
├── SOUL.md          # 페르소나, 경계, 톤
├── TOOLS.md         # 도구 노트
├── BOOTSTRAP.md     # 최초 실행 (삭제됨)
├── IDENTITY.md      # 에이전트 이름/이모지
├── USER.md          # 사용자 프로필
├── MEMORY.md        # 장기 메모리
├── memory/
│   ├── 2026-03-16.md
│   └── 2026-03-15.md
└── skills/
    └── my-skill/
        └── SKILL.md
```

### Hermes 워크스페이스

```
hermes/
├── agent.py         # 단일 파일 에이전트 루프
├── memory/
│   ├── persistent.md
│   └── session.db
├── skills/
│   └── generated-skills/
└── config/
```

---

## 4. 장단점

### OpenClaw

**장점:**
- ✅ 성숙하고 확장 가능한 플랫폼
- ✅ 멀티 채널/디바이스 통합 (WhatsApp, Telegram, Discord, Slack, 등)
- ✅ 광범위한 프로바이더 지원 + 장애 조치
- ✅ Plugin SDK로 확장 용이
- ✅ 하이브리드 메모리 검색 (BM25 + 벡터)
- ✅ MMR 다양성, 시간 감쇠
- ✅ QMD 백엔드 (실험적)
- ✅ 스트리밍 + 청킹

**단점:**
- ❌ Python 개발자에게 덜 익숙
- ❌ 학습/자기 개선 기능 없음
- ❌ TypeScript/Node.js 지식 필요
- ❌ 설정 복잡도

### Hermes

**장점:**
- ✅ Python 네이티브
- ✅ 투명하고 검사/확장 쉬움
- ✅ 자율 스킬 생성으로 학습
- ✅ 비용 효율적 (프롬프트 캐시 재사용)
- ✅ 단일 파일 구조로 이해 쉬움
- ✅ 보안 탐지기 내장

**단점:**
- ❌ 단일 에이전트 중심
- ❌ 멀티 채널 통합 제한적
- ❌ 상대적으로 덜 성숙
- ❌ 플러그인 생태계 작음

---

## 5. 선택 가이드

| 상황 | 추천 |
|------|------|
| **통합 멀티 디바이스 비서** | OpenClaw |
| **Python 네이티브 개발** | Hermes |
| **투명하고 검사 쉬운** | Hermes |
| **성숙한 확장 플랫폼** | OpenClaw |
| **비용 효율성 중시** | Hermes |
| **학습/자기 개선 필요** | Hermes |
| **다중 채널 통합** | OpenClaw |
| **TypeScript 친화적** | OpenClaw |
| **고급 메모리 검색** | OpenClaw |
| **간단한 구조 선호** | Hermes |

---

## 6. 결론

### OpenClaw이 적합한 경우

- 멀티 채널/디바이스 통합이 필요한 사용자
- TypeScript/Node.js 친화적인 개발자
- 플러그인 생태계 활용
- 고급 메모리 검색 기능 필요
- 성숙한 프로덕션 플랫폼

### Hermes가 적합한 경우

- Python 개발자
- 투명성과 비용 효율성 중시
- 학습형 에이전트 선호
- 간단한 구조로 이해/수정 원함
- 단일 에이전트 사용

---

## 7. 참고 자료

- YouTube: "Hermes vs OpenClaw — Which AI Agent Should You Use?" (https://youtu.be/wG8mOnCR0Ns)
- [OpenClaw GitHub](https://github.com/openclaw/openclaw)
- [OpenClaw 문서](https://docs.openclaw.ai)
- [OpenClaw Agent Runtime](/opt/homebrew/lib/node_modules/openclaw/docs/concepts/agent.md)
- [OpenClaw Memory](/opt/homebrew/lib/node_modules/openclaw/docs/concepts/memory.md)
