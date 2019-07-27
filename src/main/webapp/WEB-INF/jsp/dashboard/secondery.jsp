<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<link rel="stylesheet" type="text/css" href="../static/vendors/tui-grid/tui-grid/dist/tui-grid.css" />
<link rel="stylesheet" type="text/css" href="../static/vendors/tui-grid/tui-pagination/dist/tui-pagination.css" />
 
<div class="right_col" role="main" style="background-color:#5c5c5c38;">

	<div class="row">
		<div class="col-md-12 col-sm-12 col-xs-12">
			<div class="x_panel"  style="background-color:#2f2e2e; border-color:#000000;">
				<div class="x_title" style="border-bottom-color:#c5c0c06e;">
					<h2 style="font-size: 2.0em; color:#efae17;">
						<strong>재난대응 실시간 모니터링</strong>
					</h2>
					<ul class="nav navbar-right panel_toolbox">
						<li><h2 id="clock1" style="font-size: 1.5em; font-weight:800; color:#efae17;"></h2> </li>
					</ul>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">
					<!-- 여기가 상단 -->
					 <div class="bs-example" data-example-id="simple-jumbotron">
                    <div class="jumbotron" style="background-color:#262930;" >
					 <div class="row tile_count" >
				            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
				             <h2 style="color:#c3f400; text-align:center;"><i class="fa fa-bullhorn"></i><strong> Today Total </strong></h2>
				              <div class="count" style="color:white; text-align:center;"><span style="font-size: 1.9em;" id="todayTotal">55</span></div>
				            </div>
				            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
				             <h2 style="color:#c3f400; text-align:center;"><i class="fa fa-warning"></i><strong> 미확인 </strong></h2>
				              <div class="count" style="color:#FE2E64; text-align:center;"><span style="font-size: 1.9em;" id="issue">15</span></div>
				            </div>
				            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
				              <h2 style="color:#c3f400; text-align:center;"><i class="fa fa-cogs"></i><strong> 확인중 </strong></h2>
				              <div class="count" style="color:yellow; text-align:center;"><span style="font-size: 1.9em;" id="issueChk">23</span></div>
				            </div>
				            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
				              <h2 style="color:#c3f400; text-align:center;"><i class="fa fa-thumbs-o-up"></i><strong> 종료 </strong></h2>
				              <div class="count" style="color:#8585ff; text-align:center;"><span style="font-size: 1.9em;" id="issueEnd">3</span></div>
				              <!-- <span class="count_bottom"><i class="green">% </i></span> -->
				            </div>
				            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
				             <h4  style="color:white;"> 처리율 : <span style="font-size: 1.1em; color:#1ABB9C;" id="issuePer">23 %</span></h4>
				              <h4 style="color:white;"> 미처리 : <span style="font-size: 1.1em; color:#1ABB9C;" id="issueUnsolve">44건</span> </h4>
				               <h4 style="color:white;"> 평균처리시간 : <span style="font-size: 1.1em; color:#1ABB9C;" id="issueAvgTime"> 32분</span></h4>
				            </div>
				            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
				              <a class="btn btn-app" id="fire_alert" data-toggle="modal" style="font-size: 10pt; margin: 5px 5px 5px; height:80px;" data-target="#CalenderModalNew"><span  style="font-size: 16pt" class="badge bg-red" id="fire_alert_cnt"></span><i style="font-size: 20pt" class="fa fa-bell-o"></i>상세목록</a>
				            </div>
				          </div>
						</div>
					</div>
					
					<div class="profile_title" style="background-color:#444853;">
						<div class="col-md-10">
							<span class="label label-danger" style="font-size:110%;"><i class="fa fa-building"></i>  Today Event Count:</span> <span id="todaybuildCnt"class="label label-danger" style="font-size:110%;"> / 5000</span>
						</div>
						<div class="col-md-2">
							<select id="eventCode" name="eventCode" class="_required pull-right" style="width: 70%;">
								<option value=""> -  전체  - </option>
								<option value="1">재난발생</option>
								<option value="2">대응중</option>
								<option value="3">상황종료</option>
							</select>
						</div>
					</div>
						<div id="fireSearch"></div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>

