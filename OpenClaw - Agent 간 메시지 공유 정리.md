# OpenClaw - Agent 간 메시지 공유 정리

작성일: 2026-03-15

## 배경
텔레그램 그룹/토픽에서 Kitty가 작성한 메시지를 Hank가 읽지 못한 이유와, 이를 우회하기 위한 OpenClaw 측 설계 방법을 정리했다.

## 왜 Hank가 Kitty 메시지를 못 읽을 수 있나

### 1. 텔레그램 관리자 권한과 Agent 컨텍스트는 다르다
- 텔레그램 그룹 관리 권한이 있다고 해서, 모든 Agent가 모든 메시지를 자동으로 자기 컨텍스트에 갖게 되는 것은 아니다.
- OpenClaw의 Agent는 보통 **자기 세션으로 라우팅된 메시지**를 기준으로 동작한다.

### 2. 세션이 분리되어 있을 수 있다
- Kitty와 Hank가 서로 다른 세션이라면, Kitty가 본 대화가 Hank 세션에 자동 복제되지 않는다.
- 이 경우 Hank가 Kitty의 내용을 보려면 `sessions_history` 같은 방식으로 **명시적으로 다른 세션 기록을 읽어야** 한다.

### 3. Telegram forum topic 단위 바인딩 가능성
- 같은 그룹 안에서도 topic별로 서로 다른 세션/agent에 바인딩될 수 있다.
- 그러면 같은 그룹이어도 기본 컨텍스트는 분리된다.

### 4. 과거 메시지 자동 로드가 아닐 수 있다
- Hank가 나중에 붙더라도, Kitty가 이전에 했던 말을 자동으로 전부 불러오지 않을 수 있다.
- 필요하면 별도 히스토리 조회나 전달이 필요하다.

### 5. 세션 visibility 제한
- OpenClaw의 `sessions_history`, `sessions_send`는 가능하지만,
- 어떤 세션까지 볼 수 있는지는 설정(`tools.sessions.visibility`)에 영향을 받을 수 있다.
- Kitty와 Hank가 독립 세션이면 서로 못 볼 수 있다.

## 텔레그램 bot 제한 가능성
- 병혁의 추정처럼, 텔레그램에서 **bot이 생성한 메시지가 다른 bot에게 그대로 전달되지 않는 구조**일 가능성이 있다.
- 이 경우 텔레그램 레벨에서 직접 읽게 하려 하기보다,
- **OpenClaw 내부에서 agent-to-agent relay를 만드는 쪽이 더 현실적**이다.

## 해결 방향

### A. 가장 쉬운 방법: 내부 relay
Kitty가 답변을 생성한 뒤, 그 내용을 Hank 세션에도 별도로 전달한다.

예시:
- Kitty 응답 생성
- `sessions_send(sessionKey=Hank, message="Kitty said: ...")`
- Hank는 전달받은 내용을 자기 컨텍스트로 사용

장점:
- 텔레그램 bot 제한과 무관
- OpenClaw 내부에서 제어 가능
- 비교적 구현이 단순함

### B. 파일 기반 shared log
공용 파일에 agent 발화를 기록하고, 다른 agent가 그 파일을 읽게 한다.

예시 파일:
- `shared/kitty-to-hank.md`
- `shared/group-topic-51.log`

장점:
- 구현 쉬움
- 디버깅 쉬움
- 전달된 내용을 눈으로 확인 가능

단점:
- 실시간성은 다소 약할 수 있음
- 중복 기록/포맷 관리 필요

### C. OpenClaw plugin / hook 기반 자동 relay
OpenClaw plugin을 작성해 agent 발화를 자동 감지하고,
다른 session/agent로 전달하는 구조를 만들 수 있다.

가능한 역할:
- 특정 채널/토픽의 inbound/outbound 이벤트 감시
- Kitty가 생성한 최종 응답만 추출
- Hank 세션으로 `sessions_send`
- 또는 파일/DB에 저장

문서상 plugin은 다음을 확장할 수 있다.
- hooks
- tools
- services
- HTTP routes
- channel integrations

## 추천 구현 순서

### 1단계: 빠른 프로토타입
- shared file/log 방식으로 먼저 테스트

### 2단계: 실사용형
- `sessions_send` 기반 relay 구성
- Kitty → Hank 전달 자동화

### 3단계: 정식화
- OpenClaw plugin 작성
- hook으로 outbound/inbound 감시
- topic/agent 기준 relay 정책화
- config에서 on/off 제어

## 구현 시 주의사항

### 무한 루프 방지
- Kitty → Hank 전달
- Hank가 다시 Kitty로 전달
- 이런 핑퐁이 생기지 않도록 source/target 정책 필요

### 중복 전달 방지
- 같은 메시지가 여러 번 복제되지 않도록 message id 또는 fingerprint 관리 필요

### 민감 정보 누출 방지
- 그룹 대화를 다른 세션으로 넘길 때 범위를 명확히 정해야 함

### 출처 표기
Hank가 relay 메시지를 직접 본 대화로 오해하지 않도록 메타데이터를 붙이는 것이 좋다.

예시:

```text
[Relay from Kitty | telegram group topic 51 | agent-generated]
Kitty said:
"..."
```

## 결론
- 텔레그램 관리자 권한이 있다고 해서 모든 Agent가 다른 Agent의 메시지를 자동으로 읽는 것은 아니다.
- 문제는 보통 **세션 분리**, **토픽 바인딩**, **세션 visibility**, 그리고 **텔레그램 bot 전달 제약**이 겹쳐서 발생한다.
- 우회 방법으로는 다음 셋이 현실적이다.
  1. shared file/log
  2. `sessions_send` 기반 relay
  3. OpenClaw plugin/hook 기반 자동 relay

실무적으로는:
- **가장 빠른 건 shared file**
- **가장 깔끔한 건 sessions_send 기반 relay**
- **가장 확장성 있는 건 plugin 방식**
