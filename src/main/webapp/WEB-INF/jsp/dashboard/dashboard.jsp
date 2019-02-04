<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%><!-- 커스텀태그 추가 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e0fe198a94267329d51b8335fe81e6ea"></script>

<div class="right_col" role="main">
	<!-- 상단 집계S -->
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="row tile_count">
				<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
					<span class="count_top"><i class="fa fa-user"></i> 전체 회원 수</span>
					<div class="count">${totalUser}</div>
					<span class="count_bottom"><i class="green">4% </i> 전주 대비</span>
				</div>
				<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
					<span class="count_top"><i class="fa fa-clock-o"></i> 평균
						사용시간</span>
					<div class="count">123.50</div>
					<span class="count_bottom"><i class="green"><i
							class="fa fa-sort-asc"></i>3% </i> 전주 대비</span>
				</div>
				<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
					<span class="count_top"><i class="fa fa-male"></i> 남성 비율</span>
					<div class="count green">${countMale}</div>
					<span class="count_bottom"><i class="green"><i
							class="fa fa-sort-asc"></i>34% </i> 전주 대비</span>
				</div>
				<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
					<span class="count_top"><i class="fa fa-female"></i> 여성 비율</span>
					<div class="count">${countFemale}</div>
					<span class="count_bottom"><i class="red"><i
							class="fa fa-sort-desc"></i>12% </i> 전주 대비</span>
				</div>
				<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
					<span class="count_top"><i class="fa fa-download"></i> 리스트
						집계 데이터</span>
					<div class="count">${listDataCount}</div>
					<span class="count_bottom"><i class="green"><i
							class="fa fa-sort-asc"></i>34% </i> 전주 대비</span>
				</div>
				<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
					<span class="count_top"><i class="fa fa-line-chart"></i>오늘
						접속자 수</span>
					<div class="count">7,325</div>
					<span class="count_bottom"><i class="green"><i
							class="fa fa-sort-asc"></i>34% </i> 전주 대비</span>
				</div>
			</div>
		</div>
	</div>
	<!-- 상단 집계 E-->

	<div class="row">
		<!-- e차트 S -->
		<div class="col-md-12 col-sm-12 col-xs-12">
			<div class="x_panel">
				<div class="x_title">
					<h2>상품 월별 차트</h2>
					<ul class="nav navbar-right panel_toolbox">
						<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
						</li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false"><i
								class="fa fa-wrench"></i></a></li>
						<li><a class="close-link"><i class="fa fa-close"></i></a></li>
					</ul>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">

					<div id="echart_line" style="height: 350px;"></div>

				</div>
			</div>
		</div>
	</div>
	<!-- e차트 E -->

	<br />


	<!-- CPU 측정 S -->
	<div class="row">
		<div class="col-md-4 col-sm-4 col-xs-12">
			<div class="x_panel">
				<div class="x_title">
					<h2>PC상태 정보</h2>
					<ul class="nav navbar-right panel_toolbox">
						<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
						</li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false"><i
								class="fa fa-wrench"></i></a></li>
						<li><a class="close-link"><i class="fa fa-close"></i></a></li>
					</ul>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">
					<p>CPU 점유율</p>
					<div id="echart_gauge" style="height: 305px;"></div>
				</div>
			</div>
		</div>
		<!-- CPU 측정 E -->

		<!-- 일정표 S -->
		<div class="col-md-4 col-sm-4 col-xs-12">
			<div class="x_panel">
				<div class="x_title">
					<h2>
						오늘의 할일<small>일정표 스케쥴 링크연동 예정</small>
					</h2>
					<ul class="nav navbar-right panel_toolbox">
						<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
						</li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false"><i
								class="fa fa-wrench"></i></a></li>
						<li><a class="close-link"><i class="fa fa-close"></i></a></li>
					</ul>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">
					<c:forEach items="${scheduleList}" var="list">
						<article class="media event">
							<a class="pull-left date">
								<p class="month">${list.MON}
								<p class="day">${list.DAY}</p>
							</a>
							<div class="media-body">
								<a class="title" href="#">${list.TITLE}</a>
								<p>${list.CONTENT}</p>
							</div>
						</article>
					</c:forEach>
				</div>
			</div>
		</div>
		<!-- 일정표 E -->

		<!-- 날짜 UI S -->
		<div class="col-md-4 col-sm-4 col-xs-12">
			<div class="x_panel">
				<div class="x_title">
					<h2>
						오늘의 날씨정보<small>날씨API(skp,구글 등)대체방안찾기</small>
					</h2>
					<ul class="nav navbar-right panel_toolbox">
						<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
						</li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false"><i
								class="fa fa-wrench"></i></a></li>
						<li><a class="close-link"><i class="fa fa-close"></i></a></li>
					</ul>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">
					<div class="row">
						<div class="col-sm-11">
							<div class="temperature">
								<b>Monday</b>, 07:30 AM <span>F</span> <span><b>C</b></span>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-4">
							<div class="weather-icon">
								<canvas height="84" width="84" id="partly-cloudy-day"></canvas>
							</div>
						</div>
						<div class="col-sm-8">
							<div class="weather-text">
								<h2>
									서울 날씨 <br> <i>Partly Cloudy Day</i>
								</h2>
							</div>
						</div>
					</div>
					<div class="col-sm-12">
						<div class="weather-text pull-right">
							<h3 class="degrees">23</h3>
						</div>
					</div>

					<div class="clearfix"></div>

					<div class="row weather-days">
						<div class="col-sm-2">
							<div class="daily-weather">
								<h2 class="day">Mon</h2>
								<h3 class="degrees">25</h3>
								<canvas id="clear-day" width="32" height="32"></canvas>
								<h5>
									15 <i>km/h</i>
								</h5>
							</div>
						</div>
						<div class="col-sm-2">
							<div class="daily-weather">
								<h2 class="day">Tue</h2>
								<h3 class="degrees">25</h3>
								<canvas height="32" width="32" id="rain"></canvas>
								<h5>
									12 <i>km/h</i>
								</h5>
							</div>
						</div>
						<div class="col-sm-2">
							<div class="daily-weather">
								<h2 class="day">Wed</h2>
								<h3 class="degrees">27</h3>
								<canvas height="32" width="32" id="snow"></canvas>
								<h5>
									14 <i>km/h</i>
								</h5>
							</div>
						</div>
						<div class="col-sm-2">
							<div class="daily-weather">
								<h2 class="day">Thu</h2>
								<h3 class="degrees">28</h3>
								<canvas height="32" width="32" id="sleet"></canvas>
								<h5>
									15 <i>km/h</i>
								</h5>
							</div>
						</div>
						<div class="col-sm-2">
							<div class="daily-weather">
								<h2 class="day">Fri</h2>
								<h3 class="degrees">28</h3>
								<canvas height="32" width="32" id="wind"></canvas>
								<h5>
									11 <i>km/h</i>
								</h5>
							</div>
						</div>
						<div class="col-sm-2">
							<div class="daily-weather">
								<h2 class="day">Sat</h2>
								<h3 class="degrees">26</h3>
								<canvas height="32" width="32" id="cloudy"></canvas>
								<h5>
									10 <i>km/h</i>
								</h5>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		</div>
		<!-- 날짜 UI E -->
	</div>
	
	
	
	
	
	<!-- 지도 API S -->
	<div class="row">
		<div class="col-md-12 col-sm-12 col-xs-12">
			<div class="x_panel">
				<div class="x_title">
					<h2>대한민국 지도 정보</h2>
					<ul class="nav navbar-right panel_toolbox">
						<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
						</li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false"><i
								class="fa fa-wrench"></i></a></li>
						<li><a class="close-link"><i class="fa fa-close"></i></a></li>
					</ul>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">
					<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-5">
						<input type="checkbox" id="chkTraffic"
							onclick="setOverlayMapTypeId()" /> 실시간 교통정보 <input
							type="checkbox" id="chkBicycle" onclick="setOverlayMapTypeId()" />
						자전거 도로 정보
					</div>
					<div id="map" style="width: 100%; height: 500px; margin: auto;"></div>

				</div>
			</div>
		</div>
	</div>
	<!-- 지도 API E -->
