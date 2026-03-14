---
tags:
  - openclaw
  - telegram
  - 연동
  - 셋업
date: 2026-03-12
---

# Telegram Topic OpenClaw 연동

조사 일자: 2026-03-12

조사 일자: 2026-03-12
목적: Telegram topic(forum) 생성 후 OpenClaw와 연결
출처: OpenClaw 공식 문서, Telegram Bot API 튜토리얼

---

## 1. 핵심 요약

**Telegram Topic이란:**
- Telegram Group을 Forum으로 전환하여 주제별 스레드 생성 가능
- 각 topic은 독립적인 세션으로 동작
- OpenClaw는 topic별로 격리된 대화 유지

**연결 단계:**
1. Telegram Bot 생성 (@BotFather)
2. Group 생성 및 Forum 활성화
3. Bot을 Group에 추가
4. Topic 생성
5. OpenClaw 설정
6. Gateway 시작 및 테스트

**소요 시간:** 10-15분

---

## 2. 상세 가이드

### Step 1: Telegram Bot 생성

#### 1.1 @BotFather 대화

1. Telegram 앱에서 **@BotFather** 검색
2. 대화 시작 후 `/newbot` 입력
3. Bot 이름 입력 (예: "My Research Agent")
4. Bot username 입력 (예: `my_research_agent_bot`)
   - 끝이 `bot`으로 끝나야 함

#### 1.2 Token 저장

```
Done! Congratulations on your new bot...
Use this token to access the HTTP API:
1234567890:ABCdefGHIjklMNOpqrsTUVwxyz

Keep your token secure...
```

**⚠️ 중요:** Token을 안전하게 저장. 절대 공개 저장소에 커밋하지 말 것.

#### 1.3 Bot 설정 (선택)

```
/setjoingroups
# 그룹 추가 허용 여부 설정

/setprivacy
# Privacy mode 설정 (Disabled 권장)
```

**Privacy Mode:**
- Enabled: Bot이 멘션된 메시지만 수신
- Disabled: Bot이 모든 메시지 수신
- **권장:** Forum topic 사용 시 Disabled로 설정

---

### Step 2: Group 생성 및 Forum 활성화

#### 2.1 Group 생성

1. Telegram 앱 → New Group
2. Group 이름 입력 (예: "Research Agents")
3. 최소 1명의 멤버 추가 (Bot은 나중에 추가)

#### 2.2 Forum 활성화

**Desktop (Telegram Desktop):**
1. Group 정보 → Edit → Topics 활성화

**Mobile (iOS/Android):**
1. Group 정보 → Edit → Topics 토글

**결과:**
- Group이 Forum으로 전환됨
- General topic 자동 생성
- 새 topic 생성 버튼 활성화

---

### Step 3: Bot을 Group에 추가

#### 3.1 Bot 추가

1. Group 정보 → Add Members
2. Bot username 검색 (예: `@my_research_agent_bot`)
3. 추가

#### 3.2 Bot 권한 설정 (선택)

**Admin으로 설정 시:**
1. Group 정보 → Administrators → Add Admin
2. Bot 선택
3. 필요한 권한 체크

**권장 권한:**
- ✅ Post Messages
- ✅ Edit Messages
- ✅ Delete Messages
- ✅ Pin Messages
- ✅ Manage Topics (Forum인 경우)

---

### Step 4: Topic 생성

#### 4.1 Topic 생성

1. Forum Group에서 "Create New Topic" 클릭
2. Topic 이름 입력 (예: "Research", "Coding", "General")
3. Icon 선택
4. 생성

#### 4.2 Topic ID 확인

**방법 1: 메시지 전송 후 로그 확인**
```bash
openclaw logs --follow
```

Topic에 메시지 전송 → 로그에서 `message_thread_id` 확인

**방법 2: Bot API 사용**
```bash
curl "https://api.telegram.org/bot<YOUR_TOKEN>/getUpdates" | jq
```

`message_thread_id` 필드 확인

---

### Step 5: OpenClaw 설정

#### 5.1 기본 설정

**~/.openclaw/openclaw.json5:**
```json5
{
  channels: {
    telegram: {
      enabled: true,
      botToken: "1234567890:ABCdefGHIjklMNOpqrsTUVwxyz",
      
      // DM 정책
      dmPolicy: "pairing", // 또는 "allowlist", "open"
      
      // Group 설정
      groups: {
        "-1001234567890": {  // Group ID (음수)
          requireMention: false,  // 멘션 없이도 반응
          groupPolicy: "open",    // 그룹 내 모든 멤버 허용
          
          // 특정 topic만 허용 (선택)
          topics: {
            "123": {  // Topic ID
              allowFrom: ["*"],  // 모든 사용자
            },
            "456": {
              allowFrom: ["8734062810"],  // 특정 사용자만
            },
          },
        },
      },
      
      // 그룹 전역 설정
      groupPolicy: "allowlist",  // 또는 "open"
      
      // 스트리밍 모드
      streaming: "partial",  // 실시간 메시지 편집
    },
  },
  
  agents: {
    list: [
      {
        id: "main",
        model: "zai/glm-5",  // 또는 다른 모델
      },
    ],
  },
}
```

