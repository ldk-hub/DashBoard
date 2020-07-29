<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%><!-- 커스텀태그 추가 -->
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>    

<!-- Toast Grid -->
<link rel="stylesheet" type="text/css" href="../static/vendors/toast/tui-grid/dist/tui-grid.css" />
<link rel="stylesheet" type="text/css" href="../static/vendors/toast/tui-pagination/dist/tui-pagination.css" />
 <!-- Datatables -->
 <link href="../static/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
 <link href="../static/vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
 <link href="../static/vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
 <link href="../static/vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
 <link href="../static/vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">
<!-- 차트 스타일Styles -->
<style>
#chartdiv {
  width: 100%;
  height: 400px;
}
</style>

    		<!-- 라인 그래프  -->
      		<div class="right_col" role="main" style="background-color:#5c5c5c38;" >
      		<div class="row">
              
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel" style="background-color:#2f2e2e;">
                  <div class="x_title">
                    <h2 style="color:#c3f400">차트 데이터</h2>
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
					<div id="chartdiv"></div>
                  </div>
                </div>
              </div>
              
    		<!-- 그리드형 API S -->
    		  <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel" style="background-color:#2f2e2e;">
                  <div class="x_title">
                    <h2 style="color:#c3f400">그리드형 데이터 제어</h2>
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
         		<div id="grid"></div>
              		<div class="clearfix"></div>
              		  <div class="modal-footer">
		          		   <button type="button" class="btn btn-warning antosubmit" id = "addRow">로우추가</button>
		                   <button type="button" class="btn btn-warning antosubmit" id = "deleteRow">로우삭제</button>
		                   <button type="button" class="btn btn-primary antosubmit" id = "updateGrid">수정</button>
		                   <button type="button" class="btn btn-primary antosubmit" id ="deleteGrid">삭제</button>
	                   </div>
                  </div>
                  
                </div>
              </div>
				<!-- 그리드형 API E-->
				   <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel" style="background-color:#2f2e2e;">
                  <div class="x_title">
                    <h2 style="color:#c3f400">테이블형 데이터 제어</h2>
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
                 <table id="datatable-buttons" class="table table-bordered">
                      <thead>
                        <tr>
                          <th>순번</th>
                          <th>자재번호</th>
                          <th>브랜드명</th>
                          <th>상세내용</th>
                          <th>기타</th>
                        </tr>
                      </thead>
	                     <tbody>
							<c:forEach items="${list}" var="resultList">
								<tr>
									<th scope="row">${resultList.brand_name }</th>
									<th scope="row">${resultList.item_number }</th>
									<th scope="row">${resultList.season_reason }</th>
									<th scope="row">${resultList.status }</th>
									<th scope="row">${resultList.test }</th>
								</tr>
							</c:forEach>
						</tbody>
                    </table> 
                  </div>
                </div>
              </div>
            <!-- 파일업로드API S -->
            
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel" style="background-color:#2f2e2e;">
                  <div class="x_title">
                    <h2 style="color:#c3f400">파일 업로드 </h2>
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
                    <form action="form_upload.html" class="dropzone" style="color:#363636"></form>
                    <br />
                  </div>
                </div>
              </div>
            </div>
            <!-- 파일업로드API E -->
          </div>
          
