<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>    
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<!-- toast grid link -->
<link rel="stylesheet" type="text/css" href="../static/vendors/toast/tui-grid/dist/tui-grid.css" />
<link rel="stylesheet" type="text/css" href="../static/vendors/sos_js/common/css/ad_solution.css"   />
<link rel="stylesheet" type="text/css" href="../static/vendors/toast/tui-date-picker/dist/tui-date-picker.css"/>
<!-- Switchery -->
<link rel="stylesheet" type="text/css" href="../static/vendors/switchery/dist/switchery.min.css" />

<div class="right_col" role="main">
	<div class="row">
		<div class="col-md-12 col-sm-12 col-xs-12">
			<div class="x_panel">
				<div class="x_title">
					<h2>서비스 메인정보</h2>
					<ul class="nav navbar-right panel_toolbox">
						<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
						<li><a class="close-link"><i class="fa fa-close"></i></a></li>
					</ul>
					<div class="clearfix"></div>
				</div>
					<div class="x_content">
					<div class = "row marginB5" style="width:100%">
						<div class="fl marginT8" style="width:30%;">
	                        <span class="spanBTitle"><img src="../static/images/ico_double_circle.png">&nbsp;기초정보</span>
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
                                        <th class="ellipsis">고객사건물명<span style="color:red;font-size:13px;">&nbsp;*</span></th>
										<td colspan="1">
										<select id=buildCode name="buildCode" class="_required" style="width: 50%;">
						                  <c:forEach items="${selectList}" var="databaseValue">
										    <option value="${databaseValue.b_code}">
										        ${databaseValue.b_nm}
										    </option>
									 	  </c:forEach>
										</select>
										</td>
										<th class="ellipsis">기준일 선택<span style="color:red;font-size:13px;">&nbsp;*</span></th>
										 <td colspan="1">
					                        <div class='input-group date' id='myDatepicker2' style="width: 50%;">
					                            <input id="pickDate" type='text' class="_required" />
					                             <span class="input-group-addon">      
					                             <span class="glyphicon glyphicon-calendar"></span>
					                             </span>
					                        </div>
			                        	</td>
			                        	<th class="ellipsis">동작제어(ON/OFF)<span style="color:red;font-size:13px;">&nbsp;*</span></th>
							            <td colspan="1">
				                              <input type="checkbox"  id="TempDataOnOff" class="switch"/>
							            </td>
                                    </tr>
                                    <tr>
							            <th class="ellipsis">주소 </th>
							            <td colspan="5">
							                <input id="zipCd"   name="zipCd"   type="text" class="tc ellipsis disable _required" style="width:15%;" readonly="readonly" maxlength="6"/>
							                <input id="addrDef" name="addrDef" type="text" class="ellipsis disable _required" style="width:75%;" readonly="readonly" maxlength="100"/>
							            </td>
							        </tr>
                                </tbody>
                            </table>
                            
								<div class="fl marginT8" style="width:30%;">
			                        <span class="spanBTitle"><img src="../static/images/ico_double_circle.png">&nbsp;가스,전력 소비량</span>
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
                                                <th class="ellipsis">GAS</th>
                                                <td><span id="gas_amt_o"></span>&nbsp;Nm3/h</td>
                                                <th class="ellipsis">Eectric</th>
                                                <td><span id="pwr_amt_d"></span>&nbsp;kWh</td>
                                                <th class="ellipsis" >Eectric</th>
                                                <td><span id="pwr_amt_pump"></span>&nbsp;kWh</td>
                                            </tr>
						   					<tr>
                                                <th class="ellipsis">Eectric</th>
                                                <td><span id="pwr_amt_g_pump"></span>&nbsp;kWh</td>
                                                <th class="ellipsis">Eectric</th>
                                                <td><span id="pwr_amt_top"></span>&nbsp;kWh</td>
                                                <th class="ellipsis">Eectric</th>
                                                <td><span id="pwr_amt_air"></span>&nbsp;kWh</td>
                                            </tr>
									        </tbody>
								        </table>
							        </div>
							        
								<div class="fl marginT8" style="width: 30%;">
									<span class="spanBTitle"><img src="../static/images/ico_double_circle.png">&nbsp;절감금액산출</span>
								</div>
								<div class="row table_form03 marginB10">
									<table>
										<colgroup>
											<col style="width:10%;"/>
		                                    <col style="width:15%;"/>
		                                    <col style="width:10%;"/>
		                                    <col style="width:15%;"/>
		                                    <col style="width:10%;"/>
		                                    <col style="width:15%;"/>
	                                      	<col style="width:10%;"/>
		                                    <col style="width:15%;"/>
										</colgroup>
										<tbody>
											<tr>
												<th class="ellipsis">가스</th>
												<td><span id="gas"></span>&nbsp;원/N㎥</td>
												<th class="ellipsis">전력</th>
												<td><span id="pwr"></span>&nbsp;원/kWh</td>
												<th class="ellipsis">적용기간</th>
												<td><span id="reduce_day"></span>&nbsp;day/m</td>
												<th class="ellipsis">적용월</th>
												<td><span id="reduce_mon"></span>&nbsp;m/yr</td>
											</tr>
										</tbody>
									</table>
								</div>
							        
                             <div class="modal-footer">
			                     <button type="button" class="btn btn-dark" id="buildSearch">조회</button>
			                 </div>
                        </div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
		<div class="col-md-12 col-sm-12 col-xs-12">
			<div class="x_panel">
				<div class="x_title">
					<h2>장비 정보</h2>
					<ul class="nav navbar-right panel_toolbox">
						<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
						<li><a class="close-link"><i class="fa fa-close"></i></a></li>
					</ul>
					<div class="clearfix"></div>
				</div>
					<div class="x_content">
						  <div class = "row marginB5" style="width:100%">
							  <div class="x_content">
									<div id="fcGrid"></div>
									
								<div class="modal-footer">
									<button type="button" class="btn btn-danger" id="delFc">삭제</button>
				                     <button type="button" class="btn btn-warning" id="udtFcData">수정</button>
				                 </div>
								</div>
					     </div>
					</div>
				</div>
			</div>

	<div class="row">
		<div class="col-md-12 col-sm-12 col-xs-12">
			<div class="x_panel">
				<div class="x_title">
					<h2>에너지 정보</h2>
					<ul class="nav navbar-right panel_toolbox">
						<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
						<li><a class="close-link"><i class="fa fa-close"></i></a></li>
					</ul>
					<div class="clearfix"></div>
				</div>
					<div class="x_content">
						<div id="energyGrid"></div>
						
						<div class="modal-footer">
							<button type="button" class="btn btn-danger" id="delEnergy">삭제</button>
		                     <button type="button" class="btn btn-warning" id="udtEnergyData">수정</button>
		                 </div>
					</div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-md-12 col-sm-12 col-xs-12">
			<div class="x_panel">
				<div class="x_title">
					<h2>설정 정보</h2>
					<ul class="nav navbar-right panel_toolbox">
						<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
						<li><a class="close-link"><i class="fa fa-close"></i></a></li>
					</ul>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">
					<div id="setTempGrid"></div>
					
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" id="delSetTemp">삭제</button>
	                     <button type="button" class="btn btn-warning" id="udtSetTempData">수정</button>
	                 </div>
				</div>
			</div>
		</div>
	</div>
	
	
	
	<div class="row">
		<div class="col-md-12 col-sm-12 col-xs-12">
			<div class="x_panel">
				<div class="x_title">
					<h2>회원정보</h2>
					<ul class="nav navbar-right panel_toolbox">
						<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
						<li><a class="close-link"><i class="fa fa-close"></i></a></li>
					</ul>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">
					<div id="userInfo"></div>
					
						<div class="modal-footer">
						    <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg">계정생성</button>
							<button type="button" class="btn btn-danger" id="danger_user">계정삭제</button>
							<button type="button" class="btn btn-dark" id="userListSearch">정보조회</button>
		                 </div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


				<!-- 모달 -->
					<div id="myModal" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                      <div class="modal-content" id="myModal">

                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                          </button>
                          <h4 class="modal-title" id="myModalLabel">회원가입 필수입력 항목</h4>
                        </div>
                        <div class="modal-body">
                     <form id="test1" class="form-horizontal form-label-left" novalidate>

                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">아이디명 <span style="color:red;font-size:13px;">&nbsp;*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="user_id" oninput="checkId()" maxlength="10" class="form-control col-md-7 col-xs-12" data-validate-length-range="8" name="name" required="required" type="text">
                        </div>
                      </div>
                      
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="telephone">관리자명 <span style="color:red;font-size:13px;">&nbsp;*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="user_name" name="phone" required="required" data-validate-length-range="8,20" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="number">서비스코드 <span style="color:red;font-size:13px;">&nbsp;*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="service_code" name="number" required="required" maxlength="3" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label for="password" class="control-label col-md-3">비밀번호<span style="color:red;font-size:13px;">&nbsp;*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="password" type="password" maxlength="9" name="password" data-validate-length="6" class="form-control col-md-7 col-xs-12" required="required">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label for="password2" class="control-label col-md-3 col-sm-3 col-xs-12">비밀번호 확인<span style="color:red;font-size:13px;">&nbsp;*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="password2" type="password" maxlength="9" name="password2" data-validate-linked="password" class="form-control col-md-7 col-xs-12" required="required">
                        </div>
                      </div>
                      
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">Email <span style="color:red;font-size:13px;">&nbsp;*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="email" id="e_mail" name="e_mail" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                    </form>
                        
                       			<!-- 	 <form id="test1" class="form-horizontal form-label-left" novalidate>
				                 		 <form  data-parsley-validate class="form-horizontal form-label-left">
						                      <div class="form-group">
						                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">아이디명 <span style="color:red;font-size:13px;">&nbsp;*</span>
						                        </label>
						                        <div class="col-md-6 col-sm-6 col-xs-12">
						                          <input type="text" id="user_id"  oninput="checkId()"  data-parsley-minlength="3" maxlength="10" data-parsley-trigger="change" class="form-control col-md-7 col-xs-12">
						                        </div>
						                      </div>
						                      <div class="form-group">
						                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">관리자명 <span style="color:red;font-size:13px;">&nbsp;*</span>
						                        </label>
						                        <div class="col-md-6 col-sm-6 col-xs-12">
						                          <input type="text" id="user_name" name="last-name" data-parsley-minlength="1" maxlength="10"  data-parsley-trigger="change" class="form-control col-md-7 col-xs-12">
						                        </div>
						                      </div>
						                       <div class="form-group">
						                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">패스워드 <span style="color:red;font-size:13px;">&nbsp;*</span>
						                        </label>
						                        <div class="col-md-6 col-sm-6 col-xs-12">
						                          <input type="password" id="password" name="last-name"  data-parsley-trigger="change" class="form-control col-md-7 col-xs-12">
						                        </div>
						                      </div>
						                       <div class="form-group">
						                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">패스워드확인 <span style="color:red;font-size:13px;">&nbsp;*</span>
						                        </label>
						                        <div class="col-md-6 col-sm-6 col-xs-12">
						                          <input type="password" id="password2" name="last-name" data-parsley-trigger="change"  data-parsley-equalto="#password"	 class="form-control col-md-7 col-xs-12">
						                        </div>
						                      </div>
						                       <div class="form-group">
						                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">서비스코드 <span style="color:red;font-size:13px;">&nbsp;*</span>
						                        </label>
						                        <div class="col-md-6 col-sm-6 col-xs-12">
						                          <input type="text" id="service_code" name="last-name" maxlength="3" data-parsley-minlength="1"   data-parsley-trigger="change" class="form-control col-md-7 col-xs-12">
						                        </div>
						                      </div>
						                      <div class="form-group">
						                        <label class="control-label col-md-3 col-sm-3 col-xs-12">이메일 <span style="color:red;font-size:13px;">&nbsp;*</span>
						                        </label>
						                        <div class="col-md-6 col-sm-6 col-xs-12">
						                          <input id="e_mail" class="form-control col-md-7 col-xs-12"  data-parsley-trigger="change" data-parsley-type="email" type="email">
						                        </div>
						                      </div>
				                    </form> -->
				                    
			                    	<div class="modal-footer">
			                         		<button id="createUser" disabled="disabled" type="button" class="btn btn-success">계정등록</button>
				                           <button type="button" class="btn btn-dark" id="m_close" data-dismiss="modal">닫기</button>
			                        </div>
			            <!--              <div class="form-group">
					                        <div class="col-md-6 col-md-offset-3">
					                          <button type="submit" class="btn btn-primary">Cancel</button>
					                          <button id="send" type="submit" class="btn btn-success">Submit</button>
					                        </div>
					                      </div> -->
                        </div>
                      </div>
                    </div>
                  </div>

	
