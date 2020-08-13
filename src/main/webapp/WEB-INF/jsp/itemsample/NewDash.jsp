<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- toast grid link -->
<link rel="stylesheet" type="text/css"	href="../static/vendors/toast/tui-grid/dist/tui-grid.css" />
<link rel="stylesheet" type="text/css"	href="../static/vendors/sos_js/common/css/ad_solution.css" />
<link rel="stylesheet" type="text/css"	href="../static/vendors/bootstrap-timepicker/css/bootstrap-timepicker.min.css" />

<div class="right_col" role="main">
	<div class="row">
		<div class="col-md-12 col-sm-12 col-xs-12">
			<input type="hidden" id="reduce_day"> <input type="hidden"
				id="reduce_month">
			<div class="x_panel" style="background-color:#2f2e2e; border-color:#000000;">
				<div class="x_title">
					<h2 style=" font-size: 2.0em; color:#ffe200;">서비스 정보</h2>
					<ul class="nav navbar-right panel_toolbox">
						<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
						<li><a class="close-link"><i class="fa fa-close"></i></a></li>
					</ul>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">
					<!-- 정보입력 폼-->
					<div class="row marginB5" style="width: 100%">
						<div class="fl marginT8" style="width: 30%;">
							<span style="font-size:1.2em; color:#469eca;"  class="spanBTitle">
							&nbsp;기초정보</span>
						</div>
					</div>
					<div class="clearfix"></div>
					<div class="row table_form03 marginB10">
						<table>
							<colgroup>
								<col style="width: 15%;" />
								<col style="width: 35%;" />
								<col style="width: 15%;" />
								<col style="width: 35%;" />
							</colgroup>
							<tbody>
								<tr>
									<th class="ellipsis">건물명<span
										style="color: red; font-size: 13px;">&nbsp;*</span></th>
									<td style="background:#afafaf;" colspan="1"><select id=buildCode name="buildCode"
										class="_required" style="width: 50%;">
											<c:forEach items="${selectList}" var="databaseValue">
												<option value="${databaseValue.b_code}">
													${databaseValue.b_nm}</option>
											</c:forEach>
									</select></td>
									<th class="ellipsis">기준일 선택<span
										style="color: red; font-size: 13px;">&nbsp;*</span></th>
									<td style="background:#afafaf;" colspan="3">
										<div class='input-group date' id='myDatepicker2' style="width: 30%;">
											<input id="pickDate" type='text' class="_required" /> 
											<span class="input-group-addon"> <span class="glyphicon glyphicon-calendar"></span>
											</span>
										</div>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="clearfix"></div>

					<div class="row marginB5" style="width: 100%">
						<div class="fl marginT8" style="width: 30%;">
							<span style="font-size:1.2em; color:#469eca;" class="spanBTitle">&nbsp;실시간 정보</span>
						</div>
					</div>
					<div class="clearfix"></div>
					<div class="row table_form03 marginB10">
						<table>
							<colgroup>
								<col style="width: 10%;" />
								<col style="width: 10%;" />
								<col style="width: 10%;" />
								<col style="width: 10%;" />
								<col style="width: 10%;" />
								<col style="width: 10%;" />
								<col style="width: 10%;" />
								<col style="width: 10%;" />
								<col style="width: 10%;" />
								<col style="width: 10%;" />
							</colgroup>
							<tbody>
								<tr>
									<th class="ellipsis">설정온도(평균)</th>
									<td style="background:#afafaf;"><span id="setTempAvg" onKeyUp=calculationtest();></span>&nbsp;℃</td>
									<th class="ellipsis">기동전 실내온도</th>
									<td style="background:#afafaf;"><span id="avgTemp" onKeyUp=calculationtest();></span>&nbsp;℃</td>
									<th class="ellipsis">기동전 실내습도</th>
									<td style="background:#afafaf;"><span id="avgHumi"></span>&nbsp;%</td>
									<th>기동전 외기온도</th>
									<td style="background:#afafaf;"><input id="afterTemp" name="afterTemp" type="text"
										onchange="onChangeTest(this);" class="_required"
										maxlength="50" style="width: 50%;" />℃</td>
									<th>기동전 외기습도</th>
									<td style="background:#afafaf;"><input id="afterHumi" name="afterHumi" type="text"
										onchange="onChangeTest(this);"
										class="_required" maxlength="50"  style="width: 50%;" />%</td>
								</tr>
								<tr>
									<th class="ellipsis">최적가동시점</th>
									<td style="background:#afafaf;"><span id="bestTargetTime">&nbsp;</span></td>
									<th class="ellipsis">예상절감시간</th>
									<td style="background:#afafaf;"><span id="saveTime"></span></td>
									<th class="ellipsis">예상가동시간</th>
									<td style="background:#afafaf;">
										<!-- <input id="engineTargetMin" name="engineTargetMin"
										type="text" class="_required" maxlength="50"
										style="width: 50%;" /> --> <span id="engineTargetMin"></span>(min)
									</td>
									<th class="ellipsis">냉방목표시점<span
										style="color: red; font-size: 13px;">&nbsp;*</span></th>
									<td style="background:#afafaf;"><input id="coolTargetTime" name="coolTargetTime"
										onchange="onChangeEngineTargetMin(this);" type="text"
										class="_required" maxlength="50" style="width: 50%;" /></td>
									<th class="ellipsis">기존 가동시간<span
										style="color: red; font-size: 13px;">&nbsp;*</span></th>
									<td style="background:#afafaf;"><input id="baseTime" name="baseTime"
										onchange="onChangeSaveTime(this);" type="text"
										class="_required" maxlength="50" style="width: 50%;" /></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="clearfix"></div>
					<div class="modal-footer">
						<button type="button" class="btn btn-dark" id="setAutoRefreshYn" onclick="setAutoRefreshYn()">자동조회</button>
						<button type="button" class="btn btn-dark" id="targetSearch">조회</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12 col-sm-12 col-xs-12">
			<div class="x_panel" style="background-color:#2f2e2e; border-color:#000000;">
				<div class="x_title">
					<h2 style=" font-size: 2.0em; color:#ffe200;">온도 정보</h2>
					<ul class="nav navbar-right panel_toolbox">
						<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
						<li><a class="close-link"><i class="fa fa-close"></i></a></li>
					</ul>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">
					<div style='display: inline; width: 100%;'>
						<div id="tempInfoGrid"
							style="display: inline; float: left; width: 55%;"></div>
						<div id="setTempGrid"
							style="position: absolute; right: 0; width: 44%;"></div>
					</div>

					<div class="clearfix"></div>
					<div class="modal-footer">
						<button type="button" class="btn btn-dark" id="allOpen">일괄냉난방</button>
						<button type="button" class="btn btn-dark" id="allClose">일괄비냉난방</button>
						<button type="button" class="btn btn-primary" id="allOpened">전일기동</button>
						<button type="button" class="btn btn-primary" id="allClosed">전일휴무</button>
						<button type="button" class="btn btn-warning" id="setTempUpdate">저장</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12 col-sm-12 col-xs-12">
			<div class="x_panel" style="background-color:#2f2e2e; border-color:#000000;">
				<div class="x_title">
					<h2 style=" font-size: 2.0em; color:#ffe200;">절감비용 집계정보</h2>
					<ul class="nav navbar-right panel_toolbox">
						<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
						<li><a class="close-link"><i class="fa fa-close"></i></a></li>
					</ul>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">
					<div class="row marginB5" style="width: 100%">
						<div class="fl marginT8" style="width: 30%;">
							<span style="font-size:1.2em; color:#469eca;" class="spanBTitle">&nbsp;절감금액<small>(20일
									2.5개월 적용기준)</small></span>
						</div>
					</div>
					<div class="clearfix"></div>
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
									<th class="ellipsis">절감시간</th>
									<td style="background:#afafaf;"><span id="totalSaveTime"
										style="font-size:1.1em; color: #E74C3C; font-weight: bold;"></span>&nbsp;hour</td>
									<th class="ellipsis">절감금액(total)</th>
									<td style="background:#afafaf;"><span id="totalSave"
										style="font-size:1.1em; color: #E74C3C; font-weight: bold;" class="format-money"></span>&nbsp;원</td>
									<th class="ellipsis">예상절감금액(Year)</th>
									<td style="background:#afafaf;"><span id="yearTatalSave"
										style="font-size:1.1em; color: #E74C3C; font-weight: bold;" class="format-money"></span>&nbsp;원</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="row table_form02 fl" style="width: 50%;">
						<div class="row marginB5" style="width: 100%">
							<div class="fl marginT8" style="width: 30%;">
								<span style="font-size:1.2em; color:#469eca;" class="spanBTitle">&nbsp;전력 소비량</span>
							</div>
						</div>
						<div class="clearfix"></div>
						<div class="row table_form03 marginB10">
							<table>
								<colgroup>
									<col style="width: 20%;" />
									<col style="width: 30%;" />
									<col style="width: 20%;" />
									<col style="width: 30%;" />
								</colgroup>
								<tbody>
									<tr>
										<th class="ellipsis">Eectric(냉동기)</th>
										<td style="background:#afafaf;"><span id="pwr_amt_d"></span>&nbsp;kWh</td>
										<th class="ellipsis">절감량</th>
										<td style="background:#afafaf;"><span id="pwrSave"></span>&nbsp;kWh</td>
									</tr>
									<tr>
										<th class="ellipsis">Eectric(냉수펌프)</th>
										<td style="background:#afafaf;"><span id="pumpData"></span>&nbsp;kWh</td>
										<th class="ellipsis">전기에너지 단가</th>
										<td style="background:#afafaf;"><span id="pwr"></span>&nbsp;원/kWh</td>
									</tr>
									<tr>
										<th class="ellipsis">Eectric(냉각수펌프)</th>
										<td style="background:#afafaf;"><span id="pwr_amt_g_pump"></span>&nbsp;kWh</td>
										<th class="ellipsis">절감금액</th>
										<td style="background:#afafaf;"><span id="savePwrMoney" class="format-money"></span>&nbsp;원</td>
									</tr>
									<tr>
										<th class="ellipsis">Eectric(냉각탑)</th>
										<td style="background:#afafaf;"><span id="pwr_amt_top"></span>&nbsp;kWh</td>
									</tr>
									<tr>
										<th class="ellipsis">Eectric(공조기)</th>
										<td style="background:#afafaf;"><span id="pwr_amt_air"></span>&nbsp;kWh</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>

					<div class="row table_form03 fr" style="width: 49.5%;">
						<div class="row marginB5" style="width: 100%">
							<div class="fl marginT8" style="width: 100%;">
								<span style="font-size:1.2em; color:#469eca;" class="spanBTitle">가스 소비량<small>&nbsp;(가스사용량은
										실사용량 기준 평균 시간당 사용량 적용)</small></span>
							</div>
						</div>
						<div class="clearfix"></div>
						<div class="row table_form03 marginB10">
							<table>
								<colgroup>
									<col style="width: 20%;" />
									<col style="width: 30%;" />
									<col style="width: 20%;" />
									<col style="width: 30%;" />
								</colgroup>
								<tbody>
									<tr>
										<th class="ellipsis">GAS(냉온수기)</th>
										<td style="background:#afafaf;"><span id="gas_amt_o"></span>&nbsp;N㎥/h</td>
										<th class="ellipsis">절감량</th>
										<td style="background:#afafaf;"><span id="gasSave"></span>&nbsp;N㎥/h</td>
									</tr>
									<tr>
										<th class="ellipsis">절감금액</th>
										<td style="background:#afafaf;"><span id="saveGasMoney" class="format-money"></span>&nbsp;원</td>
										<th class="ellipsis">가스에너지 단가</th>
										<td style="background:#afafaf;"><span id="gas"></span>&nbsp;원/N㎥</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div id="popupOff" class="col-md-12 col-sm-12 col-xs-12">
			<div class="x_panel" style="background-color:#2f2e2e; border-color:#000000;">
				<div class="x_title">
					<h2 style=" font-size: 2.0em; color:#ffe200;">외기냉방</h2>
					<ul class="nav navbar-right panel_toolbox">
						<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
						<li><a class="close-link"><i class="fa fa-close"></i></a></li>
					</ul>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">
					<div class="row tile_count">
						<div class="col-md-2 col-sm-4 col-xs-5 tile_stats_count"
							style="width: 13.5%;">
							<span style="font-size:1.2em; color:#469eca;" class="count_top"><i class="fa fa-line-chart"></i>
								<strong>기동전 외기온도</strong></span>
							<div class="count" id="d_afterTemp"></div>
							℃
						</div>
						<div class="col-md-2 col-sm-4 col-xs-5 tile_stats_count"
							style="width: 13.5%;">
							<span style="font-size:1.2em; color:#469eca;" class="count_top"><i class="fa fa-line-chart"></i><strong>기동전
								외기습도</strong></span>
							<div class="count" id="d_afterHumi"></div>
							%
						</div>
						<div class="col-md-2 col-sm-4 col-xs-5 tile_stats_count"
							style="width: 13.5%;">
							<span style="font-size:1.2em; color:#469eca;" class="count_top"><i class="fa fa-line-chart"></i>
								<strong>실내온도</strong></span>
							<div class="count" id="getTemp" onchange="onChangeInside(this);"></div>
							%
						</div>
						<div class="col-md-2 col-sm-4 col-xs-5 tile_stats_count"
							style="width: 13.5%;">
							<span style="font-size:1.2em; color:#469eca;" class="count_top"><i class="fa fa-line-chart"></i>
								<strong>실내습도</strong></span>
							<div class="count" id="getHumi"></div>
							%
						</div>
						<div class="col-md-2 col-sm-4 col-xs-5 tile_stats_count"
							style="width: 13.5%;">
							<span style="font-size:1.2em; color:#469eca;" class="count_top"><i class="fa fa-tachometer"></i>
								<strong>외기 온,습도</strong></span>
							<div class="count" id="outsideKcalData"></div>
							kcal/kg
						</div>
						<div class="col-md-2 col-sm-4 col-xs-5 tile_stats_count"
							style="width: 13.5%;">
							<span style="font-size:1.2em; color:#469eca;" class="count_top"><i class="fa fa-tachometer"></i><strong>실내
								온,습도</strong></span>
							<div class="count" id="insideKcalData"></div>
							kcal/kg
						</div>
						<div class="col-md-2 col-sm-4 col-xs-5 tile_stats_count"
							style="width: 13.5%;">
							<span style="font-size:1.2em; color:#469eca;" class="count_top"><i class="fa fa-building"></i><strong>
								외기냉방 Y/N</strong></span>
							<div class="count red" id="SwitchOn"></div>
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
<script	src="../static/vendors/toast/tui-code-snippet/dist/tui-code-snippet.js"></script>
<script	src="../static/vendors/toast/tui-date-picker/dist/tui-date-picker.js"></script>
<script src="../static/vendors/toast/tui-grid/dist/tui-grid.js"></script>
<script	src="../static/vendors/toast/tui-pagination/dist/tui-pagination.js"></script>
<script	src="../static/vendors/toast/tui-time-picker/dist/tui-time-picker.js"></script>
<!-- date-timepicker -->
<script type="text/javascript"	src="../static/vendors/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$('#popupOff').slideUp();//페이지오픈시 닫아
	$('#targetSearch').trigger('click');//페이지오픈시 조회부터
});
</script>
<script type="text/javascript">
var Now = new Date();
var NowTime = Now.getFullYear();
NowTime += '.' + (Now.getMonth()+1);
NowTime += '.' + Now.getDate();

