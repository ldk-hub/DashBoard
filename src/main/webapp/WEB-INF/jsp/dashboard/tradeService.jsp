<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>

<!-- Toast Grid -->
<link rel="stylesheet" type="text/css"	href="../static/vendors/toast/tui-pagination/dist/tui-pagination.css" />
<link rel="stylesheet" type="text/css"	href="../static/vendors/toast/tui-date-picker/dist/tui-date-picker.css" />
<link rel="stylesheet" type="text/css"	href="../static/vendors/toast/tui-time-picker/dist/tui-time-picker.css" />
<link rel="stylesheet" type="text/css"	href="../static/vendors/toast/tui-grid/dist/tui-grid.css" />


<!-- Styles -->
<style>
#chartdiv {
  width: 100%;
  height: 280px;
}

#demoChart {
  width: 100%;
  height: 280px;
}

#stockBuyHoga {
 height: 363px;
}
</style>


<div class="right_col" role="main">
<input id="hiddenName" type="hidden" value="비트코인">
<input id="hiddenCode" type="hidden" value="BTC">	
<input id="hiddenPrice" type="hidden" value="0">
	
	<div class="col-md-5 col-sm-5 col-xs-12"
			style="position: relative; z-index: 0;">
	<div class="row"></div>
			<div class="x_panel">
				<div class="x_title">
					<strong id="stockCoinName" style=" font-size:25px; color:#000;"></strong><Strong id="stockCoinPrice" style="color:#d9534f"></Strong><Strong style="color:#000">KRW</Strong> 
				</div>
				<div class="x_content" style="color:#000">
					<!-- 여기  api 넣기 -->
					<div id="stockBuyHoga" style="position: relative;">
					 <div class="row">
					<table>
					<tbody>
						<tr> 
							<td style="text-align: center; font-size:19px;"  width=400><p><strong style="margin: 30px;">가격</strong></p></td>
						     <td style="text-align: center; font-size:19px;"  width=400><p><strong style="margin: 30px;">수량</strong></p></td>
						</tr>
						<tr> 
							<td style=" text-align: center; margin: 30px; color:#337ab7; font-size:17px;"  width=400 id="sellhoga"></td>
						     <td style="text-align: center; margin: 30px; font-size:17px;"  width=400 id="sellresidual"></td>
						</tr>
					</tbody>
					</table>
					</div>
					<!-- <div id="sellhoga" style="color:#d9534f; padding: 0px 10px 0px 20px; float:left;">test</div>
					<div id="sellresidual" style="float:left;">test</div> -->
					
						<div class="clearfix"></div>
						<div id="stockCoinPrice2" style="text-align: center; color:#d9534f; font-weight: 800; font-size:28px;"></div>
						<div class="clearfix"></div>
					
				 <div class="row">
					<table>
					<tbody>
						<tr> 
							<td style="text-align: center; color: #d9534f; font-size:17px;"  width=400 id="buyhoga"></td>
						     <td style="text-align: center; margin: 30px; font-size:17px;"  width=400 id="buyresidual"></td>
						</tr>
					</tbody>
					</table>
					</div>
					
					<!-- <div id="buyhoga" style="text-align: center; padding: 0px 10px 0px 0px; color: #337ab7; float:left;">test</div> 
					<div id="buyresidual" style="text-align: center; float:left;">test</div>  -->
							
						</div>
					<div id="stockSellHoga"></div>
				</div>
			</div>
		
		<div class="row"></div>
				<div class="x_panel">
					<div class="x_title">
						<h2 style="font-size:25px; color:#000; font-weight: bold;">체결현황</h2>
						<div class="clearfix"></div>
					</div>
					<div class="x_content">
						 <div id="realTimeStockData"></div>
					</div>
				</div>
		
	</div>
	
		
		
		
		<div class="col-md-4 col-sm-4 col-xs-12" style="position: relative; z-index: 0;">
			<div class="x_panel" >
				<div class="x_title">
					<h2 style="font-size:25px; color:#000; font-weight: bold;">종목리스트</h2>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">
					<div id="totalStockList"></div>
				</div>
			</div>
			
			<div class="row"></div>
			<div class="x_panel">
				<div class="x_title">
					<h2 style="font-size:25px; color:#000; font-weight: bold;">미니차트</h2>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">
					 <div id="chartdiv"></div>
				</div>
			</div>
		</div>



	<div class="col-md-3 col-sm-3 col-xs-12"
		style="position: relative; z-index: 0;">
		<div class="x_panel">
			<div class="x_title">
				<!-- <h2 style="color: #c3f400">매수/매도처리</h2> -->
				<h2 style="font-size: 25px; color: #000; font-weight: bold;">매수/매도처리</h2>
				<div class="clearfix"></div>
			</div>

			<div class="x_content" style="color: #000">
				<ul class="nav nav-pills nav-justified"
					style="background-color: #8a99b99e;">
					<li class="active"><a data-toggle="tab" href="#home" style="color: #fff;">매수</a></li>
					<li><a data-toggle="tab" href="#menu1" style="color: #fff;">매도</a></li>
				</ul>

				<div class="tab-content">
					<div id="home" class="tab-pane fade in active">
						<div class="field item form-group" style="padding: 10px;">
							<label
								class="col-form-label col-md-4 col-sm-4 col-xs-4  label-align">코인명<span
								class="required">:</span></label>
							<div class="col-md-8 col-sm-8">
								<input class="form-control" id="buycoinName" type="text"
									class='text' name="text" required='required'
									placeholder="종목을 클릭하세요." readonly>
							</div>
						</div>
						<div class="clearfix"></div>
						<div class="field item form-group" style="padding: 10px;">
							<label
								class="col-form-label col-md-4 col-sm-4 col-xs-4  label-align">코인코드<span
								class="required">:</span></label>
							<div class="col-md-8 col-sm-8">
								<input class="form-control" id="buycoinCode" type="text"
									class='text' name="text" required='required'
									placeholder="종목을 클릭하세요." readonly>
							</div>
						</div>
						<div class="clearfix"></div>
						<div class="field item form-group" style="padding: 10px;">
							<label
								class="col-form-label col-md-4 col-sm-4 col-xs-4 num_only num_sum label-align">주문가격<span
								class="required">:</span></label>
							<div class="col-md-8 col-sm-8">
								<input class="form-control" id="buyPrice" type="number"
									class='number' name="number" placeholder="0"
									required='required'>
							</div>
						</div>
						<div class="clearfix"></div>
						<div class="field item form-group" style="padding: 10px;">
							<label
								class="col-form-label col-md-4 col-sm-4 col-xs-4 num_only num_sum label-align">수량<span
								class="required">:</span></label>
							<div class="col-md-8 col-sm-8">
								<input class="form-control" id="buystockCnt" type="number"
									class='number' name="number" placeholder="0"
									required='required'>
							</div>
						</div>
						<div class="clearfix"></div>

						<div class="field item form-group" style="padding: 10px;">
							<label
								class="col-form-label col-md-4 col-sm-4 col-xs-4 num_only num_sum label-align">주문총액<span
								class="required">:</span></label>
							<div class="col-md-8 col-sm-8">
								<input class="form-control" id="buytotalMoney" type="text"
									class='text' name="text" value="0" required='required' readonly>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="clearfix"></div>
						<div class="modal-footer">
							<button type="button" id="buyStockBtn"
								class="btn btn-round btn-danger" style="WIDTH: 50%">매수</button>
							<button type="button" id="returnBtn"
								class="btn btn-round btn-dark" style="WIDTH: 30%;">초기화
							</button>
						</div>
					</div>

					<div id="menu1" class="tab-pane fade">


						<div class="field item form-group" style="padding: 10px;">
							<label
								class="col-form-label col-md-4 col-sm-4 col-xs-4  label-align">코인명<span
								class="required">:</span></label>
							<div class="col-md-8 col-sm-8">
								<input class="form-control" id="sellcoinName" type="text"
									class='text' name="text" required='required'
									placeholder="종목을 클릭하세요." readonly>
							</div>
						</div>
						<div class="clearfix"></div>
						<div class="field item form-group" style="padding: 10px;">
							<label
								class="col-form-label col-md-4 col-sm-4 col-xs-4  label-align">코인코드<span
								class="required">:</span></label>
							<div class="col-md-8 col-sm-8">
								<input class="form-control" id="sellcoinCode" type="text"
									class='text' name="text" required='required'
									placeholder="종목을 클릭하세요." readonly>
							</div>
						</div>
						<div class="clearfix"></div>
						<div class="field item form-group" style="padding: 10px;">
							<label
								class="col-form-label col-md-4 col-sm-4 col-xs-4 num_only  num_sum label-align">주문가격<span
								class="required">:</span></label>
							<div class="col-md-8 col-sm-8">
								<input class="form-control" id="sellPrice" type="number"
									class='number' name="number"  placeholder="0" required='required'>
							</div>
						</div>
						<div class="clearfix"></div>
						<div class="field item form-group" style="padding: 10px;">
							<label
								class="col-form-label col-md-4 col-sm-4 col-xs-4 num_only num_sum  label-align">수량<span
								class="required">:</span></label>
							<div class="col-md-8 col-sm-8">
								<input class="form-control" id="sellstockCnt" type="number"
									class='number' name="number" placeholder="0" required='required'>
							</div>
						</div>
						<div class="clearfix"></div>

						<div class="field item form-group" style="padding: 10px;">
							<label
								class="col-form-label col-md-4 col-sm-4 col-xs-4 num_only num_sum label-align">주문총액<span
								class="required">:</span></label>
							<div class="col-md-8 col-sm-8">
								<input class="form-control" id="selltotalMoney" type="number"
									class='text' name="text" required='required' value="0" readonly>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="clearfix"></div>
						<div class="modal-footer">
							<button type="button" id="sellStockBtn"
								class="btn btn-round btn-primary" style="WIDTH: 50%">매도</button>
							<button type="button" id="returnBtn"
								class="btn btn-round btn-dark" style="WIDTH: 30%;">초기화
							</button>
						</div>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>

		<div class="row"></div>
		<div class="x_panel">
			<div class="x_title">
				<h2 style="font-size: 25px; color: #000; font-weight: bold;">체결강도차트</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<div id="demoChart"></div>
			</div>
		</div>
	</div>
	<div class="clearfix"></div>
