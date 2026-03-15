# Agent 간 메시지 공유/전달 정리

- 작성일: 2026-03-15
- 맥락: Telegram 그룹 채팅/토픽에서 한 Agent(예: Kitty)가 작성한 메시지를 다른 Agent(예: Hank)가 읽지 못하는 이유와, 이를 보완하는 방법 검토

## 배경

병혁님 질문:
- Kitty가 Telegram 그룹 채팅/토픽에서 말한 내용을 Hank가 읽지 못한 이유는 무엇인가?
- Telegram에서 bot이 생성한 메시지를 다른 bot에게 전달하지 않는 특성 때문일 수 있는가?
- 그렇다면 OpenClaw에서 agent가 생성한 메시지를 session 간 파일/메시지 전송으로 relay해 주는 방식의 plugin 또는 구조를 만들 수 있는가?

## 현재 해석

가능성이 높은 설명은 다음과 같다.

1. **Telegram 플랫폼 제약**
   - Telegram Bot API 환경에서는 bot이 생성한 메시지가 다른 bot의 update 흐름으로 자연스럽게 전달되지 않거나,
   - 전달되더라도 기대하는 형태로 다른 agent 세션의 입력 문맥으로 자동 주입되지 않을 수 있다.

2. **OpenClaw 세션/컨텍스트 분리**
   - 관리자 권한이 있다고 해서 모든 Agent가 모든 그룹/토픽의 메시지를 자동으로 공유받는 것은 아니다.
   - 실제로는 각 Agent가 연결된 세션, 라우팅 규칙, 컨텍스트 주입 방식에 따라 읽을 수 있는 범위가 달라질 수 있다.

즉, 문제는 단순 권한 부족보다는 **플랫폼 전달 방식 + OpenClaw 세션 격리 구조**의 조합일 가능성이 높다.

## 핵심 결론

Telegram 레이어 자체를 억지로 해결하려 하기보다, **OpenClaw 내부에서 agent 출력물을 다른 session/file로 relay하는 계층을 추가하는 방식**이 더 현실적이다.

## 가능한 해결 방법

### 1. 공용 파일 기반 handoff
가장 단순하고 안정적인 방법.

예시:
- `shared/telegram-topic-51.log`
- `shared/handoff/kitty-to-hank.md`

동작 방식:
- Kitty가 생성한 메시지를 공용 파일에 기록
- Hank가 그 파일을 읽어 참조

장점:
- 구현이 단순함
- 디버깅이 쉬움
- 세션 분리와 무관하게 동작 가능

단점:
- 실시간성이 약함
- 읽음 상태/동기화 규칙을 별도로 정해야 함

### 2. 세션 간 메시지 relay
OpenClaw의 세션 도구를 이용해 한 세션의 출력을 다른 세션으로 전달하는 방식.

관련 도구/개념:
- `sessions_send`
- `sessions_history`
- `sessions_list`

동작 방식 예시:
- Kitty 세션이 생성한 내용을 Hank 세션으로 `sessions_send`
- 또는 공용 협업 세션으로 복제

장점:
- 파일보다 자연스러운 협업 구조
- 대화 흐름 유지에 유리

단점:
- 라우팅 규칙 설계 필요
- 무한 relay loop 방지 필요

### 3. OpenClaw plugin으로 자동 relay
OpenClaw 플러그인은 문서상 다음을 등록할 수 있다.
- hooks
- tools
- commands
- services
- HTTP routes

따라서 특정 채널/토픽에서 생성된 agent 응답을 감지하고,
이를 다른 session 또는 shared log로 복제하는 **agent-relay plugin** 작성이 가능하다.

## 권장 플러그인 방향

### A. `agent-relay` plugin
역할:
- 특정 agent의 outbound 메시지를 후킹
- 규칙에 따라 다른 session 또는 저장소로 전달

설정 예시:

```yaml
plugins:
  entries:
    agent-relay:
      enabled: true
      config:
        rules:
          - channel: telegram
            chatId: -1003559464404
            topicId: 51
            fromAgent: kitty
            toSession: hank-main
            mode: sessions_send
```

### B. `shared-memory` / `shared-log` plugin
역할:
- 특정 채팅의 agent 출력물을 구조화된 로그 파일로 저장
- 다른 agent는 이 파일을 읽어서 참조

저장 예시:

```json
{
  "timestamp": "2026-03-15T22:20:00+09:00",
  "channel": "telegram",
  "chat_id": "-1003559464404",
  "topic_id": 51,
  "agent": "kitty",
  "message_id": "12345",
  "text": "..."
}
```

## 구현 시 주의사항

### 1. 무한 루프 방지
가장 중요하다.

필요한 메타데이터 예:
- `origin_agent`
- `relayed_by`
- `relay_depth`
- `do_not_relay`

### 2. 공개 메시지와 내부 메모 분리
그룹 채팅 내용을 agent 간 공유하더라도,
- 공개 가능한 대화
- 내부 운영 메모
- 민감 정보

를 구분해야 한다.

특히 `MEMORY.md` 같은 장기 기억/개인 메모와, Telegram 공개 대화 relay는 분리하는 것이 안전하다.

### 3. “읽는다”의 의미 정의
다른 Agent가 내용을 읽는 방식은 몇 단계로 나눌 수 있다.

- 단순 조회
- 응답 생성 시 참고 컨텍스트로 사용
- 자기 기억처럼 장기 저장

초기 구현은 아래가 안전하다.
- **자동 주입 X**
- **조회 가능한 shared log O**

## 최종 권장안

우선순위는 다음과 같다.

1. **공용 로그 파일 기반 MVP**
   - 가장 빠르게 구현 가능
   - 안정적이고 디버깅 용이

2. **세션 간 relay plugin**
   - 더 자연스럽지만 설계 복잡도 증가

3. **Telegram plugin 자체 수정**
   - 플랫폼 제약이 원인일 경우 효과가 제한적일 수 있어 후순위

## 한 줄 정리

문제의 본질은 “권한이 있는데 왜 못 읽느냐”보다는,
**Telegram의 bot 메시지 전달 특성과 OpenClaw의 세션 격리 구조 때문에 Agent 간 메시지가 자동 공유되지 않는 점**에 있다.

따라서 해결은 Telegram을 직접 바꾸기보다,
**OpenClaw 내부에 shared log 또는 session relay 계층을 추가하는 방식**이 가장 현실적이다.
