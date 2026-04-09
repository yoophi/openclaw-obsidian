# OpenClaw에 QMD를 메모리 백엔드로 추가하는 방법

생성일: 2026-04-09

## 개요
QMD는 OpenClaw와 함께 동작하는 local-first 검색 사이드카다. BM25, 벡터 검색, reranking, query expansion을 한 번에 제공하고, workspace 바깥의 문서나 세션 transcript까지 인덱싱할 수 있다.

핵심 장점:
- builtin 메모리 엔진보다 더 강한 검색 품질
- 추가 디렉터리 인덱싱 가능
- 세션 transcript 검색 가능
- 완전 로컬 동작
- 문제 발생 시 builtin 엔진으로 fallback 가능

## 1. 사전 준비
문서 기준 prerequisites:
- QMD 설치
- SQLite extension 허용 빌드 설치
- gateway 프로세스 PATH에서 `qmd` 실행 가능해야 함

예시:
```bash
npm install -g @tobilu/qmd
# 또는
bun install -g @tobilu/qmd

brew install sqlite
```

주의:
- macOS에서 서비스로 OpenClaw를 돌릴 때는 `qmd` 바이너리가 서비스 PATH에 잡혀야 한다.
- 필요하면 심볼릭 링크를 사용한다.

예시:
```bash
sudo ln -s ~/.bun/bin/qmd /usr/local/bin/qmd
```

## 2. OpenClaw 설정 변경
가장 기본적인 설정은 `memory.backend`를 `qmd`로 바꾸는 것이다.

예시:
```json5
{
  memory: {
    backend: "qmd",
  },
}
```

동작 방식:
- OpenClaw가 `~/.openclaw/agents/<agentId>/qmd/` 아래에 QMD 홈을 만든다
- collection 생성, update, embed 실행을 자동으로 관리한다
- QMD 실패 시 builtin SQLite memory engine으로 fallback 한다

## 3. 추가 경로 인덱싱
workspace 밖 문서까지 검색하려면 `memory.qmd.paths`를 설정한다.

예시:
```json5
{
  memory: {
    backend: "qmd",
    qmd: {
      paths: [
        { name: "docs", path: "~/notes", pattern: "**/*.md" }
      ],
    },
  },
}
```

이렇게 넣으면 추가 경로의 문서가 QMD collection으로 인덱싱되고,
검색 결과에는 `qmd/<collection>/<relative-path>` 형식으로 나타난다.

## 4. 세션 transcript 인덱싱
이전 대화까지 검색하고 싶으면 sessions 인덱싱을 켠다.

예시:
```json5
{
  memory: {
    backend: "qmd",
    qmd: {
      sessions: { enabled: true },
    },
  },
}
```

그러면 transcript가 `~/.openclaw/agents/<id>/qmd/sessions/` 아래 dedicated collection으로 관리된다.

## 5. scope 설정
기본적으로 QMD 검색 결과는 DM 세션 중심으로 노출된다.
그룹/채널까지 허용하려면 `memory.qmd.scope`를 조정해야 한다.

예시:
```json5
{
  memory: {
    qmd: {
      scope: {
        default: "deny",
        rules: [
          { action: "allow", match: { chatType: "direct" } }
        ],
      },
    },
  },
}
```

## 6. 모델 관련 환경변수
QMD는 gateway 프로세스의 환경변수를 그대로 사용한다.
필요하면 아래처럼 override 가능하다.

```bash
export QMD_EMBED_MODEL="hf:Qwen/Qwen3-Embedding-0.6B-GGUF/Qwen3-Embedding-0.6B-Q8_0.gguf"
export QMD_RERANK_MODEL="/absolute/path/to/reranker.gguf"
export QMD_GENERATE_MODEL="/absolute/path/to/generator.gguf"
```

embedding 모델을 바꾸면 인덱스 벡터 공간이 달라지므로 embed를 다시 맞춰야 한다.

## 7. 운영 시 알아둘 점
- boot 시 `qmd update` + `qmd embed`가 백그라운드로 돈다
- 첫 검색은 GGUF 모델 다운로드 때문에 느릴 수 있다
- 검색 timeout이 나면 `memory.qmd.limits.timeoutMs`를 늘린다
- QMD가 완전히 실패하면 builtin engine으로 fallback 한다

## 8. 트러블슈팅
### QMD not found
- `qmd`가 PATH에 있는지 확인
- 서비스 환경 PATH와 셸 PATH가 다를 수 있음

### 첫 검색이 너무 느림
- 첫 `qmd query` 시 모델 다운로드가 일어날 수 있음
- 미리 한 번 warm-up 해두는 게 좋다

예시:
```bash
qmd query "test"
```

### 검색 timeout
- 기본 timeout이 짧을 수 있음
- 느린 하드웨어면 `memory.qmd.limits.timeoutMs`를 크게 조정

### 그룹 채팅에서 결과가 비어 있음
- 기본 scope 제한일 가능성 큼
- `memory.qmd.scope` 확인

## 9. 참고 문서
참고한 로컬 문서:
- `/opt/homebrew/lib/node_modules/openclaw/docs/concepts/memory-qmd.md`
- `/opt/homebrew/lib/node_modules/openclaw/docs/reference/memory-config.md`

## 메모
다음에 실제 적용 문서까지 만들려면 아래를 추가하면 좋다:
- 현재 openclaw 설정 파일에서 어떤 필드를 어떻게 바꿔야 하는지
- macOS launch agent 환경변수 반영 방법
- 적용 후 검증 명령 (`openclaw memory status --deep` 등)