<script src="../static/vendors/toast/jquery/dist/jquery.js"></script>
<script src="../static/vendors/toast/underscore/underscore.js"></script>
<script src="../static/vendors/toast/backbone/backbone.js"></script>
<script	src="../static/vendors/toast/tui-code-snippet/dist/tui-code-snippet.js"></script>
<script	src="../static/vendors/toast/tui-date-picker/dist/tui-date-picker.js"></script>
<script src="../static/vendors/toast/tui-grid/dist/tui-grid.js"></script>
<script	src="../static/vendors/toast/tui-pagination/dist/tui-pagination.js"></script>
<script	src="../static/vendors/toast/tui-time-picker/dist/tui-time-picker.js"></script>
<script src="../static/vendors/amcharts4/core.js"></script>
<script src="../static/vendors/amcharts4/charts.js"></script>
<script src="../static/vendors/amcharts4/maps.js"></script>
<script src="../static/vendors/amcharts4/themes/moonrisekingdom.js"></script>
<script src="../static/vendors/amcharts4/themes/animated.js"></script>
<!-- <script src="../static/vendors/amcharts4/lang/ko_KR.js"></script> -->
<!-- Datatables -->
<script src="../static/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="../static/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<script src="../static/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
<script src="../static/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
<script src="../static/vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
<script src="../static/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
<script src="../static/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
<script src="../static/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
<script src="../static/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
<script src="../static/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
<script src="../static/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
<script src="../static/vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
<script src="../static/vendors/jszip/dist/jszip.min.js"></script>
<script src="../static/vendors/pdfmake/build/pdfmake.min.js"></script>
<script src="../static/vendors/pdfmake/build/vfs_fonts.js"></script>