</div>

<!-- 지도 API 제어 명령어 -->
<script type="text/javascript">
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center : new daum.maps.LatLng(37.72176756698391, 126.75141594184569), //지도의 중심좌표.
		level : 13
	//지도의 레벨(확대, 축소 정도)
	};
	var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴

	function panTo() {
		// 이동할 위도 경도 위치를 생성합니다 
		var moveLatLon = new daum.maps.LatLng(37.72176756698391,
				126.75141594184569);
		// 지도를 클릭한 위치에 표출할 마커입니다
		var marker = new daum.maps.Marker({
			// 지도 중심좌표에 마커를 생성합니다 
			position : map.getCenter()
		});
		// 지도에 마커를 표시합니다
		marker.setMap(map);
		// 지도 중심을 부드럽게 이동시킵니다
		// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
		map.panTo(moveLatLon);
	}

	var mapTypes = {
		traffic : daum.maps.MapTypeId.TRAFFIC,
		bicycle : daum.maps.MapTypeId.BICYCLE
	};
	function setOverlayMapTypeId() {
		chkTraffic = document.getElementById('chkTraffic'),
				chkBicycle = document.getElementById('chkBicycle');

		// 지도 타입을 제거합니다
		for ( var type in mapTypes) {
			map.removeOverlayMapTypeId(mapTypes[type]);
		}
		// 교통정보 체크박스가 체크되어있으면 지도에 교통정보 지도타입을 추가합니다
		if (chkTraffic.checked) {
			map.addOverlayMapTypeId(mapTypes.traffic);
		}
		// 자전거도로정보 체크박스가 체크되어있으면 지도에 자전거도로정보 지도타입을 추가합니다
		if (chkBicycle.checked) {
			map.addOverlayMapTypeId(mapTypes.bicycle);
		}
	}
	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new daum.maps.MapTypeControl();
	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);
	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new daum.maps.ZoomControl();
	map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
