# Hybrid Web Admin DashBoard
## 시스템 사용환경
JAVA1.8, Spring Boot, Security, OracleDB, lombok, Mybatis, jpa, hibernate, gentelella, Tiles3

## 메인페이지
![screencapture-localhost-9090-dashboard-2018-08-16-20_38_37](https://user-images.githubusercontent.com/12209348/44206480-e3919200-a194-11e8-9336-eea6b0437190.png)

## 데이터차트페이지
![screencapture-localhost-9090-hyopage-2018-08-16-20_39_12](https://user-images.githubusercontent.com/12209348/44206487-edb39080-a194-11e8-8eec-050fce1b4ffd.png)

## 일정계획페이지
![screencapture-localhost-9090-calendar-2018-08-16-20_39_25](https://user-images.githubusercontent.com/12209348/44206493-f73cf880-a194-11e8-96a3-57cacfdbbfe8.png)

## 로그인페이지
![screencapture-localhost-9090-login-2018-08-16-20_40_03](https://user-images.githubusercontent.com/12209348/44206630-6d415f80-a195-11e8-9307-8de988bed8a1.png)

## SMTP 이메일 비밀번호 찾기
![screencapture-localhost-9090-login-2018-08-16-20_50_35](https://user-images.githubusercontent.com/12209348/44206867-27d16200-a196-11e8-9b48-354e21f17a74.png)

## 회원가입 페이지(정규식 추가)
![screencapture-localhost-9090-login-2018-08-16-20_41_04](https://user-images.githubusercontent.com/12209348/44206667-86e2a700-a195-11e8-82b5-cf75d610f89d.png)

## 회원가입한 계정정보 패스워드 암호화
![1](https://user-images.githubusercontent.com/12209348/41805983-90200564-76ee-11e8-8c9d-ae10c214f873.PNG)

## 회원정보 페이지(회원별 데이터화 예정)
![screencapture-localhost-9090-mypage-2018-08-16-20_39_51](https://user-images.githubusercontent.com/12209348/44206682-8f3ae200-a195-11e8-8d04-2e9faef932fd.png)

## local PC(server) infomation(CPU,memory, model 등) 점유율 측정(sigar API)
![default](https://user-images.githubusercontent.com/12209348/43362948-91c6f26e-9332-11e8-9ef2-5738fb58c32e.PNG)


### 진행 예정
1. CPU, RAM 수치 게이지형 차트 연동
2. 풀캘린더 스케쥴 등록 처리 (목록 호출완료, 수정, 삭제 기능 추가예정)
3. 계정별 풀캘린더 목록리스트 메인 페이지 to-do list 호출
4. 메인페이지 회원정보 통계 수치 등록
5. 마이페이지 업무 스킬 인벤토리 등록
6. 차트 통계용 샘플데이터 크롤링 선행(바그래프,선그래프용)
7. (바형, 선형 그래프)차트 정보 DB 데이터 연동
8. 의뢰페이지 엑셀 파일업로드 DB 테이블 임포트(xls, xlsx)
9. 로그인 oAuth 연동 기능 추가 (네이버, 카카오톡)

### 완료내역
1. 시큐리티 로그인, 로그아웃 세션처리 완료(jpa)
2. 샘플데이터 게시판목록 호출 완료(mybatis)
3. 일정계획표 페이지 - 풀캘린더 구글 공휴일 정보 api 연동 완료
4. 일정관리테이블, 회원정보 상세 테이블, 회원 권한 조인용 테이블 생성 완료
5. 테이블명 수정 기존 테이블, 관리자페이지 테이블 명 구분 완료
6. 시큐리티 회원가입 개발 완료
7. 대시보드 내 시큐리티 principal 정보 호출
8. 패스워드 분실 SMTP 비밀번호 찾기 로직 완료
9. 메인페이지 다음(카카오) 지도 api로 변경 완료
10. 메인페이지 실시간도로교통정보, 자전거 도로 정보 기능 추가 완료

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

## 개발 이슈
1. SMTP 비밀번호 찾기 properties 정보 노출로 계정 정보 삭제
2. 날씨 API darksky(api 1000번 테스트 호출 이후 유료), 구글 웨더(서비스 종료), skplant 웨더 API(서비스종료)로 인한 날씨정보 API 부재로 하드코딩 
3. 풀캘린더 일정 등록 및 삭제 로직 개발 중
4. local 장비 서버 및 pc 정보 차트연동
5. 세계 인구수 정보 보다 다음(카카오) 지도 api를 통한 지역정보를 가져오는게 효율적일것으로 판단하여 변경 예정
6. 시각적효과를 위한 백그라운드 컬러 검정계열로 변경
7. 네이버 인증 토큰 발행 테스트 중 
