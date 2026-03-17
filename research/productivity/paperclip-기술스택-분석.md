---
tags:
  - paperclip
  - ai-agent
  - orchestration
  - openclaw
  - architecture
date: 2026-03-17
---

# Paperclip 기술 스택 및 서비스 분석

조사 일자: 2026-03-17
GitHub: https://github.com/paperclipai/paperclip

## 핵심 요약

Paperclip은 **AI 에이전트 오케스트레이션션 플랫폼**으로, 여러 AI 에이전트를 조직화하여 무인 회사(Autonomous Company)를 운영할 수 있게 해준다.---

## 프로젝트 개요

### 정의

> "If OpenClaw is an employee, Paperclip is the company"

OpenClaw가 개별 직원이라면, Paperclip은 그 직원들을 관리하는 **회사**다.

### 핵심 가치

1. **조직 관리** - 계층형 조직도, 역할, 예산
2. **작업 조율** - 티켓 기반 작업 할당 및 추적
3. **비용 관리** - 에이전트별 토큰 예산 설정
4. **거버넌스** - 승인 게이트, 변경 이력
5. **다중 회사** - 하나의 배포로 여러 회사 운영

---

## 기술 스택

### Backend

| 기술 | 버전 | 용도 |
|-----|------|------|
| **Node.js** | 20+ | 런타임 환경 |
| **TypeScript** | 5.7+ | 타입 안전성 |
| **Express/Fastify** | - | API 서버 |
| **PostgreSQL** | Embedded | 데이터베이스 |
| **Drizzle ORM** | - | 타입 안전 DB 액세스 |
| **Zod** | - | 스키마 검증 |

### Frontend

| 기술 | 버전 | 용도 |
|-----|------|------|
| **Next.js** | 14+ | React 프레임워크 |
| **React** | 18+ | UI 라이브러리 |
| **Tailwind CSS** | 3.4+ | 스타일링 |
| **shadcn/ui** | - | UI 컴포넌트 |

### Development

| 기술 | 용도 |
|-----|------|
| **pnpm** | 패키지 매니저 |
| **Vitest** | 단위 테스트 |
| **Playwright** | E2E 테스트 |
| **esbuild** | 번들링 |

### Infrastructure

| 기술 | 용도 |
|-----|------|
| **Docker** | 컨테이너화 |
| **Tailscale** | 원격 접근 (선택적) |

---

## 프로젝트 구조

```
paperclip/
├── cli/                    # CLI 도구 (온보딩)
├── server/                 # Node.js API 서버
│   ├── src/
│   │   ├── agents/         # 에이전트 관련 로직
│   │   ├── api/            # API 라우트
│   │   ├── services/       # 비즈니스 로직
│   │   ├── db/             # DB 연결
│   │   └── routes/         # 라우트 정의
│   └── drizzle/            # Drizzle ORM 스키마
├── db/                     # DB 마이그레이션 패키지
├── ui/                     # React 프론트엔드
│   ├── src/
│   │   ├── components/    # UI 컴포넌트
│   │   ├── pages/          # 페이지
│   │   ├── hooks/          # 커스텀 훅
│   │   └── lib/            # 유틸리티
│   └── public/             # 정적 파일
├── docs/                   # 문서 (Mintlify)
└── scripts/               # 빌드/배포 스크립트
```

---

## 주요 서비스 기능

### 1. Company (회사)

최상위 조직 단위.

**기능:**
- 회사 생성/수정/삭제
- 목표(Goals) 설정
- 전체 예산 관리
- 조직도(Org Chart) 관리

**API 엔드포인트:**
```
POST   /api/companies              # 회사 생성
GET    /api/companies              # 회사 목록
GET    /api/companies/:id           # 회사 상세
PUT    /api/companies/:id           # 회사 수정
DELETE /api/companies/:id           # 회사 삭제
```

### 2. Agent (에이전트)

회사 내의 개별 AI 에이전트.

**속성:**
- `role`: 역할 (CEO, CTO, Engineer, Designer, Marketer)
- `title`: 직책
- `managerId`: 관리자 ID (조직도)
- `budget`: 월별 토큰 예산
- `heartbeatInterval`: 하트비트 주기 (분)

