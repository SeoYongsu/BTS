<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!DOCTYPE html>
	<!--주간차트 스크립트 -->
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	<script src="https://code.highcharts.com/modules/export-data.js"></script>

	<!-- 나이차트지역차트 장르별판매랑차트 -->
	<script src="https://www.amcharts.com/lib/4/core.js"></script>
	<script src="https://www.amcharts.com/lib/4/charts.js"></script>
	<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>

    <!-- moment 달력-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.19.3/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.19.3/moment-with-locales.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.19.3/locale/ko.js"></script>	
    
    <!-- bootstrap datetimepicker 달력-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css"  />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js" ></script>
	
	<!--섹션  -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/web/js/chartForm.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/web/css/chartForm.css">
	
	
	<style type="text/css">
	/*주간선택?  */
	.bootstrap-datetimepicker-widget tr:hover { background-color: #808080;}
    #chartdiv0{width: 100%;  height: 500px;};
    /*나이차트  */
    rect{height:500px;}
    #chartdiv1 {width: 100%; height: 500px;};
    /*장르별판매량  */
    rect{height:500px;}
   #chartdiv2 {width: 100%; height: 500px;};
    /*지역별회원  */
    rect{height:500px;}
   #chartdiv3 {width: 100%; height: 500px;};
	.container{width: 100%; height: 500px;}
	hr{  border: 0;
    height: 3px;
    background: #ccc;}
	</style>	

<title>통계차트</title>
<script type="text/javascript">
//주간차트 폼비우기



function btnempty(){
	$("#weekChart")[0].reset();
}

//유효성 체크
function hasNotBlank(formId){
	var hasNotBlank = true;
	$("#" + formId + " input[required]").each(function(idx){
		if($(this).val() == "" || $(this).val().length < 10 ){
			alert("필수항목이 입력되지 않았습니다.");
			$(this).focus();			
			hasNotBlank = false;
			return false;
		}else{
			hasNotBlank = true;
		}
	});	
	return hasNotBlank;
}

//주간차트
function weekChartCall(data){
	
	Highcharts.chart('chartdiv0', {
		  chart: {
		    type: 'areaspline'
		  },
		  title: {
		    text: 'Week Chart'
		  },
		  legend: {
		    layout: 'vertical',
		    align: 'left',
		    verticalAlign: 'top',
		    x: 150,
		    y: 100,
		    floating: true,
		    borderWidth: 1,
		    backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'
		  },
		  xAxis: {
		    categories: data[2],
		    plotBands: [{ // visualize the weekend
		      from: 4.5,
		      to: 6.5,
		      color: 'rgba(68, 170, 213, .2)'
		    }]
		  },
		  yAxis: {
		    title: {
		      text: 'Sales'
		    }
		  },
		  tooltip: {
		    shared: true,
		    valueSuffix: '원'
		  },
		  credits: {
		    enabled: false
		  },
		  plotOptions: {
		    areaspline: {
		      fillOpacity: 0.5
		    }
		  },
		  series: [{
		    name: 'firstWeek',
		    data: data[0]
		  }, {
		    name: 'secoundWeek',
		    data:data[1]
		  }]
		});		   
}

//age차트
function ageChartCall(data){
	
	am4core.ready(function() {

		// Themes begin
		am4core.useTheme(am4themes_animated);
		// Themes end

		var iconPath = "M53.5,476c0,14,6.833,21,20.5,21s20.5-7,20.5-21V287h21v189c0,14,6.834,21,20.5,21 c13.667,0,20.5-7,20.5-21V154h10v116c0,7.334,2.5,12.667,7.5,16s10.167,3.333,15.5,0s8-8.667,8-16V145c0-13.334-4.5-23.667-13.5-31 s-21.5-11-37.5-11h-82c-15.333,0-27.833,3.333-37.5,10s-14.5,17-14.5,31v133c0,6,2.667,10.333,8,13s10.5,2.667,15.5,0s7.5-7,7.5-13 V154h10V476 M61.5,42.5c0,11.667,4.167,21.667,12.5,30S92.333,85,104,85s21.667-4.167,30-12.5S146.5,54,146.5,42 c0-11.335-4.167-21.168-12.5-29.5C125.667,4.167,115.667,0,104,0S82.333,4.167,74,12.5S61.5,30.833,61.5,42.5z"
		var chart = am4core.create("chartdiv1", am4charts.SlicedChart);
		chart.hiddenState.properties.opacity = 0; // this makes initial fade in effect

		chart.data = data

		var series = chart.series.push(new am4charts.PictorialStackedSeries());
		series.dataFields.value = "방문자수";
		series.dataFields.category = "age";
		series.alignLabels = true;

		series.maskSprite.path = iconPath;
		series.ticks.template.locationX = 1;
		series.ticks.template.locationY = 0.5;

		series.labelsContainer.width = 200;

		chart.legend = new am4charts.Legend();
		chart.legend.position = "left";
		chart.legend.valign = "bottom";
		}); // end am4core.ready()
};

//장르별 판매량
function genreChartCall(data){
	am4core.ready(function() {
		// Themes begin
		am4core.useTheme(am4themes_animated);
		// Themes end

		var chart = am4core.create("chartdiv2", am4charts.PieChart3D);
		chart.hiddenState.properties.opacity = 0; // this creates initial fade-in

		chart.data = data;

		chart.innerRadius = am4core.percent(40);
		chart.depth = 120;

		chart.legend = new am4charts.Legend();

		var series = chart.series.push(new am4charts.PieSeries3D());
		series.dataFields.value = "value";
		series.dataFields.depthValue = "value";
		series.dataFields.category = "genre";
		series.slices.template.cornerRadius = 5;
		series.colors.step = 3;

		}); // end am4core.ready()
};

//지역별 회원 차트
function liveChartCall(data){
	am4core.ready(function() {

		// Themes begin
		am4core.useTheme(am4themes_animated);
		// Themes end

		// Create chart instance
		var chart = am4core.create("chartdiv3", am4charts.XYChart3D);

		// Add data
		chart.data = data

		// Create axes
		let categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
		categoryAxis.dataFields.category = "country";
		categoryAxis.renderer.labels.template.rotation = 270;
		categoryAxis.renderer.labels.template.hideOversized = false;
		categoryAxis.renderer.minGridDistance = 20;
		categoryAxis.renderer.labels.template.horizontalCenter = "right";
		categoryAxis.renderer.labels.template.verticalCenter = "middle";
		categoryAxis.tooltip.label.rotation = 270;
		categoryAxis.tooltip.label.horizontalCenter = "right";
		categoryAxis.tooltip.label.verticalCenter = "middle";

		let valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
		valueAxis.title.text = "Countries";
		valueAxis.title.fontWeight = "bold";

		// Create series
		var series = chart.series.push(new am4charts.ColumnSeries3D());
		series.dataFields.valueY = "visits";
		series.dataFields.categoryX = "country";
		series.name = "Visits";
		series.tooltipText = "{categoryX}: [bold]{valueY}[/]";
		series.columns.template.fillOpacity = .8;

		var columnTemplate = series.columns.template;
		columnTemplate.strokeWidth = 2;
		columnTemplate.strokeOpacity = 1;
		columnTemplate.stroke = am4core.color("#FFFFFF");

		columnTemplate.adapter.add("fill", (fill, target) => {
		  return chart.colors.getIndex(target.dataItem.index);
		})

		columnTemplate.adapter.add("stroke", (stroke, target) => {
		  return chart.colors.getIndex(target.dataItem.index);
		})

		chart.cursor = new am4charts.XYCursor();
		chart.cursor.lineX.strokeOpacity = 0;
		chart.cursor.lineY.strokeOpacity = 0;

		}); // end am4core.ready()
}

/*차트에 필요한 데이터가공  */
function dataSet(data,chartCallNumber){
	/*차트넘버  */
	var chartNumber=chartCallNumber;
	/*가공한 데이터를 넣을 변수  */
	var chartData =[];
	console.log(data)
	console.log(chartCallNumber)
	
	if(chartNumber == 0){
		chartData =[];
		var first = [];
		for(var i =0; i<data.a.length; i++){
			first.push(data.a[i].firstCount)
		}
		var secound = [];
		for(var i =0; i<data.b.length; i++){
			secound.push(data.b[i].secoundCount)
		}
		var weekDay = [];
		for(var i =0; i<data.a.length; i++){
			weekDay.push(data.a[i].firstWeek)
		}
		chartData.push(first)
		chartData.push(secound)
		chartData.push(weekDay)
	}
	else if(chartNumber == 1){
		chartData =[];
		for(var i in data){
		chartData.push({"age":data[i].age+"대", "방문자수":data[i].cnt}) 
		}
	}
	else if(chartNumber == 2){
		chartData =[];
		for(var i in data){
		chartData.push({genre:data[i].biGenre, value:data[i].count}) 
		}
	}
	else if(chartNumber == 3){
		chartData =[]
		for(var i in data){
		chartData.push({"country":data[i].mSido, "visits":data[i].liveCount}) 
		}
	}
	else{
		alert("다시시도해주세요")
		return ;
	};
	return chartData
};

$(document).ready(function(){
 	
	
	//차트를 불러오는 기능
	$("#btn_weekSaleChart, #btn_ageChart, #btn_genreChart, #btn_liveChart").on("click",function(){
		//ajax 차트 분류
		var  week = $("#btn_weekSaleChart").val()
		var  age = $("#btn_ageChart").val()
		var  genre = $("#btn_genreChart").val()
		var  live = $("#btn_liveChart").val()
		var url = null;
		var frmData = null;
		var chartCallNumber = null;
		var chartDataSet =[];
		
		if($(this).val() == week){
			frmData = $("#weekChart").serialize();
			url="/chart/weekChart";
			chartCallNumber = 0;
			if(!hasNotBlank("weekChart")){ return false};
		}
	
		else if ($(this).val() == age){
			frmData=null
			url="/chart/ageChart";
			chartCallNumber = 1;
  		}
		else if ($(this).val() == genre){
			frmData=null
			url="/chart/genreChart";
			chartCallNumber = 2;
  		}
		else if ($(this).val() == live){
			frmData=null
			url="/chart/liveChart";
			chartCallNumber = 3;
  		}
		else{
			alert("담당자에게문의")
			return false;
		}

		//차트불러오기시작
		 $.ajax({
			    data : frmData,
		        type: "POST",
		        url : "${pageContext.request.contextPath}"+url,
		        dataType : "json",
		        success : function(data){
			        if(data == null || data.length == 0){
			        	alert(" 담당자에게 문의 하시길 바랍니다")
			        	return;
			        }	
			        	
			   		if(chartCallNumber == 0){
			   			chartDataSet =[];
			   			chartDataSet =	dataSet(data,chartCallNumber)
			     		weekChartCall(chartDataSet);
			        }
			   		
			   		else if(chartCallNumber == 1){
			   			chartDataSet =[];
			         	chartDataSet =	dataSet(data,chartCallNumber)
			   			ageChartCall(chartDataSet);
			         	$("rect").css("height", "500px")
			   		}
			   		else if(chartCallNumber == 2){
			   			chartDataSet =[];
			   			chartDataSet =	dataSet(data,chartCallNumber)
			   			genreChartCall(chartDataSet);
			   		}
			   		else if(chartCallNumber == 3){
			   			chartDataSet =[];
			   			chartDataSet =	dataSet(data,chartCallNumber)
			   			liveChartCall(chartDataSet);
			   			$(rect).css("height", "500px")
			   		}
			   		else{
			   			alert("담당자에게 문의")
			   			return;
			   		}
		   		
		        },
		        error : function(xhr, status, error){
		        	alert("xhr:"+xhr+", status:"+ status + ", error:"+error);

		        }
		    });
 
		});
	
	  //차트를 위한 날짜선택 이벤트 시작
	  $("#firstWeeka").datetimepicker({
	      format: 'YYYY-MM-DD'
	    	  ,maxDate: '2019-05-31'

	  });
	  $("#secoundWeeka").datetimepicker({
	      format: 'YYYY-MM-DD'
		      ,maxDate: '2019-05-31'
	  });

	 
	   //중복날짜  체크
	   //firstcheck
	   var disabledateFirst = null;
	   //secoundcheck
	   var disabledateSecound = null;
	   
	  // 여기가 1번쨰
	  $('#firstWeeka').on('dp.change', function (e) {	
	      var value = $("#firstWeeka").val();
	      var firstDate = moment(value, "YYYY-MM-DD").day(0).format("YYYY-MM-DD");
	      var lastDate =  moment(value, "YYYY-MM-DD").day(6).format("YYYY-MM-DD");
	      disabledateFirst = firstDate;

	      //중복선택불가	
	      if(disabledateSecound == firstDate){
	    	  $("#firstWeeka, #firstWeekb").val("선택불가");
	    	  return;
	      }else{
	    	  $("#firstWeeka").val(firstDate);
	   	      $("#firstWeekb").val(lastDate);    	  
	   	     	  
	      }	    	  
	  });
	  // 2번째
	  $('#secoundWeeka').on('dp.change', function (e) {
	      var value = $("#secoundWeeka").val();
	      var firstDate = moment(value, 'YYYY-MM-DD').day(0).format("YYYY-MM-DD");
	      var lastDate =  moment(value, 'YYYY-MM-DD').day(6).format("YYYY-MM-DD");
	      disabledateSecound = firstDate;
	    	  
	    	  //중복선택불가	
		      if(disabledateFirst == firstDate){
		    	  $("#secoundWeeka, #secoundWeekb").val("선택불가");
		    	  return;
		      }else{
			      $("#secoundWeeka").val(firstDate);
			      $("#secoundWeekb").val(lastDate);
		      }	    	  
	  });	
});
</script>
<body>
<div>
<div>
	<div>
	    <nav class="nava">
	        <ul class="nav-menu">
	            <li><a class="nav-menu-item" href="#section-1">주간판매율비교</a></li>
	            <li><a class="nav-menu-item" href="#section-2">회원연령별통계</a></li>
	            <li><a class="nav-menu-item" href="#section-3">장르별판매량</a></li>
	            <li><a class="nav-menu-item" href="#section-4">지역별통계</a></li>
	        </ul>
	    </nav>
	</div>
<div>
	<div class="section">
	<!--주간비교판매량  -->
	    <section id="section-1">
	        <!--날짜선택DIV -->
		<div class="container-fluid">    
		    <div class="row">
		        <div class="col-sm-6 form-group">
		            <div class="input-group" id="DateDemo" >
		            <!--날짜선택 폼  -->
		              <form id="weekChart" method="post" name="weekChart">
			              <input type="text" id="firstWeeka" name = "firstWeeka" placeholder="Select Week" required="required" /> -
			              <input type="text" id="firstWeekb" name = "firstWeekb" placeholder="Select Week" required="required" /></br>
			              <input type="text" id="secoundWeeka" name = "secoundWeeka" placeholder="Select Week" required="required" /> -
			              <input type="text" id="secoundWeekb" name = "secoundWeekb" placeholder="Select Week" required="required"/>     
		         	  </form>
			               <!--차트불러오기 버튼  -->
			              <button type="button"  id = "btn_weekSaleChart" class="btn btn-dark"   name = "btn_weekSaleChart" value = "week">week</button>
			             <!--날짜선택 초기화 버튼 -->
			              <button type="button"  id = "btn_weekChartClear" class="btn btn-dark" name = "btn_weekChartClear" value = "weekChartClear" onclick="btnempty();">weekclear</button>
		          </div>
		      </div>
		  <div id="chartdiv0"></div>
		  </div>
		</div>	
		</section>
		
		<hr>
		
		<!--나이차트  -->
	    <section id="section-2">
			  <button type="button" id = "btn_ageChart" class="btn btn-dark" name = "btn_ageChart" value = "age" >age</button>
			  <div id="chartdiv1" class="container"></div>
	    </section>
	    <hr>
	    
	    <!--장르별  -->
	   
	    <section id="section-3">
			 <button type="button" id = "btn_genreChart" class="btn btn-dark" name = "btn_genreChart" value = "genre">genre</button>
			  <div id="chartdiv2" class="container"></div>
	    </section>
	    
	    <hr>
	    
	    <section id="section-4">
	        <!--지역별회원  -->
			 <button type="button" id = "btn_liveChart" class="btn btn-dark" name = "btn_liveChart" value = "live">live</button>
			 <div id="chartdiv3" class="container"></div>	
	    </section>
	</div>
</div>
</div>
</div>
</body>
   
		
		
				
				
		    
			