$('#pickDate').val(NowTime);
</script>

<!-- 기동전 실내온도 -->
<script type="text/javascript">
	var tempInfoGrid = new tui.Grid({
		el : $('#tempInfoGrid'), 
		scrollX: true,
	    bodyHeight: 350,
	    rowHeaders: ['rowNum'],
	    rowHeight: 30,
	    columnOptions: {
	        width: 100
	    },
		columns : [ 
		{
			title : '날짜',
			name : 'set_date',
			sortable: true,
			align: 'center',
			width: 150
		},	
		{
			title : '층별',
			align: 'center',
			name : 'stage'
		}, {
			title : '장비명',
			align: 'center',
			name : 'machine'
		}, {
			title : 'N(℃)',
			align: 'center',
			name : 'result_temp1',
			width: 70
		}, {
			title : 'E(℃)',
			align: 'center',
			name : 'result_temp2',
			width: 70
		},{
			title : 'W(℃)',
			align: 'center',
			name : 'result_temp3',
			width: 70
		},{
			title : 'S(℃)',
			align: 'center',
			name : 'result_temp4',
			width: 70
		},{
			title : 'Center(℃)',
			align: 'center',
			name : 'result_temp5'
		}
	],
		summary : {
			height : 40,
			position : 'bottom',
			columnContent : {
				machine : {
					template : function(valueMap) {
					return  '평균온도 : '
					}
				},
				result_temp1 : {
					template : function(valueMap) {
						return   valueMap.avg.toFixed(1);
					}
				},
				result_temp2 : {
					template : function(valueMap) {
						return  valueMap.avg.toFixed(1);
					}
				},
				result_temp3 : {
					template : function(valueMap) {
						return   valueMap.avg.toFixed(1);
					}
				},
				result_temp4 : {
					template : function(valueMap) {
						return valueMap.avg.toFixed(1);
					}
				},
				result_temp5 : {
					template : function(valueMap) {
						return  valueMap.avg.toFixed(1);
					}
				}
			}
		}
	});
	
	tempInfoGrid.use('Net', {
		initialRequest: false,
	    perPage: 500,
	    enableAjaxHistory: true,
	    withCredentials: true,
	    api: {
	        updateData: '/udtGeneralInfo'
	    }
	 });
	
	tempInfoGrid.on('beforeRequest', function(data) {
	    }).on('response', function(data) {
	    	alert(data.responseData.msg);
	    	$('#targetSearch').click();
    });
	
	   var options = { checkedOnly: false,
				showConfirm:false};
	    
	    $("#tempUpdate").click(function() {
			 if(confirm("저장 하시겠습니까?") == false) {
		         return false;
		     }
			 var net = tempInfoGrid.getAddOn('Net');
			net.request('updateData',options);
		});