<!-- toast 연계 -->
<script src="../static/vendors/toast/jquery/dist/jquery.js"></script>
<script src="../static/vendors/toast/underscore/underscore.js"></script>
<script src="../static/vendors/toast/backbone/backbone.js"></script>
<!-- toast API -->
<script src="../static/vendors/toast/tui-code-snippet/dist/tui-code-snippet.js"></script>
<script src="../static/vendors/toast/tui-date-picker/dist/tui-date-picker.js"></script>
<script src="../static/vendors/toast/tui-grid/dist/tui-grid.js"></script>
<script src="../static/vendors/toast/tui-pagination/dist/tui-pagination.js"></script>
<script src="../static/vendors/toast/tui-time-picker/dist/tui-time-picker.js"></script>
<script src="../static/vendors/toast/tui-date-picker/dist/tui-date-picker.js"></script>
<!-- Switchery -->
<script src="../static/vendors/switchery/dist/switchery.min.js"></script>
<!-- validator -->
<script src="../static/vendors/validator/validator.js"></script>

<script type="text/javascript">
var Now = new Date();
var NowTime = Now.getFullYear();
NowTime += '.' + (Now.getMonth()+1);
NowTime += '.' + Now.getDate();

$('#pickDate').val(NowTime);
</script>

<!-- 장비정보  -->
<script type="text/javascript">
	var fcGrid = new tui.Grid({
		el : $('#fcGrid'), 
		scrollX: true,
	    bodyHeight: 200,
	    rowHeaders: ['checkbox','rowNum'],
	    rowHeight: 28,
	    columnOptions: {
	        width: 100
	    },
		columns : [ 
			{
				title : '장비구분',
				align: 'center',
				name : 'fc_gubun',
					editOptions : {
						type : 'text',
						useViewMode : true
					}
			},
			{
				title : '장비명',
				align: 'center',
				name : 'fc_nm',
					editOptions : {
						type : 'text',
						useViewMode : true
					}
			},
			{
				title : '용량',
				align: 'center',
				name : 'fc_capacity',
					editOptions : {
						type : 'text',
						 maxLength: 7,
						useViewMode : true
					},
					validation: {
				        dataType: 'number',
			        	required: true
				      }
			},
			{
				title : '효율',
				align: 'center',
				name : 'efficiency',
					editOptions : {
						type : 'text',
						 maxLength: 5,
						useViewMode : true
					},
					validation: {
				        dataType: 'number',
			        	required: true
				      }
			}
		]
	});
	
	fcGrid.use('Net', {
		initialRequest: false,
	    perPage: 500,
	    enableAjaxHistory: true,
	    withCredentials: true,
	    api: {
	    	updateData: '/udtBuildFc'
	    }
	 });

	fcGrid.on('beforeRequest', function(data) {
	  }).on('response', function(data) {
	  	alert(data.responseData.msg);
	  	$('#buildSearch').click();
	});
	
	
	 var options = { checkedOnly: false,showConfirm:false};
  $("#udtFcData").click(function() {
	  var chkData = fcGrid.validate();
	  	var chkNull = [];
	      $.each(chkData, function(index, result) {
	  		chkNull += index;
	  	 }); 
		 if(confirm("수정 하시겠습니까?") == false) {
	         return false;
	     }
		if(fcGrid.isModified() == false){
			 alert("변경된 데이터가 없습니다.");	 
			return false;
 		 }
		if(chkNull != ""){
			alert("필수 항목을 입력하세요.");
			return false;
		}
		
		 var net = fcGrid.getAddOn('Net');
			net.request('updateData',options);
	});
  
