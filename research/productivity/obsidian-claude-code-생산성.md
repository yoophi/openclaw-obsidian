---
tags:
  - 생산성
  - obsidian
  - claude-code
  - 워크플로우
date: 2026-03-12
---

# Obsidian + Claude Code 생산성

조사 일자: 2026-03-12

조사 일자: 2026-03-12
목적: Obsidian과 AI 도구 통합을 통한 생산성 향상
출처: GitHub, Reddit, OpenClaw 공식 문서

---

## 1. 핵심 요약

**Obsidian + Claude Code 조합의 핵심 가치:**
- 개인 지식 관리(PKM)와 AI 에이전트의 완전한 통합
- 자연어로 볼트 탐색, 정리, 분석 가능
- 목표 → 프로젝트 → 일일 태스크의 자동 연결
- 반복적인 정리 작업 자동화

**주요 도구:**
1. **OpenClaw Obsidian Skill** — CLI 기반 볼트 관리
2. **Claudian** — Obsidian 플러그인, Claude Code 내장
3. **obsidian-claude-pkm** — 목표-프로젝트-태스크 시스템
4. **obsidian-agent-client** — 멀티 에이전트 지원

---

## 2. 상세 분석

### 2.1 OpenClaw Obsidian Skill

**개요:**
- OpenClaw의 obsidian skill은 `obsidian-cli`를 통해 볼트를 관리
- 볼트 = 일반 폴더 (Markdown 파일들)
- `.obsidian/` 폴더에 설정 저장

**설치:**
```bash
brew install yakitrak/yakitrak/obsidian-cli
```

**기본 명령어:**

1. **기본 볼트 설정:**
```bash
# 기본 볼트 설정
obsidian-cli set-default "my-vault"

# 기본 볼트 경로 확인
obsidian-cli print-default
obsidian-cli print-default --path-only
```

2. **검색:**
```bash
# 노트 이름으로 검색
obsidian-cli search "project"

# 노트 내용 검색
obsidian-cli search-content "meeting notes"
```

3. **노트 생성:**
```bash
# 새 노트 생성
obsidian-cli create "Projects/New Project" --content "# New Project" --open
```

4. **노트 이동/이름 변경:**
```bash
# wikilink 자동 업데이트
obsidian-cli move "old/path/note" "new/path/note"
```

5. **노트 삭제:**
```bash
obsidian-cli delete "path/note"
```

**활성 볼트 확인:**
```bash
# macOS
cat ~/Library/Application\ Support/obsidian/obsidian.json
```

**OpenClaw에서의 사용:**
- `read`, `write`, `edit` 툴로 직접 노트 파일 조작
- obsidian-cli는 검색, 이동 등 특수 작업에 사용
- Obsidian이 자동으로 변경사항을 감지

---

### 2.2 Obsidian + Claude Code 생산성 사례

#### Case 1: obsidian-claude-pkm (1.2k ⭐)

**개요:**
- "Not another PKM starter kit. This is an execution system."
- 3년 비전 → 연간 목표 → 프로젝트 → 월간/주간/일일 리뷰 연결
- 모든 계층이 자동으로 연결되어 "아무것도 빠뜨리지 않음"

**핵심 기능:**

| 레이어 | 파일 | 스킬 | 역할 |
|--------|------|------|------|
| 비전 | Goals/0. Three Year Goals.md | /goal-tracking | 인생 영역, 장기 방향 |
| 연간 | Goals/1. Yearly Goals.md | /goal-tracking | 측정 가능한 목표, 분기별 마일스톤 |
| 프로젝트 | Projects/*/CLAUDE.md | /project | 목표에 연결된 활성 이니셔티브 |
| 월간 | Goals/2. Monthly Goals.md | /monthly | 주간 리뷰 롤업, 분기 진행 체크 |
| 주간 | Goals/3. Weekly Review.md | /weekly | 성찰, 재정렬, 다음 주 계획 |
| 일일 | Daily Notes/YYYY-MM-DD.md | /daily | 아침 계획, 저녁 성찰 |

**사용 시나리오:**

- **아침:** `/daily` → 오늘의 노트 생성, 이번 주의 ONE Big Thing 표시
- **저녁:** `/daily` → 어떤 목표와 프로젝트에 집중했는지 요약
- **일요일:** `/weekly` → 모든 일일 노트 읽기, 프로젝트 상태 스캔, 목표 진행 계산
- **월말:** `/monthly` → 주간 리뷰 롤업, 분기 마일스톤 체크

**특별 기능:**

1. **/adopt** — 기존 볼트에 적용
   - 기존 폴더 구조 스캔
   - PARA, Zettelkasten, LYT 등 감지
   - 폴더 매핑 후 설정 파일 생성
   - 기존 구조 유지