<!-- Chart code -->
<script>
am4core.ready(function() {

// Themes begin
am4core.useTheme(am4themes_dark);
am4core.useTheme(am4themes_animated);
// Themes end

// Create chart instance
var chart = am4core.create("chartdiv", am4charts.XYChart);

chart.colors.step = 2;
chart.maskBullets = false;

// Add data
chart.data = [{
    "date": "2012-01-01",
    "distance": 227,
    "townName": "New York",
    "townName2": "New York",
    "townSize": 12,
    "latitude": 40.71,
    "duration": 408
}, {
    "date": "2012-01-02",
    "distance": 371,
    "townName": "Washington",
    "townSize": 7,
    "latitude": 38.89,
    "duration": 482
}, {
    "date": "2012-01-03",
    "distance": 433,
    "townName": "Wilmington",
    "townSize": 3,
    "latitude": 34.22,
    "duration": 562
}, {
    "date": "2012-01-04",
    "distance": 345,
    "townName": "Jacksonville",
    "townSize": 3.5,
    "latitude": 30.35,
    "duration": 379
}, {
    "date": "2012-01-05",
    "distance": 480,
    "townName": "Miami",
    "townName2": "Miami",
    "townSize": 5,
    "latitude": 25.83,
    "duration": 501
}, {
    "date": "2012-01-06",
    "distance": 386,
    "townName": "Tallahassee",
    "townSize": 3.5,
    "latitude": 30.46,
    "duration": 443
}, {
    "date": "2012-01-07",
    "distance": 348,
    "townName": "New Orleans",
    "townSize": 5,
    "latitude": 29.94,
    "duration": 405
}, {
    "date": "2012-01-08",
    "distance": 238,
    "townName": "Houston",
    "townName2": "Houston",
    "townSize": 8,
    "latitude": 29.76,
    "duration": 309
}, {
    "date": "2012-01-09",
    "distance": 218,
    "townName": "Dalas",
    "townSize": 8,
    "latitude": 32.8,
    "duration": 287
}, {
    "date": "2012-01-10",
    "distance": 349,
    "townName": "Oklahoma City",
    "townSize": 5,
    "latitude": 35.49,
    "duration": 485
}, {
    "date": "2012-01-11",
    "distance": 603,
    "townName": "Kansas City",
    "townSize": 5,
    "latitude": 39.1,
    "duration": 890
}, {
    "date": "2012-01-12",
    "distance": 534,
    "townName": "Denver",
    "townName2": "Denver",
    "townSize": 9,
    "latitude": 39.74,
    "duration": 810
}, {
    "date": "2012-01-13",
    "townName": "Salt Lake City",
    "townSize": 6,
    "distance": 425,
    "duration": 670,
    "latitude": 40.75,
    "dashLength": 8,
    "alpha": 0.4
}, {
    "date": "2012-01-14",
    "latitude": 36.1,
    "duration": 470,
    "townName": "Las Vegas",
    "townName2": "Las Vegas"
}]; 

// Create axes
//날짜 값 
var dateAxis = chart.xAxes.push(new am4charts.DateAxis());
dateAxis.renderer.grid.template.location = 0;
dateAxis.renderer.minGridDistance = 50;
dateAxis.renderer.grid.template.disabled = true;
dateAxis.renderer.fullWidthTooltip = true;

var distanceAxis = chart.yAxes.push(new am4charts.ValueAxis());
distanceAxis.title.text = "Distance";
distanceAxis.renderer.grid.template.disabled = true;

var durationAxis = chart.yAxes.push(new am4charts.DurationAxis());
durationAxis.title.text = "시간";
durationAxis.baseUnit = "minute";
durationAxis.renderer.grid.template.disabled = true;
durationAxis.renderer.opposite = true;

durationAxis.durationFormatter.durationFormat = "hh':'mm";

var latitudeAxis = chart.yAxes.push(new am4charts.ValueAxis());
latitudeAxis.renderer.grid.template.disabled = true;
latitudeAxis.renderer.labels.template.disabled = true;

// Create series
var distanceSeries = chart.series.push(new am4charts.ColumnSeries());
distanceSeries.dataFields.valueY = "distance";
distanceSeries.dataFields.dateX = "date";
distanceSeries.yAxis = distanceAxis;
distanceSeries.tooltipText = "{valueY} miles";
distanceSeries.name = "거리";
distanceSeries.columns.template.fillOpacity = 0.7;
distanceSeries.columns.template.propertyFields.strokeDasharray = "dashLength";
distanceSeries.columns.template.propertyFields.fillOpacity = "alpha";

var disatnceState = distanceSeries.columns.template.states.create("hover");
disatnceState.properties.fillOpacity = 0.9;

var durationSeries = chart.series.push(new am4charts.LineSeries());
durationSeries.dataFields.valueY = "duration";
durationSeries.dataFields.dateX = "date";
durationSeries.yAxis = durationAxis;
durationSeries.name = "Duration";
durationSeries.strokeWidth = 2;
durationSeries.propertyFields.strokeDasharray = "dashLength";
durationSeries.tooltipText = "{valueY.formatDuration()}";

var durationBullet = durationSeries.bullets.push(new am4charts.Bullet());
var durationRectangle = durationBullet.createChild(am4core.Rectangle);
durationBullet.horizontalCenter = "middle";
durationBullet.verticalCenter = "middle";
durationBullet.width = 7;
durationBullet.height = 7;
durationRectangle.width = 7;
durationRectangle.height = 7;

var durationState = durationBullet.states.create("hover");
durationState.properties.scale = 1.2;

var latitudeSeries = chart.series.push(new am4charts.LineSeries());
latitudeSeries.dataFields.valueY = "latitude";
latitudeSeries.dataFields.dateX = "date";
latitudeSeries.yAxis = latitudeAxis;
latitudeSeries.name = "Duration";
latitudeSeries.strokeWidth = 2;
latitudeSeries.propertyFields.strokeDasharray = "dashLength";
latitudeSeries.tooltipText = "Latitude: {valueY} ({townName})";

var latitudeBullet = latitudeSeries.bullets.push(new am4charts.CircleBullet());
latitudeBullet.circle.fill = am4core.color("#fff");
latitudeBullet.circle.strokeWidth = 2;
latitudeBullet.circle.propertyFields.radius = "townSize";

var latitudeState = latitudeBullet.states.create("hover");
latitudeState.properties.scale = 1.2;

var latitudeLabel = latitudeSeries.bullets.push(new am4charts.LabelBullet());
latitudeLabel.label.text = "{townName2}";
latitudeLabel.label.horizontalCenter = "left";
latitudeLabel.label.dx = 14;

// Add legend
chart.legend = new am4charts.Legend();

// Add cursor
chart.cursor = new am4charts.XYCursor();
chart.cursor.fullWidthLineX = true;
chart.cursor.xAxis = dateAxis;
chart.cursor.lineX.strokeOpacity = 0;
chart.cursor.lineX.fill = am4core.color("#000");
chart.cursor.lineX.fillOpacity = 0.1;

}); // end am4core.ready()
</script>



