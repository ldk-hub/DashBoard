<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%><!-- 커스텀태그 추가 -->
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>    

    <script type = "text/javascript" src = "https://uicdn.toast.com/tui.code-snippet/latest/tui-code-snippet.min.js"></script> 
    <script type = "text/javascript" src = "https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.min.js"></script> 
    <script type = "text/javascript" src = "https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.min.js"></script>
<script
  src="https://code.jquery.com/jquery-1.11.0.js"
  integrity="sha256-zgND4db0iXaO7v4CLBIYHGoIIudWI5hRMQrPB20j0Qw="
  crossorigin="anonymous"></script>
<script type="text/javascript">
var grid = new tui.Grid({
    el: $('#tgrid'),
    scrollX: false,
    scrollY: false,
    columns: [
        {
            title: 'Name',
            name: 'name',
            onBeforeChange: function(ev){
                console.log('Before change:' + ev);
            },
            onAfterChange: function(ev){
                console.log('After change:' + ev);
            },
            editOptions: {
                type: 'text',
                useViewMode: true
            }
        },
        {
            title: 'Artist',
            name: 'artist',
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
            title: 'Type',
            name: 'typeCode',
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
        },
        {
            title: 'Genre',
            name: 'genreCode',
            onBeforeChange: function(ev){
                console.log('Before change:' + ev);
            },
            onAfterChange: function(ev){
                console.log('After change:' + ev);
            },
            editOptions: {
                type: 'checkbox',
                listItems: [
                    { text: 'Pop', value: '1' },
                    { text: 'Rock', value: '2' },
                    { text: 'R&B', value: '3' },
                    { text: 'Electronic', value: '4' },
                    { text: 'etc.', value: '5' }
                ],
                useViewMode: true
            },
            copyOptions: {
                useListItemText: true // when this option is used, the copy value is concatenated text
            }
        },
        {
            title: 'Grade',
            name: 'grade',
            onBeforeChange: function(ev){
                console.log('Before change:' + ev);
            },
            onAfterChange: function(ev){
                console.log('After change:' + ev);
            },
            copyOptions: {
                useListItemText: true
            },
            editOptions: {
                type: 'radio',
                listItems: [
                    { text: '★☆☆☆☆', value: '1' },
                    { text: '★★☆☆☆', value: '2' },
                    { text: '★★★☆☆', value: '3' },
                    { text: '★★★★☆', value: '4' },
                    { text: '★★★★★', value: '5' }
                ],
                useViewMode: true
            }
        }
    ]
});

grid.setData(gridData);
</script>


    		<!-- 라인 그래프  -->
      		<div class="right_col" role="main">
      		
      		  <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Bar Graph</h2>
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
    		<!-- 테이블 화면 -->
                <div class="x_panel">
                  <div class="x_title">
                    <h2>고객별 정보</h2>
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
              		<div id="tgrid"></div>
              		
                  </div>
                </div>
				<!-- 테이블 화면 -->
                <div class="x_panel">
                  <div class="x_title">
                    <h2>상품별 정보 데이터</h2>
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
    
             
            <!-- 파일업로드 -->
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
          </div>


	

         