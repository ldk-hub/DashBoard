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
    <!-- bootstrap-progressbar -->
    <link href="/static/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- JQVMap -->
    <link href="/static/vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet"/>
    <!-- bootstrap-daterangepicker -->
    <link href="/static/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
	 <!-- bootstrap-datetimepicker -->
    <link href="/static/vendors/bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.css" rel="stylesheet">
     <!-- Ion.RangeSlider -->
    <link href="/static/vendors/normalize-css/normalize.css" rel="stylesheet">
    <link href="/static/vendors/ion.rangeSlider/css/ion.rangeSlider.css" rel="stylesheet">
    <link href="/static/vendors/ion.rangeSlider/css/ion.rangeSlider.skinFlat.css" rel="stylesheet">
    <!-- Bootstrap Colorpicker -->
    <link href="/static/vendors/mjolnic-bootstrap-colorpicker/dist/css/bootstrap-colorpicker.min.css" rel="stylesheet">
    <link href="/static/vendors/cropper/dist/cropper.min.css" rel="stylesheet">
    <!-- 풀캘린더 -->
    <link href="/static/vendors/fullcalendar/dist/fullcalendar.min.css" rel="stylesheet">
    <link href="/static/vendors/fullcalendar/dist/fullcalendar.print.css" rel="stylesheet" media="print">
    <!-- Datatables -->
    <link href="/static/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="/static/vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="/static/vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="/static/vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="/static/vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">
    
    <!-- Custom Theme Style -->
    <link href="/static/css/custom.min.css" rel="stylesheet">

</head>
<body class="nav-md">
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
	<!-- FullCalendar -->
	<script src="/static/vendors/moment/min/moment.min.js"></script>
	<script src="/static/vendors/fullcalendar/dist/fullcalendar.min.js"></script>
	<script src="/static/vendors/fullcalendar/dist/gcal.js"></script>
	<!-- bootstrap-daterangepicker -->
	<script src="/static/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
	 <!-- bootstrap-datetimepicker -->    
	<script src="/static/vendors/bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
	<!-- Ion.RangeSlider -->
	<script src="/static/vendors/ion.rangeSlider/js/ion.rangeSlider.min.js"></script>
	<!-- Bootstrap Colorpicker -->
	<script src="/static/vendors/mjolnic-bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
	<!-- jQuery Knob -->
	<script src="/static/vendors/jquery-knob/dist/jquery.knob.min.js"></script>
	<!-- echart -->
	<script src="/static/vendors/echarts/dist/echarts.min.js"></script>
	<script src="/static/vendors/echarts/map/js/world.js"></script>
	 <!-- Datatables -->
	<script src="/static/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
	<script src="/static/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
	<script src="/static/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
	<script src="/static/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
	<script src="/static/vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
	<script src="/static/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
	<script src="/static/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
	<script src="/static/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
	<script src="/static/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
	<script src="/static/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
	<script src="/static/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
	<script src="/static/vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
	<script src="/static/vendors/jszip/dist/jszip.min.js"></script>
	<script src="/static/vendors/pdfmake/build/pdfmake.min.js"></script>
	<script src="/static/vendors/pdfmake/build/vfs_fonts.js"></script>
	<!-- Dropzone.js -->
	<script src="/static/vendors/dropzone/dist/min/dropzone.min.js"></script>
	
 	<!-- Initialize datetimepicker -->
	<script>
	    $('#myDatepicker').datetimepicker();
	    
	    $('#myDatepicker2').datetimepicker({
	        format: 'YYYY.DD.MM'
	    });
	    
	    $('#myDatepicker3').datetimepicker({
	        format: 'hh:mm A'
	    });
	    
	    $('#myDatepicker4').datetimepicker({
	        ignoreReadonly: true,
	        allowInputToggle: true
	    });
	
	    $('#datetimepicker6').datetimepicker();
	    
	    $('#datetimepicker7').datetimepicker({
	        useCurrent: false
	    });
	    
	    $("#datetimepicker6").on("dp.change", function(e) {
	        $('#datetimepicker7').data("DateTimePicker").minDate(e.date);
	    });
	    
	    $("#datetimepicker7").on("dp.change", function(e) {
	        $('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
	    });
	</script>
	<!-- 일정관리페이지 -->
	<script type="text/javascript">
        jQuery("#calendar").fullCalendar({
            header : {
                  left : "month,today,agendaWeek"
                , center : "title"
                , right : "prev,next"
            }
	        , allDayDefault: true 
	        , selectable: true
	        , selectHelper: true
            , lang : "ko"
            , editable : true
            , eventLimit : true
            , googleCalendarApiKey : "AIzaSyDcnW6WejpTOCffshGDDb4neIrXVUA1EAE"  // Google API KEY
           	, columnFormat:'ddd'
   	        , monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"]
   	       	, monthNamesShort: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"]
   	        , dayNames: ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"]
   	        , dayNamesShort: ["일","월","화 ","수 ","목 ","금 ","토 "]      ///한글로변환
   	        , buttonText: {
   	    	    today : "오늘",
   	    	    month : "월별",
   	    	 agendaWeek : "일주일"
   	    	   }
            // 예제소스에 적힌 구글캘린더 API 키는 FullCalendar 예제에 있는 API키를 그대로 사용한 것이다.
			, select: function(start, end) {
			    $('#CalenderModalNew').modal('show');
			    dt_start = moment(start).format('YYYY-MM-DD');
			    dt_end = moment(end).format('YYYY-MM-DD');
			   }
            , eventSources : [// 대한민국의 공휴일
                {
                      googleCalendarId : "ko.south_korea#holiday@group.v.calendar.google.com"
                    , className : "koHolidays"
                    , color : "#110101"
                    , textColor : "#FFFFFF"
                }
            ], 
            events: function(start, end, timezone, callback) {
                $.ajax({
                    url: '/scheduleList',
                   	dataType: 'json',
                    success: function(data) {
                        var events = [];
                        	 $(data).each(function() {
                            events.push({
                            	title: $(this).attr('TITLE'),
                                start: $(this).attr('START_DATE'),
                                end: $(this).attr('END_DATE'),
                                color: '#C2185B'
                            });
                        }); 
                        callback(events);
                    }
                });
            },
            loading:function(bool) {
                jQuery("#loading").toggle(bool);
            }
        });
	</script>

	<script src="/static/js/custom.min.js"></script>
	
</body>
</html>