</script>


<script type="text/javascript">
$("#delFc").click(function() {
		 if(confirm("삭제 하시겠습니까?") == false) {
	         return false;
	     }
		 if(fcGrid.getCheckedRowKeys(true) == "[]"){
				alert("체크박스를 선택하시오.");
				return false;
		}
	var test = fcGrid.getCheckedRows(true);
		 
		 $.ajax({
		        url:"/delBuildFc",
		        type:'POST',
		        data: {delParam:test},
		        dataType:'json',
		        success:function(data){
		        	if(data.code==1){
		        		 alert("삭제완료.");
		        		 $("#buildSearch").click();
		        	}else{
		        		
		        	}
		        },
		        error:function(data){
		        	alert("에러발생 관리자에게 문의하시오.");
		        }
		    });
	});
	</script>

<!-- 에너지 정보 -->
<script type="text/javascript">
    var grid = new tui.Grid({
	    el: $('#energyGrid'), 
	    bodyHeight: 350,
	    rowHeight: 28,
	    rowHeaders: ['checkbox','rowNum'],
	    columns: [
	    	{
	            title: '그룹',
	            align: 'center',
	            name: 'sort_data',
	            width: 55,
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
	                      { text: '그룹1', value: '1' },
	                      { text: '그룹2', value: '2' },
	                      { text: '그룹3', value: '3' },
	                      { text: '그룹4', value: '4' },
	                      { text: '그룹5', value: '5' },
	                      { text: '그룹6', value: '6' },
	                      { text: '그룹7', value: '7' },
	                      { text: '그룹8', value: '8' },
	                      { text: '그룹9', value: '9' },
	                      { text: '그룹10', value: '10' }
	                  ],
	                  useViewMode: true
	              }
	        },
	        {
	            title: '층별',
	            align: 'center',
	            name: 'floor',
	            width: 70,
				editOptions : {
					type : 'text',
					useViewMode : true
				}
	        },
	        {
	            title: '장비명',
	            align: 'center',
	            name: 'equip_nm',
				editOptions : {
					type : 'text',
					useViewMode : true
				}
	        },
	        
	        {
	            title: '용량1',
	            align: 'center',
	            name: 'wind_sa',
				editOptions : {
					type : 'text',
					useViewMode : true
				},
				validation: {
			        dataType: 'number',
		        	required: true
			      },
			      defaultValue: 0,
			      onBeforeChnage: function (ev) {
			        if(Number(ev.value)){
			          ev.value = Number(ev.value);
			          return ev;
			        }else{
			         ev.stop();
			        }
			      }
	        },
	        {
	            title: '용량2',
	            align: 'center',
	            name: 'sa_kw',
				editOptions : {
					type : 'text',
					useViewMode : true
				},
				validation: {
			        dataType: 'number',
		        	required: true
			      },
			      defaultValue: 0,
			      onBeforeChnage: function (ev) {
			        if(Number(ev.value)){
			          ev.value = Number(ev.value);
			          return ev;
			        }else{
			         ev.stop();
			        }
			      }
	        },
	        {
	            title: '용량3',
	            align: 'center',
	            name: 'wind_ra',
				editOptions : {
					type : 'text',
					useViewMode : true
				},
				validation: {
			        dataType: 'number',
		        	required: true
			      },
			      defaultValue: 0,
			      onBeforeChnage: function (ev) {
			        if(Number(ev.value)){
			          ev.value = Number(ev.value);
			          return ev;
			        }else{
			         ev.stop();
			        }
			      }
	        },
	        {
	            title: '용량4',
	            align: 'center',
	            name: 'ra_kw',
				editOptions : {
					type : 'text',
					useViewMode : true
				},
				validation: {
			        dataType: 'number',
		        	required: true
			      },
			      defaultValue: 0,
			      onBeforeChnage: function (ev) {
			        if(Number(ev.value)){
			          ev.value = Number(ev.value);
			          return ev;
			        }else{
			         ev.stop();
			        }
			      }
	        },
	        {
	            title: '능력치',
	            align: 'center',
	            name: 'cool_capacity',
				editOptions : {
					type : 'text',
					useViewMode : true
				},
				validation: {
			        dataType: 'number',
		        	required: true
			      },
			      defaultValue: 0,
			      onBeforeChnage: function (ev) {
			        if(Number(ev.value)){
			          ev.value = Number(ev.value);
			          return ev;
			        }else{
			         ev.stop();
			        }
			      }
	        },
	        {
	            title: '능력치2',
	            align: 'center',
	            name: 'heat_capacity',
				editOptions : {
					type : 'text',
					useViewMode : true
				},
				validation: {
			        dataType: 'number',
		        	required: true
			      },
			      defaultValue: 0,
			      onBeforeChnage: function (ev) {
			        if(Number(ev.value)){
			          ev.value = Number(ev.value);
			          return ev;
			        }else{
			         ev.stop();
			        }
			      }
	        },
	       {
	            title: '면적',
	            align: 'center',
	            name: 'air_area',
	            width: 70,
				editOptions : {
					type : 'text',
					useViewMode : true
				},
				validation: {
			        dataType: 'number',
		        	required: true
			      },
			      defaultValue: 0,
			      onBeforeChnage: function (ev) {
			        if(Number(ev.value)){
			          ev.value = Number(ev.value);
			          return ev;
			        }else{
			         ev.stop();
			        }
			      }
	        },
	        {
	            title: '기타정보',
	            align: 'center',
	            name: 'floor_data',
	            width: 70,
				editOptions : {
					type : 'text',
					useViewMode : true
				},
				validation: {
			        dataType: 'number',
		        	required: true
			      },
			      defaultValue: 0,
			      onBeforeChnage: function (ev) {
			        if(Number(ev.value)){
			          ev.value = Number(ev.value);
			          return ev;
			        }else{
			         ev.stop();
			        }
			      }
	        }
	        {
	            title: '비고',
	            name: 'etc',
				editOptions : {
					type : 'text',
					useViewMode : true
				}
	        }
	    ]
	});
	
    
    grid.use('Net', {
		initialRequest: false,
	    perPage: 500,
	    enableAjaxHistory: true,
	    withCredentials: true,
	    api: {
	    	updateData: '/udtFcInfo'
	    }
	 });
	
    
    grid.on('beforeRequest', function(data) {
	    }).on('response', function(data) {
	    	alert(data.responseData.msg);
	    	$('#buildSearch').click();
    });
    
    var options = { checkedOnly: false,	showConfirm:false};
    
    $("#udtEnergyData").click(function() {
    	var chkData = grid.validate();//벨류데이션
    	var chkNull = [];
        $.each(chkData, function(index, result) {
    		chkNull += index;
    	 }); 
    	
		 if(confirm("수정 하시겠습니까?") == false) {
	         return false;
	     }
		 if(grid.isModified() == false){
			 alert("변경된 데이터가 없습니다.");	 
			return false;
 		 }
		 if(chkNull != ""){
			alert("필수 항목을 입력하세요.");
			return false;
		 }
	  
		 
		 var net = grid.getAddOn('Net');
		net.request('updateData',options);
	});
    
    
    $("#delEnergy").click(function() {
		 if(confirm("삭제 하시겠습니까?") == false) {
	         return false;
	     }
		 if(grid.getCheckedRowKeys(true) == "[]"){
				alert("체크박스를 선택하시오.");
				return false;
		}
		 
		var test = grid.getCheckedRows(true);
		 
		 $.ajax({
		        url:"/delFcInfo",
		        type:'POST',
		        data: {delParam:test},
		        dataType:'json',
		        success:function(data){
		        	if(data.code==1){
		        		 alert("삭제완료.");
		        		 $('#buildSearch').click();
		        	}else{
		        		
		        	}
		        },
		        error:function(data){
		        	alert("에러발생 관리자에게 문의하시오.");
		        }
		    });
	});
   
