<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!-- <style type="text/css">	
::-webkit-scrollbar{Display:none;}	
</style>	 -->
<link rel="stylesheet" type="text/css" href="../static/vendors/toast/tui-grid/dist/tui-grid.css" />
<link rel="stylesheet" type="text/css" href="../static/vendors/toast/tui-pagination/dist/tui-pagination.css" />
 
<div class="right_col" role="main" style="background-color:#5c5c5c38;">


<div style="-ms-overflow-style:none;">	
</div>	

	<div class="row">
		<div class="col-md-12 col-sm-12 col-xs-12">
			<div class="x_panel"  style="background-color:#2f2e2e; border-color:#000000;">
				<div class="x_title" style="border-bottom-color:#c5c0c06e;">
					<h2 style="font-size: 2.0em; color:#efae17;">
						<strong>실시간감지</strong>
					</h2>
					<ul class="nav navbar-right panel_toolbox">
						<li><h2 id="clock1" style="width:100%; font-size: 1.4em; font-weight:800; color:#efae17;"></h2> </li>
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
				             <h2 style="color:#c3f400; text-align:center;"><i class="fa fa-warning"></i><strong> 미처리 </strong></h2>
				              <div class="count" style="color:#FE2E64; text-align:center;"><span style="font-size: 1.9em;" id="issue">15</span></div>
				            </div>
				            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
				              <h2 style="color:#c3f400; text-align:center;"><i class="fa fa-cogs"></i><strong> 작업중 </strong></h2>
				              <div class="count" style="color:yellow; text-align:center;"><span style="font-size: 1.9em;" id="issueChk">23</span></div>
				            </div>
				            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
				              <h2 style="color:#c3f400; text-align:center;"><i class="fa fa-thumbs-o-up"></i><strong> 복구완료 </strong></h2>
				              <div class="count" style="color:#45d888; text-align:center;"><span style="font-size: 1.9em;" id="issueEnd">3</span></div>
				            </div>
				            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
				              <h2 style="color:#c3f400; text-align:center;"><i class="fa fa-thumbs-o-up"></i><strong> 종료 </strong></h2>
				              <div class="count" style="color:#8585ff; text-align:center;"><span style="font-size: 1.9em;" id="issueEnd">3</span></div>
				            </div>
				            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
				             <h4  style="color:white;"> 처리율 : <span style="font-size: 1.1em; color:#1ABB9C;" id="issuePer">23%</span></h4>
				              <h4 style="color:white;"> 미처리 : <span style="font-size: 1.1em; color:#1ABB9C;" id="issueUnsolve">44건</span> </h4>
				               <h4 style="color:white;"> 평균시간 : <span style="font-size: 1.1em; color:#1ABB9C;" id="issueAvgTime">32분</span></h4>
				            </div>
				          </div>
						</div>
					</div>
					
					<div class="profile_title" style="background-color:#444853;">
						<div class="col-md-10">
							<span class="label label-danger" style="font-size:110%;"><i class="fa fa-phone"></i> Call Count:</span> <span id="todaybuildCnt"class="label label-danger" style="font-size:110%;"> / 50</span>
						</div>
						<div class="col-md-2">
							<select id="eventCode" name="eventCode" class="_required pull-right" style="width: 70%; color:#363636">
								<option value=""> -  전체  - </option>
								<option value="1">재난발생</option>
								<option value="2">대응중</option>
								<option value="3">상황종료</option>
							</select>
						</div>
					</div>
						<div id="monitering" style="font-weight:700;"></div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>