<script type="text/javascript">
	$(document).ready(function(){
		selectBoardList();
	});
</script>




<script type="text/javascript">
//자바스크립트 YYYY-MM-DD 오늘 날짜 구하기
var Now = new Date();
		var NowTime = Now.getFullYear();
		NowTime += '.' + (Now.getMonth()+1);
		NowTime += '.' + Now.getDate();
		//현재날짜 이전의 날짜는 선택못하도록 막
		//$('#myDatepicker2').data("DateTimePicker").minDate(NowTime);
		</script>
<!-- 그리드 제어 명령어 -->
<script type="text/javascript">
//데이터 그리드 내부에서 모바일로 접속시 가상키보드가 튀어나오던현상을 제거해줌. 
//$(':focus').blur(); // 모바일 키보드 해제

var grid1 = new tui.Grid({
    el: $('#grid'),
    bodyHeight: 350,
    virtualScrolling :true,
    rowHeaders:['checkbox','rowNum'],
    rowHeight: 70,
    columnOptions:{
    	width:100
    },
    columns: [
        {
            title: '브랜드명',
            name: 'brand_name'
        },
        {
            title: '자재번호 ',
            name: 'item_number'
        },
        {
            title: '제품명',
            name: 'season_reason',
            editOptions: {
                type: 'text',
                maxLength: 10,
                useViewMode: true
            }
        },
        {
            title: '제품상세',
            name: 'status',
            editOptions: {
                type: 'text',
                maxLength: 10,
                useViewMode: true
            }
        },
      //grid에서 이미지 넣는방법
    	/* {
        		title : '온도트렌드',
        		name : 'file_name',
        		align: 'center',
        		width: 450,
        		 formatter : function(value, rowData) {
                     return "<img src='" + value + "' style='"width "' />";
                 }
        	}, */
        {
            title: '구분',
            name: 'STATUS',
        }
    ]
});
		
		
		
		
		
function selectBoardList() {
	$.ajax({
			type:'POST',
			url : '/selectBoardList',
			dataType:"json",
			success : function(result){
				grid1.setData(result.data);
			},
			error: function(data){
			      alert('error 관리자에게문의하시오.');
		    }
		});
	} 
		
		
		//그리드에서 지원하는 NET통신
		/*   grid1.use('Net',{
			perPage:500,
			readDataMethod: 'GET',
			api:{
				readData:'/selectBoardList',
				createdData : '/insertRows'
			}
		}); 
		 var net = grid1.getAddOn('Net');
		
		 
		// 후처리 로직 성공 실패 유무 
		grid1.on('response', function(data) {
			console.log("1",data);
		    
		}); */
		
		
		//동적 셀렉트박스 구성하기
		//1번셀렉트박스의 값을기반으로 조회하여 2번차수의 셀렉트박스에 결과 리스트를 호출하여 선택할수있게한다.
		/* $('#SearchStore').change(function(){
			$.ajax({
				type:'POST',
				url : '/storeDeviceInfo',
				data : {
					store_name : $('#SearchStore').val(),
					},
				dataType:"json",
				success:function(data){
					$.each(data, function(key, val) {
						//1번선택값에 의한 결과값을 2번셀렉트에 주입
						$('#storeDeviceInfo').append("<option value='"+val.device_nm+"'>"+val.device_nm+"</option>");
					});
				}
			});
		}); */


		//tui-grid 내에서 해당 셀클릭해서 팝업띄우는 액션을 호출하는 
		//해당미리보기 구현되면 팝업으로 상세보기 기능 예고
		/* 셀을 클릭할 때 팝업을 띄워주는 기능을 제공하고 있지는 않지만 제공되고 있는 
		focusChange이벤트를 이용해서 해당 rowKey와 columnName을 가져와서 팝업을 띄워주도록 
		하는 방식으로 개발이 될 수 있을 것 같습니다. */
		//grid1.on('focusChange', (ev) => {
			  //const{columnName, rowKey} = ev;
			  //클릭한셀의 정보 가져오기
			  //console.log(grid1.getRow(rowKey));
			  //img 의 src를 변경하는 방법
			  //$("#img_form_url").attr("src", imgurl);
			  //팝업창띄우기 가장마지막에
			 // $('#popupModalNew').modal('toggle');
			//});
		
		
		
		//이미지 프론트와 백로직둘다 체크
		//파일업로드 확장자, 파일크기 제한 유효성 체크
		function getCmaFileView() {
			//파일정보
			if( $("#file_upload_field").val() != "" ){
				var ext = $('#file_upload_field').val().split('.').pop().toLowerCase();
				      if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
					 alert('gif,png,jpg,jpeg 파일만 업로드 할수 있습니다.');
					 $("#file_upload_field").val("");
					 return;
				      }
				}
			//이미지 파일 사이즈
			if(document.getElementById("file_upload_field").value!=""){
			    var fileSize = document.getElementById("file_upload_field").files[0].size;
			    var maxSize = 5 * 1024 * 1024;//5MB
			 	 
			    if(fileSize > maxSize){
			       alert("첨부파일 사이즈는 5MB 이내로 등록 가능합니다. ");
			        $("#file_upload_field").val("");
			        return;
			     }
			} 
		}
		//자바스크립트 내 guid생성 이미지와 데이터 키값 매핑용으로 유니크 값 사용
		function guid() {
			  function s4() {
			    return Math.floor((1 + Math.random()) * 0x10000)
			      .toString(16)
			      .substring(1);
			  }
			  return s4() + s4() + '-' + s4() + '-' + s4() + '-' +
			    s4() + '-' + s4() + s4() + s4();
			}
