<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>
<script src="https://code.highcharts.com/highcharts-more.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>


<script type="text/javascript">

$(function(){
	var url="<%=cp%>/study/pie3d";
	$.getJSON(url, function (data) {
		$('#pie3dContainer').highcharts({
			chart: {
	            type: 'pie',
	            options3d: {
	                enabled: true,
	                alpha: 45
	            }
	        },			
	        title: {
	            text: '5월 16일 공부시간',
	        },
	        plotOptions: {
	            pie: {
	                innerSize: 100,
	                depth: 45
	            }
	        },
	        series:data
		});
	});
});

$(function() {
	
	
});


$(function(){
	var url="<%=cp%>/study/line";
	$.getJSON(url, function (data) {
		var year=data.year;
		
		$('#lineContainer').highcharts({
	        title: {
	            text: '이번주 우리의 공부시간',
	        },
	        xAxis: {
	            categories: ['5월13일', '5월14일', '5월15일', '5월16일', 
	            					'5월17일', '5월18일', '5월19일']
	        },
	        yAxis: {
	            title: {
	                text: '공부시간 (Hour)'
	            },
	        },
	        series:data.series
		});
	});
});

$(function() {
	var chart = Highcharts.chart('container', {

	    title: {
			text: '5월 16일 공부시간'
		},

		xAxis: {
			categories: ['국어', '영어', '한국사', '생활과 윤리', '윤리와 사상', '경제', '법과정치', '수학-나']
		},
		
		yAxis: {
            title: {
                text: '공부시간 (Hour)'
            },
	    },

		series: [{
			type: 'column',
			colorByPoint: true,
			data: [1.0, 1.5, 3.0, 1.2, 1.5, 2.0, 3.6, 2.5],
			showInLegend: false
		}]
	});


	$('#plain').click(function () {
	    chart.update({
	        chart: {
	            inverted: false,
	            polar: false
	        },	        
	    });
	});

	$('#inverted').click(function () {
	    chart.update({
	        chart: {
	            inverted: true,
	            polar: false
	        },
	    });
	});

	$('#polar').click(function () {
	    chart.update({
	        chart: {
	            inverted: false,
	            polar: true
	        },
	    });
	});

});


</script>


<!-- Main content -->
<section class="content container-fluid">

	<div>
		<div class="box-body">
	     <blockquote>
	       <p>당신과 함께할 스터디 <span class="text-green">${dto.studyName}</span></p>
	       <small>StudyUp은 언제나 당신을 응원합니다.</small>
	     </blockquote>
	   </div>
	</div>


	<div class="row" style="height: 100%;">
		<div class="col-md-5 col-md-offset-1" style="height: 70%;">
			<div class="box box-info">
			    <div class="box-header with-border">
			      <h3 class="box-title">나의 공부시간</h3>
			
			      <div class="box-tools pull-right">
			        <button class="btn btn-box-tool" type="button" data-widget="collapse"><i class="fa fa-minus"></i></button>
			      </div>
			    </div>
	            <!-- /.box-header -->
	            <div class="box-body">
	            	<div style="clear: both;">
					    <div id="container"></div>
					</div>
					<div class="box-footer clearfix pull-right">              
						<button class="btn btn-success" id="plain">Plain</button>
						<button class="btn btn-success" id="inverted">Inverted</button>
						<button class="btn btn-success" id="polar">Polar</button>
		            </div>	              
             	</div>
              <!-- /.table-responsive -->
            </div>
        
   		 </div>
   		 
   		 <div class="col-md-5"  style="height: 70%;">
			<div class="box box-success">
			    <div class="box-header with-border">
			      <h3 class="box-title">우리 공부시간</h3>
			
			      <div class="box-tools pull-right">
			        <button class="btn btn-box-tool" type="button" data-widget="collapse"><i class="fa fa-minus"></i></button>
			      </div>
			    </div>
	            <!-- /.box-header -->
	            <div class="box-body" style="height: 475px;">
	            	<div style="clear: both;">
					    <div id="lineContainer"></div>
					</div>
	             	<div class="box-footer clearfix pull-right">
		            </div>	
            
            	</div>
   		 	</div>  
  		</div>
  	</div>
</section>

