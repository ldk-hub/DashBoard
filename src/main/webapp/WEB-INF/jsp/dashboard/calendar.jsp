<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!-- bootstrap-daterangepicker -->
    <link href="../static/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
	 <!-- bootstrap-datetimepicker -->
    <link href="../static/vendors/bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.css" rel="stylesheet">
  <!-- 캘린더 API S -->
  
	
        <div class="right_col" role="main" style="background-color:#5c5c5c38;">
        <div class="row">
		<div class="col-md-7 col-sm-7 col-xs-12" style="position: relative; z-index: 0;">
            <div class="clearfix"></div>
            <div class="row">
              <div class="col-md-12">
                <div class="x_panel" style="background-color:#2f2e2e;">
                  <div class="x_title">
                    <h2 style="color:#c3f400">업무 일정표 <small>해당날짜를 클릭해 일정을 등록해주세요.</small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">

                    <div id='calendar'></div>

                  </div>
                  </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        <!-- 캘린더 API E-->
        
       <!-- 캘린더 내부 모달 S -->
    <div id="CalenderModalNew"  class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content" style="background-color:#5c5c5c;">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h4 class="modal-title" id="myModalLabel">일정 등록</h4>
          </div>
          <div class="modal-body">
            <div id="testmodal" style="padding: 5px 20px;">
              <form id="antoform" class="form-horizontal calender" role="form">
                 <div class="form-group">
                  <label class="col-sm-3 control-label">날짜 선택</label>
                     <fieldset>
                        <div class="form-group">
                            <div class="input-prepend input-group">
                              <span class="add-on input-group-addon"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
                              <input type="text" style="width: 343px" name="reservation" id="reservation" class="form-control"  />
                            </div>
                        </div>
                     </fieldset>
					</div>
                <div class="form-group">
                  <label class="col-sm-3 control-label">제목</label>
                  <div class="col-sm-9">
                    <input type="text" class="form-control" id="title" name="title">
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-3 control-label">상세내역</label>
                  <div class="col-sm-9">
                    <textarea class="form-control" style="height:55px;" id="content" name="content"></textarea>
                  </div>
                </div>
              </form>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-success antosubmit" id="schedule">저장</button>
            <button type="button" class="btn btn-default antoclose" data-dismiss="modal" OnClick="modalClose()">닫기</button>
          </div>
        </div>
      </div>
    </div>

    <div id="fc_create" data-toggle="modal" data-target="#CalenderModalNew"></div>
    <div id="fc_edit" data-toggle="modal" data-target="#CalenderModalEdit"></div>
      <!-- 캘린더 내부 모달 E -->
    
    <script src="../static/vendors/moment/min/moment.min.js"></script>
    <!-- bootstrap-daterangepicker -->
	<script src="../static/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
	 <!-- bootstrap-datetimepicker -->    
	<script src="../static/vendors/bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
	<!-- FullCalendar -->
	<script src="../static/vendors/fullcalendar/dist/fullcalendar.min.js"></script>
	<script src="../static/vendors/fullcalendar/dist/gcal.js"></script>
	
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
                    , color : "#9c2626"
                    , textColor : "#FFFFFF"
                }
            ], 
           /*  events: function(start, end, timezone, callback) {
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
            }, */
            loading:function(bool) {
                jQuery("#loading").toggle(bool);
            }
        });
	</script>
	
	<!-- 모달  데이터 초기화 -->
	<script type="text/javascript">
		function modalClose(){
			$('#title').val('');
			$('#content').val('');
		}
	</script>
	<!-- 스케쥴 등록 -->
	<script type="text/javascript">
	$('#schedule').click(function(){
		if($('#title').val() == ""){
			alert("제목을 입력해주세요.");
			$('#title').focus();
			return false;
		}
		if($('#content').val() == ""){
			alert("내용을 입력해주세요.");
			$('#content').focus();
			return false;
		}
		
	
		var splt_date= $('#reservation').val().split('-');
			
			$.ajax({
		    	type:'POST',
				url : '/insertSchedule',
				data : {
					start_date : splt_date[0],
					end_date : splt_date[1],
					title: $('#title').val(), 
					content: $('#content').val()
					},
				dataType:"json",
				beforeSend : function(xhr)
              {   //데이터를 전송하기 전에 헤더에 csrf값을 설정한다
                  xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
              },
				success:function(data){
		alert(data);
		alert(data.result);
					if(data.result == 1){
						alert("등록되었습니다.");
					}
				},
				error:function(result){
					alert("에러발생");
				}
			});
		});
	</script>
	
	
	<!-- 스케쥴 삭제 -->
	<!-- <script type="text/javascript">
	$( document ).ready(function() {
		
		$('#demo').daterangepicker({
		   
		}, function(start, end) { start.format('YYYY-MM-DD') end.format('YYYY-MM-DD')
		});
		$('#reservation').on('apply.daterangepicker', function(ev, picker) {
			  picker.startDate.format('YYYY-MM-DD');
			  picker.endDate.format('YYYY-MM-DD');
			});
	});
	</script> -->
	
	
	
	
	
	
	