</script>

<!-- 차트게이지 -->
<script type="text/javascript">
	var myChart;
	function init_echarts2() {
		var myChart = echarts.init(document.getElementById("echart_gauge"));
		myChart.setOption({
			tooltip : {
				formatter : "{a} <br/>{b} : {c}%"
			},
			toolbox : {
				show : !0,
				feature : {
					restore : {
						show : !0,
						title : "Restore"
					},
					saveAsImage : {
						show : !0,
						title : "Save Image"
					}
				}
			},
			series : [ {
				name : "cpu 점유율",
				type : "gauge",
				center : [ "50%", "50%" ],
				startAngle : 140,
				endAngle : -140,
				min : 0,
				max : 100,
				precision : 0,
				splitNumber : 10,
				axisLine : {
					show : !0,
					lineStyle : {
						color : [ [ .2, "lightgreen" ], [ .4, "orange" ],
								[ .8, "skyblue" ], [ 1, "#ff4500" ] ],
						width : 30
					}
				},
				axisTick : {
					show : !0,
					splitNumber : 5,
					length : 8,
					lineStyle : {
						color : "#eee",
						width : 1,
						type : "solid"
					}
				},
				axisLabel : {
					show : !0,
					formatter : function(a) {
						switch (a + "") {
						case "10":
							return "10%";
						case "30":
							return "30%";
						case "50":
							return "50%";
						case "70":
							return "70%";
						case "90":
							return "90%";
						default:
							return ""
						}
					},
					textStyle : {
						color : "#333"
					}
				},
				splitLine : {
					show : !0,
					length : 30,
					lineStyle : {
						color : "#eee",
						width : 2,
						type : "solid"
					}
				},
				pointer : {
					length : "80%",
					width : 8,
					color : "auto"
				},
				title : {
					show : !0,
					offsetCenter : [ "-65%", -10 ],
					textStyle : {
						color : "#333",
						fontSize : 15
					}
				},
				detail : {
					show : !0,
					backgroundColor : "rgba(0,0,0,0)",
					borderWidth : 0,
					borderColor : "#ccc",
					width : 100,
					height : 40,
					offsetCenter : [ "-60%", 10 ],
					formatter : "{value}%",
					textStyle : {
						color : "auto",
						fontSize : 30
					}
				},
				data : [ {
					value : data.data,
					name : "Performance"
				} ]
			} ]
		})
	}
	//myChart.setOption()
	//timeId = setInterval("getChartData();",2000); // 시스템 상시 콜 부하테스트 해봐야함
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
        }, 3000); // 5초 간격으로 리스트 검색
    } else {
        if(!confirm("자동 새로고침 설정을 OFF로 변경하시겠습니까?")) {
            return;
        }
        autoRefreshYn = "N";
        clearInterval(autoRefresh);
    }
}
</script>
