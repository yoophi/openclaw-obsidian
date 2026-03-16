---
tags:
  - aws
  - mqtt
  - chat
  - golang
  - react
  - architecture
date: 2026-03-16
---

# AWS IoT MQTT 기반 채팅 서비스 기술 스택

조사 일자: 2026-03-16

## 핵심 요약

AWS IoT Core MQTT 브로커를 활용한 실시간 채팅 서비스 구축을 위한 기술 스택 조사. 백엔드는 Golang, 프론트엔드는 React를 기반으로 한다.

---

## 1. 시스템 아키텍처

### 전체 구성

```
┌─────────────────────────────────────────────────────────────┐
│                        Frontend (React)                      │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐         │
│  │  Chat UI    │  │  User List  │  │  Room List  │         │
│  └──────┬──────┘  └──────┬──────┘  └──────┬──────┘         │
│         │                │                │                 │
│  ┌──────▼────────────────▼────────────────▼──────┐         │
│  │           MQTT.js (WebSocket)                  │         │
│  └───────────────────────┬───────────────────────┘         │
└──────────────────────────┼──────────────────────────────────┘
                           │ WSS (MQTT over WebSocket)
                           │
┌──────────────────────────▼──────────────────────────────────┐
│                    AWS IoT Core MQTT                         │
│  ┌──────────────────────────────────────────────────────┐  │
│  │              Message Broker                           │  │
│  │  - Topic: chat/rooms/{roomId}/messages               │  │
│  │  - Topic: chat/users/{userId}/status                 │  │
│  │  - Topic: chat/typing/{roomId}/{userId}              │  │
│  └──────────────────────────────────────────────────────┘  │
│                                                              │
│  ┌──────────────────────────────────────────────────────┐  │
│  │         AWS IoT Rules Engine                          │  │
│  │  - DynamoDB: 메시지 영속화                             │  │
│  │  - S3: 파일/이미지 저장                               │  │
│  │  - Lambda: 비즈니스 로직                              │  │
│  └──────────────────────────────────────────────────────┘  │
└──────────────────────────┬──────────────────────────────────┘
                           │
┌──────────────────────────▼──────────────────────────────────┐
│                    Backend (Golang)                          │
│  ┌──────────────────────────────────────────────────────┐  │
│  │              REST API Server                          │  │
│  │  - User authentication (Cognito)                      │  │
│  │  - Room management                                     │  │
│  │  - User management                                     │  │
│  │  - Message history query                               │  │
│  └──────────────────────────────────────────────────────┘  │
│                                                              │
│  ┌──────────────────────────────────────────────────────┐  │
│  │           MQTT Client (Paho Go)                       │  │
│  │  - System messages                                     │  │
│  │  - Presence management                                 │  │
│  │  - Moderation                                          │  │
│  └──────────────────────────────────────────────────────┘  │
└──────────────────────────────────────────────────────────────┘
```

---

## 2. 기술 스택

### 2-1. Frontend (React)

| 구성요소 | 기술 | 설명 |
|---------|------|------|
| **MQTT Client** | MQTT.js | 브라우저 WebSocket 기반 MQTT 클라이언트 |
| **State Management** | Zustand / Redux Toolkit | 채팅 상태 관리 |
| **UI Framework** | Tailwind CSS + shadcn/ui | 빠른 UI 개발 |
| **Real-time Updates** | React Query + WebSocket | 데이터 동기화 |
| **Build Tool** | Vite | 빠른 개발 서버 |

**MQTT.js 설정 예시:**

```typescript
import mqtt from 'mqtt';

const client = mqtt.connect('wss://xxxxxxxxxxxxxx-ats.iot.ap-northeast-2.amazonaws.com/mqtt', {
  clientId: `user-${userId}-${Date.now()}`,
  clean: true,
  connectTimeout: 4000,
  username: 'use-token-auth', // AWS IoT WebSocket 인증
  password: cognitoToken, // Cognito JWT
  reconnectPeriod: 1000,
});

client.on('connect', () => {
  client.subscribe(`chat/rooms/${roomId}/messages`, { qos: 1 });
});

client.on('message', (topic, message) => {
  const data = JSON.parse(message.toString());
  // 메시지 처리
});
```

### 2-2. Backend (Golang)

| 구성요소 | 기술 | 설명 |
|---------|------|------|
| **Web Framework** | Gin / Echo | REST API 서버 |
| **MQTT Client** | Eclipse Paho MQTT Go | AWS IoT 연결 |
| **Database** | DynamoDB | 메시지 영속화 |
| **Cache** | ElastiCache (Redis) | 세션/프레즌스 캐시 |
| **Auth** | AWS Cognito | 사용자 인증 |
| **Deployment** | AWS ECS Fargate | 컨테이너 배포 |

