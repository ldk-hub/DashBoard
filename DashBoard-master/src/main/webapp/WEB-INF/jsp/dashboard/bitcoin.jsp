

<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>

<!-- Toast Grid -->

<link rel="stylesheet" type="text/css"	href="../static/vendors/toast/tui-pagination/dist/tui-pagination.css" />
<link rel="stylesheet" type="text/css"	href="../static/vendors/toast/tui-date-picker/dist/tui-date-picker.css" />
<link rel="stylesheet" type="text/css"	href="../static/vendors/toast/tui-time-picker/dist/tui-time-picker.css" />
<link rel="stylesheet" type="text/css"	href="../static/vendors/toast/tui-grid/dist/tui-grid.css" />

<div class="right_col" role="main" style="background-color: #5c5c5c38;">
	
	
	<div class="col-md-6 col-sm-6 col-xs-12"
			style="position: relative; z-index: 0;">
	<div class="row">
			<div class="x_panel" style="background-color: #2f2e2e;">
				<div class="x_title">
					<strong id="stockCoinName" style="font-size:25px;"></strong><small id="stockCoinPrice" style="color:#c3f400"></small><small style="color:#c3f400">KRW</small> 
				</div>
				<div class="x_content">
					<!-- 여기  api 넣기 -->
					<div id="stockBuyHoga"></div>
					<div><Strong>------------------------</Strong></div>
					<div id="stockSellHoga"></div>
				</div>
				<button type="button" id="testBtn"	class="btn btn-round btn-primary" style="WIDTH: 50%">임시용버튼</button>
			</div>
		</div>
		<div class="row">
				<div class="x_panel" style="background-color: #2f2e2e;">
					<div class="x_title">
						<h2>체결현황</h2>
						<div class="clearfix"></div>
					</div>
					<div class="x_content">
						 <div id="realTimeStockData"></div>
					</div>
				</div>
		</div>
	</div>
	
		<div class="col-md-3 col-sm-3 col-xs-12" style="position: relative; z-index: 0;">
			<div class="x_panel" style="background-color: #2f2e2e;">
				<div class="x_title">
					<!-- <h2 style="color: #c3f400">매수/매도처리</h2> -->
					<h2>매수/매도처리</h2>
					<div class="clearfix"></div>
				</div>

				<div class="x_content">
					<ul class="nav nav-pills nav-justified"	style="background-color: #484646;">
						<li class="active"><a data-toggle="tab" href="#home" style="color: #fff;">매수</a></li>
						<li><a data-toggle="tab" href="#menu1" style="color: #fff;">매도</a></li>
					</ul>

					<div class="tab-content">
						<div id="home" class="tab-pane fade in active">
							<div class="field item form-group" style="padding: 10px;">
								<label
									class="col-form-label col-md-3 col-sm-3 col-xs-3  label-align">코인명<span
									class="required">:</span></label>
								<div class="col-md-7 col-sm-7">
									<input class="form-control" id="buycoinName" type="text"
										class='text' name="text" required='required' placeholder="이값은 없앨예정">
								</div>
							</div>
							<div class="clearfix"></div>
							<div class="field item form-group" style="padding: 10px;">
								<label
									class="col-form-label col-md-3 col-sm-3 col-xs-3 num_only num_sum label-align">매수가<span
									class="required">:</span></label>
								<div class="col-md-7 col-sm-7">
									<input class="form-control" id="buyPrice" type="number"
										class='number' name="number" required='required'>
								</div>
							</div>
							<div class="clearfix"></div>
							<div class="field item form-group" style="padding: 10px;">
								<label
									class="col-form-label col-md-3 col-sm-3 col-xs-3 num_only num_sum label-align">수량<span
									class="required">:</span></label>
								<div class="col-md-7 col-sm-7">
									<input class="form-control" id="buystockCnt" type="number"
										class='number' name="number" required='required'>
								</div>
							</div>
							<div class="clearfix"></div>

							<div class="field item form-group" style="padding: 10px;">
								<label
									class="col-form-label col-md-3 col-sm-3 col-xs-3 num_only num_sum label-align">주문총액<span
									class="required">:</span></label>
								<div class="col-md-7 col-sm-7">
									<input class="form-control" id="buytotalMoney" type="text"
										class='text' name="text" value="0" required='required'
										readonly>
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
								<label class="col-form-label col-md-3 col-sm-3 col-xs-3 label-align">코인명<span
									class="required"> : </span></label>
								<div class="col-md-7 col-sm-7">
									<input class="form-control" id="sellcoinName" type="text"
										class='text' name="text" required='required' placeholder="이값은 없앨예정"> 
								</div>
							</div>
							<div class="clearfix"></div>
							<div class="field item form-group" style="padding: 10px;">
								<label
									class="col-form-label col-md-3 col-sm-3 col-xs-3 num_only  num_sum label-align">매수가<span
									class="required">:</span></label>
								<div class="col-md-7 col-sm-7">
									<input class="form-control" id="sellPrice" type="number"
										class='number' name="number" required='required'>
								</div>
							</div>
							<div class="clearfix"></div>
							<div class="field item form-group" style="padding: 10px;">
								<label
									class="col-form-label col-md-3 col-sm-3 col-xs-3 num_only num_sum  label-align">수량<span
									class="required">:</span></label>
								<div class="col-md-7 col-sm-7">
									<input class="form-control" id="sellstockCnt" type="number"
										class='number' name="number" required='required'>
								</div>
							</div>
							<div class="clearfix"></div>

							<div class="field item form-group" style="padding: 10px;">
								<label
									class="col-form-label col-md-3 col-sm-3 col-xs-3 num_only num_sum label-align">주문총액<span
									class="required">:</span></label>
								<div class="col-md-7 col-sm-7">
									<input class="form-control" id="selltotalMoney" type="number"
										class='text' name="text" required='required' value="0"
										readonly>
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
		</div>
		
		
		<div class="col-md-3 col-sm-3 col-xs-12" style="position: relative; z-index: 0;">
			<div class="x_panel" style="background-color: #2f2e2e;">
				<div class="x_title">
					<h2>종목리스트</h2>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">
					<div id="totalStockList"></div>
				</div>
			</div>
		</div>
