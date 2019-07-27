<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!-- toast grid link -->
<link rel="stylesheet" type="text/css"	href="../static/vendors/toast/tui-grid/dist/tui-grid.css" />
<link rel="stylesheet" type="text/css"	href="../static/vendors/sos_js/common/css/ad_solution.css" />
<link rel="stylesheet" type="text/css"	href="../static/vendors/bootstrap-timepicker/css/bootstrap-timepicker.min.css" />

<div class="right_col" role="main" style="background-color:#5c5c5c38;">
	<div class="row">
		<div class="col-md-12 col-sm-12 col-xs-12">
			<div class="x_panel">
				<div class="x_title">
					<h2>
						<strong>이벤트 관리</strong>
					</h2>
					<ul class="nav navbar-right panel_toolbox">
						<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
						<li><a class="close-link"><i class="fa fa-close"></i></a></li>
					</ul>
					<div class="clearfix"></div>
				</div>
				<div class="profile_title" style="background-color:#444853;">
				<div class="col-md-7">
				</div>
				<div class="col-md-3">
					<span class="spanBTitle" style="color:white;"><img src="../static/images/ico_double_circle.png">&nbsp;조회 기간 :</span>
					<div class='input-group date pull-right' id='myDatepicker2' style="width: 40%; float:right; ">
						<input id="pickDate" type='text' class="_required" /> 
						<span class="input-group-addon"> <span class="glyphicon glyphicon-calendar"></span></span>  
					</div>
					<div class='input-group date pull-right' id='myDatepicker9' style="width: 40%; float:left;">
						<input id="pickDate1" type='text' class="_required" /> 
						<span class="input-group-addon"> <span class="glyphicon glyphicon-calendar"></span></span>  <span style="padding:0px 6px; color:white;">~</span> 
					</div> 
				</div>
					<div class="col-md-2">
						<select id="eventCode" name="eventCode" class="_required pull-right"	style="width: 60%;">
								<option value=""> - 전체 - </option>
								<option value="1">발생</option>
								<option value="2">확인중</option>
								<option value="3">종료</option>
							</select>
					</div>
						
					<button type="button" class="btn btn-default btn-sm"  id="eventListSearch">조회</button>
					<!-- <button type="button" class="btn btn-default btn-sm" id="">종료</button> -->
				</div>
				<div class="x_content">
					<div id="fireSearch"></div>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">
					<div class = "row marginB5" style="width:100%">
						<div class="fl marginT8" style="width:30%;">
	                        <h2 class="spanBTitle"><img src="../static/images/ico_double_circle.png">&nbsp;<strong>이벤트 처리등록</strong></h2>
	                    </div>
	                </div>
                        <div class="row table_form03 marginB10">
                            <table>
                                <colgroup>
                                 	    <col style="width: 10%;" />
										<col style="width: 23%;" />
										<col style="width: 10%;" />
										<col style="width: 23%;" />
										<col style="width: 10%;" />
										<col style="width: 23%;" />
                                </colgroup>
                                <tbody>
                                   <tr>
										<th class="ellipsis">건물명</th>
										<td style="background:#e9edef;" ><span id="build_name"></span></td>
										<th class="ellipsis">이벤트명</th>
										<td><span id="event_content"></span></td>
										<th class="ellipsis">발생일시</th>
										<td><span id="issue_date"></span></td>
										
                                    </tr>
                                    <tr>
                                  		<th class="ellipsis">확인자<span style="color:red;font-size:13px;">&nbsp;*</span></th>
										<td><input id="issue_check" name="issue_check" type="text" class="_required" maxlength="20" style="width:50%;" /></td>
										<th class="ellipsis">상태<span style="color:red;font-size:13px;">&nbsp;*</span></th>
										<td colspan="1">
											<select id="eventCode" name="eventCode" class="_required"	style="width: 50%;">
												<option value=""> - 선택 - </option>
												<option value="1">발생</option>
												<option value="2">확인중</option>
												<option value="3">종료</option>
											</select>
										</td>
										<th class="ellipsis">복구일시</th>
										<td><span id="restore_date"></span></td>
                                    </tr>
                                     <tr>
                                        <th class="ellipsis">종료처리자<span style="color:red;font-size:13px;">&nbsp;*</span></th>
										<td><input id="end_check" name="end_check" type="text" class="_required" maxlength="20" style="width:50%;" /></td>
										<th class="ellipsis">발생원인<span style="color:red;font-size:13px;">&nbsp;*</span></th>
										<td colspan="1">
											<select id="causeCode" name="causeCode" class="_required"	style="width: 50%;">
												<option value=""> - 선택 - </option>
												<option value="설비이상">설비이상</option>
												<option value="오동작">오동작</option>
												<option value="점검">점검</option>
												<option value="기타">기타</option>
											</select>
										</td>
										<th class="ellipsis">확인일시</th>
										<td><span id="chk_date"></span></td>
									
                                    </tr>
                                     <tr>
										 <th class="ellipsis">처리내용<span style="color:red;font-size:13px;">&nbsp;*</span></th>
										<td><input id="end_detail" name="end_detail" type="text" class="_required" maxlength="3" style="width:100%;"/></td>
                                    </tr>
                                </tbody>
                             </table>
						 </div>
						 	<div class="modal-footer">
						 		<button type="button" id="issueChkBtn" class="btn btn-dark">저장</button>
					 		</div>
			</div>
		</div>
	</div>
