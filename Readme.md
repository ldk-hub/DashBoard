# Bootstrap Admin DashBoard
[![HitCount](http://hits.dwyl.io/ldk-hub/DashBoard.svg)](http://hits.dwyl.io/ldk-hub/DashBoard)
[![HitCount](https://img.shields.io/badge/lisence-MIT-green.svg)](https://github.com/ldk-hub/DashBoard/blob/master/LICENSE)

### Introduce Menu List

 * [화면UI](#-- login)
 * [진행예정](#진행예정)
 * [사용한 API](#API)
 * [진행예정](#개발이슈)
 * [완료내역](#완료내역)
 * [개발환경](#개발환경)





### -- login, security, SMTP E-mail Find Password, Membership page (Add regular expression) --
![녹화_2019_12_27_16_59_23_687](https://user-images.githubusercontent.com/12209348/71508393-f957b100-28ca-11ea-96b7-cc9c693cf0a9.gif)

## Encrypt the member account information password
![1](https://user-images.githubusercontent.com/12209348/41805983-90200564-76ee-11e8-8c9d-ae10c214f873.PNG)

### RealTime Monitoring Page
![screencapture-localhost-9110-secondery-2019-08-14-13_06_51](https://user-images.githubusercontent.com/12209348/62994062-f7013700-be94-11e9-9c0b-ac9eab6c3510.png)

## Data Chart Page
![data](https://user-images.githubusercontent.com/12209348/48657074-53533980-ea70-11e8-9114-97814ee4b032.png)

## Calendar Page
![calendar](https://user-images.githubusercontent.com/12209348/48657075-53533980-ea70-11e8-9f1a-a3f63f96bbe8.png)

## Member information page (data for each member)
![screencapture-localhost-9090-mypage-2018-08-16-20_39_51](https://user-images.githubusercontent.com/12209348/44206682-8f3ae200-a195-11e8-8d04-2e9faef932fd.png)

## local PC(server) infomation(CPU, Memory etc.)
![default](https://user-images.githubusercontent.com/12209348/43362948-91c6f26e-9332-11e8-9ef2-5738fb58c32e.PNG)

## Color Concept : Dark Theme
![screencapture-localhost-9110-dashboard-2019-08-14-13_13_19](https://user-images.githubusercontent.com/12209348/62994145-58c1a100-be95-11e9-93e8-ebedea1211d2.png)
![screencapture-localhost-9090-hyopage-2019-08-10-11_53_15](https://user-images.githubusercontent.com/12209348/62841157-bca26900-bcdf-11e9-894a-2d77cfc81e2f.png)
![screencapture-localhost-9110-calendar-2019-08-13-11_04_55](https://user-images.githubusercontent.com/12209348/62910147-6524fb80-bdba-11e9-96c3-aeff500369ea.png)
![screencapture-localhost-9110-mypage-2019-08-14-13_08_24](https://user-images.githubusercontent.com/12209348/62994061-f668a080-be94-11e9-9d0d-b53208b15b30.png)




### 진행예정
1. amchart4 실데이터 연동 테스트 작업(라인차트, stock차트 테스트중)
2. README.md 이미지 -> 움짤로 시연영상 변경 

### 완료내역
1. 시큐리티 로그인, 로그아웃 세션처리 완료(jpa)
2. 샘플데이터 게시판목록 호출 완료(mybatis)
3. 일정계획표 페이지 - 풀캘린더 구글 공휴일 정보 api 연동 완료
4. 일정관리테이블, 회원정보 상세 테이블, 회원 권한 조인용 테이블 생성 완료
5. 테이블명 수정 기존 테이블, 관리자페이지 테이블 명 구분 완료
6. 시큐리티 회원가입 개발 완료
7. 대시보드 내 시큐리티 principal 정보 호출
8. 패스워드 분실 SMTP 비밀번호 찾기 로직 완료
9. 메인페이지  지도 api 다음서비스 종료로 인한 카카오로 변경 완료
10. 메인페이지 실시간도로교통정보, 자전거 도로 정보 기능 추가 완료
11. TUI GRID 데이터 제어 완료 
12. 메인페이지 회원정보 통계 수치 호출 완료
13. 사이드바 시계 기능 추가 완료
14. 시스템 테이블 및 데이터 로그 설정(log4jdbc)완료
15. 커스터마이징 용 대시보드 페이지 추가 완료
16. 대시보드 관리페이지 개발완료
17. 실시간 모니터링용 페이지개발완료
18. 시스템 다크테마 변경완료
19. read.me 뱃지 추가 및 링크 적용 및 시스템 이미지 최신화 작업 완료
20. 이미지 업로드 처리 
21. tui-grid에서 저장된 이미지 호출 완료
22. sigar 라이브러리 연동작업 완료
23. 차트게이지 정보데이터 실시간 모니터링 완료
24. echart -> amchart4 반영완료

### 개발이슈
1. SMTP 비밀번호 찾기 properties 정보 노출로 계정 정보 삭제
2. 날씨 API darksky(api 1000번 테스트 호출 이후 유료), 구글 웨더(서비스 종료), skplant 웨더 API(서비스종료)로 인한 날씨정보 API 부재로 하드코딩 
3. 풀캘린더 일정 등록 및 삭제 로직 개발 중
4. local 장비 서버 및 pc 정보 차트연동
5. 세계 인구수 정보 보다 다음(카카오) 지도 api를 통한 지역정보를 가져오는게 효율적일것으로 판단하여 변경 
6. 시각적효과를 위한 백그라운드 컬러 검정(Dark)계열로 변경
7. 사이드바 시계 30초 단위 컬러변경 기능 추가
9. tui-grid 업데이트 bootstrap-timepicker 업데이트 완료
10. 이미지 처리시 서버의 OS에 따라 path 설정 및 처리방식이 다름.
11. 기존 oracle -> postgresql DB변환 하였음.
12. echart경우 중국어라서 한계점이 많았음. ->amchart4같은 경우 최근 이슈되기도하고 반응형에서도 대응이 확실하여 전환하게됨.

### API
 - System table : Datatables, tui grid
 - 날씨, 지도 : daum maps, Skycons
 - 차트 : amcharts4
 - 캘린더 : fullcalendar, bootstrap-daterangepicker, Bootstrap Colorpicker, DateJS
 - 기타 : Dropzone, NProgress, iCheck, Flot
  
### 개발환경
  - 개발언어 : JAVA1.8
  - 스프링 : Spring Boot, Spring Security
  - DB : OracleDB, Postgresql-DB
  - UI : gentelella, Tiles3, Bootstrap4
  - 기타 : Mybatis, jpa, lombok
  
### 프로젝트 세팅법
1. 라이브러리중 dist 폴더 세팅
2. DB 테이블 싱크 (테이블 정보 세팅예정 일부는 jpa가 자동세팅함.)
