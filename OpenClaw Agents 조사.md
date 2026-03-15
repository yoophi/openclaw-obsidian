# OpenClaw Agents 조사

- 저장소: <https://github.com/shenhao-stu/openclaw-agents>
- 조사일: 2026-03-15
- 로컬 클론 경로: `/Users/yoophi/.openclaw/workspace/openclaw-agents`

## 한 줄 요약

`openclaw-agents`는 OpenClaw 위에 연구용 멀티 에이전트 팀을 빠르게 배포하기 위한 **설정/프롬프트/워크플로우 패키지**다. 별도의 독립 실행형 애플리케이션이라기보다는, `setup.sh`가 OpenClaw의 agent/config/workspace를 자동 구성해 주는 **설치 키트**에 가깝다.

---

## 1. 프로젝트 성격

이 프로젝트는 자체 런타임 엔진을 제공하는 프레임워크라기보다, OpenClaw를 대상으로 다음을 자동화한다.

- 여러 서브에이전트 생성
- 각 에이전트의 identity/role 설정
- agent별 workspace 배포
- workflow 문서 주입
- `openclaw.json`에 agents/bindings/channel 설정 병합

즉, 핵심 실행 주체는 OpenClaw이고, 이 저장소는 그 위에 올리는 **멀티 에이전트 배포 템플릿**이다.

---

## 2. 저장소 구조

대략적인 구조는 다음과 같다.

```text
openclaw-agents/
├── setup.sh
├── agents.yaml
├── soul.md
├── README.md
├── docs/
│   └── installation.md
├── examples/
│   ├── openclaw.feishu.json
│   ├── openclaw.telegram.json
│   ├── openclaw.whatsapp.json
│   └── openclaw.local.json
└── .agents/
    ├── planner/
    ├── ideator/
    ├── critic/
    ├── surveyor/
    ├── coder/
    ├── writer/
    ├── reviewer/
    ├── scout/
    └── workflows/
        ├── paper-pipeline.md
        ├── brainstorm.md
        ├── daily-digest.md
        └── rebuttal.md
```

### 주요 파일 역할

- `setup.sh`
  - 실제 설치/배포 로직의 중심
- `agents.yaml`
  - 에이전트 ID, 역할, 모델, workspace 등을 정의하는 매니페스트
- `soul.md`
  - 메인 에이전트의 역할/철학 정의
- `.agents/<agent>/soul.md`
  - 각 서브에이전트의 성격/업무 원칙
- `.agents/<agent>/agent.md`
  - 각 서브에이전트의 모델/도구/세션 규칙
- `.agents/<agent>/user.md`
  - 사용자/도메인 맥락 정의
- `.agents/workflows/*.md`
  - 에이전트들이 참고할 협업 워크플로우 문서
- `examples/*.json`
  - 채널별 OpenClaw 설정 예시

---

## 3. 아키텍처 개요

프로젝트가 의도하는 상위 구조는 다음과 같다.

### 메인 구조

- `main`
  - 시스템 오케스트레이터, 감사(audit), 최종 중재자
- `planner`
  - 작업 분해, 단계 관리, 서브에이전트 조정 허브
- 전문 역할 에이전트
  - `ideator`: 아이디어 생성
  - `critic`: 아이디어/논문 품질 감식 및 taste gate
  - `surveyor`: 문헌 조사
  - `coder`: 구현/실험
  - `writer`: 논문 작성
  - `reviewer`: 내부 리뷰
  - `scout`: 최신 논문/트렌드 탐색

### 설계 특징

이 구조의 특징은 단순한 역할 분할이 아니라 **의도적 긴장 관계**를 넣었다는 점이다.

- `Ideator ↔ Critic`
  - 창의성 vs 품질/취향
- `Writer ↔ Reviewer`
  - 작성 vs 검토

즉, 협업만 강조하는 것이 아니라, **서로 다른 관점의 충돌을 통해 품질을 끌어올리도록 설계**되어 있다.

---

## 4. 기능 분석

### 4.1 설치/프로비저닝

`setup.sh`는 다음 작업을 수행한다.