</div>





<!-- tui-grid -->
<script src="../static/vendors/toast/tui-code-snippet/dist/tui-code-snippet.js"></script>
<script	src="../static/vendors/toast/tui-pagination/dist/tui-pagination.js"></script>
<script	src="../static/vendors/toast/tui-date-picker/dist/tui-date-picker.min.js"></script>
<script	src="../static/vendors/toast/tui-time-picker/dist/tui-time-picker.min.js"></script>
<script src="../static/vendors/toast/tui-grid/dist/tui-grid.js"></script>

<!-- 스윗알럿2 -->
<script src="../static/vendors/sweetalert2/dist/sweetalert2.all.min.js"></script>

<!-- Resources -->
<script src="../static/vendors/amcharts4/core.js"></script>
<script src="../static/vendors/amcharts4/charts.js"></script>
<script src="../static/vendors/amcharts4/themes/material.js"></script>
<script src="../static/vendors/amcharts4/themes/animated.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	 hogaStockInfofunc();
	 stockTransaction();
	 grid1.sort('strTime',false,false);
});

//주기적
setInterval(function(){
	hogaStockInfofunc();
	stockTransaction();
	grid1.sort('strTime',false,false);
}, 15000);
</script>


<!-- 매수입력창 자동계산 처리 -->
<script type="text/javascript">
		const grid1 = new tui.Grid({
		el : document.getElementById('realTimeStockData'),
			  data : {
				api : {
					readData : {
						url : '/StockInfo',
						method : 'GET',
						initParams:{param: 'MTC'},
					}
				}
			},  
	      rowHeight: 30,
	      bodyHeight : 250,
	      header: {
	        height: 40
	      },
	      columns: [
    	  	{
	          header: '숨김처리예정',
	          name: 'side',
	        },
	        {
	          header: '체결시간',
	          name: 'strTime',
	          align: 'center',
	          sortable: true , 
	          sortingType: 'desc'
	        },
	        {
	          header: '체결가격',
	          name: 'price',
	          align: 'right'
	        },
	        {
	          header: '체결량',
	          name: 'amount',
	          align: 'center'
	        },
	        {
	          header: '체결금액',
	          name: 'strTotal',
	          align: 'right'
	        },
	      ],
	   });
		
 </script>
 
 <script type="text/javascript"> 
