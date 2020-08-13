<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>  
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- toast grid link -->
<link rel="stylesheet" type="text/css" href="../static/vendors/sos_js/common/css/ad_solution.css"/>
<link rel="stylesheet" type="text/css" href="../static/vendors/toast/tui-grid/dist/tui-grid.css"/>
<link rel="stylesheet" type="text/css" href="../static/vendors/toast/tui-date-picker/dist/tui-date-picker.css"/>
	
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
                                 	  <col style="width:13%;"/>
                                      <col style="width:37%;"/>
                                      <col style="width:13%;"/>
                                      <col style="width:37%;"/>
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th class="ellipsis">고객사건물명<span style="color:red;font-size:13px;">&nbsp;*</span></th>
										<td><input id="buildNm" name="buildNm" type="text" class="_required" maxlength="20" style="width:40%;" /></td>
										 <th class="ellipsis">서비스코드(중요)<span style="color:red;font-size:13px;">&nbsp;*</span></th>
										<td><input id="buildCode" name="buildCode" type="text" class="_required" maxlength="3" style="width:20%;"/></td>
                                    </tr>
                                    <tr>
						                <th class="ellipsis">주소<span style="color:red;font-size:13px;">&nbsp;*</span></th>
							            <td colspan="3">
							                <input id="zipCd"   name="zipCd"   type="text" class="tc ellipsis disable _required" style="width:15%;" readonly="readonly" maxlength="6"/>
							                <input id="addrDef" name="addrDef" type="text" class="ellipsis disable _required" style="width:64%;" readonly="readonly" maxlength="100"/>
							                <img id="btnAddrSearch" src="../static/images/ico_search.gif" class="verticalM cursorP" />
							                <img id="btnAddrClear"  src="../static/images/ico_clear.png"  class="verticalM cursorP" />
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
                                                <th class="ellipsis">GAS(냉온수기)<span style="color:red;font-size:13px;">&nbsp;*</span></th>
                                                 <td><input id="gasWaterAmt" name="gasWaterAmt" type="text" class="_onlynumber _required" maxlength="5" style="width:40%;"/>Nm3/h</td>
                                                <th class="ellipsis">Eectric(냉동기)<span style="color:red;font-size:13px;">&nbsp;*</span></th>
                                                 <td><input id="pwrAmt" name="pwrAmt" type="text" class="_onlynumber _required" maxlength="4" style="width:40%;"/>kWh</td>
                                                <th class="ellipsis" >Eectric(냉수펌프)<span style="color:red;font-size:13px;">&nbsp;*</span></th>
                                                 <td><input id="pwrWaterAmt" name="pwrWaterAmt" type="text" class="_onlynumber _required" maxlength="4" style="width:40%;"/>kWh</td>
                                            </tr>
                                            <tr>
                                                <th class="ellipsis">Eectric(냉각수펌프)<span style="color:red;font-size:13px;">&nbsp;*</span></th>
                                                <td><input id="pwrWaterAmt2" name="pwrWaterAmt2" type="text" class="_onlynumber _required" maxlength="4" style="width:40%;"/>kWh</td>
                                                <th class="ellipsis">Eectric(냉각탑)<span style="color:red;font-size:13px;">&nbsp;*</span></th>
                                                 <td><input id="pwrTopAmt" name="pwrTopAmt" type="text" class="_onlynumber _required" maxlength="4" style="width:40%;"/>kWh</td>
                                                <th class="ellipsis">Eectric(공조기)<span style="color:red;font-size:13px;">&nbsp;*</span></th>
                                                 <td><input id="pwrAirAmt" name="pwrAirAmt" type="text" class="_onlynumber _required" maxlength="4" style="width:40%;"/>kWh</td>
                                            </tr>
									        </tbody>
								        </table>
							        </div>
							        
								        <div class="fl marginT8" style="width: 30%;">
											<span class="spanBTitle"><img src="../static/images/ico_double_circle.png">&nbsp;절감금액산출정보</span>
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
														<th class="ellipsis">가스<span style="color:red;font-size:13px;">&nbsp;*</span></th>
														<td><input id="gasInfo" name="gasInfo" type="text"
															class="_onlynumber _required" maxlength="5"
															style="width: 40%;" />원/N㎥</td>
														<th class="ellipsis">전기<span style="color:red;font-size:13px;">&nbsp;*</span></th>
														<td><input id="pwrInfo" name="pwrInfo"
															type="text" class="_onlynumber _required" maxlength="6"
															style="width: 40%;" />원/kWh</td>
														<th class="ellipsis">적용기간<span style="color:red;font-size:13px;">&nbsp;*</span></th>
														<td><input id="AppDay" name="AppDay"
															type="text" class="_onlynumber _required" maxlength="4"
															style="width: 40%;" />day/m</td>
														<th class="ellipsis">적용월<span style="color:red;font-size:13px;">&nbsp;*</span></th>
														<td><input id="AppMon" name="AppMon"
															type="text" class="_onlynumber _required" maxlength="4"
															style="width: 40%;" />m/yr</td>
													</tr>
												</tbody>
											</table>
										</div>
							        
                             <div class="modal-footer">
			                     <button type="button" class="btn btn-dark" id="buildInfoAdd">등록</button>
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
					<h2>장비정보</h2>
					<ul class="nav navbar-right panel_toolbox">
						<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
						<li><a class="close-link"><i class="fa fa-close"></i></a></li>
					</ul>
					<div class="clearfix"></div>
				</div>
					<div class="x_content">
						 <!-- 정보입력 폼 끝-->	
						  <div class = "row marginB5" style="width:100%">
							  <div class="x_content">
									<div id="fcGrid"></div>
								</div>
							     </div>
							 <div class="modal-footer">
								 <button type="button" class="btn btn-primary" id="FcAppend">추가</button>
								 <button type="button" class="btn btn-danger" id="FcRemove">삭제</button>
			                     <button type="button" class="btn btn-dark" id="SetFc">등록</button>
			                 </div>
					</div>
				</div>
			</div>
						
	<div class="row">
		<div class="col-md-12 col-sm-12 col-xs-12">
			<div class="x_panel">
				<div class="x_title">
					<h2>에너지정보</h2>
					<ul class="nav navbar-right panel_toolbox">
						<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
						<li><a class="close-link"><i class="fa fa-close"></i></a></li>
					</ul>
					<div class="clearfix"></div>
				</div>
					<div class="x_content">
						<div id="energyGrid"></div>
						<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="EnergyAppend">추가</button>
						<button type="button" class="btn btn-danger" id="EnergyRemove">삭제</button>
                        <button type="button" class="btn btn-dark" id="EnergyPut">등록</button>
                    </div>
				</div>
			</div>
		</div>
	</div>
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="x_panel">
					<div class="x_title">
						<h2>온도설정 정보</h2>
						<ul class="nav navbar-right panel_toolbox">
							<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
							<li><a class="close-link"><i class="fa fa-close"></i></a></li>
						</ul>
						<div class="clearfix"></div>
					</div>
					<div class="x_content">
						<div id="setTempGrid"></div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" id="SetTempAppend">추가</button>
							<button type="button" class="btn btn-danger" id="SetTempRemove">삭제</button>
	                        <button type="button" class="btn btn-dark" id="SetTemp">등록</button>
	                    </div>
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
<script src="../static/vendors/toast/tui-code-snippet/dist/tui-code-snippet.js"></script>
<script src="../static/vendors/toast/tui-date-picker/dist/tui-date-picker.js"></script>
<script src="../static/vendors/toast/tui-grid/dist/tui-grid.js"></script>
<script src="../static/vendors/toast/tui-pagination/dist/tui-pagination.js"></script>
<script src="../static/vendors/toast/tui-time-picker/dist/tui-time-picker.js"></script>
<script src="../static/vendors/toast/tui-date-picker/dist/tui-date-picker.js"></script>
<!-- 우편번호 검색 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<!-- 다음 주소찾기 API-->
<script type="text/javascript">
$(document).on("click", "#btnAddrSearch, #btnAddrClear", function(e){
    e.preventDefault();
    
    var id = $(this).attr("id");
		// 우편번호 찾기 Icon
		if(id == "btnAddrSearch"){       
				    searchAddrPop();
				} else if(id == "btnAddrClear"){    // 우편번호 X Icon
					initializeAddr();
				} 
		});
		//주소 초기화 !!
		function initializeAddr(){
		    $("#zipCd").val("");
		    $("#addrDef").val("");
		}

 			//우편번호검색
            function searchAddrPop() {
                new daum.Postcode({
                    oncomplete: function(data) {
                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                        
                        // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                        var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                        var extraRoadAddr = ""; // 도로명 조합형 주소 변수
                        
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname != "" && /[동|로|가]$/g.test(data.bname)){
                            extraRoadAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName != "" && data.apartment == "Y"){
                           extraRoadAddr += (extraRoadAddr !== "" ? ", " + data.buildingName : data.buildingName);
                        }
                        // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraRoadAddr != ""){
                            extraRoadAddr = "(" + extraRoadAddr + ")";
                        }
                        // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                        if(fullRoadAddr != ""){
                            fullRoadAddr += extraRoadAddr;
                        }
                        
                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                        $("#zipCd").val(data.zonecode); //5자리 새우편번호 사용
                        $("#addrDef").val(fullRoadAddr); 
                    }
                }).open();
            }
   </script>
