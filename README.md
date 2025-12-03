# 할 일을 미루지 말자.
반응형 UI가 적용된 Flutter TODO 앱

![_2025_12_03_09_32_13_266-ezgif com-video-to-gif-converter (1)](https://github.com/user-attachments/assets/ce1dadf7-5028-45ca-beec-5bc86ecff1f0)

<br>

### 목차

---

1. [👽 기록](#record)
2. [🐬 기능 구현](#impl)
3. [👟 트러블 슈팅?](#trouble)

<br>


<a id="record"></a>
### 👽 기록

---

| 날짜 | 내용 |
| --- | --- |
| <strong>2025-12-03</strong> | 반응형 UI 구현 (태블릿/폴드 기기 대응) |
|  | 클린 아키텍쳐 적용 |
|  | 무한스크롤 & Pull-to-Refresh 구현 |
|  | 중복 호출 방지 + 디바운싱 적용 |
|  | Go Router 페이지 라우팅 |
| <strong>2025-11-12</strong> | Firestore CRUD 구현 |
|  | MVVM 아키텍쳐 적용 |
|  | Freezed 데이터 클래스 적용 |
|  | Riverpod Generator + Flutter Hooks 상태 관리 |
|  | Geolocator + Open-Meteo API 기반 날씨 위젯 구현 |
| <strong>2025-10-23</strong> | 테마 설정 |
|  | 앱 전반 레이아웃 및 기능 구현 |

<br>


<a id="impl"></a>
### 🐬 기능 구현

---
<strong>[2025.12.03]</strong>

- 📲 <strong>반응형 UI 구현 (태블릿/폴드 기기 대응)</strong>
    화면 크기가 와이드인지(가로세로 둘 다 600dp이상) 체크<br>
    와이드 모드에서 리스트 아이템 선택 시, 화면 분할 후 우측에 상세 페이지 출력 (2:3 비율)<br>
    분할 상태일 경우 HomePage에서 왼쪽화면에만 FAB, 날씨위젯 보이도록 구현

  <img width="4426" height="1840" alt="7" src="https://github.com/user-attachments/assets/0ce71317-d59e-407b-947f-8f77adc80ff3" />
  

- ⛔ <strong>예외 처리 및 예외 전파 구현</strong><br>
    모든 비동기 작업에 try-catch + 로깅 + rethrow로 전파<br>
    사용자는 에러 내용을 스낵바로 확인 가능하고, 개발자는 로그를 통한 디버깅 가능


- 🌀 <strong>중복 호출 방지 + 디바운싱 적용</strong><br>
    무한스크롤 및 Pull-to-Refresh에서 플래그(state-loading)를 통해서 1회 호출 보장<br>
    디테일 페이지의 textController의 리스너에 디바운싱을 적용해서 연속 타이핑(300ms)시 1회 호출 보장


- 🔀 <strong>페이지 라우팅</strong><br>
    go_router를 통한 페이지 라우팅<br>
    페이지 전환 애니메이션 구현 (우측 슬라이드)<br>
    페이지에 static const path를 정의해서 라우팅 경로 관리

- 📜 <strong>무한 스크롤</strong><br>
  Firestore 커서 기반 페이지네이션 적용<br>
  ```
  // 상태 관리
  TodoListSate {
    todos // 현재 리스트
    hasMore // 아직 안가져온 데이터가 서버에 있는지
    isLoadingMore // 지금 추가 데이터를 로딩 중인지
  }
  // 동작 방식
  초기 로드 ➡️ 리스트 끝에 도달하면 자동으로 다음 15개 로드 ➡️ 15개 미만이 반환되면 hasMore = false로 설정 (더 이상 없을 때)
  ```   

  <br>

---
<strong>[2025.11.12]</strong>

- ☀️ <strong>Geolocator + Open-Meteo API 기반 날씨 위젯</strong><br>
    Geolocator를 활용해 사용자의 현재 위도/경도를 가져옴<br>
    Open-Meteo API를 통해 위도/경도 기반으의 날씨 정보를 받아와서 출력
    
    <img width="2170" height="630" alt="6" src="https://github.com/user-attachments/assets/8ecdb546-24e5-4024-9d94-1e5d1fd93158" />

   <br><br>

---
<strong>[2025.10.23]</strong>

- ⬅️ <strong>밀어서 삭제/ 되돌리기</strong>
    리스트의 item을 왼쪽으로 밀어서 삭제<br>
    실수로 밀어버릴 수 있으니까, 삭제 직후에 출력하는 스낵바를 통해 '되돌리기'를 지원

    <img width="2170" height="387" alt="1 복사" src="https://github.com/user-attachments/assets/1e6633b3-1407-4a3e-bddd-b1394cc68f0e" />

   <br>
   
- 🕑 <strong>마감일/시간 설정</strong><br>
    마감일을 설정(재설정)하거나 삭제할 수 있음<br>
    DateTimePicker를 통해 선택, 마감일이기 때문에 이전 날짜는 선택 불가능함
- ⚒️ <strong>수정 / 삭제 경고 다이얼로그</strong><br>
    변경사항이 있을 경우 페이지 이탈시 경고 다이얼로그를 출력<br>
    삭제 시 경고 다이얼로그 출력
- 🧱 <strong>유효성 검증</strong><br>
    title이 없을경우 스낵바 출력으로 예외처리
- 🐦‍⬛ <strong>테마 설정</strong><br>
    라이트 모드 적용<br>
    다크 모드 적용
  
    <img width="5440" height="2400" alt="5 복사" src="https://github.com/user-attachments/assets/b81efd83-d4f6-4ed6-bac5-1653727e2e3f" />

    <br><br>


<a id="trouble"></a>
### 👟 트러블 슈팅

---

- 무한 스크롤에 쓰로틀링을 적용해야할까?
- 현재상황
    - isLoadingMore: true를 통해 중복요청 방지 구현했음 (상태 플래그 기반)
- 차이점
    - 쓰로틀링 (Throttling)은 시간 간격 기반 제어
- 결론
    - 플래그 기반으로 호출은 한번만 되는걸 보장하기 때문에, 굳이 쓰로틀링 호출할 필요없다고 판단

  <br><br>
