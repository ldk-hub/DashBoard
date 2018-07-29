# Bootstrap Hybrid Web Admin Site
## 시스템 사용환경
JAVA1.8, Spring Boot, Security, OracleDB, lombok, Mybatis, jpa, hibernate, gentelella, Tiles3

## 메인페이지
![screencapture-localhost-9090-dashboard-2018-07-29-13_13_50](https://user-images.githubusercontent.com/12209348/43362942-452b4810-9332-11e8-9d7f-9bd4e38f9a07.png)

## 데이터차트페이지
![screencapture-localhost-9090-hyopage-2018-07-29-13_14_12](https://user-images.githubusercontent.com/12209348/43362941-450339c4-9332-11e8-9277-6694821ee320.png)

## 일정계획페이지
![screencapture-localhost-9090-calendar-2018-07-29-15_33_35](https://user-images.githubusercontent.com/12209348/43363652-d2852e80-9344-11e8-8424-53bb0b09291a.png)

## 로그인페이지
![screencapture-localhost-9090-login-2018-05-14-12_28_49](https://user-images.githubusercontent.com/12209348/39977138-c70af462-5772-11e8-89f5-fd99f96a6de2.png)

## SMTP 이메일 비밀번호 찾기
![default](https://user-images.githubusercontent.com/12209348/40882898-7e6d85c2-672a-11e8-8a32-2b227c267d16.PNG)

## 회원가입 페이지(정규식 추가)
![screencapture-localhost-9090-login-2018-06-23-14_04_31](https://user-images.githubusercontent.com/12209348/41805990-c386016a-76ee-11e8-8081-4e2a1467caed.png)

## 회원가입한 계정정보 패스워드 암호화
![1](https://user-images.githubusercontent.com/12209348/41805983-90200564-76ee-11e8-8c9d-ae10c214f873.PNG)

## 회원정보 페이지(회원별 데이터화 예정)
![screencapture-localhost-9090-mypage-2018-06-08-13_08_42](https://user-images.githubusercontent.com/12209348/41138730-44814f86-6b1e-11e8-995b-a592d267f941.png)

## local PC(server) infomation(CPU,memory, model 등) 점유율 측정(sigar API)
![default](https://user-images.githubusercontent.com/12209348/43362948-91c6f26e-9332-11e8-9ef2-5738fb58c32e.PNG)


### 진행 예정
1. 풀캘린더 스케쥴 등록 처리 (메인페이지 to-do List 연동)
2. 마이페이지 업무 스킬 인벤토리 등록 
3. 메인페이지 회원정보 통계 수치 등록
4. local PC infomation 호출 (현재 콘솔에서 출력중 차트 연동 중)
5. 차트 통계용 샘플데이터 크롤링 선행
6. 차트 정보 데이터처리
7. 엑셀 파일업로드 데이터 차트 연동

### 완료내역
1. 시큐리티 로그인, 로그아웃 세션처리 완료(jpa)
2. 샘플데이터 게시판목록 호출 완료(mybatis)
3. 일정계획표 페이지 - 풀캘린더 구글 공휴일 정보 api 연동 완료
4. 일정관리테이블, 회원정보 상세 테이블, 회원 권한 조인용 테이블 생성 완료
5. 테이블명 수정 기존 테이블, 관리자페이지 테이블 명 구분 완료
6. 시큐리티 회원가입 개발 완료
7. 대시보드 내 시큐리티 principal 정보 호출
8. 패스워드 분실 SMTP 비밀번호 찾기 로직 완료

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
2. 날씨 API darksky(api 1000번 호출 이후 유료), 구글 웨더(서비스 종료),skplant 웨더 API(서비스종료)로 인한 하드코딩 사용 
3. 풀캘린더 일정 리스트 호출 로직 수정 중
4. local PC infomation 호출(서버라면 서버에서 sigar로 측정가능 테스트는 로컬 피씨를 대상으로)