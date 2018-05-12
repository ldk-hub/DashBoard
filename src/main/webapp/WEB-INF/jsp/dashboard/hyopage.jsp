<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%><!-- 커스텀태그 추가 -->
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>    
    
    		<!-- 라인 그래프  -->
      		<div class="right_col" role="main">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>상품 월별 차트</h2>
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

                    <div id="echart_line" style="height:350px;"></div>

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