**Paho MQTT Go 설정 예시:**

```go
package main

import (
    "fmt"
    "log"
    
    mqtt "github.com/eclipse/paho.mqtt.golang"
)

func NewMQTTClient(broker, clientID string) mqtt.Client {
    opts := mqtt.NewClientOptions()
    opts.AddBroker(broker)
    opts.SetClientID(clientID)
    opts.SetAutoReconnect(true)
    opts.SetCleanSession(true)
    opts.SetOnConnectHandler(func(c mqtt.Client) {
        log.Println("Connected to AWS IoT")
        // 시스템 토픽 구독
        c.Subscribe("chat/system/#", 1, handleSystemMessage)
    })
    
    client := mqtt.NewClient(opts)
    if token := client.Connect(); token.Wait() && token.Error() != nil {
        log.Fatal(token.Error())
    }
    
    return client
}

func handleSystemMessage(client mqtt.Client, msg mqtt.Message) {
    // 시스템 메시지 처리
    log.Printf("Received: %s from %s", msg.Payload(), msg.Topic())
}
```

### 2-3. AWS Services

| 서비스 | 용도 |
|-------|------|
| **AWS IoT Core** | MQTT 브로커, 디바이스 인증 |
| **Amazon Cognito** | 사용자 인증, JWT 발급 |
| **DynamoDB** | 메시지, 사용자, 방 데이터 저장 |
| **S3** | 파일/이미지 업로드 |
| **Lambda** | 메시지 처리, 규칙 엔진 |
| **API Gateway** | REST API 엔드포인트 |
| **CloudWatch** | 로깅, 모니터링 |

---

## 3. 장점 / 단점 / 위험요소

### 장점

| 장점 | 설명 |
|------|------|
| **관리형 브로커** | MQTT 브로커 운영 불필요, AWS가 관리 |
| **자동 확장** | 트래픽 증가 시 자동 스케일링 |
| **높은 가용성** | 멀티 AZ 지원, 99.9% SLA |
| **보안** | TLS 암호화, IoT Policy 기반 인가 |
| **다양한 프로토콜** | MQTT 3.1.1, MQTT 5.0, WebSocket 지원 |
| **Rules Engine** | 메시지를 DynamoDB, S3, Lambda로 라우팅 |
| **QoS 지원** | QoS 0, 1 지원으로 메시지 신뢰성 보장 |
| **Persistent Session** | 오프라인 메시지 저장 및 전달 |
| **낮은 지연** | 글로벌 엣지 로케이션으로 낮은 latency |

### 단점

| 단점 | 설명 |
|------|------|
| **비용 구조** | 메시지 수/크기 기반 과금, 대량 트래픽 시 비용 증가 |
| **제한 사항** | QoS 2 미지원, 토픽 별칭 제한 |
| **채팅 특화 기능 부재** | 읽음 표시, 타이핑 인디케이터 직접 구현 필요 |
| **메시지 크기 제한** | 128KB (MQTT), HTTP는 512KB |
| **Persistent Session 비용** | 오프라인 메시지 저장 시 추가 과금 |
| **복잡한 인증 설정** | IoT Certificate, Policy 설정 복잡 |
| **채팅 히스토리** | 별도 저장소(DynamoDB) 필요 |
| **검색 기능** | 메시지 검색을 위한 별도 인덱싱 필요 |

### 위험요소

| 위험 | 영향 | 대응 방안 |
|------|------|----------|
| **비용 폭증** | 대량 메시지 전송 시 예상치 못한 비용 | CloudWatch 알림 설정, 예산 관리 |
| **인증 만료** | Cognito 토큰 만료로 연결 끊김 | 토큰 갱신 로직, Reconnection 핸들링 |
| **메시지 유실** | QoS 0 사용 시 네트워크 장애로 유실 | 중요 메시지는 QoS 1 사용 |
| **보안 설정 오류** | IoT Policy 설정 실수로 무단 접근 | 최소 권한 원칙, 정기 보안 감사 |
| **스팸/남용** | 악의적 사용자의 메시지 스팸 | Rate limiting, 사용자 신고 시스템 |
| **규정 준수** | 데이터 보관 정책 (GDPR 등) | 메시지 보관 기간 설정, 삭제 기능 |
| **서비스 종속** | AWS 종속으로 마이그레이션 어려움 | 추상화 레이어 도입 |
| **동시 접속자 제한** | 계정별 동시 연결 수 제한 | 계정 한도 증설 요청 |

---

## 4. 단계별 구현 전략

### Phase 1: 인프라 구축 (1-2주)

**목표:** 기본 AWS 리소스 생성 및 MQTT 연결 테스트