<!-- 모달 페이지 -->
<div id="popupModalNew" class="modal fade" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
	<div class="modal-dialog" style="width:80%;">
		<div class="modal-content" style="background-color:#2f2e2e;">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true" style=" color:#fff;">×</button>
				<h4 style=" color:#c3f400; font-size: 2. 0em;" class="modal-title" id="myModalLabel">
					<strong>사고현장 정보</strong>
				</h4>
			</div>
			<div class="modal-body">
					<img id="img_form_url" src="" style="width:100%; height:450px;"/>
				<div class="clearfix"></div>
					 <div class="table-responsive">	
					<table class="table table-striped jambo_table bulk_action">	
						<thead style="background-color:#262930;">	
							<tr  class="headings">	
								<th align="center" class="column-title" style="font-size: 1.6em; text-align:center;">빌딩</th>	
								<th align="center" class="column-title" style="font-size: 1.6em; text-align:center;">이벤트</th>	
								<th align="center" class="column-title" style="font-size: 1.6em; text-align:center;">발생일시</th>	
							</tr>	
						</thead>	
						<tbody>	
							<c:forEach items="${list}" var="resultList">	
								<tr class="even pointer">	
									<td style="font-size: 1.5em;" align="center" scope="row">${resultList.build_nm }</td>	
									<td style="font-size: 1.5em;" align="center" scope="row">${resultList.result_data }</td>	
									<td style="font-size: 1.5em;" align="center" scope="row">${resultList.last_issue_dt }</td>	
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
<script	src="../static/vendors/toast/tui-code-snippet/dist/tui-code-snippet.js"></script>
<script	src="../static/vendors/toast/tui-date-picker/dist/tui-date-picker.js"></script>
<script src="../static/vendors/toast/tui-grid/dist/tui-grid.js"></script>
<script	src="../static/vendors/toast/tui-pagination/dist/tui-pagination.js"></script>
<script	src="../static/vendors/toast/tui-time-picker/dist/tui-time-picker.js"></script>

<!-- date-timepicker -->
<!-- <script type="text/javascript"
	src="../static/vendors/bootstrap-timepicker/js/bootstrap-timepicker.js"></script> -->

<script type="text/javascript">
var grid1 = new tui.Grid({
    el: document.getElementById('monitering'),
    data: {
        api: {
          readData: { url: '/DashboardList', method: 'POST' }
        }
      },    
    scrollX: true,
    bodyHeight: 500,
    rowHeaders: ['checkbox','rowNum'],
    rowHeight: 70,
    virtualScrolling: true,
     columnOptions: {
        width: 100
    }, 
    columns: [
    	{
    		header : '상태',
    		name : 'status_info',
   			align: 'center',
   			whiteSpace: 'pre-line'
    	},
    	{
    		header : '고객명',
    		name : 'person_info' ,
   			align: 'center',
   			whiteSpace: 'pre-line'   		
    	},
    	{
    		header : '피해액',
    		name : 'damage',
   			align: 'center',
   			whiteSpace: 'pre-line'
    	},
    	{
    		header : '발생위치',
    		name : 'addr_info',
   			align: 'center',
   			whiteSpace: 'pre-line'
    	},
    	{
    		header : '상세내용',
    		name : 'file_name',
   			align: 'center',
   			whiteSpace: 'pre-line',
   		 	formatter : function(value, rowData) {
             return "<img src='" + value +"'width='370px;'height='120px;'/>";
         }
    	},
    	{
    		header : '상황발생일',
    		name : 'occur_dt',
   			align: 'center',
   			whiteSpace: 'pre-line'
    	},
    	{
    		header : '작업일',
    		name : 'chk_dt',
   			align: 'center',
   			whiteSpace: 'pre-line'
    	},
    	{
    		header : '상황종료일',
    		name : 'restore_dt',
   			align: 'center',
   			whiteSpace: 'pre-line'
    	}
    ]
});