#### 5.2 Group ID 찾기

**방법 1: 로그 확인**
```bash
openclaw logs --follow
```

Group에 메시지 전송 → 로그에서 `chat.id` 확인 (음수, 예: `-1001234567890`)

**방법 2: Bot API**
```bash
curl "https://api.telegram.org/bot<YOUR_TOKEN>/getUpdates" | jq '.result[-1].message.chat.id'
```

**방법 3: Third-party bot**
- `@userinfobot`에 Group 메시지 포워드
- 또는 `@getidsbot` 사용

#### 5.3 사용자 ID 찾기

**방법 1: 로그 확인**
```bash
openclaw logs --follow
```

Bot에게 DM 전송 → 로그에서 `from.id` 확인

**방법 2: Bot API**
```bash
curl "https://api.telegram.org/bot<YOUR_TOKEN>/getUpdates" | jq '.result[-1].message.from.id'
```

---

### Step 6: Gateway 시작 및 테스트

#### 6.1 Gateway 시작

```bash
openclaw gateway start
```

또는 foreground에서 실행:
```bash
openclaw gateway
```

#### 6.2 상태 확인

```bash
# Gateway 상태
openclaw status

# Telegram 채널 상태
openclaw channels status telegram

# Plugin 목록
openclaw plugins list
```

#### 6.3 Pairing (DM인 경우)

```bash
# Bot에게 DM 전송
# openclaw logs --follow 로 pairing code 확인

openclaw pairing list telegram
openclaw pairing approve telegram <CODE>
```

#### 6.4 Topic에서 테스트

1. Topic에 메시지 전송: "안녕!"
2. Bot이 응답하는지 확인
3. 로그 확인: `openclaw logs --follow`

---

## 3. 설정 예시

### 3.1 간단한 설정 (하나의 Group, 모든 topic 허용)

```json5
{
  channels: {
    telegram: {
      enabled: true,
      botToken: "1234567890:ABCdefGHIjklMNOpqrsTUVwxyz",
      dmPolicy: "pairing",
      
      groups: {
        "-1001234567890": {
          requireMention: false,
          groupPolicy: "open",
        },
      },
      
      streaming: "partial",
    },
  },
}
```

---

### 3.2 고급 설정 (여러 Group, Topic별 권한)

```json5
{
  channels: {
    telegram: {
      enabled: true,
      botToken: "1234567890:ABCdefGHIjklMNOpqrsTUVwxyz",
      
      // DM은 allowlist만 허용
      dmPolicy: "allowlist",
      allowFrom: ["8734062810"],
      
      // Group 1: 모든 멤버, 모든 topic
      groups: {
        "-1001234567890": {
          requireMention: false,
          groupPolicy: "open",
        },
      },
      
      // Group 2: 특정 멤버만
      groups: {
        "-1009876543210": {
          requireMention: true,
          groupPolicy: "allowlist",
          groupAllowFrom: ["8734062810", "745123456"],
          
          // Topic별 권한
          topics: {
            "123": {  // Research topic
              allowFrom: ["8734062810"],
            },
            "456": {  // General topic
              allowFrom: ["*"],
            },
          },
        },
      },
      
      streaming: "partial",
    },
  },
}
```

---

### 3.3 특정 Agent를 Topic에 연결

```json5
{
  agents: {
    list: [
      {
        id: "research",
        model: "zai/glm-5",
        label: "Research Agent",
        systemPrompt: "You are a research agent...",
      },
      {
        id: "coding",
        model: "anthropic/claude-3-opus",
        label: "Coding Agent",
        systemPrompt: "You are a coding agent...",
      },
    ],
  },
  
  channels: {
    telegram: {
      enabled: true,
      botToken: "...",
      
      groups: {
        "-1001234567890": {
          requireMention: false,
          groupPolicy: "open",
          
          // Topic별 agent 지정 (현재 지원하지 않을 수 있음)
          // 기본적으로는 모든 topic이 default agent 사용
        },
      },
    },
  },
}
```

---

## 4. 문제 해결

### 4.1 Bot이 응답하지 않음

**확인 사항:**