2. **4개의 특화 에이전트:**
   - `goal-aligner` — 일일 활동과 목표 정렬 감사
   - `weekly-reviewer` — 3단계 주간 리뷰 진행
   - `note-organizer` — 링크 수정, 중복 통합
   - `inbox-processor` — GTD 스타일 inbox 처리

**비판적 관점:**
- 매우 구조화된 시스템 → 자유로운 노트 작성 스타일에는 부적합
- 초기 설정 비용이 큼
- 지속적인 사용 필요 (그렇지 않으면 시스템이 의미 없음)

---

#### Case 2: Claudian (3.7k ⭐)

**개요:**
- Obsidian 플러그인으로 Claude Code를 볼트에 내장
- 볼트가 Claude의 작업 디렉토리가 됨
- 파일 읽기/쓰기, 검색, bash 명령, 멀티스텝 워크플로우 가능

**핵심 기능:**

1. **Full Agentic Capabilities:**
   - Claude Code의 모든 능력 활용
   - 파일 읽기/쓰기/편집
   - 검색
   - Bash 명령 실행

2. **Context-Aware:**
   - 현재 포커스된 노트 자동 첨부
   - @ 파일 멘션
   - 태그로 노트 제외
   - 에디터 선택 영역 포함
   - 외부 디렉토리 접근

3. **Vision Support:**
   - 이미지 분석 (드래그 앤 드롭, 붙여넣기, 파일 경로)

4. **Inline Edit:**
   - 선택된 텍스트 편집
   - 커서 위치에 콘텐츠 삽입
   - 워드 수준 diff 미리보기

