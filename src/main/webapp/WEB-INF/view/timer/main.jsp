<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<script type="text/javascript">
$(function(){
	$(document).on("change", "input[name=goalTime]", function(){
		
		var url = "<%=cp%>/timer/selectGoalTime";
		
		$.ajax({
			type : "POST"
			,url : url
			,success : function(data){
				if($("input:checkbox[name='goalTime']").is(":checked")){
					$("#goaltimeSelector").html(data);
				}else{
					$("#goaltimeSelector").empty();
				}

			}
			,error : function(e){
				console.log(e);
			}
			
		});
		
	});
	

});

	
$(function(){

		$("body").on("click","button[data-timer=apply]", function(){
	
			var selectHour = $("select[name=goaltimeH]").val();
			var selectMinute = $("select[name=goaltimeM]").val();
	
			var Now = new Date();
			var currentHour = Now.getHours();
			var currentMinute = Now.getMinutes();
			
			var second = (selectHour-currentHour)*3600 + (selectMinute-currentMinute) * 60;
			
			var $span = $("#goaltimeSelector").next("div").children("span");
			
			if(second < 0){
				$span.html("무리 입니다. 자제하세요");
				return;
			}
			
			var url = "<%=cp%>/timer/start";
			$.ajax({
				type : "POST"
				,url : url
				,data : {"second": second}
				,dataType : "JSON"
				,success : function(data){
					if(data.state == "true"){
						$("#DateCountdown").attr("data-timer" , second);
						
						$("#DateCountdown").TimeCircles({
						    "animation": "smooth",
						    "bg_width": 1.2,
						    "fg_width": 0.1,
						    "circle_bg_color": "#60686F",
						    "time": {
						        "Days": {
						            "text": "Days",
						            "color": "#FFCC66",
						            "show": false
						        },
						        "Hours": {
						            "text": "Hours",
						            "color": "#99CCFF",
						            "show": true
						        },
						        "Minutes": {
						            "text": "Minutes",
						            "color": "#BBFFBB",
						            "show": true
						        },
						        "Seconds": {
						            "text": "Seconds",
						            "color": "#FF9999",
						            "show": true
						        }
						    }
						});
						$("canvas").css("width", "400px");
						$(".time_circles").addClass("timer_main_loc");	

						$(".textDiv_Hours").css("width", "0px");
						$(".textDiv_Hours").css("top", "164px");
						$(".textDiv_Hours").css("left", "");
						$(".textDiv_Hours").css("right", "370px");
						$(".textDiv_Hours").addClass("timer_loc_fix");
						
						$(".textDiv_Minutes").css("width", "0px");
						$(".textDiv_Minutes").css("top", "164px");
						$(".textDiv_Minutes").css("left", "");
						$(".textDiv_Minutes").css("right", "235px");
						$(".textDiv_Minutes").addClass("timer_loc_fix");
						
						$(".textDiv_Seconds").css("width", "0px");
						$(".textDiv_Seconds").css("top", "164px");
						$(".textDiv_Seconds").css("left", "");
						$(".textDiv_Seconds").css("right", "108px");
						$(".textDiv_Seconds").addClass("timer_loc_fix");
						
						$(".textDiv_Hours").children("h4").css("font-size", "20px");
						$(".textDiv_Hours").children("span").css("font-size", "40px");
						$(".textDiv_Hours").children("h4").css("color", "red");
						$(".textDiv_Hours").children("span").css("color", "red");
						$(".textDiv_Minutes").children("h4").css("font-size", "20px");
						$(".textDiv_Minutes").children("span").css("font-size", "40px");
						$(".textDiv_Minutes").children("h4").css("color", "red");
						$(".textDiv_Minutes").children("span").css("color", "red");	
						$(".textDiv_Seconds").children("h4").css("font-size", "20px");
						$(".textDiv_Seconds").children("span").css("font-size", "40px");
						$(".textDiv_Seconds").children("h4").css("color", "red");
						$(".textDiv_Seconds").children("span").css("color", "red");
						
						$(".btn-success").show();
						$(".btn-danger").show();
						$(".btn-info").show();
						$(".btn-db").show();
						
						$(".start").click(function(){ $("#DateCountdown").TimeCircles().start(); });
						$(".stop").click(function(){ $("#DateCountdown").TimeCircles().stop(); });
						$(".restart").click(function(){ $("#DateCountdown").TimeCircles().restart(); }); 
						
					    $(".btn-success").addClass("success_timer_btn");
					    $(".btn-danger").addClass("stop_timer_btn");
					    $(".btn-info").addClass("restart_timer_btn");
						
						$('#myTimerModal').modal('hide');

					}
				}
				,error : function(e){
					console.log(e);
				}
				
			});
			
			
			
			

		});

		
		
		
});
	
	
$(function(){
	//1. 중도에 그만 멈추기(저장 까지)
	
	$("body").on("click", ".btn-db", function(){
		var time = $("#DateCountdown").TimeCircles().getTime();
		alert(time);
		
		var selectHour = $("select[name=goaltimeH]").val();
		var selectMinute = $("select[name=goaltimeM]").val();
		
		
		//여기 까지
		//끝난 시간 저장
		var url = "<%=cp%>/timer/etime";
		$.ajax({
			type : "POST"
			,url : url
			,dataType : "json"
			,success : function(data){
				if(data.state == "true"){
					
				}else{
					
				}
			}
			,error : function(e){
				console.log(e);
			}
		});
		
		
		/* 
		var second = 0;
		$("#DateCountdown").attr("data-timer" , second);
		
		$("#DateCountdown").TimeCircles().destroy(); */
		
	});
	
	
	//시작 시간, 끝난 시간, 목표 시간 저장
	
	//목표 시간까지 했을 때 (완료 알림 표시)
	//시간 정리
	
	//2. 타이머 스타트 구간(타이머는 저장 안됨)
	//그냥 시간 가도록
	
	//다른 페이지 이동해도 계속 될 수 있게 구현


});



</script>


<div class="modal-header" style="width: 900;">
	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
 	<h4 class="modal-title" id="myModalLabel" align="center">타이머</h4>
</div>
<div class="timer-modal-body modal-body row" style="height: 200;">
 	<div class="dialog-content-location"><input type="checkbox" name="goalTime">&nbsp;<b>목표시간</b></div>
 		
 	<div id="goaltimeSelector"class="dialog-content dialog-content-location"></div>
	<div><span style="color: red; padding-left: 20px"></span></div>
</div>
<div class="modal-footer">
   <button type="button" class="btn btn-primary" data-timer="apply">적용</button>
   <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
</div>



	
	
	
		