</script>



<!-- 설정온도  -->
<script type="text/javascript">
	var setTempGrid = new tui.Grid({
		el : $('#setTempGrid'), 
		scrollX: true,
	    bodyHeight: 350,
	    rowHeaders: ['checkbox','rowNum'],
	    rowHeight: 28,
	    columnOptions: {
	        width: 100
	    },
		columns : [ 
			{
				title : '층별',
				align: 'center',
				name : 'stage',
				editOptions : {
					type : 'text',
					useViewMode : true
				}
			}, {
				title : '장비명',
				align: 'center',
				name : 'machine',
				editOptions : {
					type : 'text',
					useViewMode : true
				}
			}, {
				title : '설정값',
				align: 'center',
				name : 'temp_info',
				editOptions : {
					type : 'text',
					useViewMode : true
				},
				validation: {
			        dataType: 'number',
		        	required: true
			      },
			      defaultValue: 0,
			      onBeforeChnage: function (ev) {
			        if(Number(ev.value)){
			          ev.value = Number(ev.value);
			          return ev;
			        }else{
			         ev.stop();
			        }
			      }
			},{
				title : '설정치',
				align: 'center',
				name : 'humi_info',
				editOptions : {
					type : 'text',
					useViewMode : true
				},
				validation: {
			        dataType: 'number',
		        	required: true
			      },
			      defaultValue: 0,
			      onBeforeChnage: function (ev) {
			        if(Number(ev.value)){
			          ev.value = Number(ev.value);
			          return ev;
			        }else{
			         ev.stop();
			        }
			      }
			},{
	            title: '구분값',
	            align: 'center',
	            name: 'yn_temp',
	            editOptions : {
					type : 'select',
					listItems : [ 
					{
						text : '선택없음',
						value : ''
					},{
						text : '테스트1',
						value : '1'
					}, {
						text : '테스트2',
						value : '0'
					}
					],
					useViewMode : true
				}
	        },{
				title : '온오프 유무',
				align: 'center',
				name : 'yesterday_yn',
				editOptions : {
					type : 'select',
					listItems : [ {
						text : 'ON',
						value : '1.2'
					}, {
						text : 'OFF',
						value : '1'
					}
					]
				}
	        },{	
				title : '감가상각',
				align: 'center',
				name : 'c_per',
				editOptions : {
					type : 'text',
					maxLength : 4,
					useViewMode : true
				},
				validation: {
			        dataType: 'number',
		        	required: true
			      },
			      defaultValue: 0,
			      onBeforeChnage: function (ev) {
			        if(Number(ev.value)){
			          ev.value = Number(ev.value);
			          return ev;
			        }else{
			         ev.stop();
			        }
			      }
			},{
				title : '비율',
				align: 'center',
				name : 'h_per',
				editOptions : {
					type : 'text',
					maxLength : 4,
					useViewMode : true
				},
				validation: {
			        dataType: 'number',
		        	required: true
			      },
			      defaultValue: 0,
			      onBeforeChnage: function (ev) {
			        if(Number(ev.value)){
			          ev.value = Number(ev.value);
			          return ev;
			        }else{
			         ev.stop();
			        }
			      }
			},{
				title : '비고',
				name : 'etc',
				editOptions : {
					type : 'text',
					useViewMode : true
				}
			}
		]
	});
	
	
	setTempGrid.use('Net', {
		initialRequest: false,
	    perPage: 500,
	    enableAjaxHistory: true,
	    withCredentials: true,
	    api: {
	    	updateData: '/udtSetInfo2'
	    }
	 });
	
	    
	    setTempGrid.on('beforeRequest', function(data) {
		    }).on('response', function(data) {
		    	alert(data.responseData.msg);
		    	$('#buildSearch').click();
	    });
	    
	    var options = { checkedOnly: false,	showConfirm:false};
	    
	    $("#udtSetTempData").click(function() {
	    	var chkData = setTempGrid.validate();
	    	var chkNull = [];
	        $.each(chkData, function(index, result) {
	    		chkNull += index;
	    	 }); 
	        
			 if(confirm("수정 하시겠습니까?") == false) {
		         return false;
		     }
			 if(setTempGrid.isModified() == false){
				 alert("변경된 데이터가 없습니다.");	 
				return false;
	 		 }
			 if(chkNull != ""){
				alert("필수 항목을 입력하세요.");
				return false;
			 }
			 var net = setTempGrid.getAddOn('Net');
			net.request('updateData',options);
		});