</div>
</div>
<!-- toast 연계 -->
<script src="../static/vendors/toast/jquery/dist/jquery.js"></script>
<script src="../static/vendors/toast/underscore/underscore.js"></script>
<script src="../static/vendors/toast/backbone/backbone.js"></script>
<!-- toast API -->
<script	src="../static/vendors/toast/tui-code-snippet/dist/tui-code-snippet.js"></script>
<script	src="../static/vendors/toast/tui-date-picker/dist/tui-date-picker.js"></script>
<script src="../static/vendors/toast/tui-grid/dist/tui-grid.js"></script>
<script	src="../static/vendors/toast/tui-pagination/dist/tui-pagination.js"></script>
<script	src="../static/vendors/toast/tui-time-picker/dist/tui-time-picker.js"></script>
<!-- date-timepicker -->
<script type="text/javascript"	src="../static/vendors/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>

<script type="text/javascript">
var Now = new Date();
var NowTime = Now.getFullYear();
NowTime += '.' + (Now.getMonth()+1);
NowTime += '.' + Now.getDate();

$('#pickDate').val(NowTime);
$('#pickDate1').val(NowTime);
</script>

<!-- 데이타 테이블 -->
<script type="text/javascript"> 
	function dataTables() { 
	var myTable= echarts.init(document.getElementById("datatable-buttons"));
		myTable.setOption;
	
	$('#datatable-buttons').DataTable({
			"responsive" : false
		}); 
	}
</script>

<!-- 조회 -->
<script type="text/javascript">
$(document).on("click","#eventListSearch",function(){
	//1. 날짜 정보 
	alert($('#pickDate1').val()); //이게앞
	alert($('#pickDate').val());  //이게뒤에
	//2. select 박스정보
	alert($('#eventCode').val()); //들어옴 조건걸면됨
	
	$.ajax({
		type:'POST',
		url : '/fireEventList',
		dataType:"json",
		success : function(result){
			grid1.setData(result.data);
		},
		error: function(data){
	        alert('error 관리자에게문의하시오.');
	    }
	});
});
</script>

<script type="text/javascript">
$(document).on("click","#issueChkBtn",function(){
	/* if($('#buildNm').val() == ''){
		alert($('#buildNm').val());
	}else{
		alert('테스트완료');
	} */
	
	alert($('#build_name').val()); //
	alert($('#evente_content').val());//
	alert($('#issue_date').val());//
	alert($('#issue_check').val());//
	alert($('#eventCode').val());
	alert($('#restore_date').val());
	alert($('#end_check').val());
	alert($('#causeCode').val());
	alert($('#chk_date').val());
	alert($('#end_detail').val());
	
});
</script>

<script type="text/javascript">
var grid1 = new tui.Grid({
    el: $('#fireSearch'), 
    scrollX: true,
    bodyHeight: 500,
    rowHeaders: ['checkbox','rowNum'],
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
    		title : '센터명',
    		name : 'center_nm',
    		hidden : true
    		
    	},
    	{
    		title : '고객사',
    		name : 'client'
    	},
    	{
    		title : '건물명',
    		name : 'build_nm'
    	},
    	{
    		title : '이벤트',
    		name : 'evt_content'
    	},
    	{
    		title : '발생일시',
    		name : 'occur_dt'
    	},
    	{
    		title : '확인일시',
    		name : 'chk_dt'
    	},
    	{
    		title : '복구일시',
    		name : 'restore_dt'
    	}
    ]
});
</script>

<script type="text/javascript">
tui.Grid.applyTheme("default", {
	  grid: {
      background: '#fff',
      border: '#ccc',
      text: '#444'
  },
  selection: {
      background: '#585858',
      border: '#004082'
  },
  toolbar: {
      border: '#ccc',
      background: '#262930'
  },
  scrollbar: {
      background: '#262930',
      thumb: '#f5f5f5',
      emptySpace: '#262930',
      active: '#c1c1c1'
  },
	  cell: {
      normal: {
          background: '#fbfbfb',
          border: '#262930'
      },
      head: {
          background: '#262930',
          border: '#999',
          text:'#E7E7E7'
      },
      rowHead: {
          background: '#262930',
          border: '#eee',
          text: '#fff',
      },
      summary: {
          background: '#262930',
          border: '#eee',
          text: '#fff',
      },
      editable: {
          background: '#fbfbfb'
      },
      selectedHead: {
          background: '#616161'
      },
      selectedRowHead: {
          background: '#616161'
      },
      focused: {
          border: '#C94948'
      },
      disabled: {
          text: '#b0b0b0'
      },
      currentRow: {
          background: '#F5DA81'
      }
  }
});
</script>