**작업 항목:**

1. **AWS IoT Core 설정**
   - Thing 생성
   - Certificate 발급 (또는 Cognito 인증 설정)
   - IoT Policy 정의
   ```json
   {
     "Version": "2012-10-17",
     "Statement": [
       {
         "Effect": "Allow",
         "Action": "iot:Connect",
         "Resource": "arn:aws:iot:ap-northeast-2:*:client/${cognito-identity.amazonaws.com:sub}"
       },
       {
         "Effect": "Allow",
         "Action": ["iot:Subscribe", "iot:Receive"],
         "Resource": "arn:aws:iot:ap-northeast-2:*:topicfilter/chat/*"
       },
       {
         "Effect": "Allow",
         "Action": "iot:Publish",
         "Resource": "arn:aws:iot:ap-northeast-2:*:topic/chat/*"
       }
     ]
   }
   ```

2. **Cognito 설정**
   - User Pool 생성
   - Identity Pool 생성 (IoT 권한 연결)
   - App Client 설정

3. **DynamoDB 테이블 생성**
   - `ChatMessages`: messageId, roomId, timestamp, userId, content
   - `ChatRooms`: roomId, name, createdAt, createdBy
   - `ChatUsers`: userId, username, status, lastSeen

**완료 기준:**
- [ ] React에서 AWS IoT MQTT 연결 성공
- [ ] Golang에서 AWS IoT MQTT 연결 성공
- [ ] Cognito 인증 연동 완료

---

### Phase 2: 기본 채팅 기능 (2-3주)

**목표:** 1:1 채팅, 그룹 채팅 기본 기능 구현

**작업 항목:**

1. **Frontend - 채팅 UI**
   ```typescript
   // 채팅방 컴포넌트
   const ChatRoom: React.FC<{ roomId: string }> = ({ roomId }) => {
     const [messages, setMessages] = useState<Message[]>([]);
     const [input, setInput] = useState('');
     const client = useMQTTClient();
     
     useEffect(() => {
       client.subscribe(`chat/rooms/${roomId}/messages`, { qos: 1 });
       client.on('message', (topic, message) => {
         const msg = JSON.parse(message.toString());
         setMessages(prev => [...prev, msg]);
       });
       
       return () => client.unsubscribe(`chat/rooms/${roomId}/messages`);
     }, [roomId]);
     
     const sendMessage = () => {
       const msg = {
         id: uuid(),
         roomId,
         userId: currentUser.id,
         content: input,
         timestamp: Date.now(),
       };
       client.publish(`chat/rooms/${roomId}/messages`, JSON.stringify(msg), { qos: 1 });
       setInput('');
     };
     
     return (
       <div>
         <MessageList messages={messages} />
         <MessageInput value={input} onChange={setInput} onSend={sendMessage} />
       </div>
     );
   };
   ```

2. **Backend - REST API**
   ```go
   // 채팅방 생성 API
   func (h *Handler) CreateRoom(c *gin.Context) {
       var req CreateRoomRequest
       if err := c.BindJSON(&req); err != nil {
           c.JSON(400, gin.H{"error": err.Error()})
           return
       }
       
       room := &ChatRoom{
           ID:        uuid.New().String(),
           Name:      req.Name,
           CreatedBy: c.GetString("userId"),
           CreatedAt: time.Now(),
       }
       
       if err := h.db.PutRoom(room); err != nil {
           c.JSON(500, gin.H{"error": err.Error()})
           return
       }
       
       c.JSON(201, room)
   }
   
   // 메시지 히스토리 조회
   func (h *Handler) GetMessages(c *gin.Context) {
       roomId := c.Param("roomId")
       lastKey := c.Query("lastKey")
       
       messages, nextKey, err := h.db.GetMessages(roomId, lastKey, 50)
       if err != nil {
           c.JSON(500, gin.H{"error": err.Error()})
           return
       }
       
       c.JSON(200, gin.H{
           "messages": messages,
           "nextKey":  nextKey,
       })
   }
   ```

3. **AWS IoT Rules - 메시지 영속화**
   ```sql
   SELECT 
     messageId as id,
     roomId,
     userId,
     content,
     timestamp
   FROM 'chat/rooms/+/messages'
   ```

**완료 기준:**
- [ ] 1:1 채팅 동작
- [ ] 그룹 채팅 동작
- [ ] 메시지 DB 저장
- [ ] 메시지 히스토리 조회

---

### Phase 3: 고급 기능 (2-3주)

**목표:** 파일 업로드, 읽음 표시, 타이핑 인디케이터

**작업 항목:**

1. **파일/이미지 업로드**
   - S3 Presigned URL 발급 API
   - 업로드 완료 시 메시지 전송
   - CloudFront CDN 연동