</div>



<!-- tui-grid -->
<script src="../static/vendors/toast/tui-code-snippet/dist/tui-code-snippet.js"></script>
<script	src="../static/vendors/toast/tui-pagination/dist/tui-pagination.js"></script>
<script	src="../static/vendors/toast/tui-date-picker/dist/tui-date-picker.min.js"></script>
<script	src="../static/vendors/toast/tui-time-picker/dist/tui-time-picker.min.js"></script>
<script src="../static/vendors/toast/tui-grid/dist/tui-grid.js"></script>

<!-- 스윗알럿2 -->
<script src="../static/vendors/sweetalert2/dist/sweetalert2.all.min.js"></script>

<!-- 매수입력창 자동계산 처리 -->
<script type="text/javascript">
	const Grid = tui.Grid;
	const grid1 =new Grid({
		el : document.getElementById('realTimeStockData'),
		withCredentials: false,  
		  initialRequest: true,
			data : {
				api : {
					readData : {
						url : '/StockInfo',
						method : 'GET',
						initParams: { 
								param: 'BTC' 
								}
					}
				}
			},
	      rowHeight: 35,
	      bodyHeight : 350,
	      header: {
	        height: 40
	      },
	      columns: [
    	  	{
	          header: '구분',
	          name: 'side',
	         /*  renderer: {
	              styles: {
	                fontWeight: 'bold',
	                color: (props) => props.value.length > 1 ? '#4b96e6' : '#d41111';
	              },
	              attributes: {
	                'data-type': 'default'
	                title: (props) => `title: ${props.formattedValue}`
	              },
	              classNames: ['my-styled-cell'],
	            }, */
	        },
	        {
	          header: '체결시간',
	          name: 'time',
	        },
	        {
	          header: '체결가격',
	          name: 'price'
	        },
	        {
	          header: '체결량',
	          name: 'amount'
	        },
	        {
	          header: '체결금액',
	          name: 'price'
	        },
	      ],
	    });
	
	
	
			 grid1.on('scrollEnd', () => {
	    });

	    
	    /* 	    $.ajax({
				type:'POST',
				url : '/selectBoardList',
				dataType:"json",
				success : function(result){
				console.log(result);
					 grid.resetData(result);
				},
				error: function(data){
				      alert('error 관리자에게문의하시오.');
			    }
			});
 		*/
 		
 		

 </script>

<script> 
	const grid2 = new tui.Grid({
		el : document.getElementById('totalStockList'),
			data : {
				api : {
					readData : {
						url : '/totalStockList',
						method : 'POST'
					}
				}
			},
	      rowHeight: 70,
	      bodyHeight : 680,
	      header: {
	        height: 70
	      },
	      columns: [
	        {
	          header: '한글명',
	          name: 'krname'
	        },
	        {
	          header: '영문코드',
	          name: 'name'
	        },
	        {
	          header: '현재가',
	          name: 'price',
	          sortable : true
	        },
	        {
	          header: '전일대비',
	          name: 'daebi',
	          sortable : true
	        },
	        {
	          header: '거래대금',
	          name: 'amount',
	          sortable : true
	        }
	      ],
	    });
	
	 grid2.on('scrollEnd', () => {
	    });
	 
	//그리드 헤더버튼-> 사이드바 사이즈 축소 때 그리드 깨지는 현상 리프레시 기능
	$(document).on('click', '#menu_toggle', function() {
		grid1.refreshLayout();
		grid2.refreshLayout();
	});
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
		//값입력하면 바로계곱하기 계산
         var sum = sum1 * sum2;
         $("#selltotalMoney").val(sum);
     });
