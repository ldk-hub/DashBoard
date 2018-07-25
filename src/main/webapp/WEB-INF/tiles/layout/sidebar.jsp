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

	<!-- /menu footer buttons -->
	<div class="sidebar-footer hidden-small">
	    <a data-toggle="tooltip" data-placement="top" title="Settings">
	        <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
	    </a>
	    <a data-toggle="tooltip" data-placement="top" title="FullScreen">
	        <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
	    </a>
	    <a data-toggle="tooltip" data-placement="top" title="Lock">
	        <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
	    </a>
	    <a data-toggle="tooltip" data-placement="top" title="Logout" href="login">
	        <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
	    </a>
	</div>
	<!-- /menu footer buttons -->