1. **Gateway 실행 중인지 확인**
   ```bash
   openclaw gateway status
   ```

2. **Token이 올바른지 확인**
   ```bash
   curl "https://api.telegram.org/bot<YOUR_TOKEN>/getMe"
   ```

3. **Bot이 Group에 추가되어 있는지 확인**
   - Group 정보 → Members

4. **Privacy Mode 확인**
   ```bash
   # @BotFather에서
   /setprivacy
   # Disabled 권장
   ```

5. **Group ID가 올바른지 확인**
   - 음수여야 함 (예: `-1001234567890`)

6. **로그 확인**
   ```bash
   openclaw logs --follow
   ```

---

### 4.2 특정 Topic에서만 응답하지 않음

**확인 사항:**

1. **Topic ID가 올바른지 확인**
   ```bash
   openclaw logs --follow
   # topic에 메시지 전송 후 message_thread_id 확인
   ```

2. **Topic별 권한 확인**
   ```json5
   topics: {
     "123": {
       allowFrom: ["*"],  // 또는 사용자 ID
     },
   }
   ```

3. **requireMention 설정 확인**
   ```json5
   requireMention: false,  // 멘션 없이도 반응
   ```

---

### 4.3 Permission denied 에러

**확인 사항:**

1. **Bot이 Admin인지 확인**
   - Group 정보 → Administrators

2. **groupPolicy / allowFrom 확인**
   ```json5
   groupPolicy: "allowlist",
   groupAllowFrom: ["8734062810"],  // 사용자 ID
   ```

---

### 4.4 중복 응답

**확인 사항:**
- Gateway가 여러 개 실행 중인지 확인
- `openclaw gateway stop` 후 다시 시작

---

## 5. 유용한 명령어

### 5.1 로그 확인

```bash
# 실시간 로그
openclaw logs --follow

# 특정 채널 로그
openclaw logs --follow --channel telegram

# 최근 로그
openclaw logs --tail 100
```

### 5.2 상태 확인

```bash
# 전체 상태
openclaw status

# 채널별 상태
openclaw channels status telegram

# Pairing 상태
openclaw pairing list telegram
```

### 5.3 재시작

```bash
# Gateway 재시작
openclaw gateway restart

# 설정 reload (재시작 없이)
# 현재 지원하지 않음, restart 필요
```

### 5.4 Doctor

```bash
# 진단
openclaw doctor

# 자동 수정
openclaw doctor --fix
```

---

## 6. 보안 고려사항

### 6.1 Token 보안

- ✅ 환경 변수 사용: `TELEGRAM_BOT_TOKEN`
- ✅ `.gitignore`에 추가
- ❌ 공개 저장소에 커밋하지 말 것
- ❌ 스크린샷에 포함하지 말 것

### 6.2 권한 최소화

- 필요한 Group만 `groups`에 등록
- 필요한 사용자만 `allowFrom`에 등록
- `requireMention: true`로 설정하여 무응답 방지

### 6.3 Privacy Mode

- Forum topic 사용 시 Disabled 권장
- 일반 Group에서는 Enabled 고려
- 설정 변경 후 Bot 재추가 필요

---

## 7. 고급 기능

### 7.1 Streaming (실시간 응답)

```json5
{
  channels: {
    telegram: {
      streaming: "partial",  // 메시지 편집으로 실시간 스트리밍
    },
  },
}
```

**옵션:**
- `off` — 스트리밍 없음
- `partial` — 부분 편집
- `block` — 블록 단위
- `progress` — 진행률

### 7.2 Mention Patterns

```json5
{
  agents: {
    list: [
      {
        id: "main",
        groupChat: {
          mentionPatterns: ["agent", "bot", "ai"],
        },
      },
    ],
  },
}
```

### 7.3 세션 격리

- 각 Topic은 자동으로 독립 세션
- Session key: `{groupId}:topic:{topicId}`
- 대화 컨텍스트가 topic 간 공유되지 않음

---

## 8. 참고 자료

### 공식 문서
- OpenClaw Telegram: https://docs.openclaw.ai/channels/telegram
- Telegram Bot API: https://core.telegram.org/bots/api
- Telegram Bot Tutorial: https://core.telegram.org/bots/tutorial

### 명령어
- @BotFather: Bot 생성 및 관리
- @userinfobot: User/Group ID 확인
- @getidsbot: User/Group ID 확인

### 로그 분석
```bash
# Bot 응답 로그
openclaw logs --follow | grep telegram

# 에러 로그
openclaw logs --follow | grep -i error
```

---

_작성자: Hank McCoy_
_조사 방법: OpenClaw 공식 문서, Telegram Bot API 튜토리얼_