//종목별 거래 체결 내역 리스트 갱신
function stockTransaction(){
	 $.ajax({
			type : 'GET',
			url : '/StockInfo',
			dataType : "json",
			data : {
						"param" : document.getElementById('hiddenCode').value,
					},
			success : function(data) {
				grid1.clear();
				grid1.resetData(data.data.contents);
				grid1.sort('strTime',false,false);
			}
		});
	} 

</script>

<script> 
	const grid2 = new tui.Grid({
		el : document.getElementById('totalStockList'),
			data : {
				api : {
					readData : {
						url : '/coinList',
						method : 'POST'
					}
				}
			},
	      rowHeight: 30,
	      bodyHeight : 318,
	      header: {
	        height: 40
	      },
	      columns: [
	        {
	          header: '종목명',
	          name: 'coin_name',
	          align: 'center'
	        },
	        {
	          header: '-숨김처리-',
	          name: 'coin_code'
	        },
	        {
	          header: '현재가',
	          name: 'stock_count',
	          align: 'right',
	          sortable : true
	        },
	        {
	          header: '전일대비',
	          name: 'stock_price',
	          align: 'center',
	          sortable : true,
	        },
	        {
	          header: '거래대금',
	          name: 'stock_price',
	          align: 'right',
	          sortable : true
	        }
	      ],
	    });
	
	
	//클릭시 로직태우기
	grid2.on('mousedown', function(ev) {
		 grid1.clear();
	    //매수쪽데이터
	    $('#buycoinCode').val(grid2.getValue(ev.rowKey,'coin_code'));
	    $('#buycoinName').val(grid2.getValue(ev.rowKey,'coin_name'));
	    //히든 데이터
	    $('#hiddenName').val(grid2.getValue(ev.rowKey,'coin_name'));
	    $('#hiddenCode').val(grid2.getValue(ev.rowKey,'coin_code'));
	    $('#hiddenPrice').val(grid2.getValue(ev.rowKey,'stock_count'));
	    //매도쪽데이터
	    $('#sellcoinCode').val(grid2.getValue(ev.rowKey,'coin_code'));
	    $('#sellcoinName').val(grid2.getValue(ev.rowKey,'coin_name'));
	    
	    hogaStockInfofunc();
	    stockTransaction();
	    
	});
	
	//그리드 헤더버튼-> 사이드바 사이즈 축소 때 그리드 깨지는 현상 리프레시 기능
	$(document).on('click', '#menu_toggle', function() {
		grid1.refreshLayout();
		grid2.refreshLayout();
	});
	
	//히든값 처리할 컬럼 숨겼음
	grid1.hideColumn('side');
	grid2.hideColumn('name');
