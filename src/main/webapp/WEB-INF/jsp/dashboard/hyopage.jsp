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
                    <h2>그리드형 데이터 제어</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                     </div>
                    <div class="clearfix"></div>
                   
                  <div class="x_content">
              		<!-- 토스트 UI 호출 -->
              		<div id="grid"></div>
                  </div>
                </div>
              </div>
				<!-- 그리드형 API E-->
				   <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>테이블형 데이터 제어</h2>
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
									<th scope="row">${resultList.itemNo }</th>
									<th scope="row">${resultList.itemName }</th>
									<th scope="row">${resultList.brdName }</th>
									<th scope="row">${resultList.reason }</th>
									<th scope="row">${resultList.status }</th>
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
    bodyHeight: 550,
    rowHeaders:['rowNum'],
    columns: [
        {
            title: '제품순번',
            name: 'certNo'
        },
        {
            title: '자재번호 ',
            name: 'itemNo'
        },
        {
            title: '제품명',
            name: 'itemName',
            onBeforeChange: function(ev){
                console.log('Before change:' + ev);
                ev.stop();
            },
            onAfterChange: function(ev){
                console.log('After change:' + ev);
            },
            editOptions: {
                type: 'text',
                maxLength: 10,
                useViewMode: false
            }
        },
        {
            title: '제품상세',
            name: 'reason',
            onBeforeChange: function(ev){
                console.log('Before change:' + ev);
                ev.stop();
            },
            onAfterChange: function(ev){
                console.log('After change:' + ev);
            },
            editOptions: {
                type: 'text',
                maxLength: 10,
                useViewMode: false
            }
        },
        {
            title: '브랜드명',
            name: 'brdName',
            onBeforeChange: function(ev){
                console.log('Before change:' + ev);
            },
            onAfterChange: function(ev){
                console.log('After change:' + ev);
            },
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

		grid.use('Net',{
			perPage:500,
			readDataMethod: 'GET',
			api:{
				readData:'/selectBoardList'
			}
		});
	
		
		grid.on('response', function(data) {
			
			console.log("1",data);
		    // when receiving response regardless of success/fail
		});


	var net = grid.getAddOn('Net');

</script>
         