//이미지 확대 모달 띄우기 프로세스
//tui-grid 내에서 해당 셀클릭해서 팝업띄우는 액션을 호출하는 
//해당미리보기 구현되면 팝업으로 상세보기 기능 예고
/* 셀을 클릭할 때 팝업을 띄워주는 기능을 제공하고 있지는 않지만 제공되고 있는 
focusChange이벤트를 이용해서 해당 rowKey와 columnName을 가져와서 팝업을 띄워주도록 
하는 방식으로 개발이 될 수 있을 것 같습니다. nhn직접질의 해결 */
grid1.on('focusChange', (ev) => {
	  const{columnName, rowKey} = ev; //클릭한 셀의 정보호출
	  var rowData   = grid1.getRow(rowKey);
	  if(columnName =="file_name"){
		  $("#img_form_url").attr("src", rowData.file_name);//이미지 src경로 변경
		  $('#popupModalNew').modal('toggle');
	  }
	});
</script>

<script type="text/javascript">
	$(document).ready(function(){
		//EventCount();
		//PushEventList();
		DashboardList();
	});
</script>

<script type="text/javascript">
//이벤트 카운트는 하드코딩으로 변경 실제 테이블 규격정보라던지 상황에따라 변경될 소지
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
	
	//자바스크립트 내 guid생성
	function guid() {
		  function s4() {
		    return Math.floor((1 + Math.random()) * 0x10000)
		      .toString(16)
		      .substring(1);
		  }
		  return s4() + s4() + '-' + s4() + '-' + s4() + '-' +
		    s4() + '-' + s4() + s4() + s4();
		}
	
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


	function DashboardList() {
		$.ajax({
				type:'POST',
				url : '/DashboardList',
				dataType:"json",
				success : function(result){
					grid1.setData(result.data);
				},
				error: function(data){
				      alert('error 관리자에게문의하시오.');
			    }
			});
		} 

	//파일 업로드 시 해당되는 확장자만 저장
	 function getCmaFileView() {
		if( $("#file_upload_field").val() != "" ){
			var ext = $('#file_upload_field').val().split('.').pop().toLowerCase();
			      if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
			    	  
			    	  Swal.fire({
		     			  type: 'error',
		     			  title: 'gif,png,jpg,jpeg 파일만 업로드 할수 있습니다.',
		     			})
				 $("#file_upload_field").val("");
				 return;
			      }
			}
		//파일용량 체크 프로세스
		if(document.getElementById("file_upload_field").value!=""){
		    var fileSize = document.getElementById("file_upload_field").files[0].size;
		    var maxSize = 5 * 1024 * 1024; //5mb로 제한 업로드
		 	 
		    if(fileSize > maxSize){
		    	  Swal.fire({
	     			  type: 'error',
	     			  title: '첨부파일 사이즈는 5MB 이내로 등록 가능합니다.',
	     			})
		        $("#file_upload_field").val("");
		        return;
		     }
		} 
	} 
</script>


<script type="text/javascript">
tui.Grid.applyTheme("default", {
	grid : {
		background : '#3a3a3a',
		border : '#000000',
		text : '#444'
	},
	selection : {
		background : '#A4A4A4',
		border : '#004082'
	},
	toolbar : {
		border : '#000000',
		background : '#262930'
	},
	scrollbar : {
		background : '#262930',
		thumb : '#fff',
		emptySpace : '#262930',
		active : '#c1c1c1'
	},
	cell : {
		normal : {
			background : '#3a3a3a',
			border : '#000000',
			text : '#fff'
		},
		header : {
			background : '#262930',
			border : '#000000',
			text : '#c3f400'
		},
		rowHeader : {
			background : '#262930',
			border : '#000000',
			text : '#fff'
		},
		summary : {
			background : '#262930',
			border : '#000000',
			text : '#fff'
		},
		editable : {
			background : '#3a3a3a',
			border : '#fff',
			text : '#fff'
		},
		selectedHeader : {
			background : '#616161'
		},
		selectedRowHeader : {
			background : '#616161'
		},
		focused : {
			border : '#FFBF00'
		},
		disabled : {
			background : '#3a3a3a',
			border : '#000000',
			text : '#fff'
		},
		currentRow : {
			background : '#0B243B'
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

