# sshpass 사용법 - SCP와 SSH 비밀번호 자동 입력

`sshpass`는 SSH 비밀번호를 비대화식(non-interactive)으로 전달하는 도구이다.

## 설치

```bash
# macOS (Homebrew)
brew install sshpass

# Ubuntu/Debian
sudo apt install sshpass
```

## 기본 사용법

### SSH 접속

```bash
sshpass -p '비밀번호' ssh -p 포트번호 사용자@호스트
```

```bash
# 예시
sshpass -p 'mypass' ssh -p 3022 yoophi@nas.yoophi.dev
```

### SCP 파일 전송

```bash
# 로컬 → 원격
sshpass -p '비밀번호' scp -P 포트번호 로컬파일 사용자@호스트:원격경로

# 원격 → 로컬
sshpass -p '비밀번호' scp -P 포트번호 사용자@호스트:원격파일 로컬경로
```

```bash
# 예시: 파일 업로드
sshpass -p 'mypass' scp -P 3022 ./backup.tar.gz yoophi@nas.yoophi.dev:/volume1/backups/

# 예시: 파일 다운로드
sshpass -p 'mypass' scp -P 3022 yoophi@nas.yoophi.dev:/volume1/data.txt ./
```

### 디렉토리 전송 (재귀)

```bash
sshpass -p '비밀번호' scp -P 포트번호 -r 로컬디렉토리 사용자@호스트:원격경로
```

## 비밀번호 전달 방식

### 1. 명령줄 인자 (`-p`)

```bash
sshpass -p '비밀번호' ssh user@host
```

> `ps` 명령으로 비밀번호가 노출될 수 있어 주의 필요

### 2. 환경 변수 (`-e`)

```bash
export SSHPASS='비밀번호'
sshpass -e ssh user@host
```

### 3. 파일에서 읽기 (`-f`)

```bash
echo 'mypass' > ~/.ssh/pass.txt
chmod 600 ~/.ssh/pass.txt
sshpass -f ~/.ssh/pass.txt ssh user@host
```

## 공개키 인증 비활성화

SSH 키가 여러 개 등록되어 있으면 "Too many authentication failures" 오류가 발생할 수 있다. 이 경우 공개키 인증을 비활성화한다.

```bash
sshpass -p 'mypass' ssh -p 3022 -o PubkeyAuthentication=no user@host
sshpass -p 'mypass' scp -P 3022 -o PubkeyAuthentication=no file user@host:
```

## 주의사항

- **보안**: `sshpass`는 편의 도구일 뿐, SSH 키 인증이 더 안전하다
- **포트 옵션**: `ssh`는 소문자 `-p`, `scp`는 대문자 `-P`
- **스크립트 용도**: 자동화 스크립트에서 임시로 사용하기 적합