**기능:**
- 에이전트 등록/수정/삭제
- OpenClaw 연결
- 하트비트 스케줄링
- 작업 할당

**API 엔드포인트:**
```
POST   /api/agents                 # 에이전트 생성
GET    /api/agents                 # 에이전트 목록
GET    /api/agents/:id              # 에이전트 상세
PUT    /api/agents/:id              # 에이전트 수정
DELETE /api/agents/:id              # 에이전트 삭제
POST   /api/agents/:id/heartbeat   # 하트비트 트리거
```

### 3. Task (작업)

에이전트가 수행하는 작업 단위.

**속성:**
- `title`: 제목
- `description`: 설명
- `priority`: 우선순위 (low, medium, high, urgent)
- `status`: 상태 (pending, in_progress, done, cancelled)
- `assigneeId`: 할당된 에이전트
- `goalId`: 연결된 목표

**상태 전이:**
```
pending → in_progress → done
                    ↓
                cancelled
```

**기능:**
- 작업 생성/수정/삭제
- 작업 할당/해제
- 작업 상태 변경
- 하위 작업 생성 (subtasks)

**API 엔드포인트:**
```
POST   /api/tasks                  # 작업 생성
GET    /api/tasks                  # 작업 목록
GET    /api/tasks/:id               # 작업 상세
PUT    /api/tasks/:id               # 작업 수정
DELETE /api/tasks/:id               # 작업 삭제
POST   /api/tasks/:id/assign         # 작업 할당
POST   /api/tasks/:id/complete       # 작업 완료
```

### 4. Heartbeat (하트비트)

에이전트에 정기적으로 전송되는 신호.

**주기:**
- 기본: 60분
- 에이전트별 설정 가능
- 관리자는 더 자주, 직원은 덜 자주

**프로세스:**
```
1. Wake up (깨우기)
2. Check work (작업 확인)
   - 새 작업 있는지 확인
   - 진행 중인 작업 있는지 확인
3. Act (행동)
   - 새 작업 시작
   - 진행 중인 작업 계속
   - 대기 (작업 없음)
4. Report (보고)
   - 작업 진행 상황
   - 토큰 사용량
```

### 5. Budget (예산)

에이전트별 토큰/비용 제한.

**기능:**
- 월별 예산 설정
- 실시간 사용량 추적
- 한도 초과 시 자동 정지
- 관리자 알림

**모니터링:**
```
Budget: 1,000,000 tokens/month
Used:    850,000 tokens (85%)
Status: Warning - 90% 도달 시 알림
```

### 6. Governance (거버넌스)

의사결정 프로세스 관리.

**기능:**
- 승인 게이트 (Approval Gates)
  - 새 에이전트 고용 승인
  - 큰 예산 변경 승인
  - 전략 변경 승인
- 변경 이력 (Audit Log)
- 감사 (Rollback)
  - 잘못된 변경 되돌리기

### 7. Goal (목표)

회사의 목표 체계.

**구조:**
```
Company Goal (회사 목표)
    ├── Project Goal (프로젝트 목표)
    │   ├── Task (작업)
    │   └── Task (작업)
    └── Project Goal (프로젝트 목표)
            └── Task (작업)
```

**기능:**
- 목표 생성/수정/삭제
- 목표 우선순위 설정
- 목표별 작업 추적
- 진행 상황 모니터링

---

## OpenClaw 통합

### 연동 방식

Paperclip은 OpenClaw와 자연스럽게 통합됩니다:

```
┌──────────────┐
│   Paperclip   │
│   (회사/작업) │
└──────┬───────┘
       │
       │ Heartbeat
       ▼
┌──────────────┐
│   OpenClaw    │
│   (에이전트)  │
└──────────────┘
```

### 통합 기능

1. **OpenClaw 온보딩**
   ```bash
   openclaw plugins install @paperclipai/openclaw-adapter
   ```

2. **Heartbeat 수신**
   - Paperclip이 OpenClaw에 heartbeat 전송
   - OpenClaw가 작업 할당받아 수행
   - 결과를 Paperclip에 보고

3. **세션 지속성**
   - OpenClaw 세션을 Paperclip 작업에 바인딩
   - 컨텍스트 유지

4. **비용 추적**
   - OpenClaw 토큰 사용량을 Paperclip에 보고
   - 예산 기준 준수

