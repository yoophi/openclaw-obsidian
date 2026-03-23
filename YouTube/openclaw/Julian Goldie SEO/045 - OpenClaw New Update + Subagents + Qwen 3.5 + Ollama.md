---
title: "OpenClaw New Update + Subagents + Qwen 3.5 + Ollama"
source: "https://www.youtube.com/watch?v=HPGNhjBRlOg"
original_url: "https://www.youtube.com/watch?v=HPGNhjBRlOg"
youtube_id: "HPGNhjBRlOg"
playlist: "📙 openclaw"
channel: "Julian Goldie SEO"
duration: "34:43"
publish_date: "2026-02-26"
playlist_index: 45
tags:
  - youtube
  - playlist
  - openclaw
  - channel/julian goldie seo
  - playlist/📙 openclaw
generated_by: "OpenClaw summarize skill"
generated_at: "2026-03-23 19:28:42 +0900"
language: "ko"
---

# OpenClaw New Update + Subagents + Qwen 3.5 + Ollama

## 영상 정보

- 원본 주소: https://www.youtube.com/watch?v=HPGNhjBRlOg
- 채널: Julian Goldie SEO
- 제목: OpenClaw New Update + Subagents + Qwen 3.5 + Ollama
- 게시일: 2026-02-26
- 재생시간: 34:43
- 플레이리스트: 📙 openclaw
- 플레이리스트 순서: 45

## 영상 설명

Want to make money and save time with AI? Join here: https://www.skool.com/ai-profit-lab-7462/about

Get a FREE AI Course + Community + 1,000 AI Agents + video notes + links to the tools 👉 https://www.skool.com/ai-seo-with-julian-goldie-1553/about

OpenClaw's new update fixes DMs and subagents, better sub agents and pairs perfectly with free Ollama running Qwen 3.5:35b for smart AI tasks. This combo handles vision, tools, and multi-step jobs like filling forms or navigating apps right on your computer. Watch to set it up easily and use these powerful, local tools to build better AI agents fast.

## 요약

## 핵심 요약
- 2월 25일 OpenClaw 업데이트로 하트비트(heartbeat) DM 복구 및 서브에이전트(sub-agent) 메시지 전달 체계 전면 개편이 이루어짐.  
- 서브에이전트 메시지 전달을 상태기계(state machine)로 재구성해 누락/오류 재시도, 백업 경로 확보 등 신뢰성 향상.  
- Slack 스레드 관련 세션·문맥 전파 오류와 Telegram 전달 상태 불일치 등 여러 버그가 수정되고 보안 패치가 추가됨.  
- Qwen 3.5(로컬 실행 가능)과 Olama(모델 관리/실행 도구)를 함께 써 OpenClaw를 로컬·무료 모델로 구동하는 방법 시연.  
- 일부 모델은 고성능 하드웨어를 요구하므로 경량 대안(예: Flash 모델 또는 클라우드 옵션)을 권장.

## 주요 내용
- 업데이트 핵심 항목
  - 하트비트 DM: 기본값으로 DM 직접 전송 복구(사용자에게 AI 상태/작업 알림 재개).  
  - 서브에이전트 전달: 전달 프로세스를 단계별 상태기계로 재설계 — 실패 시 백업 경로 사용, 실제 전달 확인 후 완료 처리.  
  - Slack: 스레드 세션 처리, 컨텍스트 상속·오버플로우·라우팅 문제 수정.  
  - 전반적 안정성 및 보안 개선: OpenCore 사용 시 Slack/Discord/Telegram 연동 관련 보안 패치 포함.  
  - UI·성능 개선: 안드로이드 채팅, 스트리밍 전달, 마크다운 처리, 시작 성능 및 채팅 작성 개선 등.

- 업데이트 적용 방법(요약)
  - OpenClaw 설정에서 Config → All settings → Updates 항목에서 자동업데이트 활성화 권장.  
  - 자동 업데이트 후 일시적으로 게이트웨이가 멈출 수 있음(정상적일 수 있으나 완전히 멈추면 데몬 재시작 필요).  
  - 문제가 지속되면 기존 설치 삭제 후 재설치 또는 데몬(open core daemon) 재시작으로 복구 시도.