</script>



<script type="text/javascript">
	$("#delSetTemp").click(function() {
			 if(confirm("삭제 하시겠습니까?") == false) {
		         return false;
		     }
			if(setTempGrid.getCheckedRowKeys(true) == "[]"){
				alert("체크박스를 선택하시오.");
				return false;
			}
			 var test = setTempGrid.getCheckedRows(true);
			 
			 $.ajax({
			        url:"/delSetInfo2",
			        type:'POST',
			        data: {delParam:test},
			        dataType:'json',
			        success:function(data){
			        	if(data.code==1){
			        		 alert("삭제완료.");
			        		 $('#buildSearch').click();
			        	}else{
			        		
			        	}
			        },
			        error:function(data){
			        	alert("에러발생 관리자에게 문의하시오.");
			        }
			    });
		}); 
</script>

<script type="text/javascript">
 $("#buildSearch").click(function() {
	var buildCode = $('#buildCode').val();
	var pickDate = $('#pickDate').val();
	
	 if(buildCode == ""){
	    alert("건물명을 선택하시오.");
	    return false;
	} 
	 if(pickDate == ""){
	    alert("기준일을 선택하시오.");
	    return false;
	} 
	 	//초기화
		$('#zipCd').val(""); 
		$('#addrDef').val("");

		$('#gas_amt_o').html("");
		$('#pwr_amt_d').html("");
		$('#pwr_amt_pump').html(""); 
		$('#pwr_amt_g_pump').html("");
		$('#pwr_amt_top').html("");
		$('#pwr_amt_air').html("");
		
		$('#gas').html(""); 
		$('#pwr').html(""); 
		$('#reduce_day').html("");
		$('#reduce_mon').html("");
		
		if(switchery.isDisabled() == true){
			switchery.enable();
		}
		
		
		 $.ajax({
			type:'POST',
			dataType:'JSON',
			url : '/selectInfo',
			data : {
					build_code: buildCode, 
					search_date: pickDate
					},
			success : function(data){
				
				$.each(data.result, function(index, result) {
					$('#zipCd').val(result.zipcd); 
					$('#addrDef').val(result.addrdef);
					
					$('#gas_amt_o').html(result.chw_gas_amt);
					$('#pwr_amt_d').html(result.frz_pwr_amt);
					$('#pwr_amt_pump').html(result.cwp_pwr_amt); 
					$('#pwr_amt_g_pump').html(result.clp_pwr_amt);
					$('#pwr_amt_top').html(result.ct_pwr_amt);
					$('#pwr_amt_air').html(result.air_pwr_amt);
					
					$('#gas').html(result.gas_price_hot);
					$('#pwr').html(result.pwr_price_0);
					$('#reduce_day').html(result.reduce_day);
					$('#reduce_mon').html(result.reduce_month);
					
					//체크박스 상태값변경
					if(result.temp_flag == 1){
						switchery.element.checked = true; 
						switchery.setPosition();
					}else{
						switchery.element.checked = false; 
						switchery.setPosition();
					}
				});
			},
			error : function (request,status,error){
				 alert("에러발생");
			}
		});
	 			
			    $.ajax({
			    	type:'POST',
					url : '/selectFcInfo',
					data : {
						build_code: buildCode, 
						search_date: pickDate
						},
					dataType:"json",
					success:function(result){
						fcGrid.setData(result.data);
					},
					error:function(result){
						fcGrid.clear();
					}
				});	
	 			
			  
			    $.ajax({
			    	type:'POST',
					url : '/selectEnergyInfo',
					data : {
						build_code: buildCode, 
						search_date: pickDate
						},
					dataType:"json",
					success:function(result){
						grid.setData(result.data);
					},
					error:function(result){
						grid.clear();
					}
				});	
			  
			  
			    $.ajax({
			    	type:'POST',
					url : '/selectSetTemp',
					data : {
						build_code: buildCode,
						search_date: pickDate
						},
					dataType:"json",
					success:function(result){
						setTempGrid.setData(result.data);
					},
					error:function(result){
						setTempGrid.clear();
					}
				});	
		});