</script>

<script type="text/javascript">
	var setTempGrid = new tui.Grid({
		el : $('#setTempGrid'), 
		scrollX: true,
	    bodyHeight: 350,
	    rowHeight: 30,
	    columnOptions: {
	        width: 100
	    },
		columns : [ 
		{
			title : '층별',
			align: 'center',
			name : 'stage'
		},
		{
			title : '설정온도(℃)',
			name : 'temp_info',
			editOptions : {
				type : 'text',
				maxLength : 4,
				useViewMode : true
			}
			/* validation: {
		        dataType: 'number',
	        	required: true
		      } */
		},
		
		 {
			title : '설정습도(℃)',
			name : 'humi_info',
			editOptions : {
				type : 'text',
				maxLength : 4,
				useViewMode : true
			}
			/* validation: {
		        dataType: 'number',
	        	required: true
		      } */
		}, 
		{
			title : '냉난방/비냉난방',
			name : 'yn_temp',
			editOptions : {
				type : 'select',
				listItems : [ 
				{
					text : '선택없음',
					value : ''
				},{
					text : '냉난방',
					value : '1'
				}, {
					text : '비냉난방',
					value : '0'
				}
				],
				useViewMode : true
			}
		},
		{
			title : '전일휴무',
			align: 'center',
			name : 'yesterday_yn',
			editOptions : {
				type : 'select',
				listItems : [ {
					text : '전일휴무',
					value : '1.2'
				}, {
					text : '전일냉난방',
					value : '1'
				}]
			}
		}
		],
		summary : {
			height : 40,
			position : 'bottom',
			columnContent : {
				temp_info : {
					template : function(valueMap) {
						return  valueMap.avg.toFixed(1);
					}
				},
				humi_info : {
					template : function(valueMap) {
						return   valueMap.avg.toFixed(1);
					}
				}				
			}
		}
	});
	
	setTempGrid.use('Net', {
		initialRequest: false,
	    perPage: 500,
	    enableAjaxHistory: true,
	    withCredentials: true,
	    api: {
	        updateData: '/udtSetInfo'
	    }
	 });
    
    setTempGrid.on('beforeRequest', function(data) {
    	
	    }).on('response', function(data) {
	    	
	    	alert(data.responseData.msg);
	    	$('#targetSearch').click();
	    	
    });
    
    var options = { checkedOnly: false,
			showConfirm:false};
    
    $("#setTempUpdate").click(function() {
    	var chkData = setTempGrid.validate();
    	var chkNull = [];
        $.each(chkData, function(index, result) {
    		chkNull += index;
    	 }); 
    	
		 if(confirm("저장 하시겠습니까?") == false) {
	         return false;
	     }
		 if(setTempGrid.isModified() == false){
			 alert("변경된 데이터가 없습니다.");	 
			return false;
 		 }
		 if(chkNull != ""){
			alert("필수 항목을 확인하세요.");
			return false;
		 }
		 
		var net = setTempGrid.getAddOn('Net');
		net.request('updateData',options);
		
		var buildCode = $('#buildCode').val();
		var pickDate = $('#pickDate').val();
		var seqData = setTempGrid.getColumnValues('seq');
		
	if(seqData !=""){
		for(var i=0; i < seqData.length; i++){
		equip_nm = setTempGrid.getValue(i,'machine');
		floor = setTempGrid.getValue(i,'stage');
			  $.ajax({
				type:'POST',
				dataType:'JSON',
				url : '/rtDataResult',
				data : {
						build_code: buildCode, 
						search_date: pickDate,
						seq : seqData[i],
						equip_nm : equip_nm, //장비명
			 			floor : floor    //층별
						},
				success : function(data){
					
				},
				error : function (request,status,error){
					 alert("RT산출쪽 에러발생");
				}
			});  
		}
	}
	});
