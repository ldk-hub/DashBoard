<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%><!-- 커스텀태그 추가 -->
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>    

<!-- Toast Grid -->
<link rel="stylesheet" type="text/css" href="../static/vendors/tui-grid/tui-grid/dist/tui-grid.css" />
<link rel="stylesheet" type="text/css" href="../static/vendors/tui-grid/tui-pagination/dist/tui-pagination.css" />

    		<!-- 라인 그래프  -->
      		<div class="right_col" role="main">
      		  <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>바그래프 통계</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">Settings 1</a>
                          </li>
                          <li><a href="#">Settings 2</a>
                          </li>
                        </ul>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">

                    <div id="mainb" style="height:350px;"></div>

                  </div>
                </div>
              </div>
              
    		<!-- 그리드형 API S -->
    		  <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>그리드형 데이터 제어(데이터를 수정 및 커스터마이징 가능)</h2>
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
          		<!-- 토스트 UI 호출 -->
         		<div id="grid"></div>
              		<div class="clearfix"></div>
              		  <div class="modal-footer">
		          		   <button type="button" class="btn btn-warning antosubmit" id = "addRow">로우추가</button>
		                   <button type="button" class="btn btn-warning antosubmit" id = "deleteRow">로우삭제</button>
		                   <button type="button" class="btn btn-primary antosubmit" id = "updateGrid">수정</button>
		                   <button type="button" class="btn btn-primary antosubmit" id ="deleteGrid">삭제</button>
	                   </div>
                  </div>
                  
                </div>
              </div>
				<!-- 그리드형 API E-->
				   <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>테이블형 데이터 제어(그리드 타입은 데이터를 CRUD기반으로 조작 가능 )</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">Settings 1</a>
                          </li>
                          <li><a href="#">Settings 2</a>
                          </li>
                        </ul>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                  <table id="datatable-buttons" class="table table-striped table-bordered">
                      <thead>
                        <tr>
                          <th>자재번호</th>
                          <th>제품명</th>
                          <th>브랜드명</th>
                          <th>상세내용</th>
                          <th>기타</th>
                        </tr>
                      </thead>
	                     <tbody>
							<c:forEach items="${list}" var="resultList">
								<tr>
									<th scope="row">${resultList.ITEMNO }</th>
									<th scope="row">${resultList.ITEMNAME }</th>
									<th scope="row">${resultList.BRDNAME }</th>
									<th scope="row">${resultList.REASON }</th>
									<th scope="row">${resultList.STATUS }</th>
								</tr>
							</c:forEach>
						</tbody>
                    </table>
                  </div>
                </div>
              </div>
            <!-- 파일업로드API S -->
            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>파일 업로드 </h2>
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
                    <p>다중 업로드를 위해 여러 파일을 아래 상자에 끌어다 놓거나 파일을 선택하려면 클릭하십시오. 또는 상자를 클릭해서 업로드 해주세요. </p>
                    <form action="form_upload.html" class="dropzone"></form>
                    <br />
                    <br />
                    <br />
                    <br />
                  </div>
                </div>
              </div>
            </div>
            <!-- 파일업로드API E -->
          </div>
          
<!-- Toast Grid -->
<script src="../static/vendors/tui-grid/jquery/dist/jquery.js"></script>
<script src="../static/vendors/tui-grid/underscore/underscore.js"></script>
<script src="../static/vendors/tui-grid/backbone/backbone.js"></script>
<script src="../static/vendors/tui-grid/tui-code-snippet/dist/tui-code-snippet.js"></script>
<script src="../static/vendors/tui-grid/tui-pagination/dist/tui-pagination.js"></script>
<script src="../static/vendors/tui-grid/tui-date-picker/dist/tui-date-picker.js"></script>
<script src="../static/vendors/tui-grid/tui-grid/dist/tui-grid.js"></script>



<script type="text/javascript">
//자바스크립트 YYYY-MM-DD 오늘 날짜 구하기
var Now = new Date();
		var NowTime = Now.getFullYear();
		NowTime += '.' + (Now.getMonth()+1);
		NowTime += '.' + Now.getDate();
		//현재날짜 이전의 날짜는 선택못하도록 막
		//$('#myDatepicker2').data("DateTimePicker").minDate(NowTime);
		</script>