</script>

<!-- on/off -->
<script type="text/javascript">
var elem = document.querySelector('.switch');
var switchery = Switchery(elem, { disabled: true });


$('.switch').on('change',function(){
	if($("#TempDataOnOff").is(":checked")){
    $.ajax({
    	type:'GET',
		url : '/TempDataOnOff',
		data : {
			b_code : $('#buildCode').val(),
			temp_flag: 1
			}
	});	
	}else{
    $.ajax({
    	type:'GET',
		url : '/TempDataOnOff',
		data : {
			b_code : $('#buildCode').val(),
			temp_flag: 0
			}
		});	
	} 
});
 </script>
 
 
 <script type="text/javascript">
 var userInfo = new tui.Grid({
		el : $('#userInfo'), 
		scrollX: true,
	    bodyHeight: 200,
	    rowHeaders: ['checkbox','rowNum'],
	    rowHeight: 28,
	    columnOptions: {
	        width: 100
	    },
		columns : [ 
			{
				title : '아이디',
				align: 'center',
				name : 'user_id'
			}, {
				title : '관리자명',
				align: 'center',
				name : 'user_name'
			}, {
				title : '이메일',
				align: 'center',
				name : 'email'
			}, {
				title : '권한상태',
				align: 'center',
				name : 'flag',
				editOptions : {
					type : 'select',
					listItems : [ {
						text : '모니터링',
						value : '1'
					}, {
						text : '마스터',
						value : '0'
					}
					]
				}
			},{
				title : '서비스코드',
				align: 'center',
				name : 'build_code'
			},{
				title : '계정생성일',
				align: 'center',
				name : 'c_date'
			}
		]
	});
	     
 $("#userListSearch").click(function() {
    	$.ajax({
		    	type:'POST',
				url : '/userInfoList',
				dataType:"json",
				success:function(result){
					userInfo.setData(result.data);
				},
				error:function(result){
					userInfo.clear();
				}
			});	
	});
 </script>
 
 <script type="text/javascript">
 //삭제버튼 2번 검증 프로세스
	$('#danger_user').click(function(){
		if(confirm("삭제 하시겠습니까?") == false) {
		    return false;
		}
		//계정에 연관된 코드 데이터 del?his?
		if(confirm("Danger. 삭제시 복구 불가능합니다 계정을 삭제 하시겠습니까?") == false) {
		    return false;
		}
		
		if(userInfo.getCheckedRowKeys(true) == "[]"){
			alert("체크박스를 선택하시오.");
			return false;
		}
		
	 var test = userInfo.getCheckedRows(true); 
	 
	 $.ajax({
	        url:"/delUser",
	        type:'POST',
	        data: {delParam:test},
	        dataType:'json',
	        success:function(data){
	        	if(data.code==1){
	        		 alert("삭제완료.");
	        		 $("#userListSearch").click();
	        	}else{
	        		
	        	}
	        },
	        error:function(data){
	        	alert("에러발생 관리자에게 문의하시오.");
	        }
	    });
}); 
</script>