</script>


<script type="text/javascript">
$(document).on("click","#targetSearch",function(){
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
	
		$('#gas_amt_o').html("");//가스 냉온수기
		$('#pwr_amt_d').html("");//냉동기
		$('#pumpData').html(""); //냉수퍼프
		$('#pwr_amt_g_pump').html("");//냉각수펌프
		$('#pwr_amt_top').html("");//냉각탑
		$('#pwr_amt_air').html("");//공조기
		
		$('#reduce_day').html("");
		$('#reduce_mon').html("");
		$('#gas').html(""); //계절별 온도에따라 값설정해줘야함 추후
		$('#pwr').html(""); //계절별 온도에따라 값설정해줘야함 추후
		
		$('#avgTemp').html("");
		$('#avgHumi').html("");
		$('#getTemp').html("");
		$('#getHumi').html("");
		$('#insideKcalData').html("");
		
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
				
				$('#gas_amt_o').html(result.chw_gas_amt);//가스 냉온수기
				$('#pwr_amt_d').html(result.frz_pwr_amt);//냉동기
				$('#pumpData').html(result.cwp_pwr_amt); //냉수퍼프
				$('#pwr_amt_g_pump').html(result.clp_pwr_amt);//냉각수펌프
				$('#pwr_amt_top').html(result.ct_pwr_amt);//냉각탑
				$('#pwr_amt_air').html(result.air_pwr_amt);//공조기
				$('#reduce_day').val(result.reduce_day);
				$('#reduce_month').val(result.reduce_month);
				
				$('#gas').html(result.gas_price_hot); //계절별 온도에따라 값설정해줘야함 추후
				$('#pwr').html(result.pwr_price_0); //계절별 온도에따라 값설정해줘야함 추후
			 	
				if(result.temp_flag == 1){
					$('#popupOff').slideDown(); 
				}else{
					$('#popupOff').slideUp();
				}
			
			});
		},
		error : function (request,status,error){
			 alert("에러발생");
		}
	});
	 
	    
	 // 실내온도 정보
	    $.ajax({
	    	type:'POST',
			url : '/selectGeneralInfo',
			data : {
				build_code: buildCode,
				search_date: pickDate
				},
			dataType:"json",
			success:function(result){
				tempInfoGrid.setData(result.data);
			},
			error:function(result){
				tempInfoGrid.clear();
			}
		});	
	 
	 
	 // 설정온도 평균정보
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
				
				function average(array) {
					  var sum = 0.0;
					  var arrLength = array.length;
					  for (var i = 0; i < arrLength; i++){
					    sum += array[i];
						}
					  return sum / arrLength;
					}
				var avg =  setTempGrid.getColumnValues('temp_info');
				var setAvg =  average(avg).toFixed(1);
				document.getElementById('setTempAvg').innerHTML = setAvg;
			},
			error:function(result){
				setTempGrid.clear();
				document.getElementById('setTempAvg').innerHTML = '';
			}
		});	
	 	
	 
	 	//기동전 실내온도
	   var promise1 =  $.ajax({
	    	type:'POST',
			url : '/avgTempList',
			data : {
				build_code: buildCode,
				search_date: pickDate
				},
				dataType:"json",
			success:function(json){
			 var avg = new Array();
			 //값만 추출
				for(var key in json[0]){
					avg.push(json[0][key]);
				}
			 //평균산출
				function average(array) {
					  var sum = 0.0;
					  var arrLength = array.length;
					  for (var i = 0; i < arrLength; i++){
					    sum += array[i];
						}
					  return sum / arrLength;
					}
				var setAvg =  average(avg).toFixed(1);
				
				if(setAvg == "NaN"){
					setAvg = 0
					}
						
				//해당영역에 set
				document.getElementById('avgTemp').innerHTML = setAvg;
				document.getElementById('getTemp').innerHTML = setAvg;
			},
			error:function(data){
				document.getElementById('avgTemp').innerHTML = '';
			}
		});	
	    
	 	//기동전 실내습도
	  var promise = $.ajax({
	    	type:'POST',
			url : '/avgHumiList',
			data : {
				build_code: buildCode,
				search_date: pickDate
				},
				dataType:"json",
			success:function(json){
			 var avg = new Array();
			//json배열 내 리스트 값만 추출
				for(var key in json[0]){
					avg.push(json[0][key]);
				}
			//평균값 산출
				function average(array) {
					  var sum = 0.0;
					  var arrLength = array.length;
					  for (var i = 0; i < arrLength; i++){
					    sum += array[i];
						}
					  return sum / arrLength;
					}
				var setAvg =  average(avg).toFixed(1);
				
				if(setAvg == "NaN"){
					setAvg = 0
					}
				//해당영역 입력
				document.getElementById('avgHumi').innerHTML = setAvg;
				document.getElementById('getHumi').innerHTML = setAvg;
				//실내온,습도 연산 결과
				
			},
			error:function(data){
				document.getElementById('avgHumi').innerHTML = '';
			}
		});	
	 	
	   
	 	//rt산출값, 전일냉방, 설정한rt값
	     $.ajax({
	    	type:'POST',
			url : '/rtTotalData',
			data : { 
					 build_code: buildCode,
				   	 search_date: pickDate
					},
			dataType:"json",
			success:function(data){
				
				var est_time;
				var result_rt;
				var base_rt;
				var yesterday_yn;
				
				$.each(data, function(index, result) {
					 result_rt = result.result_rt;
					 base_rt = result.base_rt;
					 yesterday_yn = result.yesterday_yn;
				});
				
				est_time = 60 * ( result_rt / (base_rt * 0.92)) * yesterday_yn;
				if(isNaN(est_time)){
					document.getElementById('engineTargetMin').innerHTML = 0;
				}else{
					document.getElementById('engineTargetMin').innerHTML = est_time.toFixed(1);
				}
			},
			error:function(data){
				alert("산출에러발생");
			}
		}); 
	 	Promise.all([promise,promise1]).then(function(values){
				backTimeData();
	 	});
	});
