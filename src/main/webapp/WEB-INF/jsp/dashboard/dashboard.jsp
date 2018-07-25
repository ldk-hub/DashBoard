<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<script src="/static/vendors/echarts/dist/echarts.min.js"></script>

<!-- page content -->
<div class="right_col" role="main">
	<!-- 상단 집계 -->
	<div class="row tile_count">
		<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
			<span class="count_top"><i class="fa fa-user"></i> 전체 회원 수</span>
			<div class="count">216</div>
			<span class="count_bottom"><i class="green">4% </i> 전주 대비</span>
		</div>
		<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
			<span class="count_top"><i class="fa fa-clock-o"></i> 평균 사용시간</span>
			<div class="count">123.50</div>
			<span class="count_bottom"><i class="green"><i
					class="fa fa-sort-asc"></i>3% </i> 전주 대비</span>
		</div>
		<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
			<span class="count_top"><i class="fa fa-male"></i> 남성 비율</span>
			<div class="count green">2,500</div>
			<span class="count_bottom"><i class="green"><i
					class="fa fa-sort-asc"></i>34% </i> 전주 대비</span>
		</div>
		<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
			<span class="count_top"><i class="fa fa-female"></i> 여성 비율</span>
			<div class="count">4,567</div>
			<span class="count_bottom"><i class="red"><i
					class="fa fa-sort-desc"></i>12% </i> 전주 대비</span>
		</div>
		<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
			<span class="count_top"><i class="fa fa-download"></i> 오늘 발생 된
				데이터</span>
			<div class="count">2,315</div>
			<span class="count_bottom"><i class="green"><i
					class="fa fa-sort-asc"></i>34% </i> 전주 대비</span>
		</div>
		<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
			<span class="count_top"><i class="fa fa-line-chart"></i>오늘 접속자
				수</span>
			<div class="count">7,325</div>
			<span class="count_bottom"><i class="green"><i
					class="fa fa-sort-asc"></i>34% </i> 전주 대비</span>
		</div>
	</div>
	<!-- /top tiles -->

	<div class="row">
		<!-- 차트 -->
		<div class="col-md-12 col-sm-12 col-xs-12">
			<div class="dashboard_graph">

				<div class="row x_title">
					<div class="col-md-6">
						<h3>
							일일 통계 데이터 차트 <small>Graph(위의 발생된 데이터 그래프로 측정 호출 예정)</small>
						</h3>
					</div>
				</div>

				<div class="col-md-9 col-sm-9 col-xs-12">
					<div id="chart_plot_01" class="demo-placeholder"></div>
				</div>
				<div class="col-md-3 col-sm-3 col-xs-12 bg-white">
					<div class="x_title">
						<h2>실적</h2>
						<div class="clearfix"></div>
					</div>

					<div class="col-md-12 col-sm-12 col-xs-6">
						<div>
							<p>Facebook Campaign</p>
							<div class="">
								<div class="progress progress_sm" style="width: 76%;">
									<div class="progress-bar bg-green" role="progressbar"
										data-transitiongoal="80"></div>
								</div>
							</div>
						</div>
						<div>
							<p>Twitter Campaign</p>
							<div class="">
								<div class="progress progress_sm" style="width: 76%;">
									<div class="progress-bar bg-green" role="progressbar"
										data-transitiongoal="60"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-12 col-sm-12 col-xs-6">
						<div>
							<p>Conventional Media</p>
							<div class="">
								<div class="progress progress_sm" style="width: 76%;">
									<div class="progress-bar bg-green" role="progressbar"
										data-transitiongoal="40"></div>
								</div>
							</div>
						</div>
						<div>
							<p>Bill boards</p>
							<div class="">
								<div class="progress progress_sm" style="width: 76%;">
									<div class="progress-bar bg-green" role="progressbar"
										data-transitiongoal="50"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<br />
	<!-- CPU 측정 -->
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
							
			    <script>
			    function init_echarts() {
			    	if ($('#echart_gauge').length ){ 
			
			    var echartGauge = echarts.init(document.getElementById('echart_gauge'), theme);

				  echartGauge.setOption({
					tooltip: {
					  formatter: "{a} <br/>{b} : {c}%"
					},
					toolbox: {
					  show: true,
					  feature: {
						restore: {
						  show: true,
						  title: "Restore"
						},
						saveAsImage: {
						  show: true,
						  title: "Save Image"
						}
					  }
					},
					series: [{
					  name: 'Performance',
					  type: 'gauge',
					  center: ['50%', '50%'],
					  startAngle: 140,
					  endAngle: -140,
					  min: 0,
					  max: 100,
					  precision: 0,
					  splitNumber: 10,
					  axisLine: {
						show: true,
						lineStyle: {
						  color: [
							[0.2, 'lightgreen'],
							[0.4, 'orange'],
							[0.8, 'skyblue'],
							[1, '#ff4500']
						  ],
						  width: 30
						}
					  },
					  axisTick: {
						show: true,
						splitNumber: 5,
						length: 8,
						lineStyle: {
						  color: '#eee',
						  width: 1,
						  type: 'solid'
						}
					  },
					  axisLabel: {
						show: true,
						formatter: function(v) {
						  switch (v + '') {
							case '10':
							  return '10%';
							case '30':
							  return '30%';
							case '60':
							  return '60%';
							case '90':
							  return '90%';
							default:
							  return '';
						  }
						},
						textStyle: {
						  color: '#333'
						}
					  },
					  splitLine: {
						show: true,
						length: 30,
						lineStyle: {
						  color: '#eee',
						  width: 2,
						  type: 'solid'
						}
					  },
					  pointer: {
						length: '80%',
						width: 8,
						color: 'auto'
					  },
					  title: {
						show: true,
						offsetCenter: ['-65%', -10],
						textStyle: {
						  color: '#333',
						  fontSize: 15
						}
					  },
					  detail: {
						show: true,
						backgroundColor: 'rgba(0,0,0,0)',
						borderWidth: 0,
						borderColor: '#ccc',
						width: 100,
						height: 40,
						offsetCenter: ['-60%', 10],
						formatter: '{value}%',
						textStyle: {
						  color: 'auto',
						  fontSize: 30
						}
					  },
					  data: [{
						value: 50,
						name: 'Performance'
					  }]
					}]
				  });
			        }
			        clearInterval(timeTicket);
					timeTicket = setInterval(function (){
					    option.series[0].data[0].value = (Math.random()*100).toFixed(2) - 0;
					    myChart.setOption(option, true);
					},2000)
			    </script>
					<div id="echart_gauge" style="height: 305px;"></div>
				</div>
			</div>
		</div>
		<!-- 메모리 측정 -->

		<!-- 일정표 -->
		<div class="col-md-4 col-sm-4 col-xs-12">
			<div class="x_panel">
				<div class="x_title">
					<h2>
						오늘의 할일<small>일정표 스케쥴 데이터 호출 예정</small>
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
					<article class="media event">
						<a class="pull-left date">
							<p class="month">April</p>
							<p class="day">23</p>
						</a>
						<div class="media-body">
							<a class="title" href="#">Item One Title</a>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
						</div>
					</article>
					<article class="media event">
						<a class="pull-left date">
							<p class="month">April</p>
							<p class="day">23</p>
						</a>
						<div class="media-body">
							<a class="title" href="#">Item Two Title</a>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
						</div>
					</article>
					<article class="media event">
						<a class="pull-left date">
							<p class="month">April</p>
							<p class="day">23</p>
						</a>
						<div class="media-body">
							<a class="title" href="#">Item Two Title</a>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
						</div>
					</article>
					<article class="media event">
						<a class="pull-left date">
							<p class="month">April</p>
							<p class="day">23</p>
						</a>
						<div class="media-body">
							<a class="title" href="#">Item Two Title</a>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
						</div>
					</article>
				</div>
			</div>
		</div>
		
	 <!-- 날씨정보 -->
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
									서울 날씨 <br>
									<i>Partly Cloudy Day</i>
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
		<!-- end of weather widget -->
	</div>
	
	 <div class="row">
		<!-- 인구정보 -->
		<div class="col-md-12 col-sm-12 col-xs-12">
			<div class="x_panel">
				<div class="x_title">
					<h2>
						세계 인구 수 정보 <small>2010년 기준</small>
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
					<div id="echart_world_map" style="height: 370px;"></div>
				</div>
			</div>
		</div>
	</div>
</div>