<!-- 모달 페이지  -->
<div id="CalenderModalNew" class="modal fade" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h4 class="modal-title" id="myModalLabel">
					<strong>경보 발생 목록</strong>
				</h4>
			</div>
			<div class="modal-body">
				<div class="clearfix"></div>
				<div class="table-responsive">
					<table class="table table-striped jambo_table bulk_action">
						<thead style="background-color:#262930;">
							<tr  class="headings">
								<th align="center" class="column-title" style="text-align:center;">발생시각</th>
								<th align="center" class="column-title" style="text-align:center;">대응방안</th>
								<th align="center" class="column-title" style="text-align:center;">구조인원</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="resultList">
								<tr class="even pointer">
									<td align="center" scope="row">${resultList.msg_title }</td>
									<td align="center" scope="row">${resultList.sms_send_chk }</td>
									<td align="center" scope="row">${resultList.send_time }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>

			<div class="modal-footer">
				<button type="button" class="btn btn-default antoclose"	data-dismiss="modal" id="m_close">닫기</button>
			</div>
		</div>
	</div>
</div>

<!-- Toast Grid -->
<script src="../static/vendors/tui-grid/jquery/dist/jquery.js"></script>
<script src="../static/vendors/tui-grid/underscore/underscore.js"></script>
<script src="../static/vendors/tui-grid/backbone/backbone.js"></script>
<script src="../static/vendors/tui-grid/tui-code-snippet/dist/tui-code-snippet.js"></script>
<script src="../static/vendors/tui-grid/tui-pagination/dist/tui-pagination.js"></script>
<script src="../static/vendors/tui-grid/tui-date-picker/dist/tui-date-picker.js"></script>
<script src="../static/vendors/tui-grid/tui-grid/dist/tui-grid.js"></script>
<!-- toast 연계 -->
<!-- <script src="../static/vendors/toast/jquery/dist/jquery.js"></script>
<script src="../static/vendors/toast/underscore/underscore.js"></script>
<script src="../static/vendors/toast/backbone/backbone.js"></script>
toast API
<script	src="../static/vendors/toast/tui-code-snippet/dist/tui-code-snippet.js"></script>
<script	src="../static/vendors/toast/tui-date-picker/dist/tui-date-picker.js"></script>
<script src="../static/vendors/toast/tui-grid/dist/tui-grid.js"></script>
<script	src="../static/vendors/toast/tui-pagination/dist/tui-pagination.js"></script>
<script	src="../static/vendors/toast/tui-time-picker/dist/tui-time-picker.js"></script> -->
<!-- date-timepicker -->
<!-- <script type="text/javascript"
	src="../static/vendors/bootstrap-timepicker/js/bootstrap-timepicker.js"></script> -->



<script type="text/javascript">
	$(document).ready(function(){
		//EventCount();
		//PushEventList();
		//fireDashboardList();
	});
</script>

<!-- 문자 전송 -->
<script type="text/javascript">

/* function EventCount() {
	$.ajax({
			type:'POST',
			url : '/fireEventCnt',
			dataType:"json",
			success : function(data){
				$("#valueTest").text(data);
			},
			error: function(data){
			      alert('error 관리자에게문의하시오.');
		    }
		});
	} */
	
/* function fireDashboardList() {
	$.ajax({
			type:'POST',
			url : '/fireDashboardList',
			dataType:"json",
			success : function(result){
				grid1.setData(result.data);
			},
			error: function(data){
			      alert('error 관리자에게문의하시오.');
		    }
		});
	} */
	
/* function PushEventList() {
	$.ajax({
			type:'POST',
			url : '/PushEventList',
			dataType:"json",
			success : function(data){
				$("#valueTest").text(data);
			},
			error: function(data){
			      alert('error 관리자에게문의하시오.');
		    }
		});
	} */
</script>


<script type="text/javascript">
var grid1 = new tui.Grid({
    el: $('#fireSearch'), 
    scrollX: true,
    bodyHeight: 500,
    rowHeaders: ['rowNum'],
    rowHeight: 30,
    columnOptions: {
        width: 100
    },
    columns: [
    	{
    		title : '상태',
    		name : 'status'
    	},
    	{
    		title : '고객명',
    		name : 'center_nm',
    		hidden : true
    		
    	},
    	{
    		title : '피해액',
    		name : 'client'
    	},
    	{
    		title : '주소',
    		name : 'build_nm'
    	},
    	{
    		title : '상세내용',
    		name : 'evt_content'
    	},
    	{
    		title : '발생시각',
    		name : 'occur_dt'
    	},
    	{
    		title : '대응시각',
    		name : 'chk_dt'
    	},
    	{
    		title : '복구시각',
    		name : 'restore_dt'
    	}
    ]
});
</script>