</script>



<script type="text/javascript">
function calculationtest(){
	var x = document.getElementById('avgTemp').innerHTML;
	var y = document.getElementById('setTemapAvg').innerHTML;
	eval(s.x) - eval(s.y);
	var xy = eval("x * y");
	
	document.write(xy);
}
</script>


<script type="text/javascript">
$("#allOpen").click(function() {
	 if(confirm("일괄냉난방처리 하시겠습니까?") == false) {
        return false;
    }
	setTempGrid.setColumnValues('yn_temp','1');
	
});

$("#allClose").click(function() {
	 if(confirm("일괄비냉난방처리 하시겠습니까?") == false) {
        return false;
    }
	setTempGrid.setColumnValues('yn_temp','0');
});

$("#allOpened").click(function() {
	 if(confirm("전일냉난방처리 하시겠습니까?") == false) {
       return false;
   }
	setTempGrid.setColumnValues('yesterday_yn','1');
});

$("#allClosed").click(function() {
	 if(confirm("전일휴무처리 하시겠습니까?") == false) {
        return false;
    }
	setTempGrid.setColumnValues('yesterday_yn','1.2');
});
</script>

<!-- 시간 선택 옵션 -->
<script type="text/javascript">
	//냉방목표시간
	$('#coolTargetTime').timepicker({
		 minuteStep: 1,
         template: 'modal',
         appendWidgetTo: 'body',
         showSeconds: false,
         showMeridian: false,
         defaultTime: false
	});
	
	//기존가동시간
	$('#baseTime').timepicker({
		 minuteStep: 1,
         template: 'modal',
         appendWidgetTo: 'body',
         showSeconds: false,
         showMeridian: false,
         defaultTime: false
	});