<!-- 회원정보 삽입 -->
<script type="text/javascript">
$('#createUser').click(function(){
  var e_mail = $('#e_mail').val();
  var user_name =	$('#user_name').val();
  var pass =	$('#password').val();
  var id =	$('#user_id').val();
  var s_code =	$('#service_code').val();
	if(id =="") {
		$('#user_id').focus();
		return false;
     }
	if(user_name =="") {
		$('#user_name').focus();
		return false;
     }
	if(pass =="") {
		$('#password').focus();
		return false;
     }
	if(s_code =="") {
		$('#service_code').focus();
		return false;
     }
	if(e_mail =="") {
		$('#e_mail').focus();
		return false;
     }
	
	$.ajax({
		type:'POST',
		url : '/insertUserInfo',
		data : {
				email: e_mail, 
				nickname: user_name,
				password: pass,
				username: id,
				build_code: s_code
				},
		success : function(data){
		 if(data.code == '1') {
		        alert("등록되었습니다.");
		        $('#m_close').click();
		        $('#userListSearch').click();
		 	}
		},
		error: function(data){
		      alert('error 관리자에게문의하시오.');
	    }
	});
});
</script>

<!-- 회원등록 중복check -->
<script type="text/javascript">
	//아이디와 비밀번호가 맞지 않을 경우 가입버튼 비활성화를 위한 변수설정
    var idCheck = 0;
    var pwdCheck = 0;	
    //아이디 체크하여 가입버튼 비활성화, 중복확인.
    function checkId() {
        var inputed = $('#user_id').val();
        $.ajax({
        	type:'POST',
            data : {
                id : inputed
            },
            url : '/checkId',
            success : function(data) {
                if(data.code=='1' || inputed.length <='3' ) {
                    $("#createUser").prop("disabled", true);
                    $("#createUser").css("background-color", "#aaaaaa");
                    $("#user_id").css("background-color", "#FFCECE");
                    if(data.code=='1'){
                    	//중복아이디 체크 확인 로직
                    }
                    idCheck = 0;
                } else if (data.code == '0') {
                	$("#user_id").css("background-color", "#B0F6AC");
                    idCheck = 1;
                    if(idCheck==1) {
                        $("#createUser").prop("disabled", false);
                        $("#createUser").css("background-color", "#4CAF50");
                    } 
                } 
            }
        });
    }
   </script>
   
   
<!-- 모달 초기화 -->
<script type="text/javascript">
$(document).ready(function() {
  $(".modal").on("hidden.bs.modal", function() {
	  $('#test1')[0].reset();
  });
});
</script>


<!-- 그리드 컬러제어 -->
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