---

## React UI 주요 기능

### 페이지 구조

```
/                    # 대시보드
/companies            # 회사 목록
/companies/:id        # 회사 상세
/agents               # 에이전트 목록
/agents/:id           # 에이전트 상세
/tasks                # 작업 목록
/tasks/:id            # 작업 상세
/goals               # 목표 목록
/settings            # 설정
```

### 대시보드

- 전체 회사 현황
- 에이전트 활동 모니터링
- 비용 추적
- 작업 진행 상황

### 에이전트 관리

- 에이전트 카드
  - 이름, 역할, 직책
  - 현재 작업
  - 예산 사용량
  - 상태 (active/idle)
  
### 작업 관리

- 칸반 보드 스타일
- 드래그앤드롭 우선순위 변경
- 빠른 할당
- 상태 필터

---

## 설치 및 실행

### 요구사항

- Node.js 20+
- pnpm 9.15+
- Git

### 빠른 시작

```bash
# 자동 온보딩
npx paperclipai onboard --yes

# 또는 수동 설치
git clone https://github.com/paperclipai/paperclip.git
cd paperclip
pnpm install
pnpm dev
```

### 접속

- **Local**: http://localhost:3100
- **API**: http://localhost:3100/api
- **UI**: http://localhost:3100 (동일 서버에서 제공)

### 데이터베이스

- **Development**: Embedded PostgreSQL (`./data/paperclip.db`)
- **Production**: 외부 PostgreSQL 사용 권장

---

## 개발 스크립트

| 명령어 | 설명 |
|--------|------|
| `pnpm dev` | 전체 개발 모드 (API + UI, watch) |
| `pnpm dev:server` | 서버만 실행 |
| `pnpm dev:ui` | UI만 실행 |
| `pnpm build` | 프로덕션 빌드 |
| `pnpm test:run` | 테스트 실행 |
| `pnpm db:generate` | DB 마이그레이션 생성 |
| `pnpm db:migrate` | 마이그레이션 적용 |

---

## 비교: Paperclip vs 유사 도구

| 도구 | 초점 | Paperclip 장점 |
|------|-----|----------------|
| **OpenClaw** | 단일 에이전트 | 멀티 에이전트 오케스트레이션 |
| **Asana/Trello** | 작업 관리 | AI 에이전트 특화 기능 |
| **LangChain** | LLM 체인 | 회사 수준 오케스트레이션 |
| **AutoGPT** | 단일 에이전트 | 멀티 에이전트, 조직 구조 |

---

## 사용 사례

### 적합한 경우

- 🏢 솔로 창업가의 무인 회사 운영
- 👥 여러 AI 에이전트 조율 팀
- 💼 AI 운영 비용 관리
- 🔄 24/7 무인 운영
- 📊 포트폴리오 관리 (다중 회사)

### 부적합한 경우

- 단일 에이전트 사용
- 단순 챗봇 애플리케이션
- AI 에이전트를 사용하지 않는 팀
- 자율적 목표가 없는 프로젝트

---

## 로드맵

### 현재 (v0.1)

- ✅ 핵심 오케스트레이션
- ✅ OpenClaw 통합
- ✅ 기본 UI
- ✅ Heartbeat 스케줄링

### 계획 중

- ⚪ ClipMart (회사 템플릿 마켓플레이스)
- ⚪ 클라우드 에이전트 (Cursor, e2b)
- ⚪ 플러그인 시스템
- ⚪ 개선된 문서화
- ⚪ 지식 베이스 통합

---

## 리소스

- **GitHub**: https://github.com/paperclipai/paperclip
- **문서**: https://paperclip.ing/docs
- **Discord**: https://discord.gg/m4HZY7xNG3
- **라이선스**: MIT

---

## 관련 문서

- [AI Native Engineer 직군 조사](./ai-native-engineer-직군-조사.md)
- [OpenClaw Multi-Agent 아키텍처](../openclaw/openclaw-multi-agent-아키텍처.md)
- [계층적 Coding Agent 구성](../openclaw/계층적-coding-agent-구성.md)

---

_조사 일자: 2026-03-17_
_저장소: /Users/yoophi/openclaw-workspace/paperclip_
