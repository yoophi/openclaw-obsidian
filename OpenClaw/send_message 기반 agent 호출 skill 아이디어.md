# send_message 기반 agent 호출 skill 아이디어

생성일: 2026-04-09

## 배경
다른 agent를 호출해서 작업을 시키고, 필요하면 텔레그램 같은 외부 채널로 보고까지 보내는 흐름을 skill로 묶는 방안을 검토했다.

현재 확인된 점:
- `sessions_send`를 통해 coding agent에 작업 전달 가능
- coding agent가 텔레그램으로 메시지를 보내는 흐름 정상
- 작업자 + 보고자 역할을 coding agent에 함께 맡길 수 있음

## 추천 방향
이 skill은 무거운 오케스트레이터보다 **얇은 agent relay skill**로 시작하는 것이 좋다.

핵심 역할:
- 대상 agent 선택
- 전달 메시지 형식 표준화
- 응답 처리 규칙 표준화
- 필요 시 현재 사용자에게 결과 요약

## 권장 구조
### 1. 목적 좁히기
이 skill은 다음에 집중한다.
- 다른 agent에게 작업 위임
- 전달 템플릿 표준화
- 응답을 짧게 요약해 반환

### 2. 실제 agent 호출은 `sessions_send` 우선
권장 기본 구조:
- agent 호출: `sessions_send`
- 외부 채널 전송은 대상 agent가 담당

즉 `send_message`를 skill 본체가 직접 남발하기보다,
대상 agent에게 "메시지 전송까지 수행하라"고 시키는 쪽이 자연스럽다.

### 3. 입력 파라미터 예시
- `targetAgent`: coding / research / work / main
- `task`: 실제 전달할 요청
- `mode`: ask / report / notify
- `deliverBack`: none / summary / full
- `tone`: concise / normal / formal

### 4. mode별 템플릿 내장
예시:
- ask: 작업 수행 요청 + 완료 후 핵심 결과 보고
- report: 진행상황 요약 후 텔레그램 전송
- notify: 특정 문구 그대로 전달

### 5. 응답 처리 규칙
기본은 raw 응답 전체 출력보다 짧은 요약을 우선한다.
실패 시에는:
- 대상 세션 없음
- 전달 실패
- timeout
같은 상태를 명확히 알려준다.

### 6. 초기 버전은 agent allowlist 고정
초기 허용 대상:
- main
- coding
- research
- work

## 추천 구현 형태
### v1
skill 이름 예시:
- `agent-relay`

내부 동작:
1. agent 이름을 sessionKey로 매핑
2. mode에 맞는 프롬프트 템플릿 생성
3. `sessions_send` 호출
4. 결과를 짧게 반환

## 장점
- 이미 검증된 흐름과 맞음
- 메시지 표준화 쉬움
- 작업 + 상태보고를 한 흐름에 묶기 좋음
- 이후 외부 채널/요약 규칙 확장 가능

## 피하면 좋은 방향
- skill이 외부 채널 전송까지 직접 다 담당
- agent 선택, 채널 선택, 포맷, 재시도, 요약을 한 번에 과도하게 포함
- 처음부터 완전 범용 multi-agent orchestrator로 키우기

## 다음 액션 후보
1. 작은 v1 spec 작성
2. `SKILL.md` 초안 작성
3. `sessions_send` 기반 예시 프롬프트 3개 작성

## 메모
주말에 다시 보고 진행하기로 함.