5. **Instruction Mode (#):**
   - 시스템 프롬프트에 커스텀 인스트럭션 추가
   - 모달에서 리뷰/편집 가능

6. **Slash Commands:**
   - `/command`로 재사용 가능한 프롬프트 템플릿
   - 인자 플레이스홀더
   - @ 파일 참조
   - 인라인 bash 치환

7. **Skills:**
   - 컨텍스트 기반 자동 호출 모듈
   - Claude Code skill 포맷 호환

8. **Custom Agents:**
   - Claude가 호출할 커스텀 서브에이전트 정의
   - 툴 제한, 모델 오버라이드 지원

9. **MCP Support:**
   - Model Context Protocol 서버 연결
   - stdio, SSE, HTTP
   - 컨텍스트 저장 모드
   - @ 멘션 활성화

10. **Advanced Model Control:**
    - Haiku, Sonnet, Opus 선택
    - 커스텀 모델 설정 (환경 변수)
    - Thinking budget 조정
    - 1M 컨텍스트 윈도우 (Max 구독 필요)

**설치:**
1. main.js, manifest.json, styles.css 다운로드
2. `.obsidian/plugins/claudian/` 폴더 생성 후 복사
3. Settings → Community plugins → Claudian 활성화

**비판적 관점:**
- 플러그인 설치 필요 → Obsidian 의존성
- Claude Code CLI 별도 설치 필요
- 볼트 전체 접근 권한 → 보안 고려 필요
- 데스크톱 전용 (모바일 미지원)

---

#### Case 3: obsidian-agent-client (1.2k ⭐)

**개요:**
- Agent Client Protocol (ACP) 기반
- Claude Code, Codex, Gemini CLI 등 멀티 에이전트 지원
- Zed Industries의 ACP 프로토콜 사용

**핵심 기능:**

1. **Note Mentions:**
   - `@notename` 문법으로 노트 참조

2. **Image Attachments:**
   - 붙여넣기 또는 드래그 앤 드롭

3. **Slash Commands:**
   - 에이전트가 제공하는 / 명령 사용

4. **Multi-Agent Support:**
   - Claude Code, Codex, Gemini CLI 전환
   - 커스텀 에이전트 추가 가능

5. **Multi-Session:**
   - 여러 에이전트 동시 실행
   - 별도 뷰에서 관리

6. **Floating Chat:**
   - 빠른 접근을 위한 지속적, 접을 수 있는 채팅 창

7. **Mode & Model Switching:**
   - 채팅에서 AI 모델 및 에이전트 모드 변경

8. **Session History:**
   - 이전 대화 재개 또는 포크

9. **Chat Export:**
   - 대화를 Markdown 노트로 저장

10. **Terminal Integration:**
    - 에이전트가 명령 실행 및 결과 반환

**설치:**

Option A: BRAT 플러그인 사용
1. BRAT 플러그인 설치
2. Settings → BRAT → Add Beta Plugin
3. `https://github.com/RAIT-09/obsidian-agent-client` 입력

Option B: 수동 설치
1. Releases에서 파일 다운로드
2. `VaultFolder/.obsidian/plugins/agent-client/`에 배치
3. 활성화

**Claude Code 설정:**
```bash
# Claude Code 설치
curl -fsSL https://claude.ai/install.sh | bash

# ACP 어댑터 설치
npm install -g @zed-industries/claude-agent-acp

# 로그인
claude

# 경로 확인 (macOS/Linux)
which node
which claude-agent-acp

# 경로 확인 (Windows)
where.exe node
where.exe claude-agent-acp
```

**설정:**
- Node.js path: `/usr/local/bin/node`
- Built-in agents → Claude Code → Path: `/usr/local/bin/claude-agent-acp`
- API key 추가 (또는 CLI 로그인 사용)

**비판적 관점:**
- 여러 에이전트 설치 및 설정 필요
- ACP 어댑터 별도 설치 필요
- 터미널 통합 → 보안 고려
- 설정이 복잡할 수 있음

---

### 2.3 Reddit 커뮤니티 사례

**발견된 사례들:**

1. **Obsidian + Claude Code Daily Briefing**
   - 매일 아침 자동으로 브리핑 생성
   - 전날 활동 요약
   - 오늘의 우선순위 제안

2. **Claude AI writing assistant (사이드바)**
   - 10개 명령
   - 4단계 설명
   - 자동 생성 Mermaid 다이어그램

3. **Diane: Claude Code + SuperWhisper**
   - 음성으로 볼트 관리
   - SuperWhisper로 음성 인식
   - Claude Code로 작업 실행

4. **TaskNotes MCP & Claude Desktop**
   - 벌크 태스크 생성 데모
   - MCP를 통한 태스크 관리

5. **Year in Review/Wrapped Style Summary**
   - 연말 요약 노트 자동 생성
   - 연간 활동 분석

6. **Canvas-like UI for AI conversations**
   - 비선형 AI 대화
   - 캔버스 형태의 UI

---

### 2.4 OpenClaw에서 Obsidian 사용하기

**OpenClaw의 장점:**
1. 이미 설치된 Obsidian skill 활용
2. 다른 skills (github, google, slack 등)와 통합
3. 메시징 플랫폼 (Telegram, Discord, Slack)에서 접근
4. 에이전트 메모리 시스템과 연동

**실제 사용 예시:**

**시나리오 1: 연구 결과를 Obsidian에 저장**
```
유박사: "React Native 최신 트렌드 조사해줘. 결과를 내 Obsidian 볼트에도 저장해."
행크: [조사 수행] → [20260312-react-native-trends.md 생성]
     → [obsidian-cli create "Research/React Native Trends" --content "..."]
```

**시나리오 2: 프로젝트 상태를 Obsidian에서 읽기**
```
유박사: "내 'pixel-office' 프로젝트 노트 요약해줘."
행크: [obsidian-cli search-content "pixel-office"]
     → [노트 읽기] → [요약]
```

**시나리오 3: 일일 리뷰 자동화**
```
유박사: "오늘 한 일 정리해서 Obsidian 일일 노트에 추가해."
행크: [memory/2026-03-12.md 읽기]
     → [obsidian-cli search "Daily Notes/2026-03-12"]
     → [노트에 섹션 추가]
```

**시나리오 4: 볼트 전체 검색**
```
유박사: "내 볼트에서 '머신러닝' 관련 노트 찾아줘."
행크: [obsidian-cli search-content "머신러닝"]
     → [결과 정리 및 분석]
```

---

## 3. 장단점

### 3.1 OpenClaw Obsidian Skill

**장점:**
1. CLI 기반 → 스크립팅 가능
2. OpenClaw 에이전트와 자연스러운 통합
3. 다른 skills (github, slack 등)와 연동
4. 가볍고 빠름
5. 플러그인 설치 불필요

**단점:**
1. Obsidian 내에서 직접 실행되지 않음
2. UI 없음 (CLI만)
3. 실시간 미리보기 없음
4. obsidian-cli 별도 설치 필요

---

### 3.2 Claudian

**장점:**
1. Obsidian 내부에 완전히 내장
2. 풍부한 UI (사이드바, 채팅, 인라인 편집)
3. Vision 지원
4. Skills, MCP, Custom Agents 지원
5. 실시간 컨텍스트 (현재 노트, 선택 영역)

**단점:**
1. 플러그인 설치 및 유지보수 필요
2. Obsidian에 종속
3. 볼트 전체 접근 권한
4. 데스크톱 전용
5. 설정 복잡도

---

### 3.3 obsidian-claude-pkm

**장점:**
1. 완전한 목표-태스크 시스템
2. 자동 연결 (비전 → 일일 태스크)
3. 4개 특화 에이전트
4. /adopt로 기존 볼트에 적용 가능
5. 검증된 방법론

**단점:**
1. 매우 구조화됨 → 유연성 제한
2. 초기 설정 비용
3. 지속적 사용 필요
4. 특정 워크플로우에 맞춤

---

### 3.4 obsidian-agent-client

**장점:**
1. 멀티 에이전트 지원 (Claude, Codex, Gemini)
2. ACP 표준 기반
3. 플로팅 채팅
4. 세션 히스토리
5. 채팅 내보내기

**단점:**
1. 여러 에이전트 설치 필요
2. ACP 어댑터 별도 설정
3. 터미널 통합 보안 이슈
4. 설정 복잡도

---

## 4. 결론

### 4.1 유박사를 위한 추천

**상황 분석:**
- research 전용 에이전트 (행크)
- 이미 OpenClaw 사용 중
- 기술 조사, 논문 분석, 제품 비교 수행
- 조사 결과를 `.md` 파일로 저장

**1순위: OpenClaw Obsidian Skill (현재 사용 중)**

**이유:**
1. 이미 OpenClaw 생태계 안에 있음
2. 추가 플러그인 설치 불필요
3. Telegram 등 메시징에서 접근 가능
4. 행크의 메모리 시스템과 통합
5. CLI 기반 → 자동화 용이

**사용법:**
1. obsidian-cli 설치
2. 기본 볼트 설정: `obsidian-cli set-default "Research"`
3. 행크에게 자연어로 요청

**워크플로우 예시:**
```
유박사: "React Native 최신 트렌드 조사해서 Obsidian에도 저장해줘."
행크:
  1. 조사 수행
  2. yyyymmdd-*.md 파일 생성 (workspace)
  3. obsidian-cli create "Research/2026-03-12 React Native Trends" --content "..."
  4. 양쪽에 저장 완료
```

---

**2순위: Claudian (Obsidian 내에서 작업 시)**

**적합한 경우:**
- Obsidian에서 장시간 작업
- 노트 편집 중 실시간 AI 지원 필요
- Vision (이미지 분석) 필요
- 인라인 편집 선호

**워크플로우:**
1. Obsidian에서 Claudian 플러그인 설치
2. 노트 열어둔 상태에서 Claudian에게 질문
3. @ 파일 멘션으로 컨텍스트 제공
4. 인라인으로 노트 편집

---

**3순위: obsidian-claude-pkm (목표 관리 시)**

**적합한 경우:**
- 연구 목표를 체계적으로 관리하고 싶음
- 장기 비전 → 프로젝트 → 일일 태스크 연결
- 주간/월간 리뷰 자동화

**워크플로우:**
1. 템플릿 복제 또는 /adopt
2. `/daily`, `/weekly`, `/monthly` 사용
3. 목표별 진행 상황 추적

---

### 4.2 통합 워크플로우 제안

**Hybrid Approach:**

```
┌─────────────────────────────────────────┐
│           OpenClaw (행크)                │
│  - Telegram에서 자연어 요청              │
│  - 조사 수행                             │
│  - 결과를 workspace + Obsidian에 저장    │
└─────────────────────────────────────────┘
                   ↓
┌─────────────────────────────────────────┐
│          Obsidian (Research Vault)      │
│  - 장기 아카이브                         │
│  - 태그, 링크로 연결                     │
│  - 필요 시 Claudian으로 추가 편집        │
└─────────────────────────────────────────┘
```

**이점:**
1. **workspace** → 빠른 접근, 작업용
2. **Obsidian** → 장기 저장, 링크, 태그, 검색
3. **Telegram** → 언제 어디서나 요청
4. **Claudian** → 심층 편집 시 사용

---

### 4.3 실용적 팁

**1. 이중 저장**
- 모든 조사 결과를 workspace와 Obsidian 양쪽에 저장
- workspace: 빠른 접근, 최신
- Obsidian: 아카이브, 맥락

**2. 태그 시스템**
```markdown
# 2026-03-12 React Native Trends

#research #react-native #frontend #trends

## Summary
...

## References
- [React Native Blog](https://reactnative.dev/blog)
```

**3. 자동화 스크립트**
```bash
# research 완료 후 자동으로 Obsidian에 저장
alias save-to-obsidian='obsidian-cli create "Research/$(date +%Y-%m-%d)" --content "$(cat $(ls -t *.md | head -1))" --open'
```

**4. 템플릿 사용**
- 각 조사 유형별 템플릿 정의
- 기술 조사, 논문 분석, 제품 비교 등

**5. 주간 리뷰**
- 일요일에 지난주 조사 내용 리뷰
- 중요한 내용을 Obsidian에서 정리
- 링크 연결

---

## 5. 참고 자료

### OpenClaw
- Obsidian Skill: `/opt/homebrew/lib/node_modules/openclaw/skills/obsidian/SKILL.md`
- OpenClaw Docs: https://docs.openclaw.ai

### Obsidian + Claude Code
- obsidian-claude-pkm: https://github.com/ballred/obsidian-claude-pkm
- Claudian: https://github.com/YishenTu/claudian
- obsidian-agent-client: https://github.com/RAIT-09/obsidian-agent-client
- Visual Skills Pack: https://github.com/axtonliu/axton-obsidian-visual-skills

### Obsidian 공식
- Obsidian: https://obsidian.md
- Community Plugins: https://github.com/obsidianmd/obsidian-releases
- Help Docs: https://help.obsidian.md

### 커뮤니티
- r/ObsidianMD: https://www.reddit.com/r/ObsidianMD/
- Obsidian Forum: https://forum.obsidian.md
- Obsidian Discord: https://discord.gg/obsidianmd

---

_작성자: Hank McCoy_
_조사 방법: OpenClaw 공식 문서, GitHub, Reddit 분석_