<script type="text/javascript">
tui.Grid.applyTheme("default", {
	 grid: {
	  	   background: '#3a3a3a',
	  	   border: '#000000',
	  	   text: '#444'
	  		  },
	  		  selection: {
	  		      background: '#585858',
	  		      border: '#004082'
	  		  },
	  		  toolbar: {
	  		      border: '#000000',
	  		      background: '#262930'
	  		  },
	  		  scrollbar: {
	  		      background: '#262930',
	  		      thumb: '#000000',
	  		      emptySpace: '#262930',
	  		      active: '#c1c1c1'
	  		  },
	  		  cell: {
	  	   normal: {
	  	       background: '#3a3a3a',
	  	       border: '#000000',
	  	       text: '#fff'
	  	   },
	  	   head: {
	  	       background: '#262930',
	  	       border: '#000000',
	  	       text:'#bfbfbf'
	  	   },
	  	   rowHead: {
	  	       background: '#262930',
	  	       border: '#000000',
	  	       text: '#fff'
	  	   },
	  	   summary: {
	  	       background: '#262930',
	  	       border: '#000000',
	  	       text: '#fff'
	  	   },
	  	   editable: {
	  	       background: '#3a3a3a',
	  	       border: '#fff',
	  	       text: '#fff'
	  	   },
	  	   selectedHead: {
	  	       background: '#616161'
	  	   },
	  	   selectedRowHead: {
	  	       background: '#616161'
	  	   },
	  	   focused: {
	  	       border: '#FFBF00'
	  	   },
	  	   disabled: {
	  	      background: '#3a3a3a',
	  	      border: '#000000',
	  	      text: '#fff'
	  	   },
	  	   currentRow: {
	  	       background: '#2F0B3A'
	  	   }
	  	  }
});
</script>

 <script>
//1초마다 함수 갱신
	function realtimeClock() {
	  document.timeForm.timeInput.value = getTimeStamp();
	  setTimeout("realtimeClock()", 1000);
	}
	 
	 
	function getTimeStamp() { // 24시간제
	  var date = new Date();
	 
	  var f_date =
	    //년-월-일  시:분:초
	    leadingZeros(date.getFullYear(), 4) + '-' +
	    leadingZeros(date.getMonth() + 1, 2) + '-' +
	    leadingZeros(date.getDate(), 2) + ' ' +
	    leadingZeros(date.getHours(), 2) + ':' +
	    leadingZeros(date.getMinutes(), 2) + ':' +
	    leadingZeros(date.getSeconds(), 2);
	 
	  return f_date;
	}
	 
	//숫자 두자리 ex) 1이면 01 앞에 0을 붙임
	function leadingZeros(date, digits) {
	  var zero = '';
	  date = date.toString();
	 
	  if (date.length < digits) {
	    for (i = 0; i < digits - date.length; i++)
	      zero += '0';
	  }
	  return zero + date;
	}

 
 
        setInterval(function(){
        	 var date = new Date();
        		    //년-월-일  시:분:초
        		  var y =  leadingZeros(date.getFullYear(), 4);
        		  var mm =  leadingZeros(date.getMonth() + 1, 2); 
        		  var d =  leadingZeros(date.getDate(), 2);
        		  var h =  leadingZeros(date.getHours(), 2);
        		  var m =  leadingZeros(date.getMinutes(), 2);
        		  var s =  leadingZeros(date.getSeconds(), 2);
        		    
           /*  var timer = new Date();
            var h = timer.getHours();
            var m = timer.getMinutes();
            var s = timer.getSeconds(); */
            document.getElementById('clock1').innerHTML = y+ '-' + mm + '-' + d  + ' ' + h + ':' + m + ':' + s;
        },1000);
    </script>




	<!-- 데이타 테이블 -->
	<!-- <script type="text/javascript"> 
		function dataTables() { 
		var myTable= echarts.init(document.getElementById("datatable-buttons"));
			myTable.setOption;
		
		$('#datatable-buttons').DataTable({
				"responsive" : false
			}); 
		}
		</script>
 -->