1. `openclaw` CLI 존재 확인
2. 8개 core sub-agent 생성
3. agent별 시각적 identity 설정
4. 각 workspace에 source 파일 복사
5. `BOOTSTRAP.md` 생성
6. `AGENTS.md`에 workflow reference 추가
7. `~/.openclaw/openclaw.json` 수정
8. 최종적으로 `openclaw agents list --bindings`로 검증 시도

### 4.2 배포 모드

#### Channel Mode

지원 채널:
- Feishu
- WhatsApp
- Telegram
- Discord
- Slack

특징:
- 모든 agent를 하나의 그룹에 붙일 수 있음
- agent별로 서로 다른 그룹에 배치 가능 (`--group-map`)
- `requireMention` 설정 가능

#### Local Workflow Mode

특징:
- 외부 채널 없이 로컬 구성 가능
- `agentToAgent` 도구를 허용해 에이전트끼리 직접 통신하도록 설정
- planner 중심 허브 구조를 로컬에서 재현

---

## 5. setup.sh 기준 상세 아키텍처

이 프로젝트의 실제 기준은 README보다 `setup.sh`다. 스크립트 기준으로 보면 설계는 다음 3층으로 나뉜다.

### 5.1 선언 계층

- `agents.yaml`
- `soul.md`
- `.agents/*/soul.md`
- `.agents/*/agent.md`
- `.agents/*/user.md`
- `.agents/workflows/*.md`

이 계층은 에이전트의 역할, 성격, 권한, 상호작용 규칙을 **코드보다 문서 형태로 선언**한다.

### 5.2 조립 계층

- `setup.sh`

이 스크립트가 선언 파일을 읽어 실제 OpenClaw 환경으로 옮긴다.

주요 함수 흐름:
- `preflight()`
- `create_agents()`
- `set_identities()`
- `deploy_source_files()`
- `append_workflows()`
- `prompt_mode_and_channel()`
- `configure_config()`
- `summary()`

### 5.3 런타임 계층

- 실제 agent 실행
- 세션 격리
- channel routing
- tool restriction
- 메시지 처리

이 부분은 OpenClaw가 담당한다. 즉 이 저장소는 **OpenClaw 설정을 생성하는 컴파일러/배포기** 같은 역할을 한다.

---

## 6. Self-merge bootstrap 방식

가장 흥미로운 포인트 중 하나는 각 agent workspace에 다음 파일들을 배포하는 부분이다.

- `_soul_source.md`
- `_user_source.md`
- `_agent_source.md`
- `BOOTSTRAP.md`

`BOOTSTRAP.md`는 최초 실행 시 agent에게:

1. `_soul_source.md`를 읽고 `SOUL.md`에 병합
2. `_user_source.md`를 읽고 `USER.md`에 병합
3. `_agent_source.md`를 읽어 구성 이해
4. `AGENTS.md` 하단 workflow 참고
5. 임시 source 파일 삭제

를 지시한다.

즉, 설치 스크립트가 최종 파일을 완성해 넣는 것이 아니라, **agent가 자기 자신을 초기화하도록 유도하는 self-merge 구조**다.

---

## 7. 핵심 에이전트 분석

### Planner

- 역할: 전체 오케스트레이션 허브
- 특징:
  - 프로젝트 상태 보드 유지
  - phase 진행 추적
  - conflict escalation
  - 여러 agent와 세션 기반 협업

### Critic

- 역할: 품질/취향 게이트
- 특징:
  - SHARP 프레임워크 사용
  - 아이디어가 실제로 가치 있는지 판단
  - "좋은데요"가 아니라 "이게 진짜 의미 있나"를 묻는 역할
  - README와 soul 정의 모두에서 매우 강한 veto 권한을 가짐

이 프로젝트는 특히 Critic을 강하게 중심축에 둔 것이 눈에 띈다.

---

## 8. 워크플로우 분석

내장 워크플로우는 4개다.

- `paper-pipeline`
- `brainstorm`
- `daily-digest`
- `rebuttal`

이 중 `paper-pipeline`이 가장 핵심이다.

