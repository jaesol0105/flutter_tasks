# Flutter Tasks App

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
| <strong>2025-11-12</strong> | Firebase CRUD 구현 |
|  | MVVM 아키텍쳐 적용 |
|  | Freezed + Build Runner 모델 생성 |
|  | Riverpod Generator + Flutter Hooks 상태 관리 |
|  | Geolocator + Open-Meteo API 기반 날씨 위젯 구현 |

<br>


<a id="impl"></a>
### 🐬 기능 구현

---
<strong>[2025.11.12]</strong>

- ☀️ <strong>Geolocator + Open-Meteo API 기반 날씨 위젯</strong>
    
    <img width="2170" height="630" alt="6" src="https://github.com/user-attachments/assets/8ecdb546-24e5-4024-9d94-1e5d1fd93158" />

    Geolocator를 활용해 사용자의 현재 위치를 가져오고, Open-Meteo API를 통해 해당 지역의 날씨 정보를 받아오는 위젯을 구현했다.<br>
    bottomNavigationBar를 통해 날씨 위젯을 출력하게 했다.

   <br>

---
<strong>[2025.10.23]</strong>

- ⬅️ <strong>밀어서 삭제/ 되돌리기</strong>
    
    <img width="2170" height="630" alt="1" src="https://github.com/user-attachments/assets/b13e5327-3875-4bc2-ab76-09dba2e85dee" />

    리스트의 item을 왼쪽으로 밀어서 삭제할 수 있도록 구현했다.<br>
    실수로 밀어버릴 수 있으니까, 삭제 직후에 출력하는 스낵바를 통해 되돌릴 수 있게 했다.

   <br>
    
- ⚒️ <strong>디테일 페이지에서의 내용 수정 / TODO 삭제</strong>
    
    <img width="3260" height="2400" alt="2-1" src="https://github.com/user-attachments/assets/394c9be4-6d6c-4000-a54f-2d01353bf6e1" />

    TextField를 사용해서 내용 수정이 가능하도록 구현했다.<br>
    제목/내용/북마크/마감일 등을 수정 후 백프레스 하면 경고 대화 상자를 출력하게 했다.<br>
    상단 메뉴를 통해서 디테일 페이지에서도 TODO를 삭제할 수 있게 했다.

   <br>
    
- 🧱 <strong>제목이 빈 칸일 경우 스낵바 출력</strong>

    <img width="3260" height="2400" alt="0" src="https://github.com/user-attachments/assets/d49457c6-339f-44fc-a014-4092e47f9ddc" />

    디테일 페이지에서 TODO를 수정할 때 title이 없을 경우 스낵바를 출력하도록 구현했다.

  <br>

- 🕑 <strong>마감일/시간 설정</strong>
    
    <img width="3260" height="2400" alt="3" src="https://github.com/user-attachments/assets/4258a661-7fcd-4efc-b4a5-deea2b7d6833" />

    DateTimePicker를 통해 TODO의 마감일/시간을 설정할 수 있게 했다.<br>
    마감일이기 때문에 이전 날짜는 선택이 불가능 하도록 구현했다.<br>
    시계 아이콘 우측의 위젯을 통해 마감일을 설정/재설정하거나 삭제할 수 있게 했다.

   <br>
    

### 🐦‍⬛ 다크 모드

---
<strong>[2025.10.23]</strong>

- ⬛ 화면:  EmptyView / ListView /  DetailView / DateTimePicker
    
    <img width="4350" height="2400" alt="4-1" src="https://github.com/user-attachments/assets/a17d5e10-8fe8-46b5-a06f-1f69f6ead433" />

    <br><br>
    

<a id="trouble"></a>
### 👟 트러블 슈팅?

---
<strong>[2025.11.12]</strong>

1. 현재 detail_page는 home_page와 거의 동일한 CRUD연산을 필요로하기 때문에 HomePageViewModel을 공유해서 사용했는데
2. CRUD를 VM을 통해서 수행하는데도 불구하고 코드가 지저분했다.
3. 상태 변수들 / 변경 사항들을 검사하는 함수 등이 뷰에 너무 많았다.<br>(페이지 이탈시 경고 대화상자를 출력해야 하기 위해, 뷰에서 useState()를 통해 isEdit등의 상태를 다뤘다.)
4. 상태가 여러개일 경우 별도에 상태 클래스로 다루면 된다는 조언을 들었다. 
5. datail_page의 상태를 다룰 상태 클래스를 만들어 볼까 하다가, 헤메다가 시간상 만들지못했다.
6. 아직은 조금 복잡하게 느껴져서 시간을 두고 천천히 고민해봐야겠다.

<br>
