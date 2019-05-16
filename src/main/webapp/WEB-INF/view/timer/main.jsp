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
	$("body").on("click", "button[data-apply=timer]", function(){
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
		var url = "<%=cp%>/timer/timer_main";
		$.ajax({
			type : "GET"
			,url : url
			,success : function(data){
				$("#DateCountdownLoc").html(data);
			}
			,error : function(e){
				console.log(e);
			}
		});
		var studyCategory  = $("select[name=studyKindCategory]").val();
		var f = document.timerContent;
		var content = f.content.value;
		var subject = f.subject.value;
		
		var timerurl = "<%=cp%>/timer/start";
		
		var query = "second=" + second + "&studyCategory=" + studyCategory + "&subject=" + subject + "&content=" + content;  
		$.ajax({
			type : "POST"
			,url : timerurl
			,data : query
			,dataType : "JSON"
			,success : function(data){					
				$("#DateCountdown").attr("data-timer" , second);
				
				$("#DateCountdown").TimeCircles({
				    "animation": "smooth",
				    "bg_width": 1.2,
				    "fg_width": 0.1,
				    "circle_bg_color": "#60686F",
				    "time": {
				        "Days": {
				            "text": "Days",
				            "color": "#E8C826",
				            "show": false
				        },
				        "Hours": {
				            "text": "Hours",
				            "color": "#E8C826",
				            "show": true
				        },
				        "Minutes": {
				            "text": "Minutes",
				            "color": "#E8C826",
				            "show": true
				        },
				        "Seconds": {
				            "text": "Seconds",
				            "color": "#E8C826",
				            "show": true
				        }
				    }
				});
				$("canvas").css("width", "400px");
				
				$(".textDiv_Hours").css("top", "158px");
				$(".textDiv_Hours").css("right", "-156px");
				$(".textDiv_Hours").css("width", "420px");
				$(".textDiv_Hours").css("position", "fixed");
				$(".textDiv_Hours").css("left", "");
				
				$(".textDiv_Minutes").css("top", "158px");
				$(".textDiv_Minutes").css("right", "-245px");
				$(".textDiv_Minutes").css("width", "420px");
				$(".textDiv_Minutes").css("position", "fixed");
				$(".textDiv_Minutes").css("left", "");
				
				$(".textDiv_Seconds").css("top", "158px");
				$(".textDiv_Seconds").css("right", "-346px");
				$(".textDiv_Seconds").css("width", "420px");
				$(".textDiv_Seconds").css("position", "fixed");
				$(".textDiv_Seconds").css("left", "");
				
				$(".textDiv_Hours").children("h4").css("font-size", "15px");
				$(".textDiv_Hours").children("span").css("font-size", "25px");
				$(".textDiv_Hours").children("h4").css("color", "#49C8F7");
				$(".textDiv_Hours").children("span").css("color", "#49C8F7");
				$(".textDiv_Minutes").children("h4").css("font-size", "15px");
				$(".textDiv_Minutes").children("span").css("font-size", "25px");
				$(".textDiv_Minutes").children("h4").css("color", "#49C8F7");
				$(".textDiv_Minutes").children("span").css("color", "#49C8F7");	
				$(".textDiv_Seconds").children("h4").css("font-size", "15px");
				$(".textDiv_Seconds").children("span").css("font-size", "25px");
				$(".textDiv_Seconds").children("h4").css("color", "#49C8F7");
				$(".textDiv_Seconds").children("span").css("color", "#49C8F7");
				
				$(".btn-success").show();
				$(".btn-danger").show();
				$(".btn-info").show();
				$(".btn-db").show();
				
				$(".start").click(function(){ $("#DateCountdown").TimeCircles().start(); });
				$(".stop").click(function(){ $("#DateCountdown").TimeCircles().stop(); });
				$(".restart").click(function(){ $("#DateCountdown").TimeCircles().restart(); }); 
				
				$('#myTimerModal').modal('hide');	
			}
			,error : function(e){
				console.log(e);
			}
		});
	});
		
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
   <button type="button" class="btn btn-primary" data-apply="timer">적용</button>
   <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
</div>



	
	
	
		
