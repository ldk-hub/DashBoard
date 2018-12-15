# Hybrid Web Admin DashBoard
## System use environment
JAVA1.8, Spring Boot, Security, OracleDB, lombok, Mybatis, jpa, hibernate, gentelella, Tiles3

## Main DashBoard
![mainpage](https://user-images.githubusercontent.com/12209348/48657076-53533980-ea70-11e8-86d6-72a49c2d574f.png)

## Data Chart Page
![data](https://user-images.githubusercontent.com/12209348/48657074-53533980-ea70-11e8-9114-97814ee4b032.png)

## Calendar Page
![calendar](https://user-images.githubusercontent.com/12209348/48657075-53533980-ea70-11e8-9f1a-a3f63f96bbe8.png)

## Login Page
![login](https://user-images.githubusercontent.com/12209348/48657077-53ebd000-ea70-11e8-846b-34a72b50f7c5.png)

## SMTP E-mail Find Password
![screencapture-localhost-9090-login-2018-08-16-20_50_35](https://user-images.githubusercontent.com/12209348/44206867-27d16200-a196-11e8-9b48-354e21f17a74.png)

## Membership page (Add regular expression)
![screencapture-localhost-9090-login-2018-08-16-20_41_04](https://user-images.githubusercontent.com/12209348/44206667-86e2a700-a195-11e8-82b5-cf75d610f89d.png)

## Encrypt the member account information password
![1](https://user-images.githubusercontent.com/12209348/41805983-90200564-76ee-11e8-8c9d-ae10c214f873.PNG)

## Member information page (data for each member)
![screencapture-localhost-9090-mypage-2018-08-16-20_39_51](https://user-images.githubusercontent.com/12209348/44206682-8f3ae200-a195-11e8-8d04-2e9faef932fd.png)

## local PC(server) infomation(CPU, Memory 등)
![default](https://user-images.githubusercontent.com/12209348/43362948-91c6f26e-9332-11e8-9ef2-5738fb58c32e.PNG)


### 진행 예정
1. CPU, RAM 수치 게이지형 차트 연동
2. 풀캘린더 스케쥴 등록 처리 (목록 호출완료, 수정, 삭제 기능 추가예정)
3. 계정별 풀캘린더 목록리스트 메인 페이지 to-do list 호출
4. 마이페이지 업무 스킬 인벤토리 등록
5. 차트 통계용 샘플데이터 크롤링 선행(바그래프,선그래프용)
6. (바형, 선형 그래프)차트 정보 DB 데이터 연동
7. 의뢰페이지 엑셀 파일업로드 DB 테이블 임포트(xls, xlsx)


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
11. TUI GRID 데이터 제어 완료 
12. 메인페이지 회원정보 통계 수치 호출 완료
13. 사이드바 시계 기능 추가 완료
14. 시스템 테이블 및 데이터 로그 설정(log4jdbc)

### List of API`S used
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
Skycons,
toast grid,
daum maps 등

## 개발 이슈
1. SMTP 비밀번호 찾기 properties 정보 노출로 계정 정보 삭제
2. 날씨 API darksky(api 1000번 테스트 호출 이후 유료), 구글 웨더(서비스 종료), skplant 웨더 API(서비스종료)로 인한 날씨정보 API 부재로 하드코딩 
3. 풀캘린더 일정 등록 및 삭제 로직 개발 중
4. local 장비 서버 및 pc 정보 차트연동
5. 세계 인구수 정보 보다 다음(카카오) 지도 api를 통한 지역정보를 가져오는게 효율적일것으로 판단하여 변경 예정
6. 시각적효과를 위한 백그라운드 컬러 검정계열로 변경
7. 네이버 인증 토큰 발행 테스트 중 
8. 사이드바 시계 30초 단위 컬러변경 기능 추가
