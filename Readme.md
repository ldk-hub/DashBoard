# Bootstrap Admin DashBoard
[![HitCount](http://hits.dwyl.io/ldk-hub/DashBoard.svg)](http://hits.dwyl.io/ldk-hub/DashBoard)
[![HitCount](https://img.shields.io/badge/lisence-MIT-green.svg)](https://github.com/ldk-hub/DashBoard/blob/master/LICENSE)

### Introduce Menu List

 * [API리스트](#리스트)
 * [진행예정](#진행예정)
 * [진행예정](#개발이슈)
 * [완료내역](#완료내역)
 * [개발환경](#개발환경)

  

### -- login, security, SMTP E-mail Find Password, Membership page (Add regular expression) --
![녹화_2019_12_27_16_59_23_687](https://user-images.githubusercontent.com/12209348/71508393-f957b100-28ca-11ea-96b7-cc9c693cf0a9.gif)

## Encrypt the member account information password
![1](https://user-images.githubusercontent.com/12209348/41805983-90200564-76ee-11e8-8c9d-ae10c214f873.PNG)


## local PC(server) infomation(CPU, Memory etc.)

![CPU측정](https://user-images.githubusercontent.com/12209348/71538778-79862100-2974-11ea-891f-e0706ec22af9.gif)

![default](https://user-images.githubusercontent.com/12209348/43362948-91c6f26e-9332-11e8-9ef2-5738fb58c32e.PNG)

## Main Page
![녹화_2019_12_28_13_50_01_980](https://user-images.githubusercontent.com/12209348/71539042-5dd14980-2979-11ea-973a-dc58d91aa385.gif)

![screencapture-localhost-9110-dashboard-2019-12-28-13_21_32](https://user-images.githubusercontent.com/12209348/71538837-455f3000-2975-11ea-9f2c-240ce6180186.png)

## Data Edit Page
![screencapture-localhost-9090-hyopage-2019-08-10-11_53_15](https://user-images.githubusercontent.com/12209348/62841157-bca26900-bcdf-11e9-894a-2d77cfc81e2f.png)

## Schedule Page
![screencapture-localhost-9110-calendar-2019-08-13-11_04_55](https://user-images.githubusercontent.com/12209348/62910147-6524fb80-bdba-11e9-96c3-aeff500369ea.png)

## user custom page
![screencapture-localhost-9110-mypage-2019-08-14-13_08_24](https://user-images.githubusercontent.com/12209348/62994061-f668a080-be94-11e9-9d0d-b53208b15b30.png)


### RealTime Monitoring Page
![screencapture-localhost-9110-secondery-2019-08-14-13_06_51](https://user-images.githubusercontent.com/12209348/62994062-f7013700-be94-11e9-9c0b-ac9eab6c3510.png)


### 완료내역
1. 시큐리티 로그인, 로그아웃 세션처리 완료(jpa사용)
2. 샘플데이터 게시판목록 호출 완료(mybatis사용)
3. 일정계획표 페이지 - 풀캘린더, 구글 공휴일 정보 api 연동 완료
4. 일정관리테이블, 회원정보 상세 테이블, 회원 권한 조인용 테이블 생성 완료
5. 테이블명 수정 기존 테이블, 관리자페이지 테이블 명 구분 완료
6. 스프링 시큐리티 회원가입 로직 구현완료(principal 사용)
7. 패스워드 분실 SMTP 메일발송 비밀번호 찾기 로직 구현완료
8. 대시보드페이지 서비스 종료 다음지도api -> 카카오맵 API로 변경 완료
9. 대시보드페이지 지도API 실시간도로교통정보, 자전거 도로 정보 기능 추가 완료
10. TUI GRID, datatables API 연동 완료 
11. 대시보드페이지 회원 사용자 통계수치 로직 구현완료
12. 사이드바 시계 기능 추가 완료
13. 시스템 테이블 및 데이터 로그 설정 사용(log4jdbc)
14. 실시간 모니터링용 페이지 개발완료
15. 시스템 UI 다크테마 변경완료
16. 실시간모니터링 페이지 이미지 업로드 호출로직 구현완료 
17. TUI-GRID API 내 저장된 이미지 호출로직 구현완료
18. sigar API(로컬 시스템 정보 수집 API) 연동작업 완료
19. amcharts4 API -> Sigar API의 수집정보 연동 로직 구현완료(실시간 PC정보 모니터링 기능)
20. echart -> amchart4 반영완료(변경이유 : 차트의 웹 유연성 및 최적화 이슈로 변경함)
21. amchart 게이지 차트 ->시스템 정보 표출 , 멀티라인차트 DB 연동(데이터 누적방식 차트)

### 개발이슈
1. SMTP 비밀번호 찾기 properties 정보 계정 정보 삭제
2. 날씨 API darksky(유료), 구글 웨더(서비스 종료), skplant 웨더 API(서비스종료)로 인한 날씨정보 API 부재로 하드코딩 
3. 풀캘린더 일정 등록 및 삭제 로직 개발 중
4. local 장비 서버 및 pc 정보 차트연동
5. 세계 인구수 정보 보다 다음(카카오) 지도 api를 통한 지역정보를 가져오는게 효율적일것으로 판단하여 변경 
6. 시각적효과를 위한 백그라운드 컬러 검정(Dark)계열로 변경
7. 사이드바 시계 30초 단위 컬러변경 기능 추가
9. tui-grid 업데이트 bootstrap-timepicker 업데이트 완료
10. 이미지 처리시 서버의 OS에 따라 path 설정 및 처리방식이 다름.
11. 기존 oracle -> postgresql DB변환 하였음.
12. echart경우 중국어라서 한계점이 많았음. ->amchart4같은 경우 최근 이슈되기도하고 반응형에서도 대응이 확실하여 전환결정.
13. 멀티라인차트 DB 연동 중 누적방식을 채택(DB데이터정보 바로 찍는방식,누적방식 등 커스터마이징 가능) 차트내 표출갯수 15개 한계(인터벌로 호출주기로 갱신가능)
14. 멀티라인차트,게이지차트 두가지를 한화면 내에서 동시 처리하는 과정에서 속도이슈 발생 최적화 방안 검토예정

### API리스트
 - System table : Datatables, tui grid
 - 날씨, 지도 : daum maps, Skycons
 - 차트 : amcharts4
 - 캘린더 : fullcalendar, bootstrap-daterangepicker, DateJS
 - 기타 : Dropzone, NProgress, iCheck, Flot
  
### 개발환경
  - language : JAVA1.8
  - framework : Spring Boot, Spring Security
  - DB : OracleDB, Postgresql-DB
  - UI : gentelella, Tiles3, Bootstrap
  - etc : Mybatis, jpa, lombok
