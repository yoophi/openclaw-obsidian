# Telegram bot-to-bot relay 정리

작성일: 2026-03-15

## 배경
- Telegram 그룹 채팅 / forum topic 에서 **Kitty가 말한 내용을 Hank가 읽지 못한 이유**를 확인했다.
- 핵심 가설은 **Telegram이 한 bot이 생성한 메시지를 다른 bot에게 일반 그룹 메시지처럼 전달하지 않기 때문**이라는 점이다.
- 따라서 두 agent가 같은 그룹/토픽 관리자 권한을 가지고 있어도, **Bot API 레벨에서 update를 받지 못하면 읽을 수 없다.**

## 왜 관리자 권한이 있어도 안 보일 수 있나
- Telegram의 관리자 권한은 보통:
  - 메시지 삭제
  - 멤버/권한 관리
  - 토픽 관리
  - 고정 등
  같은 **운영 권한**에 가깝다.
- 하지만 bot은 사람 클라이언트처럼 그룹 전체 타임라인을 자유롭게 읽는 구조가 아니다.
- bot은 **Telegram이 전달한 update만** 볼 수 있다.
- 그래서 관리자여도:
  - 과거 메시지를 임의 조회하거나
  - 다른 bot의 메시지를 전부 감시하거나
  - 그룹 전체 로그를 자유롭게 읽는 것은 보장되지 않는다.

## 관련해서 함께 본 점
- Privacy mode 는 그룹의 일반 메시지 수신 여부에 영향을 준다.
- 다만 이번 문제는 privacy mode 여부만으로 설명되기보다,
  **bot ↔ bot 메시지 전달 자체가 제한되는 케이스**로 보는 게 더 타당하다.
- Telegram forum topic 은 `message_thread_id` 기반으로 분리되며,
  OpenClaw도 topic 단위로 별도 세션처럼 다룬다.
- 하지만 이번 현상은 topic 분리보다는 **Telegram 전달 제한** 쪽이 더 유력하다.

## 결론
Telegram 위에서 bot끼리 직접 상대 bot 메시지를 읽게 기대하기보다,
**OpenClaw 내부에서 agent 메시지를 relay / mirror 하는 구조**를 만드는 편이 더 안정적이다.

---

## 가능한 해결 방향

### 1. 파일 기반 relay
가장 단순한 방식.

예시:
- Kitty가 말한 내용을 JSONL 파일에 append
- Hank가 그 파일을 읽어서 새 메시지만 소비
- 마지막으로 읽은 위치는 별도 state 파일에 저장

예시 파일 구조:
- `shared-relay/telegram/-1003559464404/topic-51.jsonl`
- `shared-relay/state/hank.json`

장점:
- 구현이 쉽다
- 디버깅이 쉽다
- Telegram 제한과 무관하다

단점:
- push 기반이 아니라 poll/read 기반이다
- 중복 처리, 동시성 처리 필요

### 2. 세션 간 message forwarding
OpenClaw의 세션 전송 개념으로 relay 하는 방식.

흐름:
1. Kitty가 메시지 생성
2. relay 로직이 Hank 세션으로 전달
3. Hank는 이 내용을 내부 문맥으로 읽음

전달 예시:
```text
[Relayed from Kitty in Telegram group Fluffy Soft / topic 51]
안녕하세요 팀장님 👋
```

장점:
- Hank가 파일을 직접 읽지 않아도 된다
- “다른 agent의 발화”를 문맥으로 다루기 좋다

단점:
- relay trigger 지점 설계가 필요하다
- 재전송 루프 방지가 중요하다

필요한 메타데이터 예시:
- `originAgent`
- `relayedBy`
- `relayId`

### 3. OpenClaw plugin 기반 event bridge
가장 정식에 가까운 방식.

OpenClaw plugin은 TypeScript 모듈로 로드되며, 다음을 확장할 수 있다.
- tools
- CLI commands
- background services
- hooks
- 기타 런타임 기능

