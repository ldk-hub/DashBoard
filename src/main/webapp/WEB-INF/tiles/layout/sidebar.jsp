<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!-- menu profile quick info -->
<div class="profile clearfix">
    <div class="profile_pic">
        <img src="/static/images/user.png" alt="..." class="img-circle profile_img">
    </div>
    <div class="profile_info">
        <span>환영합니다. </span>
        <h2>Admin</h2>
    </div>
</div>
<!-- /menu profile quick info -->
<br />

<!-- sidebar menu -->
<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
    <div class="menu_section">
        <h3>관리업무 탭</h3>
        <ul class="nav side-menu">
            <li><a><i class="fa  fa-bar-chart-o"></i> 데이터 통계 페이지<span class="label label-success pull-right">공사중</span></a></li>
            <li><a href="calendar"><i class="fa fa-calendar"></i>일정표<span class="label label-success pull-right">공사중</span></a></li>
            <li><a href="contacts"><i class="fa fa-table"></i> 회원 정보 조회 <span class="label label-success pull-right">공사중</span></a></li>
            <li><a><i class="fa fa-desktop"></i> 개발 샘플API<span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu">
                	<li><a href="icons">심볼 아이콘 샘플</a></li>
                    <li><a href="chartjs">Chart JS</a></li>
                    <li><a href="chartjs2">Chart JS2</a></li>
                    <li><a href="echarts">ECharts</a></li>
                </ul>
            </li>
            <li><a><i class="fa fa-edit"></i> 개발예정 목록 <span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu">
                    <li><a href="form">폼구성 샘플</a></li>
                    <li><a href="table">게시판 샘플</a></li>
                    <li><a href="page_403.html">403 Error</a></li>
                    <li><a href="page_404.html">404 Error</a></li>
                    <li><a href="page_500.html">500 Error</a></li>
                    
                </ul>
            </li>
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