### paper-pipeline 단계

1. 프로젝트 초기화
2. 문헌 조사
3. 아이디어 생성
4. Critic의 Idea Taste Gate
5. 방법 설계
6. 코드 구현
7. 실험 실행
8. 논문 작성
9. 내부 리뷰 및 수정
10. 제출 준비

즉, 단순 챗봇 묶음이 아니라 **연구실의 논문 생산 프로세스를 에이전트 협업 구조로 포장**한 프로젝트라고 볼 수 있다.

---

## 9. 설정 구조 분석

`configure_config()`를 보면 `openclaw.json`에 다음이 구성된다.

### agents.list
- 각 agent의 id
- workspace
- model
- identity.name
- groupChat mentionPatterns
- historyLimit

### bindings
- agent별 channel/group 라우팅 규칙

### channels.<channel>
- `groupPolicy: open`
- group별 `requireMention`
- 예시에서는 tool deny 설정도 가능

### messages.groupChat
- historyLimit 지정

### local mode의 tools.agentToAgent
- planner 중심 허용 규칙
- ideator↔critic, writer↔reviewer 직접 통신 허용

즉, 실제 오케스트레이션은 OpenClaw 설정의 조합으로 구현된다.

---

## 10. 장점

### 10.1 빠른 시작
한 번의 스크립트 실행으로 멀티 에이전트 실험 환경을 구성할 수 있다.

### 10.2 역할 설계가 명확함
단순히 agent 수만 많은 것이 아니라 역할 구분이 분명하다.

### 10.3 연구 워크플로우 특화
논문 작성/실험/리뷰 파이프라인에 맞춘 구조라 목적성이 강하다.

### 10.4 유연한 배포
- agent별 모델 다르게 지정 가능
- agent별 그룹 다르게 지정 가능
- local/channel 모드 모두 지원

---

## 11. 한계 및 주의점

### 11.1 본질은 템플릿 패키지
복잡한 런타임 시스템이라기보다, 설정/프롬프트/워크플로우를 배포하는 패키지다.

### 11.2 OpenClaw 버전 의존성
`setup.sh`가 OpenClaw CLI와 config 구조에 강하게 의존하므로, 상위 버전 변화에 취약할 수 있다.

### 11.3 문서와 구현의 미세한 차이
README, `docs/installation.md`, 실제 `setup.sh`의 설명이 완전히 동일하진 않다.
예:
- 문서상 표현과 실제 생성 대상 개수/구조 차이
- 예시 JSON의 workspace 표현 차이
- 일부 기능 설명이 실제보다 다소 확장적으로 표현됨

따라서 실제 동작 기준은 **문서보다 `setup.sh`**다.

### 11.4 도메인 편향
AI 연구/논문 작성에는 잘 맞지만, 범용 조직 운영 멀티에이전트로 바로 전용하기엔 프롬프트가 많이 연구 편향적이다.

---

## 12. 종합 평가

이 프로젝트는 다음처럼 보는 것이 가장 정확하다.

> OpenClaw를 위한 **연구용 멀티 에이전트 스타터킷**

혹은

> OpenClaw 설정/프롬프트/워크플로우를 자동 배포하는 **설치형 멀티 에이전트 패키지**

### 총평

- 멀티 에이전트 연구팀 컨셉이 명확하다.
- 설치 구조가 단순하고 이해하기 쉽다.
- 실제 핵심은 코드 프레임워크보다 **prompt architecture + config generation** 쪽에 있다.
- 실험/데모/템플릿으로는 유용하지만, 장기 운영용으로는 OpenClaw 버전 변화와 문서 일관성 검토가 필요하다.

---

## 추가로 해볼 만한 분석

다음 후속 분석이 가능하다.

1. `setup.sh` 함수별 세부 코드 리뷰
2. 각 agent의 `soul.md` 비교 분석
3. 실제 내 OpenClaw 환경에 적용 시 충돌 가능성 검토
4. 개선 포인트/버그 후보 정리
5. 이 구조를 개인용/업무용 멀티에이전트 템플릿으로 일반화하는 방법 검토