</script>



<!--매수 매도 자동연산 처리-->
<script> 
$("#buyPrice, #buystockCnt").on('keyup',function(){
            var sum1 = parseInt($("#buyPrice").val() || 0 ); 
            var sum2 = parseInt($("#buystockCnt").val() || 0);
            var sum = sum1 * sum2;
            $("#buytotalMoney").val(sum);
        });
$("#sellPrice, #sellstockCnt").on('keyup',function(){
         var sum1 = parseInt($("#sellPrice").val() || 0 ); 
         var sum2 = parseInt($("#sellstockCnt").val() || 0);
         var sum = sum1 * sum2;
         $("#selltotalMoney").val(sum);
     });
</script>

<!-- 매수 버튼 액션 -->
<script type="text/javascript">
	$(document).on("click", "#buyStockBtn", function() {
		
	var price = document.getElementById('buyPrice').value;
	var stockCnt = document.getElementById('buystockCnt').value;
	var coinName = document.getElementById('buycoinName').value;
	var coinCode = document.getElementById('buycoinCode').value;
	
		if(coinName == ''){
			Swal.fire({
				  icon: 'error',
				  title: '종목을 선택하시오.',
				});
			return false;
		}
		
		if(coinCode == ''){
			Swal.fire({
				  icon: 'error',
				  title: '종목을 선택하시오.',
				});
			
			return false;
		}
	
	   if(price == ''){
			Swal.fire({
				  icon: 'error',
				  title: '가격입력하시오.',
				});
			
			return false;
		}
		if(stockCnt == ''){
			Swal.fire({
				  icon: 'error',
				  title: '수량입력하시오.',
				});
			
			return false;
		}
		
	$.ajax({
			type : 'POST',
			url : '/buyStock',
			dataType : "json",
			data : {
						"buyStockName" : coinCode,
						"buyStock" : price,
						"buyStockCnt" : stockCnt,
						"totalBuyStock" : document.getElementById('buytotalMoney').value
					},
			success : function(data) {
				hogaStockInfofunc();
				
				grid2.reloadData();
				Swal.fire({
					position : 'top-end',
					icon : 'success',
					title : '매수가 완료되었습니다.',
					showConfirmButton : false,
					timer : 1000
				});
				
				 $('#sellPrice').val('');
				 $('#sellstockCnt').val('');
				 $('#selltotalMoney').val('');
				 $('#sellcoinName').val('');
				 $('#sellcoinCode').val('');
				 $('#buyPrice').val('');
				 $('#buystockCnt').val('');
				 $('#buycoinCode').val('');
				 $('#buycoinName').val('');
				 $('#buytotalMoney').val('');
				 stockTransaction();
			}
			
		});
	});

	//매도 버튼  주문
	$(document).on("click", "#sellStockBtn", function() {
		var sellPrice = document.getElementById('sellPrice').value;
		var sellStockCnt = document.getElementById('sellstockCnt').value;
		var sellCoinName = document.getElementById('sellcoinName').value;
		var sellCoinCode = document.getElementById('sellcoinCode').value;
		
		if(sellCoinName == ''){
			Swal.fire({
				  icon: 'error',
				  title: '종목을 선택하시오.',
				});
			
			
			return false;
		}
		
		if(sellCoinCode == ''){
			Swal.fire({
				  icon: 'error',
				  title: '종목을 선택하시오.',
				});
			
			return false;
		}
	  
		if(sellPrice == ''){
			Swal.fire({
				  icon: 'error',
				  title: '가격입력하시오.',
				});
			
			return false;
		}
		
		if(sellStockCnt == ''){
			Swal.fire({
				  icon: 'error',
				  title: '수량입력하시오.',
				});
			
			return false;
		}
		
		$.ajax({
			type : 'POST',
			url : '/sellStock',
			dataType : "json",
			data : {
						"sellStockName" : sellCoinCode,
						"sellStock" : sellPrice,
						"sellStockCnt" : sellStockCnt,
						"totalSellStock" : document.getElementById('selltotalMoney').value 
					},
			success : function(data) {
				hogaStockInfofunc();
				
				 grid2.reloadData();
				Swal.fire({
					position : 'top-end',
					icon : 'success',
					title : '매도가 완료되었습니다.',
					showConfirmButton : false,
					timer : 1000
				});
				
				 $('#sellPrice').val('');
				 $('#sellstockCnt').val('');
				 $('#selltotalMoney').val('');
				 $('#sellcoinName').val('');
				 $('#sellcoinCode').val('');
				 $('#buycoinCode').val('');
				 $('#buyPrice').val('');
				 $('#buystockCnt').val('');
				 $('#buycoinName').val('');
				 $('#buytotalMoney').val('');
				 stockTransaction();
			}
					
			/* ,error:function(request,status,error){
			    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			    
			} */
		});
	});

	//초기화 버튼 
	$(document).on("click", "#returnBtn", function() {
		 $('#sellPrice').val('');
		 $('#sellstockCnt').val('');
		 $('#selltotalMoney').val('');
		 $('#sellcoinName').val('');
		 $('#sellcoinCode').val('');
		 $('#buycoinCode').val('');
		 $('#buyPrice').val('');
		 $('#buystockCnt').val('');
		 $('#buycoinName').val('');
		 $('#buytotalMoney').val('');
		 
		Swal.fire({
			position : 'top-end',
			icon : 'info',
			title : '입력값 초기화 완료.',
			showConfirmButton : false,
			timer : 600
		});
	});
	
	
	
	//데이터 뿌리는 영역
	function hogaStockInfofunc(){
		$.ajax({
			type : 'GET',
			url : '/hogaStockInfo',
			dataType : "json",
			data : {
						"HiddenCoinName" : document.getElementById('hiddenName').value,
						"HiddenStockCode" : document.getElementById('hiddenCode').value,
						"HiddenstockCoinPrice": document.getElementById('hiddenPrice').value,
					},
			success : function(result) {
				$('#buyhoga').empty();
				$('#buyresidual').empty();
				$('#sellhoga').empty();
				$('#sellresidual').empty();
				grid2.reloadData();
				$('#stockCoinName').html(result.HiddenCoinName);
				$('#stockCoinPrice').html(result.HiddenstockCoinPrice);
				$('#stockCoinPrice2').html(result.HiddenstockCoinPrice);
					for(var i=0; i<5; i++){
						if(result.stockBuyHoga[i]){
							console.log(result.stockBuyHoga[i]);
						$('#buyhoga').append(result.stockBuyHoga[i].hoga + "<br>");
						$('#buyresidual').append(result.stockBuyHoga[i].residual+ "<br>");
						}
						
						if(result.stockSellHoga[i]){
							console.log(result.stockSellHoga[i]);
						$('#sellhoga').append(result.stockSellHoga[i].hoga+ "<br>");
						$('#sellresidual').append(result.stockSellHoga[i].residual+ "<br>");
						}
					}
					
			}
		});
	}