따라서 plugin에서:
- 특정 Telegram group/topic의 agent outbound message를 감지하고
- 내부 relay queue 또는 저장소에 기록하고
- 다른 agent/session에 전달하는 구조를 만들 수 있다.

이 방식의 핵심은:
**Telegram 메시지를 다시 읽는 게 아니라, OpenClaw가 이미 알고 있는 agent 출력 이벤트를 내부에서 복제한다**는 점이다.

---

## 추천 구조: `agent-relay` plugin

### 목표
특정 채팅/토픽에서 발생한 **agent outbound message**를 다른 agent/session으로 전달한다.

### 예시 설정
```json
{
  "plugins": {
    "entries": {
      "agent-relay": {
        "enabled": true,
        "config": {
          "rules": [
            {
              "channel": "telegram",
              "chatId": "-1003559464404",
              "topicId": "51",
              "fromAgent": "coding",
              "toAgent": "hank",
              "mode": "session-send"
            }
          ]
        }
      }
    }
  }
}
```

### 동작 개요
1. Kitty(coding agent)가 Telegram topic 51에 응답
2. plugin이 그 outbound event를 감지
3. 표준 relay payload로 변환
4. Hank session으로 전달
5. Hank는 이후 문맥에서 해당 내용을 읽을 수 있음

예시 payload:
```json
{
  "source": {
    "channel": "telegram",
    "chatId": "-1003559464404",
    "topicId": "51"
  },
  "speaker": "Kitty",
  "agentId": "coding",
  "text": "안녕하세요 팀장님 👋",
  "timestamp": "2026-03-15T13:01:00Z",
  "relayId": "..."
}
```

---

## 구현 시 필수 안전장치

### 1. loop 방지
가장 중요하다.

문제 예시:
- Kitty → Hank relay
- Hank가 응답
- 그 응답이 다시 Kitty로 relay
- 무한 반복

방지책:
- relay 메시지에 `relayId`, `originAgent` 표기
- 이미 relay된 메시지는 재전송 금지
- self-forward 금지

### 2. scope 제한
전부 복제하면 위험하다.

권장:
- 특정 `chatId + topicId`만 허용
- 특정 agent pair만 허용
- 민감 채널/DM 기본 차단

### 3. message shaping
다른 agent에게 사람이 쓴 말처럼 보이지 않도록, 출처를 명확히 표시한다.

예시:
```text
[Relayed from Kitty in Telegram group Fluffy Soft / topic 51]
안녕하세요 팀장님 👋
```

### 4. history 전략
- 최근 n개 relay 캐시 유지
- 재시작 후 복구 가능하도록 JSONL 저장 권장

---

## 권장 실행 순서

### 단기: MVP
파일 기반 relay로 검증
- `relay/messages.jsonl`
- `relay/state/hank.json`
- 최근 메시지 append / consume 구현

### 중기: plugin + session forwarding
- 운영성 좋음
- Telegram 제약에서 독립적
- 토픽 단위 정책 적용 쉬움

### 장기: event bus 수준 일반화
- agent outbound/inbound를 표준 이벤트로 다뤄서
- relay, logging, audit, mirroring 등을 공통 기능으로 재사용

---

## 최종 요약
- Hank가 Kitty 메시지를 못 읽은 가장 유력한 이유는 **Telegram이 bot이 만든 메시지를 다른 bot에 일반 group update로 전달하지 않았기 때문**이다.
- 관리자 권한은 이 문제를 해결하지 못한다.
- 해결하려면 Telegram을 우회해서,
  **OpenClaw 내부에서 agent 발화를 session/file/plugin 기반으로 relay 하는 구조**를 만드는 것이 현실적이다.
- 실무적으로는:
  1. 파일 기반 MVP로 빠르게 검증하고
  2. 이후 `agent-relay` plugin으로 정식화하는 방향이 적절하다.