</script>

<!-- 기동전 외기온,습도 산출 -->
<script type="text/javascript">
function onChangeTest(textbox) {
	var temp = document.getElementById("afterTemp").value;
	var humi = document.getElementById("afterHumi").value;
	var data1 = ((-0.0052653348-0.00062202171*temp+0.03788993*humi+0.00003756779*Math.pow(temp,2)-0.00000126819*Math.pow(humi,2)+0.0016741451*temp*humi)/(1-0.030664741*temp-0.00011389447*humi+0.00028884007*Math.pow(temp,2)+0.00000038884*Math.pow(humi,2)-0.00000325535*temp*humi))/1000;
	var result = (0.24*temp)+((597.3+(0.441*temp))*data1.toFixed(4));
	document.getElementById('d_afterHumi').innerHTML = humi;
	document.getElementById('d_afterTemp').innerHTML = temp;
	document.getElementById('outsideKcalData').innerHTML = result.toFixed(2);
	
	LastOnOffSwitch();//외기냉방 사용유무 로직
}
</script>

<!-- 실내 온,습도 -->
<script type="text/javascript">
function backTimeData(){
	//실내 온, 습도
	var temp = document.getElementById("avgTemp").innerHTML; 
	var humi = document.getElementById("avgHumi").innerHTML; 
	var data1 = ((-0.0052653348-0.00062202171* temp +0.03788993* humi +0.00003756779*Math.pow(temp,2)-0.00000126819*Math.pow(humi,2)+0.0016741451*temp*humi)/(1-0.030664741*temp-0.00011389447*humi+0.00028884007*Math.pow(temp,2)+0.00000038884*Math.pow(humi,2)-0.00000325535*temp*humi))/1000;
	var result = (0.24*temp)+((597.3+(0.441* temp))*data1.toFixed(4));
	document.getElementById('insideKcalData').innerHTML = result.toFixed(2);
		
		LastOnOffSwitch();//외기냉방 사용유무 로직
 	}
