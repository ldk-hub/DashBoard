<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Gentelella Alela! | </title>

    <!-- Bootstrap -->
    <link href="/static/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="/static/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="/static/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="/static/vendors/iCheck/skins/flat/green.css" rel="stylesheet">

    <!-- bootstrap-progressbar -->
    <link href="/static/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- JQVMap -->
    <link href="/static/vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet"/>
    <!-- bootstrap-daterangepicker -->
    <link href="/static/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="/static/css/custom.min.css" rel="stylesheet">

</head>

<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <div class="col-md-3 left_col">
            <div class="left_col scroll-view">
                <div class="navbar nav_title" style="border: 0;">
                    <a href="index.html" class="site_title"><i class="fa fa-paw"></i> <span>Gentelella Alela!</span></a>
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
<!-- Chart.js -->
<script src="/static/vendors/Chart.js/dist/Chart.min.js"></script>
<!-- gauge.js -->
<script src="/static/vendors/gauge.js/dist/gauge.min.js"></script>
<!-- bootstrap-progressbar -->
<script src="/static/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
<!-- iCheck -->
<script src="/static/vendors/iCheck/icheck.min.js"></script>
<!-- Skycons -->
<script src="/static/vendors/skycons/skycons.js"></script>
<!-- Flot -->
<script src="/static/vendors/Flot/jquery.flot.js"></script>
<script src="/static/vendors/Flot/jquery.flot.pie.js"></script>
<script src="/static/vendors/Flot/jquery.flot.time.js"></script>
<script src="/static/vendors/Flot/jquery.flot.stack.js"></script>
<script src="/static/vendors/Flot/jquery.flot.resize.js"></script>
<!-- Flot plugins -->
<script src="/static/vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
<script src="/static/vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
<script src="/static/vendors/flot.curvedlines/curvedLines.js"></script>
<!-- DateJS -->
<script src="/static/vendors/DateJS/build/date.js"></script>
<!-- JQVMap -->
<script src="/static/vendors/jqvmap/dist/jquery.vmap.js"></script>
<script src="/static/vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
<script src="/static/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
<!-- bootstrap-daterangepicker -->
<script src="/static/vendors/moment/min/moment.min.js"></script>
<script src="/static/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>

<!-- Custom Theme Scripts -->
<script src="/static/js/custom.min.js"></script>

</body>
</html>

