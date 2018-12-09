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
                  </div>
                   <button type="button" class="btn btn-warning antosubmit" id = "addRow">로우추가</button>
                   <button type="button" class="btn btn-warning antosubmit" id = "deleteRow">로우삭제</button>
                   <button type="button" class="btn btn-primary antosubmit" id = "updateGrid">수정</button>
                   <button type="button" class="btn btn-primary antosubmit" id ="deleteGrid">삭제</button>
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


<!-- 그리드 제어 명령어 -->
<script type="text/javascript">
var grid = new tui.Grid({
    el: $('#grid'),
    bodyHeight: 350,
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
                useViewMode: false
            }
        },
        {
            title: '제품상세',
            name: 'REASON',
            editOptions: {
                type: 'text',
                maxLength: 10,
                useViewMode: false
            }
        },
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
		 grid.use('Net',{
			perPage:500,
			readDataMethod: 'GET',
			api:{
				readData:'/selectBoardList',
				createdData : '/insertRows'
			}
		}); 
		 var net = grid.getAddOn('Net');
		
		 
		// 후처리 로직 성공 실패 유무 
		grid.on('response', function(data) {
			console.log("1",data);
		    
		});
		
		
		
		
		//ajax 데이터 통신 
		 /* $.ajax({
		    	type:'POST',
				url : '/selectBoardList',
				data : {
					build_code: buildCode, 
					search_date: pickDate
					},
				dataType:"json",
				beforeSend : function(xhr)
              {   //데이터를 전송하기 전에 헤더에 csrf값을 설정한다
                  xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
              },
				success:function(result){
					grid.setData(result.data);
				},
				error:function(result){
					alert("에러발생");
				}
			});	 */

</script>

  	<!-- 데이타 테이블 -->
		<script type="text/javascript"> 
		function dataTables() { 
		var myTable= echarts.init(document.getElementById("datatable-buttons"));
			
			myTable.setOption
		
		$('#datatable-buttons').DataTable({
				"responsive" : false
			}); 
		</script>

<!-- 그리드 툴 테마 설정 -->
   <script type="text/javascript">
tui.Grid.applyTheme("default", {
	  grid: {
    background: '#fff',
    border: '#ccc',
    text: '#444'
	},
	selection: {
	    background: '#4daaf9',
	    border: '#004082'
	},
	toolbar: {
	    border: '#ccc',
	    background: '#fff'
	},
	scrollbar: {
	    background: '#f5f5f5',
	    thumb: '#2c2c2c',
	    active: '#c1c1c1'
	},
		  cell: {
	    normal: {
	        background: '#fbfbfb',
	        border: '#e0e0e0'
	    },
	    head: {
	        background: '#2c2c2c',
	        border: '#999',
	        text:'#E7E7E7'
	    },
	    editable: {
	        background: '#fbfbfb'
	    },
	    selectedHead: {
	        background: '#424242'
	    },
	    focused: {
	        border: '#C94948'
	    },
	    disabled: {
	        text: '#b0b0b0'
	    },
	    currentRow: {
	        background: '#e0ffe0'
	    }
	}
});
</script>
         