</script>

<script type="text/javascript">
//외기냉방 사용유무 로직
function LastOnOffSwitch(){
var outsideTemp = document.getElementById('d_afterTemp').innerHTML;
var outsideMix = document.getElementById('outsideKcalData').innerHTML;
var insideMix = document.getElementById('insideKcalData').innerHTML;
	
	if(outsideTemp == "" || outsideMix == "" || insideMix == ""){
		$("#SwitchOn").text("");
	}else{
		if(outsideTemp < 23.5){
			if((insideMix - outsideMix) > 0){
					$("#SwitchOn").text("가능");
				}else{
					$("#SwitchOn").text("불가");
			} 
		}else{
			$("#SwitchOn").text("불가");
		}
	}
}
</script>

<!-- 최적가동시점 -->
<script type="text/javascript">
	function onChangeEngineTargetMin(textbox) {
		var coolTargetTime  = document.getElementById("coolTargetTime").value; //냉방목표시점
		var engineTargetMin  = document.getElementById("engineTargetMin").innerHTML; //예상가동시간
		var test =	coolTargetTime.split(':');
		//최적가동시점 산출
		var targetTime=(Number(test[0])*60)+Number(test[1])-engineTargetMin
		//산출값 시간으로 변환
		var myNum = parseInt(targetTime, 10);
		var hours   = Math.floor(myNum / 60);
	    var minutes = Math.floor((myNum - (hours * 60)));
	    if (hours   < 10) {hours   = "0"+hours;}
	    if (minutes < 10) {minutes = "0"+minutes;}
	    //최적기동 산출결과 넣기
        var result = hours+':'+minutes
	    document.getElementById('bestTargetTime').innerHTML = result
	}
</script>

<script type="text/javascript">
	//예상절감시간 (최적 - 기존가동)
	function onChangeSaveTime(textbox){
		var baseTime = textbox.value; //기존가동시간
		var bestTargetTime1 = document.getElementById("bestTargetTime").innerHTML;
		var s_baseTime = baseTime.split(':');
		var s_bestTargetTime = bestTargetTime1.split(':');
		var resultBase = Number(s_baseTime[0]*60)+Number(s_baseTime[1])
		var resultBest = Number(s_bestTargetTime[0]*60)+Number(s_bestTargetTime[1])
		var last = resultBest-resultBase
		var myNum = parseInt(last, 10);
		var hours   = Math.floor(myNum / 60);
	    var minutes = Math.floor((myNum - (hours * 60)));
	    if (hours   < 10) {hours   = "0"+hours;}
	    if (minutes < 10) {minutes = "0"+minutes;}
	   
	    var saveTimeData =  hours+':'+minutes
	    //예상절감시간
	   if(saveTimeData.match(/-/)){
		   alert('최적가동시점보다 값이 큽니다.');
			   $('#baseTime').val('');
			   $('#baseTime').focus();
		   return false;
	   }else{
		   document.getElementById('saveTime').innerHTML=  saveTimeData
	   }  
	 	// 합산절감시간
		var SavingTime =  (last/60).toFixed(2); 
		if(isNaN(SavingTime)){
			document.getElementById('totalSaveTime').innerHTML = 0;
		}else{
			document.getElementById('totalSaveTime').innerHTML = SavingTime;
		}
		
		var gas_amt = document.getElementById('gas_amt_o').innerHTML;
		//절감량 = 가스소비량 *절감시간
		var gasSave =  gas_amt * SavingTime
		if(isNaN(gasSave)){
			document.getElementById('gasSave').innerHTML = 0;
		}else{
			document.getElementById('gasSave').innerHTML = gasSave.toFixed(1);
		}
		
		//절감량 = 전기소비량 * 절감시간
		var pwr_amt_d =  document.getElementById('pwr_amt_d').innerHTML 
		var pumpData =  document.getElementById('pumpData').innerHTML 
		var pwr_amt_g_pump =  document.getElementById('pwr_amt_g_pump').innerHTML 
		var pwr_amt_top =  document.getElementById('pwr_amt_top').innerHTML 
		var pwr_amt_air =  document.getElementById('pwr_amt_air').innerHTML 
		var pwrSave = (Number(pwr_amt_d) + Number(pumpData) + Number(pwr_amt_g_pump) + Number(pwr_amt_top) + Number(pwr_amt_air)) * SavingTime
		
		if(isNaN(pwrSave)){
			document.getElementById('pwrSave').innerHTML = 0;
		}else{
			document.getElementById('pwrSave').innerHTML = pwrSave.toFixed(1);
		}
		
		
		var pwr =  document.getElementById('pwr').innerHTML;//전력
		var gas =  document.getElementById('gas').innerHTML;//가스
		//절감금액=절감량*에너지단가
		var saveGasMoney = (gasSave* gas).toFixed(0); 
		var savePwrMoney = (pwrSave * pwr).toFixed(0); 
		//천단위 포맷 변경 펑션
		Number.prototype.format = function(){
		    if(this==0) return 0;
		
		    var reg = /(^[+-]?\d+)(\d{3})/;
		    var n = (this + '');
		
		    while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
		
		    return n;
		};
		// 문자열 타입에서 쓸 수 있도록 format() 함수 추가
		String.prototype.format = function(){
		    var num = parseFloat(this);
		    if( isNaN(num) ) return "0";
		
		    return num.format();
		};
		//합산절감금액
		var totalSave =  Number(saveGasMoney) + Number(savePwrMoney)
		if(isNaN(totalSave)){
			document.getElementById('totalSave').innerHTML = 0;
		}else{
			document.getElementById('totalSave').innerHTML =  totalSave.format();
		}
		
		//년간예상절감금액DB에 저장된 적용기간 적용개월수 가져와야함
		var day = $('#reduce_day').val();
		var month = $('#reduce_month').val();
		//개월 * 기간* ()
		var LastData = (Number(month) * Number(day)*(Number(totalSave))).toFixed(0);
		
		document.getElementById('saveGasMoney').innerHTML = saveGasMoney.format(); 
		document.getElementById('savePwrMoney').innerHTML = savePwrMoney.format();
		document.getElementById('yearTatalSave').innerHTML  = LastData.format();
	}
