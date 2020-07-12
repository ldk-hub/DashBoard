<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title> 통합정보시스템 </title>
	 
 	<!-- favicon -->
 	<link rel="shortcut icon" type="image/x-icon" href="/static/images/favicon.ico">
    <!-- Bootstrap -->
    <link href="/static/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="/static/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="/static/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="/static/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
	<!-- Dropzone.js -->
    <link href="/static/vendors/dropzone/dist/min/dropzone.min.css" rel="stylesheet">
    <!-- 풀캘린더 -->
    <link href="/static/vendors/fullcalendar/dist/fullcalendar.min.css" rel="stylesheet">
    <link href="/static/vendors/fullcalendar/dist/fullcalendar.print.css" rel="stylesheet" media="print">
    <!-- Custom Theme Style -->
    <link href="/static/css/custom.min.css" rel="stylesheet">

</head>
<body class="nav-md" style="color:#fff">
	<div class="container body">
	    <div class="main_container">
	        <div class="col-md-3 left_col">
	            <div class="left_col scroll-view">
	                <div class="navbar nav_title" style="border: 0;">
	                    <a class="site_title"><i class="fa fa-bullhorn"></i> <span>통합정보시스템</span></a>
	                </div>
	                <div class="clearfix"></div>
	                <tiles:insertAttribute name="sidebar" />
	            </div>
	        </div>
	        <tiles:insertAttribute name="header" />
	        <tiles:insertAttribute name="body" />
	        <tiles:insertAttribute name="footer" />
	    </div>
	</div>
	
	<!-- jQuery -->
	<script src="/static/vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="/static/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- FastClick -->
	<script src="/static/vendors/fastclick/lib/fastclick.js"></script>
	<!-- NProgress -->
	<script src="/static/vendors/nprogress/nprogress.js"></script>
	<!-- iCheck -->
	<script src="/static/vendors/iCheck/icheck.min.js"></script>
	<!-- Skycons -->
	<script src="/static/vendors/skycons/skycons.js"></script>
	<!-- DateJS -->
	<!-- <script src="/static/vendors/DateJS/build/date.js"></script> -->
	<!-- Dropzone.js -->
	<script src="/static/vendors/dropzone/dist/min/dropzone.min.js"></script>
	<!-- amcharts4  -->
	<script src="/static/vendors/amcharts4/core.js"></script>
	<script src="/static/vendors/amcharts4/charts.js"></script>
	<script src="/static/vendors/amcharts4/themes/dark.js"></script>
	<script src="/static/vendors/amcharts4/themes/animated.js"></script>

	<script src="/static/js/custom.min.js"></script>
	

</body>
</html>