<!-- 그리드 제어 명령어 -->
<script type="text/javascript">
var grid1 = new tui.Grid({
    el: $('#grid'),
    bodyHeight: 350,
    virtualScrolling :true,
    rowHeaders:['checkbox','rowNum'],
    columns: [
        {
            title: '브랜드명',
            name: 'BRDNAME'
        },
        {
            title: '자재번호 ',
            name: 'ITEMNO'
        },
        {
            title: '제품명',
            name: 'ITEMNAME',
            editOptions: {
                type: 'text',
                maxLength: 10,
                useViewMode: true
            }
        },
        {
            title: '제품상세',
            name: 'REASON',
            editOptions: {
                type: 'text',
                maxLength: 10,
                useViewMode: true
            }
        },
      //grid에서 이미지 넣는방법
    	/* {
        		title : '온도트렌드',
        		name : 'file_name',
        		align: 'center',
        		width: 450,
        		 formatter : function(value, rowData) {
                     return "<img src='" + value + "' style='"width "' />";
                 }
        	}, */
        {
            title: '브랜드명',
            name: 'brdName',
            editOptions: {
                type: 'select',
                listItems: [
                    { text: 'Deluxe', value: '1' },
                    { text: 'EP', value: '2' },
                    { text: 'Single', value: '3' }
                ],
                useViewMode: true
            }
        }
    ]
});
		
		//그리드에서 지원하는 NET통신
		 grid1.use('Net',{
			perPage:500,
			readDataMethod: 'GET',
			api:{
				readData:'/selectBoardList',
				createdData : '/insertRows'
			}
		}); 
		 var net = grid1.getAddOn('Net');
		
		 
		// 후처리 로직 성공 실패 유무 
		grid1.on('response', function(data) {
			console.log("1",data);
		    
		});
		
		
		//동적 셀렉트박스 구성하기
		//1번셀렉트박스의 값을기반으로 조회하여 2번차수의 셀렉트박스에 결과 리스트를 호출하여 선택할수있게한다.
		$('#SearchStore').change(function(){
			$.ajax({
				type:'POST',
				url : '/storeDeviceInfo',
				data : {
					store_name : $('#SearchStore').val(),
					},
				dataType:"json",
				success:function(data){
					$.each(data, function(key, val) {
						//1번선택값에 의한 결과값을 2번셀렉트에 주입
						$('#storeDeviceInfo').append("<option value='"+val.device_nm+"'>"+val.device_nm+"</option>");
					});
				}
			});
		});


		//tui-grid 내에서 해당 셀클릭해서 팝업띄우는 액션을 호출하는 
		//해당미리보기 구현되면 팝업으로 상세보기 기능 예고
		/* 셀을 클릭할 때 팝업을 띄워주는 기능을 제공하고 있지는 않지만 제공되고 있는 
		focusChange이벤트를 이용해서 해당 rowKey와 columnName을 가져와서 팝업을 띄워주도록 
		하는 방식으로 개발이 될 수 있을 것 같습니다. */
		grid1.on('focusChange', (ev) => {
			  const{columnName, rowKey} = ev;
			  //클릭한셀의 정보 가져오기
			  //console.log(grid1.getRow(rowKey));
			  //img 의 src를 변경하는 방법
			  $("#img_form_url").attr("src", imgurl);
			  //팝업창띄우기 가장마지막에
			  $('#popupModalNew').modal('toggle');
			});
		
		
		
		//이미지 프론트와 백로직둘다 체크
		//파일업로드 확장자, 파일크기 제한 유효성 체크
		function getCmaFileView() {
			//파일정보
			if( $("#file_upload_field").val() != "" ){
				var ext = $('#file_upload_field').val().split('.').pop().toLowerCase();
				      if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
					 alert('gif,png,jpg,jpeg 파일만 업로드 할수 있습니다.');
					 $("#file_upload_field").val("");
					 return;
				      }
				}
			//이미지 파일 사이즈
			if(document.getElementById("file_upload_field").value!=""){
			    var fileSize = document.getElementById("file_upload_field").files[0].size;
			    var maxSize = 5 * 1024 * 1024;//5MB
			 	 
			    if(fileSize > maxSize){
			       alert("첨부파일 사이즈는 5MB 이내로 등록 가능합니다. ");
			        $("#file_upload_field").val("");
			        return;
			     }
			} 
		}
		//자바스크립트 내 guid생성 이미지와 데이터 키값 매핑용으로 유니크 값 사용
		function guid() {
			  function s4() {
			    return Math.floor((1 + Math.random()) * 0x10000)
			      .toString(16)
			      .substring(1);
			  }
			  return s4() + s4() + '-' + s4() + '-' + s4() + '-' +
			    s4() + '-' + s4() + s4() + s4();
			}
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

<!-- 그리드 툴 테마 설정 -->
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
			head : {
				background : '#262930',
				border : '#000000',
				text : '#c3f400'
			},
			rowHead : {
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
			selectedHead : {
				background : '#616161'
			},
			selectedRowHead : {
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

<!-- 그리드 삭제 이벤트 -->
 <script type="text/javascript">
	$("#deleteGrid").click(function() {
			 if(confirm("삭제 하시겠습니까?") == false) {
		         return false;
		     }
			if(grid1.getCheckedRowKeys(true) == "[]"){
				alert("체크박스를 선택하시오.");
				return false;
			}
				
			 
			 var test = grid1.getCheckedRows(true);
			 
			 $.ajax({
			        url:"/delGrid",
			        type:'POST',
			        data: {delParam:test},
			        dataType:'json',
			        success:function(data){
			        	if(data.code==1){
			        		 alert("삭제완료.");
			        	}else{
			        		
			        	}
			        },
			        error:function(data){
			        	alert("에러발생 관리자에게 문의하시오.");
			        }
			    });
		}); 
</script>