</script>

<!-- 매수 버튼 액션 -->
<script type="text/javascript">
	$(document).on("click", "#buyStockBtn", function() {
		
	var price = document.getElementById('buyPrice').value;
	var stockCnt = document.getElementById('buystockCnt').value;

	   if(price == ''){
			Swal.fire({
				  icon: 'error',
				  title: '가격입력하시오.',
				})
		}
		if(stockCnt == ''){
			Swal.fire({
				  icon: 'error',
				  title: '수량입력하시오.',
				})
		}
		
		$.ajax({
			type : 'POST',
			url : '/buyStock',
			dataType : "json",
			data : {
						"buyStockName" : document.getElementById('buycoinName').value,
						"buyStock" : price,
						"buyStockCnt" : stockCnt,
						"totalBuyStock" : document.getElementById('buytotalMoney').value
					},
			success : function(data) {
				/* $.each(data.data, function(k, v) {
				    /// do stuff
				}); */
				console.log(data);
				grid1.reloadData();
				
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
				 
				 $('#buyPrice').val('');
				 $('#buystockCnt').val('');
				 $('#buycoinName').val('');
				 $('#buytotalMoney').val('');
			},error:function(request,status,error){
			    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	});

    //매도 버튼  주문
	$(document).on("click", "#sellStockBtn", function() {
		var sellPrice = document.getElementById('sellPrice').value;
		var sellStockCnt = document.getElementById('sellstockCnt').value;
		
		if(sellPrice == ''){
			Swal.fire({
				  icon: 'error',
				  title: '가격입력하시오.',
				})
		}
		if(sellStockCnt == ''){
			Swal.fire({
				  icon: 'error',
				  title: '수량입력하시오.',
				})
		}
		
		$.ajax({
			type : 'POST',
			url : '/sellStock',
			dataType : "json",
			data : {
						"sellStockName" : document.getElementById('sellcoinName').value,
						"sellStock" : sellPrice,
						"sellStockCnt" : sellStockCnt,
						"totalSellStock" : document.getElementById('selltotalMoney').value 
					},
			success : function(data) {
				console.log(data);
				
				grid1.reloadData();
				
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
				 $('#buyPrice').val('');
				 $('#buystockCnt').val('');
				 $('#buycoinName').val('');
				 $('#buytotalMoney').val('');
			},error:function(request,status,error){
			    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			    
			}
		});
	});

	//초기화 버튼 
	$(document).on("click", "#returnBtn", function() {
		 $('#sellPrice').val('');
		 $('#sellstockCnt').val('');
		 $('#selltotalMoney').val('');
		 $('#sellcoinName').val('');
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
	
	
	//개별 종목 체결내역
	$(document).on("click", "#StockInfoButton", function() {
		$.ajax({
			type : 'GET',
			url : '/StockInfo',
			dataType : "json",
			data : {
						"stockInfoName" : document.getElementById('stockInfoName').value,
					},
			success : function(result) {
				console.log(result);
				Swal.fire({
					position : 'top-end',
					icon : 'success',
					title : '조회 완료되었습니다.',
					showConfirmButton : false,
					timer : 1000
				});
			}
		});
	});
	
	//임시용 데이터 맵핑 버튼
	$(document).on("click", "#testBtn", function() {
		$.ajax({
			type : 'GET',
			url : '/hogaStockInfo',
			dataType : "json",
			data : {
						"stockInfoName" : "BTC",
					},
			success : function(result) {
								
				
				 $('#stockCoinName').html(result.stockCoinName);
				 $('#stockCoinPrice').html(result.stockCoinPrice);
				 $('#stockBuyHoga').html(result.stockBuyHoga);
				 $('#stockSellHoga').html(result.stockSellHoga);
			}
		});
	});
	
	//현재가 조회
	$(document).on("click", "#currentPrice", function() {
		$.ajax({
			type : 'POST',
			url : '/currentPrice',
			dataType : "json",
			data : {
						"stockInfoName" : document.getElementById('stockInfoName').value,
					},
			success : function(result) {
				console.log(result);
				Swal.fire({
					position : 'top-end',
					icon : 'success',
					title : '조회 완료되었습니다.',
					showConfirmButton : false,
					timer : 1000
				});
			}
		});
	});
</script>

<!-- 그리드 컬러 커스터마이징 -->
<script type="text/javascript">
Grid.applyTheme('clean', {
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
			text : '#fff',
			showVerticalBorder: true,
			showHorizontalBorder:true
		},
		header : {
			background : '#393e489e',
			border : '#000000',
			text : '#000000'
		},
		oddRow: {
		      background: '#3a3a3a'
	    },
		evenRow: {
		      background: '#2c2c2c'
		    },
		editable : {
			background : '#3a3a3a',
			border : '#fff',
			text : '#fff'
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
			border : '#000000',
			text : '#fff'
		},
	}
}); 
</script>