</script>

  	<!-- 데이타 테이블 -->
		<script type="text/javascript"> 
		function dataTables() { 
		var myTable= echarts.init(document.getElementById("datatable-buttons"));
			myTable.setOption;
		
		$('#datatable-buttons').DataTable({
				"responsive" : false
			}); 
		}
		</script>

<!-- 그리드 툴 테마 설정 -->
  <script type="text/javascript">
  tui.Grid.applyTheme("default", {
		grid : {
			background : '#3a3a3a',
			border : '#000000',
			text : '#444'
		},
		selection : {
			background : '#A4A4A4',
			border : '#004082'
		},
		toolbar : {
			border : '#000000',
			background : '#262930'
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
				text : '#fff'
			},
			head : {
				background : '#262930',
				border : '#000000',
				text : '#c3f400'
			},
			rowHead : {
				background : '#262930',
				border : '#000000',
				text : '#fff'
			},
			summary : {
				background : '#262930',
				border : '#000000',
				text : '#fff'
			},
			editable : {
				background : '#3a3a3a',
				border : '#fff',
				text : '#fff'
			},
			selectedHead : {
				background : '#616161'
			},
			selectedRowHead : {
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
			currentRow : {
				background : '#0B243B'
			}
		}
	});
</script>

<!-- 그리드 삭제 이벤트 -->
 <script type="text/javascript">
	/* $("#deleteGrid").click(function() {
			 if(confirm("삭제 하시겠습니까?") == false) {
		         return false;
		     }
			if(grid1.getCheckedRowKeys(true) == "[]"){
				alert("체크박스를 선택하시오.");
				return false;
			}
				
			 
			 var test = grid1.getCheckedRows(true);
			 
			 $.ajax({
			        url:"/delGrid",
			        type:'POST',
			        data: {delParam:test},
			        dataType:'json',
			        success:function(data){
			        	if(data.code==1){
			        		 alert("삭제완료.");
			        	}else{
			        		
			        	}
			        },
			        error:function(data){
			        	alert("에러발생 관리자에게 문의하시오.");
			        }
			    });
		});  */
</script>
