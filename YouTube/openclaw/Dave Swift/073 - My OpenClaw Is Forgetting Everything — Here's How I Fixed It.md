---
title: "My OpenClaw Is Forgetting Everything — Here's How I Fixed It"
source: "https://www.youtube.com/watch?v=iUkFb_TaqZA"
original_url: "https://www.youtube.com/watch?v=iUkFb_TaqZA"
youtube_id: "iUkFb_TaqZA"
playlist: "📙 openclaw"
channel: "Dave Swift"
duration: "19:09"
publish_date: "2026-02-18"
playlist_index: 73
tags:
  - youtube
  - playlist
  - openclaw
  - channel/dave swift
  - playlist/📙 openclaw
generated_by: "OpenClaw summarize skill"
generated_at: "2026-03-23 19:40:49 +0900"
language: "ko"
---

# My OpenClaw Is Forgetting Everything — Here's How I Fixed It

## 영상 정보

- 원본 주소: https://www.youtube.com/watch?v=iUkFb_TaqZA
- 채널: Dave Swift
- 제목: My OpenClaw Is Forgetting Everything — Here's How I Fixed It
- 게시일: 2026-02-18
- 재생시간: 19:09
- 플레이리스트: 📙 openclaw
- 플레이리스트 순서: 73

## 영상 설명

Sponsor 👉 Try the AI Chatbot for FREE here: https://daveswift.link/elfsight

Use coupon DAVESWIFT for a 30% discount on Elfsight widgets!

OpenClaw's built-in memory system doesn't deliver on its promise of persistent, forever memory. In this tutorial, I show you how to integrate Obsidian with your OpenClaw agent to create a real, working memory system that actually persists across conversations.

📝 Show Notes: https://daveswift.com/openclaw-obsidian-memory/
⭐ Join Premium: https://daveswift.com/join/


🔗 Resources:
📖 X Article: https://x.com/arscontexta/status/2013045749580259680
📥 Obsidian (Free): https://obsidian.md/
🔒 Tailscale: https://tailscale.com/

Chapters:
00:00 Introduction
00:37 OpenClaw's Memory Problem
02:31 The Obsidian Inspiration
03:01 Setting Up Obsidian
03:27 Creating Your First Vault
04:38 Designing the File Structure
07:46 Syncing Across Devices
10:05 Security Considerations
12:13 Configuring OpenClaw
14:42 Setting the Vault Path
15:25 Indexing the Vault
16:32 Troubleshooting and Testing
18:06 Understanding Your Thinking

Follow me:
Facebook: https://facebook.com/groups/daveswift
Twitter: https://twitter.com/davidswift
YouTube: https://youtube.com/@dave-swift
Web: https://daveswift.com

Website Management: https://clientamp.com

Some links in this description are affiliate links. If you purchase through these links, I may earn a small commission at no extra cost to you. I only recommend products I genuinely use and believe in.

#OpenClaw #Obsidian #AIMemory #AIAgent #PersonalAI #Tutorial

## 요약

## 핵심 요약
- OpenClaw 에이전트의 기본 메모리는 영구 저장 측면에서 한계가 있어, 별도 파일 기반 저장소로 보완해야 함.  
- Obsidian(마크다운 기반 노트 vault)을 OpenClaw의 메모리 소스로 연결하면 지속적이고 공유 가능한 개인 지식베이스를 만들 수 있음.  
- 설정 흐름: Obsidian 설치 → vault 생성 및 파일 구조 구성 → OpenClaw 설정 파일에 Obsidian 경로 추가 → 에이전트 재시작 후 인덱싱.  
- 보안·동기화 고려(로컬 vs 클라우드 LLM, 네트워크 접근성, 백업)와 작은 문서 단위의 빠른 동기화 장점 확인이 필요.

## 주요 내용
- OpenClaw 에이전트 예시: 개인 비서(“Lloyd”)를 Mac Mini에 설치해 Apple ID로 문자 등 상호작용 가능.  
- Obsidian 소개: 무료 마크다운 노트 앱. vault는 폴더(마크다운 파일 모음)로 동작하며 플랫폼 간 호환성 높음. 유료 동기화 서비스 존재하지만 필수 아님.  
- 파일 구조 구성:
  - 기본 템플릿(영상에서 인용한 글 또는 샘플)을 기반으로 폴더/노트 구조를 만든 뒤 에이전트에 맞게 확장.  
  - 에이전트에게 파일 생성·정리·분류를 맡기면 자동으로 폴더와 노트를 만들어 줌.  
- OpenClaw 설정 연동:
  - 사용자 폴더의 숨김 디렉토리 내 openclaw.json(또는 설정 파일)을 편집해 memory 블록을 교체하고 Obsidian vault 경로를 넣음.  
  - JSON 편집 시 괄호/쉼표 문법을 주의(닫는 괄호/다음 항목에 쉼표 필요).  
  - 경로 복사 팁: macOS에서 폴더 우클릭 후 option 키 누르면 "경로 복사" 가능.  
- 인덱싱 및 테스트:
  - 설정 후 에이전트 재시작하면 QMD 인덱서가 vault를 색인함.  
  - 공백(스페이스)이 있는 vault 이름 때문에 인덱싱 실패한 사례 있음 → 공백 대신 대시 등 사용 권장.  
  - 인덱싱 완료되면 에이전트가 vault 내 노트 검색·새 노트 생성·사고 패턴 분석 등 수행 가능.  
- 네트워크/접근성:
  - 로컬에만 두면 이동 중 접근 불편 → Tailscale 같은 도구로 개인 네트워크를 확장하거나 Obsidian Sync 사용 고려.  
- 프라이버시·보안:
  - 기존 Obsidian 노트를 에이전트와 공유하면 에이전트가 접근 가능해지고, 사용 중인 LLM 제공자(클라우드)로 정보가 노출될 수 있음. 로컬 LLM 사용 시 위험 감소.

- 인용된 강한 문장 예시:
  - *"He was born about three weeks ago."*  
  - *"It just doesn't have a context for where you're at and how you will best digest information."*

## 실무 포인트
- JSON 편집 전 반드시 전체 백업 또는 폴더 복제할 것(구문 오류 시 복구용).  
- vault 이름에 공백을 피하면 인덱싱 문제 예방 가능(예: Dave's-vault).  
- 에이전트에게 설정·편집을 맡기면 문법 오류를 자동으로 방지해 주는 경우가 있으므로, 자신이 불안하면 에이전트에게 작업을 시켜도 됨.  
- 동기화 선택: 외부 접근이 필요하면 Tailscale 또는 Obsidian Sync(유료)를 사용하되, 클라우드 LLM 사용 시 민감정보 노출 위험을 검토.  
- 에이전트에게 "명확화 질문을 하라"는 지시를 습관화하면 잘못된 가정으로 인한 오류를 줄일 수 있음.  
- 마크다운 파일을 작게 분할하면 동기화·인덱싱 속도가 빨라져 체감 성능 향상.  
- OpenClaw와 Obsidian 연동 후에는 간단한 검색·노트 생성으로 정상 동작을 확인하자(예: 특정 주제 검색, 새 프로젝트 노트 생성).

## 한줄 평
OpenClaw의 한계를 Obsidian 기반의 파일 저장소로 보완해 에이전트의 '지속적 메모리'와 장문 문서 공유를 실현하는 실용적 가이드. 영상은 설정 절차·주의사항을 단계별로 보여줘 바로 적용하기 좋다.
