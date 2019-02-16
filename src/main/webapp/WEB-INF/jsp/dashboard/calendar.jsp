<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

  <!-- 캘린더 API S -->
        <div class="right_col" role="main">
            <div class="clearfix"></div>
            <div class="row">
              <div class="col-md-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>업무 일정표 <small>해당날짜를 클릭해 일정을 등록해주세요.</small></h2>
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
        <!-- 캘린더 API E-->
        
       <!-- 캘린더 내부 모달 S -->
    <div id="CalenderModalNew" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
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
            <button type="button" class="btn btn-primary antosubmit" id="schedule">저장</button>
            <button type="button" class="btn btn-default antoclose" data-dismiss="modal" OnClick="modalClose()">닫기</button>
          </div>
        </div>
      </div>
    </div>

    <div id="fc_create" data-toggle="modal" data-target="#CalenderModalNew"></div>
    <div id="fc_edit" data-toggle="modal" data-target="#CalenderModalEdit"></div>
      <!-- 캘린더 내부 모달 E -->
    
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
	<script type="text/javascript">
	$( document ).ready(function() {
		
		$('#demo').daterangepicker({
		   
		}, function(start, end) { start.format('YYYY-MM-DD') end.format('YYYY-MM-DD')
		});
		$('#reservation').on('apply.daterangepicker', function(ev, picker) {
			  picker.startDate.format('YYYY-MM-DD');
			  picker.endDate.format('YYYY-MM-DD');
			});
	});
	
	</script>
	
	
	
	