- Qwen 3.5를 이용한 로컬 구성(Olama 사용)
  - Olama의 프리릴리스(베타) 버전 필요: 해당 바이너리로 교체해야 최신 모델을 내려받아 실행 가능.  
  - 터미널에서 모델 다운로드 명령 실행(모델 용량 약 20~25GB).  
  - Olama에 모델을 로드한 뒤 OpenClaw와 연동(Olama에서 모델을 런치하여 OpenClaw가 해당 로컬 모델을 사용하도록 설정).  
  - 하드웨어 요구사항: 고성능(예: 데스크톱/Mac Studio급)이 권장. 리소스 부족 시 Qwen 3.5 Flash 또는 GLM 4.7 Flash 같은 경량/클라우드 대안 사용 가능.  
  - 대안: Olama 클라우드 또는 Hugging Face를 통한 경량 모델 사용으로 비용·성능 조정 가능.

- 비교 포인트
  - 로컬 모델(예: Qwen 3.5) vs 클라우드 모델: 개인정보·비용(정기 API비) 면에서 로컬 장점, 그러나 로컬은 높은 연산 자원 필요.  
  - Qwen 3.5 vs GLM 4.7 Flash: Qwen 3.5 성능 우수하나 무거움, GLM 4.7 Flash는 로컬에서 더 경량/속도 유리.  
  - OpenClaw(강력하지만 기술적 관리 필요) vs 상용/관리형 대안(비용 발생하나 안정적·비기술자 친화적).

- 실습 중 빈번히 관찰된 문제
  - 업데이트 직후 응답 중단(게이트웨이 끊김), 일부 명령으로만 복구 가능.  
  - Telegram 전송 상태가 실제와 다르게보고되는 버그(이번 패치에서 수정).  
  - 버전 표기 혼선(예: UI에 이전 날짜/버전이 남아 보일 수 있음).

*“OpenClaw is your personal AI assistant that works for you around the clock.”*  
*“Heartbeat DMs are switched on by default.”*

## 실무 포인트
- 업데이트 전후 점검 항목
  - 업데이트 적용 후 OpenClaw 버전(변경 로그) 확인 및 하트비트 DM 수신 여부 테스트.  
  - 자동업데이트 활성화 시에도 실패 가능성 대비: 데몬 재시작, 삭제·재설치 방법 숙지.  
- 하드웨어·리소스 고려
  - Qwen 3.5 정식 모델은 약 20~25GB 이상, 고성능 CPU/GPU 환경 권장. 리소스가 제한적이면 Flash 모델이나 클라우드 사용 권장.  
- 안정성 대비
  - OpenClaw은 강력하지만 잦은 업데이트로 인해 불안정성이 증가할 수 있으므로 운영 환경에서는 백업/롤백 계획과 모니터링 필요.  
  - 서브에이전트 메시지 전달 관련 로그와 실패 재시도 동작을 확인해 실제 업무 누락이 없는지 검증.  
- 보안·연동
  - Slack/Discord/Telegram 연동 시 인증·권한 설정을 재점검. 업데이트로 보안 패치가 적용됐더라도 연동 토큰 관리와 최소 권한 원칙 유지.  
- 모델 선택 가이드
  - 실사용에서 응답 속도·비용·프라이버시 요구를 기준으로 로컬 대 클라우드 선택. 빠른 반복 작업(대량 토큰 소모)이면 로컬 모델이 유리할 수 있음.  
  - 테스트 환경에서 먼저 경량 모델(GLM 4.7 Flash 등)으로 검증 후 본격 적용 권장.

## 한줄 평
업데이트로 메시지 전달 신뢰도와 보안이 크게 개선되었고, Qwen 3.5를 Olama로 로컬 연동해 비용 없이 강력한 모델을 돌려볼 수 있는 실무 중심 가이드 영상이다.