</script>

<!-- 자동실행기능 -->
<script type="text/javascript">
var autoRefreshYn = "N"; //기준지역변수

function setAutoRefreshYn() {
    if (autoRefreshYn == "N") {
        if(!confirm("자동 새로고침 설정을 ON으로 변경하시겠습니까?")) {
            return;
        }
        
        autoRefreshYn = "Y";
        autoRefresh = setInterval(function() {
			alert("잘작동중임.");        	
            $('#targetSearch').trigger('click');
        }, 20000); // 20초 간격으로 리스트 검색
    } else {
        if(!confirm("자동 새로고침 설정을 OFF로 변경하시겠습니까?")) {
            return;
        }
        autoRefreshYn = "N";
        clearInterval(autoRefresh);
    }
}
</script>

<script type="text/javascript">
tui.Grid.applyTheme("default", {
	 grid: {
  	   background: '#3a3a3a',
  	   border: '#000000',
  	   text: '#444'
  		  },
  		  selection: {
  		      background: '#585858',
  		      border: '#004082'
  		  },
  		  toolbar: {
  		      border: '#000000',
  		      background: '#262930'
  		  },
  		  scrollbar: {
  		      background: '#262930',
  		      thumb: '#000000',
  		      emptySpace: '#262930',
  		      active: '#c1c1c1'
  		  },
  		  cell: {
  	   normal: {
  	       background: '#3a3a3a',
  	       border: '#000000',
  	       text: '#fff'
  	   },
  	   head: {
  	       background: '#262930',
  	       border: '#000000',
  	       text:'#E7E7E7'
  	   },
  	   rowHead: {
  	       background: '#262930',
  	       border: '#000000',
  	       text: '#fff'
  	   },
  	   summary: {
  	       background: '#262930',
  	       border: '#000000',
  	       text: '#fff'
  	   },
  	   editable: {
  	       background: '#3a3a3a',
  	       border: '#fff',
  	       text: '#fff'
  	   },
  	   selectedHead: {
  	       background: '#616161'
  	   },
  	   selectedRowHead: {
  	       background: '#616161'
  	   },
  	   focused: {
  	       border: '#FFBF00'
  	   },
  	   disabled: {
  	      background: '#3a3a3a',
  	      border: '#000000',
  	      text: '#fff'
  	   },
  	   currentRow: {
  	       background: '#2F0B3A'
  	   }
  	  }
});
</script>

<!-- 테스트용 설정온도 저장 버튼에 이식하였음 -->
<!-- <script type="text/javascript">
		$("#testButton").click(function() {
			var buildCode = $('#buildCode').val();
			var pickDate = $('#pickDate').val();
			var seqData = setTempGrid.getColumnValues('seq');
			var equip_nm = "";
			var floor = "";
			
			if(seqData !=""){
				for(var i=0; i<seqData.length; i++) {
					equip_nm = setTempGrid.getValue(i,'machine');
					floor = setTempGrid.getValue(i,'stage');
				 $.ajax({
					type:'POST',
					dataType:'JSON',
					url : '/rtDataResult',
					data : {
							build_code: buildCode, 
							search_date: pickDate,
							seq : seqData[i],
				 			equip_nm : equip_nm, //장비명
				 			floor : floor    //층별
							},
					success : function(data){
						
					},
					error : function (request,status,error){
						 alert("RT산출쪽 에러발생");
					}
					});
				}
			}
		});
</script>
 -->