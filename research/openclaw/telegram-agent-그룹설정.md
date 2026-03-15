---
tags:
  - openclaw
  - telegram
  - agent
  - setup
date: 2026-03-15
---

# Telegram 그룹에 Agent 참여 설정

조사 일자: 2026-03-15

## 핵심 요약

OpenClaw agent를 Telegram 그룹에 참여시키려면 봇 생성, 설정 구성, Privacy Mode 비활성화가 필요하다.

## 설정 단계

### 1단계: 봇 생성 및 토큰 획득

```bash
# Telegram에서 @BotFather 대화
/newbot
# 봇 이름 입력, 토큰 받기
```

### 2단계: OpenClaw 설정

`~/.openclaw/openclaw.json`:

```json5
{
  channels: {
    telegram: {
      enabled: true,
      botToken: "123456:ABC...",  // 또는 환경변수 TELEGRAM_BOT_TOKEN
      dmPolicy: "pairing",
      groupPolicy: "allowlist",  // 또는 "open"
      groups: {
        "-1001234567890": {      // 그룹 채팅 ID
          requireMention: false, // 멘션 없이도 모든 메시지 수신
        },
      },
    },
  },
}
```

### 3단계: 봇을 그룹에 추가

1. 그룹 설정 → 멤버 추가 → 봇 검색 후 추가
2. **중요**: Privacy Mode 비활성화 필요

```
@BotFather → /setprivacy → Disable
```

또는 봇을 **그룹 관리자**로 승격

### 4단계: 그룹 채팅 ID 찾기

```bash
# 방법 1: 로그 확인
openclaw logs --follow
# 그룹에서 메시지 보내면 chat.id 확인

# 방법 2: 봇 API 직접 호출
curl "https://api.telegram.org/bot<TOKEN>/getUpdates"

# 방법 3: 서드파티 봇 사용
# 그룹 메시지를 @userinfobot 또는 @getidsbot에 포워드
```

### 5단계: Gateway 시작

```bash
openclaw gateway restart
```

## 주요 설정 옵션

### 그룹 정책 (groupPolicy)

| 값 | 설명 |
|------|------|
| `open` | 그룹 내 모든 사용자 허용 |
| `allowlist` | 특정 사용자만 허용 (기본값) |
| `disabled` | 그룹 비활성화 |

### 멘션 설정 (requireMention)

| 값 | 설명 |
|------|------|
| `true` | @멘션 시에만 반응 |
| `false` | 모든 메시지에 반응 |

### 특정 사용자만 허용

```json5
groups: {
  "-1001234567890": {
    requireMention: false,
    allowFrom: ["123456789", "987654321"],  // 허용할 사용자 ID
  },
}
```

## Privacy Mode 이해

Telegram 봇은 기본적으로 **Privacy Mode**가 활성화되어 있어:
- 그룹 메시지 중 일부만 수신 (멘션, 명령어 등)
- 모든 메시지를 수신하려면 비활성화 필요

**비활성화 방법:**
1. @BotFather에서 `/setprivacy` → Disable
2. 봇을 그룹에서 제거 후 다시 추가

## Forum Topics 지원

Forum 그룹의 각 토픽을 다른 에이전트에 바인딩 가능:

```json5
{
  channels: {
    telegram: {
      groups: {
        "-1001234567890": {
          topics: {
            "1": { agentId: "main" },      // General topic → main agent
            "3": { agentId: "dev" },       // Dev topic → dev agent
            "5": { agentId: "coder" }      // Code review → coder agent
          }
        }
      }
    }
  }
}
```

## 문제 해결

### 봇이 멘션 없는 메시지에 반응하지 않음

1. `requireMention: false` 설정 확인
2. Privacy Mode 비활성화 확인
3. 봇 제거 후 재추가

### 봇이 그룹 메시지를 전혀 수신하지 않음

1. `groups` 설정에 그룹 ID 포함 확인
2. 봇이 그룹 멤버인지 확인
3. `openclaw logs --follow` 로그 확인

## 참고 자료

- [OpenClaw Telegram 문서](/opt/homebrew/lib/node_modules/openclaw/docs/channels/telegram.md)
- [BotFather](https://t.me/BotFather)
