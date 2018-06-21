# Bootstrap Hybrid Web Admin Site
## 시스템 사용환경
JAVA1.8, Spring Boot, Security, OracleDB, lombok, Mybatis, jpa, hibernate, gentelella, Tiles3

## 메인페이지
![screencapture-localhost-9090-dashboard-2018-06-08-12_53_10](https://user-images.githubusercontent.com/12209348/41138723-375a5cd0-6b1e-11e8-80cb-64b33582ab2c.png)

## 데이터차트페이지
![screencapture-localhost-9090-hyopage-2018-06-03-12_26_22](https://user-images.githubusercontent.com/12209348/40882894-5de6cc14-672a-11e8-8f36-c8f9dbb29459.png)

## 일정계획페이지
![screencapture-localhost-9090-calendar-2018-06-08-12_52_44](https://user-images.githubusercontent.com/12209348/41138715-253696e0-6b1e-11e8-9090-ad03880f1b8e.png)

## 로그인페이지
![screencapture-localhost-9090-login-2018-05-14-12_28_49](https://user-images.githubusercontent.com/12209348/39977138-c70af462-5772-11e8-89f5-fd99f96a6de2.png)

## SMTP 이메일 비밀번호 찾기
![default](https://user-images.githubusercontent.com/12209348/40882898-7e6d85c2-672a-11e8-8a32-2b227c267d16.PNG)

## 회원가입 페이지(정규식추가)
![screencapture-localhost-9090-login-2018-06-03-12_28_58](https://user-images.githubusercontent.com/12209348/40882903-981c85fe-672a-11e8-867d-04c158543a2a.png)

## 회원정보 페이지(회원별 데이터화 예정)
![screencapture-localhost-9090-mypage-2018-06-08-13_08_42](https://user-images.githubusercontent.com/12209348/41138730-44814f86-6b1e-11e8-995b-a592d267f941.png)

### 진행 예정
1. 회원정보 페이지 회원별 데이터 호출 (회원정보 수정 모달 생성)
2. 풀캘린더 스케쥴 등록 처리 (메인페이지 스케쥴 리스트 호출)
3. local PC infomation 호출
4. 차트 정보 데이터처리(샘플데이터 생성 후 진행)
5. 엑셀 파일업로드 데이터 차트 연동
6. 테이블 ERD 작성

### 완료내역
1. 시큐리티 로그인, 로그아웃 세션처리(jpa) 완료
2. 날씨 API darksky(api 1000번 호출 이후 유료), 구글 웨더(서비스 종료),skplant 웨더 API(서비스종료)로 인한 하드코딩 사용 
3. 샘플데이터 게시판목록 호출 (mybatis)완료
4. 일정계획표 페이지 - 풀캘린더 구글 공휴일 정보 api 연동 완료
5. 일정관리테이블, 회원정보 상세 테이블, 회원 권한 조인용 테이블 생성 완료
6. 테이블명 수정 기존 테이블, 관리자페이지 테이블 명 구분 완료
7. 시큐리티 회원가입 로직 개발 완료

### 사용된 API 목록
Datatables,
JQVMap,
Dropzone,
fullcalendar,
bootstrap-daterangepicker,
Ion.RangeSlider,
Bootstrap Colorpicker,
echart,
DateJS,
Flot,
iCheck,
gauge,
NProgress,
Skycons 등