2. **읽음 표시**
   ```typescript
   // 읽음 상태 토픽: chat/rooms/{roomId}/read/{userId}
   const markAsRead = (roomId: string, lastMessageId: string) => {
     client.publish(
       `chat/rooms/${roomId}/read/${currentUser.id}`,
       JSON.stringify({ lastMessageId, timestamp: Date.now() }),
       { qos: 1 }
     );
   };
   ```

3. **타이핑 인디케이터**
   ```typescript
   // 타이핑 상태 토픽: chat/typing/{roomId}/{userId}
   const sendTypingStatus = (roomId: string, isTyping: boolean) => {
     client.publish(
       `chat/typing/${roomId}/${currentUser.id}`,
       JSON.stringify({ isTyping, timestamp: Date.now() }),
       { qos: 0 } // 낮은 QoS로 지연 최소화
     );
   };
   ```

4. **프레즌스 (온라인/오프라인)**
   - MQTT Last Will and Testament (LWT) 활용
   - Heartbeat 메시지 주기적 전송

**완료 기준:**
- [ ] 파일/이미지 업로드 및 미리보기
- [ ] 읽음 표시 기능
- [ ] 타이핑 인디케이터
- [ ] 온라인/오프라인 상태 표시

---

### Phase 4: 운영 및 최적화 (1-2주)

**목표:** 모니터링, 알림, 성능 최적화

**작업 항목:**

1. **모니터링 대시보드**
   - CloudWatch 대시보드 구성
   - 메시지 전송량, 연결 수, 에러율 추적
   - 비용 알림 설정

2. **푸시 알림**
   - AWS SNS + FCM/APNs 연동
   - Lambda로 오프라인 사용자 알림

3. **성능 최적화**
   - 메시지 배치 처리
   - DynamoDB Auto Scaling
   - CloudFront 캐싱

4. **보안 강화**
   - Rate limiting
   - Content moderation (Amazon Rekognition)
   - 입력값 검증

**완료 기준:**
- [ ] 운영 대시보드 완료
- [ ] 푸시 알림 동작
- [ ] 보안 설정 완료
- [ ] 부하 테스트 통과

---

## 5. 비용 예상

### AWS IoT Core 요금 (서울 리전 기준)

| 항목 | 단가 | 월 예상 (10,000 DAU) |
|------|------|---------------------|
| 연결 시간 | $0.08 / 백만 분 | ~$50 |
| 메시지 전송 | $1.00 / 백만 건 | ~$200 |
| 메시지 수신 | $1.00 / 백만 건 | ~$200 |
| Rules Engine | $0.90 / 백만 규칙 실행 | ~$100 |
| **월 총계** | | **~$550** |

### 기타 AWS 서비스

| 서비스 | 월 예상 |
|-------|--------|
| DynamoDB | ~$100 |
| S3 | ~$50 |
| CloudFront | ~$50 |
| Cognito | ~$55 (50,000 MAU) |
| **총계** | **~$805/월** |

---

## 6. 대안 기술 스택

### 대안 1: Amazon SQS + API Gateway WebSocket

**장점:**
- 채팅 특화 설계 용이
- 비용 예측 가능

**단점:**
- 구현 복잡도 높음
- 실시간성 떨어질 수 있음

### 대안 2: Firebase Realtime Database / Firestore

**장점:**
- 빠른 개발
- 실시간 동기화 내장

**단점:**
- AWS 생태계와 분리
- 대규모 시 비용 증가

### 대안 3: WebSocket 서버 직접 구축 (Gorilla WebSocket)

**장점:**
- 완전한 제어
- 비용 최적화 가능

**단점:**
- 운영 복잡도
- 확장성 직접 관리

---

## 7. 권장 사항

### MVP 단계
- AWS IoT MQTT + Cognito + DynamoDB 조합으로 시작
- 빠른 출시 후 피드백 수집

### 확장 단계
- 메시지 검색을 위해 OpenSearch 추가 고려
- 대규모 트래픽 시 Redis 캐시 레이어 추가

### 비용 최적화
- 메시지 크기 최소화 (필요한 필드만 전송)
- QoS 0과 1 적절히 혼용
- Persistent Session 기간 최적화

---

## 참고 자료

- [AWS IoT Core Documentation](https://docs.aws.amazon.com/iot/)
- [Eclipse Paho MQTT Go](https://github.com/eclipse-paho/paho.mqtt.golang)
- [MQTT.js](https://github.com/mqttjs/MQTT.js)
- [AWS IoT MQTT Limits](https://docs.aws.amazon.com/general/latest/gr/iot-core.html#message-broker-limits)
