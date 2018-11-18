<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<div class="profile clearfix">
    <div class="profile_pic">
        <img src="/static/images/user.png" alt="..." class="img-circle profile_img">
    </div>
    <div class="profile_info">
        <span>환영합니다. </span>
        <h2><sec:authentication property="principal.username" /></h2>
    </div>
</div>
<br />
	<!-- sidebar menu -->
	<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
	    <div class="menu_section">
	        <h3>업무관리 목록</h3>
	        <ul class="nav side-menu">
	        	<li><a href="dashboard" ><i class="fa fa-desktop"></i> 통합정보조회 <span class="label label-success pull-right">공사중</span></a></li>
	            <li><a href="hyopage"><i class="fa  fa-bar-chart-o"></i> 데이터 차트 조회 <span class="label label-success pull-right">공사중</span></a></li>
	            <li><a href="calendar"><i class="fa fa-calendar"></i>일정표</a></li>
	            <!-- 미사용으로인한 주석처리 -->
	           <!--  <li><a><i class="fa fa-desktop"></i> 개발 샘플API <span class="label label-success pull-right">개발용</span><span class="fa fa-chevron-down"></span></a>
	                <ul class="nav child_menu">
	                	<li><a href="form">폼구성 샘플</a></li>
	                	<li><a href="icons">심볼 아이콘 샘플</a></li>
	                    <li><a href="chartjs">Chart JS</a></li>
	                    <li><a href="chartjs2">Chart JS2</a></li>
	                    <li><a href="echarts">ECharts</a></li>
	                </ul>
	            </li> -->
	        </ul>
	    </div>
	</div>
	<!-- /sidebar menu -->


	<!-- 사이드 바 메인 타이머 -->
	<body onload="printClock()">
		<div style="overflow:hidden; width:100%; height:150px; line-height:60px; color:#999;font-size:30px; text-align:center;" id="clock">
		</div>
	</body>
	<!-- /menu footer buttons -->
	<div class="sidebar-footer hidden-small">
	    <a data-toggle="tooltip" data-placement="top" title="mypage" href="mypage">
	        <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
	    </a>
	    <a data-toggle="tooltip" data-placement="top" title="FullScreen">
	        <span class="glyphicon glyphicon-fullscreen" aria-hidden="true" onclick="toggleFullScreen();"></span>
	    </a>
	    <a data-toggle="tooltip" data-placement="top" title="Lock">
	        <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
	    </a>
	    <a data-toggle="tooltip" data-placement="top" title="Logout" href="logout">
	        <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
	    </a>
	</div>
	<!-- /menu footer buttons -->

	<!-- 대시보드 풀스크린 적용 -->
	<script type="text/javascript">
		function toggleFullScreen() {
		  var doc = window.document;
		  var docEl = doc.documentElement;
		
		  var requestFullScreen = docEl.requestFullscreen || docEl.mozRequestFullScreen || docEl.webkitRequestFullScreen || docEl.msRequestFullscreen;
		  var cancelFullScreen = doc.exitFullscreen || doc.mozCancelFullScreen || doc.webkitExitFullscreen || doc.msExitFullscreen;
		
		  if(!doc.fullscreenElement && !doc.mozFullScreenElement && !doc.webkitFullscreenElement && !doc.msFullscreenElement) {
		    requestFullScreen.call(docEl);
		  }
		  else {
		    cancelFullScreen.call(doc);
		  }
		}
	</script>
	<!-- 시계 30초기점으로 컬러 변경 옵션 스크립트 -->
	<script type="text/javascript">
		function printClock() {
		    var clock = document.getElementById("clock");            // 출력할 장소 선택
		    var currentDate = new Date();                                     // 현재시간
		    var calendar = currentDate.getFullYear() + "-" + (currentDate.getMonth()+1) + "-" + currentDate.getDate() // 현재 날짜
		    var amPm = 'AM'; // 초기값 AM
		    var currentHours = addZeros(currentDate.getHours(),2); 
		    var currentMinute = addZeros(currentDate.getMinutes() ,2);
		    var currentSeconds =  addZeros(currentDate.getSeconds(),2);
		    
		    if(currentHours >= 12){ // 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
		    	amPm = 'PM';
		    	currentHours = addZeros(currentHours - 12,2);
		    }
		
		    if(currentSeconds >= 30){// 50초 이상일 때 색을 변환해 준다.
		       currentSeconds = '<span style="color:#8fbc8f;">'+currentSeconds+'</span>'
		       currentMinute = '<span style="color:#8fbc8f;">'+currentMinute+'</span>'
		       currentHours = '<span style="color:#8fbc8f;">'+currentHours+'</span>'
		    }
		    clock.innerHTML = currentHours+":"+currentMinute+":"+currentSeconds +" <span style='font-size:20px;'>"+ amPm+"</span>"; //날짜를 출력해 줌
		    
		    setTimeout("printClock()",1000); // 1초마다 printClock() 함수 호출
		}
		
		function addZeros(num, digit) { // 자릿수 맞춰주기
			  var zero = '';
			  num = num.toString();
			  if (num.length < digit) {
			    for (i = 0; i < digit - num.length; i++) {
			      zero += '0';
			    }
			  }
			  return zero + num;
		}
	</script>