</script>

<!-- 그리드 컬러 커스터마이징 -->
<script type="text/javascript">
 tui.Grid.applyTheme('clean', {
	 setSelectionRange : {
			background : '#A4A4A4',
			border : '#004082'
		},
		toolbar : {
			border : '#000000',
			background : '#262930'
		},
		selection : {
			background : '#4daaf9',
			border : '#004082'
		},
		scrollbar: {
		    background: '#fff',
		    thumb: '#8a99b99e',
		    active: '#8a99b99e'
		  },
		cell : {
			normal : {
				background : '#fff',
				text : '#000',
			},
			header : {
				background : '#8a99b99e',
				text : '#000000'
			},
			selectedHeader : {
				background : '#616161'
			},
			selectedRowHeader : {
				background : '#616161'
			},
			focused : {
				border : '#FFBF00'
			},
			disabled : {
				background : '#3a3a3a',
				text : '#fff'
			},
		}
}); 
</script>


<!-- Chart code -->
<script>
am4core.ready(function() {

// Themes begin
am4core.useTheme(am4themes_animated);
// Themes end

var chart = am4core.create("chartdiv", am4charts.XYChart);
chart.paddingRight = 20;

chart.dateFormatter.inputDateFormat = "yyyy-MM-dd";

var dateAxis = chart.xAxes.push(new am4charts.DateAxis());
dateAxis.renderer.grid.template.location = 0;

var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
valueAxis.tooltip.disabled = true;

var series = chart.series.push(new am4charts.CandlestickSeries());
series.dataFields.dateX = "date";
series.dataFields.valueY = "close";
series.dataFields.openValueY = "open";
series.dataFields.lowValueY = "low";
series.dataFields.highValueY = "high";
series.simplifiedProcessing = true;
series.tooltipText = "Open:${openValueY.value}\nLow:${lowValueY.value}\nHigh:${highValueY.value}\nClose:${valueY.value}";

chart.cursor = new am4charts.XYCursor();

// a separate series for scrollbar
var lineSeries = chart.series.push(new am4charts.LineSeries());
lineSeries.dataFields.dateX = "date";
lineSeries.dataFields.valueY = "close";
// need to set on default state, as initially series is "show"
lineSeries.defaultState.properties.visible = false;

// hide from legend too (in case there is one)
lineSeries.hiddenInLegend = true;
lineSeries.fillOpacity = 0.5;
lineSeries.strokeOpacity = 0.5;

var scrollbarX = new am4charts.XYChartScrollbar();
scrollbarX.series.push(lineSeries);
chart.scrollbarX = scrollbarX;

chart.data = [ {
    "date": "2011-08-01",
    "open": "136.65",
    "high": "136.96",
    "low": "134.15",
    "close": "136.49"
  }, {
    "date": "2011-08-02",
    "open": "135.26",
    "high": "135.95",
    "low": "131.50",
    "close": "131.85"
  }, {
    "date": "2011-08-05",
    "open": "132.90",
    "high": "135.27",
    "low": "128.30",
    "close": "135.25"
  }, {
    "date": "2011-08-06",
    "open": "134.94",
    "high": "137.24",
    "low": "132.63",
    "close": "135.03"
  }, {
    "date": "2011-08-07",
    "open": "136.76",
    "high": "136.86",
    "low": "132.00",
    "close": "134.01"
  }, {
    "date": "2011-08-08",
    "open": "131.11",
    "high": "133.00",
    "low": "125.09",
    "close": "126.39"
  }, {
    "date": "2011-08-09",
    "open": "123.12",
    "high": "127.75",
    "low": "120.30",
    "close": "125.00"
  }, {
    "date": "2011-08-12",
    "open": "128.32",
    "high": "129.35",
    "low": "126.50",
    "close": "127.79"
  }, {
    "date": "2011-08-13",
    "open": "128.29",
    "high": "128.30",
    "low": "123.71",
    "close": "124.03"
  }, {
    "date": "2011-08-14",
    "open": "122.74",
    "high": "124.86",
    "low": "119.65",
    "close": "119.90"
  }, {
    "date": "2011-08-15",
    "open": "117.01",
    "high": "118.50",
    "low": "111.62",
    "close": "117.05"
  }, {
    "date": "2011-08-16",
    "open": "122.01",
    "high": "123.50",
    "low": "119.82",
    "close": "122.06"
  }, {
    "date": "2011-08-19",
    "open": "123.96",
    "high": "124.50",
    "low": "120.50",
    "close": "122.22"
  }, {
    "date": "2011-08-20",
    "open": "122.21",
    "high": "128.96",
    "low": "121.00",
    "close": "127.57"
  }, {
    "date": "2011-08-21",
    "open": "131.22",
    "high": "132.75",
    "low": "130.33",
    "close": "132.51"
  }, {
    "date": "2011-08-22",
    "open": "133.09",
    "high": "133.34",
    "low": "129.76",
    "close": "131.07"
  }, {
    "date": "2011-08-23",
    "open": "130.53",
    "high": "135.37",
    "low": "129.81",
    "close": "135.30"
  }, {
    "date": "2011-08-26",
    "open": "133.39",
    "high": "134.66",
    "low": "132.10",
    "close": "132.25"
  }, {
    "date": "2011-08-27",
    "open": "130.99",
    "high": "132.41",
    "low": "126.63",
    "close": "126.82"
  }, {
    "date": "2011-08-28",
    "open": "129.88",
    "high": "134.18",
    "low": "129.54",
    "close": "134.08"
  }, {
    "date": "2011-08-29",
    "open": "132.67",
    "high": "138.25",
    "low": "132.30",
    "close": "136.25"
  }, {
    "date": "2011-08-30",
    "open": "139.49",
    "high": "139.65",
    "low": "137.41",
    "close": "138.48"
  }, {
    "date": "2011-09-03",
    "open": "139.94",
    "high": "145.73",
    "low": "139.84",
    "close": "144.16"
  }, {
    "date": "2011-09-04",
    "open": "144.97",
    "high": "145.84",
    "low": "136.10",
    "close": "136.76"
  }, {
    "date": "2011-09-05",
    "open": "135.56",
    "high": "137.57",
    "low": "132.71",
    "close": "135.01"
  }, {
    "date": "2011-09-06",
    "open": "132.01",
    "high": "132.30",
    "low": "130.00",
    "close": "131.77"
  }, {
    "date": "2011-09-09",
    "open": "136.99",
    "high": "138.04",
    "low": "133.95",
    "close": "136.71"
  }, {
    "date": "2011-09-10",
    "open": "137.90",
    "high": "138.30",
    "low": "133.75",
    "close": "135.49"
  }, {
    "date": "2011-09-11",
    "open": "135.99",
    "high": "139.40",
    "low": "135.75",
    "close": "136.85"
  }, {
    "date": "2011-09-12",
    "open": "138.83",
    "high": "139.00",
    "low": "136.65",
    "close": "137.20"
  }, {
    "date": "2011-09-13",
    "open": "136.57",
    "high": "138.98",
    "low": "136.20",
    "close": "138.81"
  }, {
    "date": "2011-09-16",
    "open": "138.99",
    "high": "140.59",
    "low": "137.60",
    "close": "138.41"
  }, {
    "date": "2011-09-17",
    "open": "139.06",
    "high": "142.85",
    "low": "137.83",
    "close": "140.92"
  }, {
    "date": "2011-09-18",
    "open": "143.02",
    "high": "143.16",
    "low": "139.40",
    "close": "140.77"
  }, {
    "date": "2011-09-19",
    "open": "140.15",
    "high": "141.79",
    "low": "139.32",
    "close": "140.31"
  }, {
    "date": "2011-09-20",
    "open": "141.14",
    "high": "144.65",
    "low": "140.31",
    "close": "144.15"
  }, {
    "date": "2011-09-23",
    "open": "146.73",
    "high": "149.85",
    "low": "146.65",
    "close": "148.28"
  }, {
    "date": "2011-09-24",
    "open": "146.84",
    "high": "153.22",
    "low": "146.82",
    "close": "153.18"
  }, {
    "date": "2011-09-25",
    "open": "154.47",
    "high": "155.00",
    "low": "151.25",
    "close": "152.77"
  }, {
    "date": "2011-09-26",
    "open": "153.77",
    "high": "154.52",
    "low": "152.32",
    "close": "154.50"
  }, {
    "date": "2011-09-27",
    "open": "153.44",
    "high": "154.60",
    "low": "152.75",
    "close": "153.47"
  }, {
    "date": "2011-09-30",
    "open": "154.63",
    "high": "157.41",
    "low": "152.93",
    "close": "156.34"
  }, {
    "date": "2011-10-01",
    "open": "156.55",
    "high": "158.59",
    "low": "155.89",
    "close": "158.45"
  }, {
    "date": "2011-10-02",
    "open": "157.78",
    "high": "159.18",
    "low": "157.01",
    "close": "157.92"
  }, {
    "date": "2011-10-03",
    "open": "158.00",
    "high": "158.08",
    "low": "153.50",
    "close": "156.24"
  }, {
    "date": "2011-10-04",
    "open": "158.37",
    "high": "161.58",
    "low": "157.70",
    "close": "161.45"
  }, {
    "date": "2011-10-07",
    "open": "163.49",
    "high": "167.91",
    "low": "162.97",
    "close": "167.91"
  }, {
    "date": "2011-10-08",
    "open": "170.20",
    "high": "171.11",
    "low": "166.68",
    "close": "167.86"
  }, {
    "date": "2011-10-09",
    "open": "167.55",
    "high": "167.88",
    "low": "165.60",
    "close": "166.79"
  }, {
    "date": "2011-10-10",
    "open": "169.49",
    "high": "171.88",
    "low": "153.21",
    "close": "162.23"
  }, {
    "date": "2011-10-11",
    "open": "163.01",
    "high": "167.28",
    "low": "161.80",
    "close": "167.25"
  }, {
    "date": "2011-10-14",
    "open": "167.98",
    "high": "169.57",
    "low": "163.50",
    "close": "166.98"
  }, {
    "date": "2011-10-15",
    "open": "165.54",
    "high": "170.18",
    "low": "165.15",
    "close": "169.58"
  }, {
    "date": "2011-10-16",
    "open": "172.69",
    "high": "173.04",
    "low": "169.18",
    "close": "172.75"
  }];

}); // end am4core.ready()
</script>