<!-- 메인 등록버튼 -->
<script type="text/javascript">
 $("#buildInfoAdd").click(function() {
	 if(confirm("등록 하시겠습니까?") == false) {
         return false;
     }
	 //기초정보 등록
	 var buildCode = $('#buildCode').val();
	 var buildName = $('#buildNm').val();
	 var zipCd = $('#zipCd').val();
	 var addrDef = $('#addrDef').val();	
	 
	 //가스/전력 소비량 등록
	 var gasWaterAmt = $('#gasWaterAmt').val();	
	 var pwrAmt = $('#pwrAmt').val();	
	 var pwrWaterAmt = $('#pwrWaterAmt').val();	
	 var pwrWaterAmt2 = $('#pwrWaterAmt2').val();	
	 var pwrTopAmt = $('#pwrTopAmt').val();	
	 var pwrAirAmt = $('#pwrAirAmt').val();	
	 
	 //예상 절감금액산정기준 등록
	 var gasInfo = $('#gasInfo').val();	
	 var pwrInfo = $('#pwrInfo').val();	
	 var AppDay = $('#AppDay').val();	
	 var AppMon = $('#AppMon').val();	
	
	 
	 
	 if(document.getElementById('buildNm').value == ""){
		    alert("건물명을 입력하시오.");
		    	$('#buildNm').focus();
		    return false;
		} 
	 if(document.getElementById('buildCode').value == ""){
		    alert("서비스코드를 입력하시오.");
		    	$('#buildCode').focus();
		    return false;
		} 
	 if(document.getElementById('zipCd').value == ""){
		    alert("우편번호를 입력하시오.");
		    return false;
		} 
	 if(document.getElementById('addrDef').value == ""){
		    alert("상세주소를 입력하시오.");
		    return false;
		} 
	 if(document.getElementById('gasWaterAmt').value == ""){
		    alert("가스소비량(냉온수기)을 입력하시오.");
		    $('#gasWaterAmt').focus();
		    return false;
		} 
	 if(document.getElementById('pwrAmt').value == ""){
		    alert("전력소비량(냉동기)를 입력하시오.");
		    $('#pwrAmt').focus();
		    return false;
		} 
	 if(document.getElementById('pwrWaterAmt').value == ""){
		    alert("전력소비량(냉수펌프)을 입력하시오.");
		    $('#pwrWaterAmt').focus();
		    return false;
		} 
	 if(document.getElementById('pwrWaterAmt2').value == ""){
		    alert("전력소비량(냉각수펌프)을 입력하시오.");
		    $('#pwrWaterAmt2').focus();
		    return false;
		} 
	 if(document.getElementById('pwrTopAmt').value == ""){
		    alert("전력소비량(냉각탑)을 입력하시오.");
		    $('#pwrTopAmt').focus();
		    return false;
		} 
	 if(document.getElementById('pwrAirAmt').value == ""){
		    alert("전력소비량(공조기)를 입력하시오.");
		    $('#pwrAirAmt').focus();
		    return false;
		} 
	 if(document.getElementById('gasInfo').value == ""){
		    alert("가스량을 입력하시오.");
		    $('#gasInfo').focus();
		    return false;
		} 
	 if(document.getElementById('pwrInfo').value == ""){
		    alert("전력량을 입력하시오.");
		    $('#pwrInfo').focus();
		    return false;
		} 
	 if(document.getElementById('AppDay').value == ""){
		    alert("적용기간을 입력하시오.");
		    $('#AppDay').focus();
		    return false;
		} 
	 if(document.getElementById('AppMon').value == ""){
		    alert("적용개월 수를 입력하시오.");
		    $('#AppMon').focus();
		    return false;
		} 
   
	//기초정보 등록
	 $.ajax({
				type:'POST',
				url : '/insertBaseInfo',
				data : {
						build_nm: buildName, 
						build_code :buildCode,
						zip_code: zipCd,
						address: addrDef,
						user:"${user.username}"
						},
				success : function(data){
					 if(data.code == '1') {
				        alert("등록완료.");
				         //기초정보 등록
					 	 $('#buildCode').val('');
						 $('#buildNm').val('');
						 $('#zipCd').val('');
					 	 $('#addrDef').val('');	
						 //가스/전력 소비량 등록
						 $('#gasWaterAmt').val('');	
						 $('#pwrAmt').val('');	
						 $('#pwrWaterAmt').val('');	
						 $('#pwrWaterAmt2').val('');	
						 $('#pwrTopAmt').val('');	
						 $('#pwrAirAmt').val('');	
						 //예상 절감금액산정기준 등록
						 $('#gasInfo').val('');	
						 $('#pwrInfo').val('');	
					 	 $('#AppDay').val('');	
						 $('#AppMon').val('');	
			        }
				},
				error: function(data){
				      alert('기초정보 부분 에러 관리자에게문의하시오.');
			    }
			});
  
	//가스/전력 소비량 등록
	 $.ajax({
			type:'POST',
			url : '/insertPriceInfo',
			data : {
					buildCd :buildCode,
					gasInfo: gasInfo,
					pwrInfo: pwrInfo,
					AppDay: AppDay,
					AppMon : AppMon,
					user:"${user.username}"
					},
			success : function(data){
				
				
			},
			error: function(data){
			      alert('가스/전력부분 에러 관리자에게문의하시오.');
		    }
		});
	 
	 //예상 절감금액산정기준 등록
	 $.ajax({
			type:'POST',
			url : '/insertGasInfo',
			data : {
					buildCd :buildCode,
					gasWaterAmt: gasWaterAmt,
					pwrAmt: pwrAmt,
					pwrWaterAmt : pwrWaterAmt,
					pwrWaterAmt2 : pwrWaterAmt2,
					pwrTopAmt : pwrTopAmt,
					pwrAirAmt : pwrAirAmt,
					user:"${user.username}"
					},
			success : function(data){
				
				
			},
			error: function(data){
			      alert('절감금액산정기준 부분에러 관리자에게문의하시오.');
		    }
		});
});
</script>

            
<!-- 장비정보  -->
<script type="text/javascript">
var fc = new tui.Grid({
	el : $('#fcGrid'), 
    bodyHeight: 200,
    rowHeaders: ['checkbox','rowNum'],
    rowHeight: 30,
    columnOptions: {
        width: 100
    },
	columns : [ 
	{
		title : '서비스코드',
		name : 'build_code',
		editOptions : {
			type : 'text',
			maxLength: 3,
			useViewMode : false
		}
	},
	{
		title : '장비구분',
		name : 'fc_gubun',
		editOptions : {
			type : 'text',
			maxLength: 10,
			useViewMode : false
		}
	},
	{
		title : '장비명',
		name : 'fc_nm',
		editOptions : {
			type : 'text',
			maxLength: 20,
			useViewMode : false
		}
	},
	{
		title : '냉동기용량(RT)',
		name : 'fc_amt',
		editOptions : {
			type : 'text',
			maxLength: 4,
			useViewMode : false
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
		title : '효율',
		name : 'efficiency',
		editOptions : {
			type : 'text',
			 maxLength: 4,
			useViewMode : false
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
	]
});

fc.use('Net', {
	initialRequest: false,
    perPage: 500,
    enableAjaxHistory: true,
    api: {
    	createData: '/insertFcInfo'
    }
 });

fc.on('beforeRequest', function(data) {
    }).on('response', function(data) {
    	alert(data.responseData.msg);
    	fc.clear();
});

var options = { checkedOnly: false,
				showConfirm:false};

//장비정보 추가 버튼
$("#FcAppend").click(function() {
	fc.appendRow();
});

$("#FcRemove").click(function() {
	fc.removeCheckedRows(false);
});

//등록
$("#SetFc").click(function() {
	var chkData = fc.validate();
	var chkNull = [];
    $.each(chkData, function(index, result) {
		chkNull += index;
	 }); 
	 if(confirm("등록 하시겠습니까?") == false) {
         return false;
     }
	 
	 if(fc.isModified() == false){
		 alert("입력된 데이터가 없습니다. 값을 입력해주세요.");	 
		 return false;
	 }
	 if(chkNull != ""){
		alert("필수 항목을 확인하세요.");
		return false;
	 }
	 
	 var net = fc.getAddOn('Net');
	 net.request('createData',options);
});
</script>
            
            
<!-- 에너지 정보  -->
<script type="text/javascript">
var energy = new tui.Grid({
    el: $('#energyGrid'), 
    scrollX: true,
    bodyHeight: 350,
    rowHeaders: ['checkbox','rowNum'],
    rowHeight: 30,
    columnOptions: {
        width: 100
    },
    columns: [
    	{
    		title : '서비스코드',
    		name : 'build_code',
    		width: 80,
    		editOptions : {
    			type : 'text',
    			maxLength: 3,
    			useViewMode : false
    		}
    	},
    	{
            title: '존그룹',
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
                      { text: '그룹10', value: '10' },
                      { text: '없음', value: '' }
                  ],
                  useViewMode: true
              }
        },
        {
            title: '층별',
            name: 'stage',
            width: 70,
            editOptions: {
                type: 'text',
                maxLength: 6,
                useViewMode: false
            }
        },
        {
            title: '장비명',
            name: 'equip_nm',
            editOptions: {
                type: 'text',
                maxLength: 10,
                useViewMode: false
            }
        },
        {
            title: '풍량-SA(CMH)',
            name: 'wind_sa',
            editOptions: {
                type: 'text',
                maxLength: 7,
                useViewMode: false
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
            title: '전력소비량-SA(kW)',
            name: 'sa_kw',
            editOptions: {
                type: 'text',
                maxLength: 6,
                useViewMode: false
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
            title: '풍량-RA(CMH)',
            name: 'wind_ra',
            editOptions: {
                type: 'text',
                maxLength: 7,
                useViewMode: false
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
            title: '전력소비량-RA(kW)',
            name: 'ra_kw',
            editOptions: {
                type: 'text',
                maxLength: 5,
                useViewMode: false
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
            title: '냉방능력(kcal/h)',
            name: 'cool_capacity',
            editOptions: {
                type: 'text',
                maxLength: 8,
                useViewMode: false
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
            title: '난방능력(kcal/h)',
            name: 'heat_capacity',
            editOptions: {
                type: 'text',
                maxLength: 8,
                useViewMode: false
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
            title: '공조면적(m2)',
            name: 'air_area',
            width: 70,
            editOptions: {
                type: 'text',
                maxLength: 6,
                useViewMode: false
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
            title: '층고(m)',
            name: 'floor_data',
            width: 70,
            editOptions: {
                type: 'text',
                maxLength: 4,
                useViewMode: false
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
            title: '연면적(m2)',
            name: 'side_area',
            width: 70,
            editOptions: {
                type: 'text',
                maxLength: 6,
                useViewMode: false
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
            title: '비고',
            name: 'etc',
            editOptions: {
                type: 'text',
                useViewMode: false
            }
        }
    ]
});

		energy.use('Net', {
			initialRequest: false,
		    perPage: 500,
		    enableAjaxHistory: true,
		    api: {
		        createData: '/insertEnergyInfo'
		    }
		 });
		
		energy.on('beforeRequest', function(data) {
		    }).on('response', function(data) {
		    	alert(data.responseData.msg);
		    	energy.clear();
		    });

		
		var options = { checkedOnly: false,
				showConfirm:false};
		//추가버튼
		$("#EnergyAppend").click(function() {
			energy.appendRow();
		});
		//삭제 버튼
		$("#EnergyRemove").click(function() {
			energy.removeCheckedRows(false);
		});
		
		$("#EnergyPut").click(function() {
		var chkData = energy.validate();
    	var chkNull = [];
        $.each(chkData, function(index, result) {
    		chkNull += index;
    	 }); 
		 if(confirm("등록 하시겠습니까?") == false) {
	         return false;
	     }
		 if(energy.isModified() == false){
			 alert("입력된 데이터가 없습니다. 값을 입력해주세요.");	 
			 return false;
		 }
		 if(chkNull != ""){
				alert("필수 항목을 입력하세요.");
				return false;
			 }
		  var net = energy.getAddOn('Net');
			net.request('createData',options);
		});
</script>
<!-- 설정온도  -->
<script type="text/javascript">
	var setTemp = new tui.Grid({
		el : $('#setTempGrid'), 
		scrollX: true,
	    bodyHeight: 350,
	    rowHeaders: ['checkbox','rowNum'],
	    rowHeight: 30,
	    columnOptions: {
	        width: 100
	    },
		columns : [ 
		{
			title : '서비스코드',
			name : 'build_code',
			editOptions : {
				type : 'text',
				maxLength: 3,
				useViewMode : false
			}
		}, {
			title : '층별명',
			name : 'stage',
			editOptions : {
				type : 'text',
				maxLength : 6,
				useViewMode : false
			}
		}, {
			title : '장비명',
			name : 'equip_nm',
			editOptions : {
				type : 'text',
				maxLength : 10,
				useViewMode : false
			}
		}, {
			title : '설정온도(℃)',
			name : 'set_temp_info',
			editOptions : {
				type : 'text',
				maxLength : 4,
				useViewMode : false
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
			title : '설정습도(℃)',
			name : 'set_humi_info',
			editOptions : {
				type : 'text',
				maxLength : 4,
				useViewMode : false
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
				title : '요율(냉방)',
				name : 'cool_per',
				editOptions : {
					type : 'text',
					maxLength : 4,
					useViewMode : false
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
				title : '요율(난방)',
				name : 'heat_per',
				editOptions : {
					type : 'text',
					maxLength : 4,
					useViewMode : false
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
				title : '비고',
				name : 'etc',
				editOptions : {
					type : 'text',
					useViewMode : false
				}
			}
		]
	});
	
	
	setTemp.use('Net', {
		initialRequest: false,
	    perPage: 500,
	    enableAjaxHistory: true,
	    withCredentials: true,
	    api: {
	        createData: '/insertSetTempGrid'
	    }
	 });

	setTemp.on('beforeRequest', function(data) {
	    }).on('response', function(data) {
	    	alert(data.responseData.msg);
	    	setTemp.clear();// 입력값 초기화
	});

	var options = { checkedOnly: false,
			showConfirm:false};
	
	//설정온도 추가버튼
	$("#SetTempAppend").click(function() {
		setTemp.appendRow();
	});
	
	$("#SetTempRemove").click(function() {
		setTemp.removeCheckedRows();
	});
	
	$("#SetTemp").click(function() {
		var chkData = setTemp.validate();
    	var chkNull = [];
        $.each(chkData, function(index, result) {
    		chkNull += index;
    	 }); 
		 if(confirm("등록 하시겠습니까?") == false) {
	         return false;
	     }
		 if(setTemp.isModified() == false){
			 alert("입력된 데이터가 없습니다. 값을 입력해주세요.");	 
			 return false;
		 }
		 if(chkNull != ""){
			alert("필수 항목을 입력하세요.");
			return false;
		 }
		 
		 var net = setTemp.getAddOn('Net');
		net.request('createData',options);
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
