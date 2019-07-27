# Bootstrap Admin DashBoard

### Introduce Menu List

 * [화면UI](#DashBoard)
 * [진행예정](#진행예정)
 * [사용한 API](#API)
 * [진행예정](#개발이슈)
 * [완료내역](#완료내역)
 * [개발환경](#개발환경)




## Main DashBoard
![mainpage](https://user-images.githubusercontent.com/12209348/48657076-53533980-ea70-11e8-86d6-72a49c2d574f.png)

### RealTime Monitering Page
![screencapture-localhost-9090-secondery-2019-05-04-15_13_31](https://user-images.githubusercontent.com/12209348/57174842-daaa3300-6e7f-11e9-9e36-9905977f4452.png)

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


### 진행예정
1. CPU, RAM 수치 게이지형 차트 연동
2. 풀캘린더 스케쥴 등록 처리 (목록 호출완료, 수정, 삭제 기능 추가예정)
3. 계정별 풀캘린더 목록리스트 메인 페이지 to-do list 호출
4. 마이페이지 업무 스킬 인벤토리 등록
6. 이미지 업로드 
7. 저장된 이미지 썸네일 호출
8. tui.grid와 이미지 처리 연계작업

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
14. 시스템 테이블 및 데이터 로그 설정(log4jdbc)완료
15. 커스터마이징 용 대시보드 페이지 추가 완료
16. 대시보드 관리페이지 개발완료
17. 실시간 모니터링용 페이지개발완료
18. 시스템 다크테마 적용

### 개발이슈
1. SMTP 비밀번호 찾기 properties 정보 노출로 계정 정보 삭제
2. 날씨 API darksky(api 1000번 테스트 호출 이후 유료), 구글 웨더(서비스 종료), skplant 웨더 API(서비스종료)로 인한 날씨정보 API 부재로 하드코딩 
3. 풀캘린더 일정 등록 및 삭제 로직 개발 중
4. local 장비 서버 및 pc 정보 차트연동
5. 세계 인구수 정보 보다 다음(카카오) 지도 api를 통한 지역정보를 가져오는게 효율적일것으로 판단하여 변경 
6. 시각적효과를 위한 백그라운드 컬러 검정(Dark)계열로 변경
7. 사이드바 시계 30초 단위 컬러변경 기능 추가
9. tui-grid 업데이트 bootstrap-timepicker 업데이트 예정.
10. 이미지 처리시 서버의 OS에 따라 path 설정 및 처리방식이 다름.

### API
 - System table : Datatables, tui grid
 - 날씨, 지도 : daum maps, Skycons
 - 차트 : echart, gauge
 - 캘린더 : fullcalendar, bootstrap-daterangepicker, Bootstrap Colorpicker, DateJS
 - 기타 : Dropzone, NProgress, iCheck, Flot
  
### 개발환경
  - 개발언어 : JAVA1.8
  - 스프링 : Spring Boot, Spring Security, 
  - DB : OracleDB, Mybatis, jpa, hibernate, lombok
  - UI : gentelella, Tiles3, Bootstrap4