<!-- Chart code -->
<script>
am4core.ready(function() {

// Themes begin
am4core.useTheme(am4themes_material);
am4core.useTheme(am4themes_animated);
// Themes end

var chart = am4core.create("demoChart", am4charts.XYChart);
chart.hiddenState.properties.opacity = 0;

chart.padding(0, 0, 0, 0);

chart.zoomOutButton.disabled = true;

var data = [];
var visits = 10;
var i = 0;

for (i = 0; i <= 30; i++) {
    visits -= Math.round((Math.random() < 0.5 ? 1 : -1) * Math.random() * 10);
    data.push({ date: new Date().setSeconds(i - 30), value: visits });
}

chart.data = data;

var dateAxis = chart.xAxes.push(new am4charts.DateAxis());
dateAxis.renderer.grid.template.location = 0;
dateAxis.renderer.minGridDistance = 30;
dateAxis.dateFormats.setKey("second", "ss");
dateAxis.periodChangeDateFormats.setKey("second", "[bold]h:mm a");
dateAxis.periodChangeDateFormats.setKey("minute", "[bold]h:mm a");
dateAxis.periodChangeDateFormats.setKey("hour", "[bold]h:mm a");
dateAxis.renderer.inside = true;
dateAxis.renderer.axisFills.template.disabled = true;
dateAxis.renderer.ticks.template.disabled = true;

var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
valueAxis.tooltip.disabled = true;
valueAxis.interpolationDuration = 500;
valueAxis.rangeChangeDuration = 500;
valueAxis.renderer.inside = true;
valueAxis.renderer.minLabelPosition = 0.05;
valueAxis.renderer.maxLabelPosition = 0.95;
valueAxis.renderer.axisFills.template.disabled = true;
valueAxis.renderer.ticks.template.disabled = true;

var series = chart.series.push(new am4charts.LineSeries());
series.dataFields.dateX = "date";
series.dataFields.valueY = "value";
series.interpolationDuration = 500;
series.defaultState.transitionDuration = 0;
series.tensionX = 0.8;

chart.events.on("datavalidated", function () {
    dateAxis.zoom({ start: 1 / 15, end: 1.2 }, false, true);
});

dateAxis.interpolationDuration = 500;
dateAxis.rangeChangeDuration = 500;

document.addEventListener("visibilitychange", function() {
    if (document.hidden) {
        if (interval) {
            clearInterval(interval);
        }
    }
    else {
        startInterval();
    }
}, false);

// add data
var interval;
function startInterval() {
    interval = setInterval(function() {
        visits =
            visits + Math.round((Math.random() < 0.5 ? 1 : -1) * Math.random() * 5);
        var lastdataItem = series.dataItems.getIndex(series.dataItems.length - 1);
        chart.addData(
            { date: new Date(lastdataItem.dateX.getTime() + 1000), value: visits },
            1
        );
    }, 1000);
}

startInterval();

// all the below is optional, makes some fancy effects
// gradient fill of the series
series.fillOpacity = 1;
var gradient = new am4core.LinearGradient();
gradient.addColor(chart.colors.getIndex(0), 0.2);
gradient.addColor(chart.colors.getIndex(0), 0);
series.fill = gradient;

// this makes date axis labels to fade out
dateAxis.renderer.labels.template.adapter.add("fillOpacity", function (fillOpacity, target) {
    var dataItem = target.dataItem;
    return dataItem.position;
})

// need to set this, otherwise fillOpacity is not changed and not set
dateAxis.events.on("validated", function () {
    am4core.iter.each(dateAxis.renderer.labels.iterator(), function (label) {
        label.fillOpacity = label.fillOpacity;
    })
})

// this makes date axis labels which are at equal minutes to be rotated
dateAxis.renderer.labels.template.adapter.add("rotation", function (rotation, target) {
    var dataItem = target.dataItem;
    if (dataItem.date && dataItem.date.getTime() == am4core.time.round(new Date(dataItem.date.getTime()), "minute").getTime()) {
        target.verticalCenter = "middle";
        target.horizontalCenter = "left";
        return -90;
    }
    else {
        target.verticalCenter = "bottom";
        target.horizontalCenter = "middle";
        return 0;
    }
})

// bullet at the front of the line
var bullet = series.createChild(am4charts.CircleBullet);
bullet.circle.radius = 5;
bullet.fillOpacity = 1;
bullet.fill = chart.colors.getIndex(0);
bullet.isMeasured = false;

series.events.on("validated", function() {
    bullet.moveTo(series.dataItems.last.point);
    bullet.validatePosition();
});

}); // end am4core.ready()
</script>
