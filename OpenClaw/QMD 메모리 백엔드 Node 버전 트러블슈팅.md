# QMD 메모리 백엔드 Node 버전 트러블슈팅

생성일: 2026-04-09

## 증상
OpenClaw에서 `memory.backend = "qmd"`로 설정한 뒤, 수동 점검 시 아래 문제가 보였다.

- `qmd status` 실패
- `openclaw memory status --deep`에서
  - `Embeddings: unavailable`
  - `Vector: unavailable`
- 에러 메시지:
  - `better-sqlite3.node was compiled against a different Node.js version`
  - `NODE_MODULE_VERSION 127` vs `141`

## 원인
문제의 핵심은 QMD 자체가 아니라 **Node 버전 불일치**였다.

당시 환경:
- 기본 `node`: `/opt/homebrew/bin/node` → `v25.9.0`
- OpenClaw gateway LaunchAgent:
  - `/opt/homebrew/opt/node@22/bin/node`
  - `v22.22.2`
- QMD 실제 설치 경로:
  - `/opt/homebrew/bin/qmd`
  - realpath: `/opt/homebrew/lib/node_modules/@tobilu/qmd/bin/qmd`

QMD wrapper는 내부적으로 현재 `node`를 사용해 실행되는데,
터미널에서는 Node 25를 탔고, 그 상태에서 `better-sqlite3` 네이티브 모듈 ABI mismatch가 발생했다.

즉:
- **서비스(OpenClaw)** 는 Node 22
- **수동 점검용 셸** 은 Node 25
- 이 차이 때문에 진단 결과가 어긋났다.

## 확인 과정
### 1. Node 25 환경에서는 실패
다음 계열 명령에서 실패:
```bash
qmd status
openclaw memory status --deep
```

### 2. Node 22로 QMD 강제 실행 시 정상
```bash
DIR=/opt/homebrew/lib/node_modules/@tobilu/qmd
/opt/homebrew/opt/node@22/bin/node "$DIR/dist/cli/qmd.js" status
```

결과:
- `QMD Status` 정상 출력
- 모델/디바이스 정보 정상 출력

### 3. Node 22 우선 PATH에서 OpenClaw memory status 확인
```bash
export PATH="/opt/homebrew/opt/node@22/bin:$PATH"
openclaw memory status --deep
```

결과:
- main / coding / research / work 전부
  - `Embeddings: ready`
  - `Vector: ready`

즉 실사용 기준으로는 정상 동작 확인.

## 해결
### zshrc에서 node@22 우선
`~/.zshrc`에 다음 설정 반영:
```zsh
# Prefer Homebrew node@22 ahead of newer Node releases for OpenClaw/QMD compatibility
export PATH="/opt/homebrew/opt/node@22/bin:$PATH"
```

### node25 제거
추가로 Homebrew의 `node 25`는 의존 패키지가 확인되지 않았고,
불필요하여 제거함.

## 현재 결론
- OpenClaw + QMD 조합은 **Node 22 기준 정상**
- 문제는 **Node 25로 수동 점검했을 때 발생한 ABI mismatch**였음
- 현재는 `node@22` 우선 환경으로 맞췄으므로 QMD 메모리 백엔드 사용 가능

## 점검 팁
문제 재발 시 우선 확인:
```bash
which node
node -v
which qmd
qmd status
openclaw memory status --deep
```

Node 22 우선으로 재확인:
```bash
export PATH="/opt/homebrew/opt/node@22/bin:$PATH"
which node
node -v
openclaw memory status --deep
```
