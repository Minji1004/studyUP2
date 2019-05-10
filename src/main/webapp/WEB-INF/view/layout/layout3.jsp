<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
   String cp = request.getContextPath();
// String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+cp;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>spring</title>

	<link rel="stylesheet" href="<%=cp%>/resource/studyroom/css/srmain.css" />
	<link rel="stylesheet" href="<%=cp%>/resource/study/css/study.css" />
	<link rel="stylesheet" href="<%=cp%>/resource/css/lecture.css">
    <link rel="stylesheet" href="<%=cp%>/resource/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=cp%>/resource/css/jquery.fancybox.css">
    <link rel="stylesheet" href="<%=cp%>/resource/css/main.css">
    <link rel="stylesheet" href="<%=cp%>/resource/css/responsive.css">
    <link rel="stylesheet" href="<%=cp%>/resource/css/animate.min.css">
    <link rel="stylesheet" href="<%=cp%>/resource/css/timer.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="<%=cp%>/resource/jquery/css/smoothness/jquery-ui.min.css" type="text/css">
	<link rel="stylesheet" href="<%=cp%>/resource/css/timer.css" type="text/css">
	
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/js/util-jquery.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/js/util.js"></script>
<script type="text/javascript" src="<%=cp %>/resource/js/jquery.pietimer.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/js/TimeCircles.js"></script>
<style type="text/css">
.timer_main_loc{
    position: fixed;
    top: 140px;
    right: 17px;
}
.timer_loc_fix{
    position: fixed;
}
.success_timer_btn{
  position: fixed;
    top: 290px;
    right: 135px;
}
.stop_timer_btn{
	position: fixed;
    top: 290px;
    right: 83px;
}
.restart_timer_btn{
	position: fixed;
    top: 290px;
    right: 18px;
}
.btn-db{
}
</style>
<script type="text/javascript">
$(function(){
	$(document).on("click",".timer", function(){
		var url = "<%=cp%>/timer/main";
		var userId = "${sessionScope.member.userId}";
		
		if(userId=="" || userId == null){
			url = "<%=cp%>/member/login";
			location.href = url;
		} 
		$('#myTimerModal .modal-content').load(url, function() {
			$('#myTimerModal').modal('show');
		});
	});
});
$(function(){
	//1. 중도에 그만 멈추기(저장 까지)
	$("body").on("click", ".btn-db", function(){
		//var time = $("#DateCountdown").TimeCircles().getTime();	
		
		var hours = $(".textDiv_Hours").children("span").text();
		var minutes = $(".textDiv_Minutes").children("span").text();
		var seconds = $(".textDiv_Seconds").children("span").text();
		
		hours = parseInt(hours);
		minutes = parseInt(minutes);
		seconds = parseInt(seconds);

		alert(hours + ":" + minutes + ":" + seconds);
		
		var second = (hours * 3600)+(minutes * 60) + seconds;
		
		var url = "<%=cp%>/timer/etime";
		var query = "second=" + second + "&timerCheck=${sessionScope.member.timerCheck}";
		alert(query);
		$.ajax({
			type : "POST"
			,url : url
			,data : query 
			,dataType : "JSON"
			,success : function(data){
				if(data.state == "true"){
					$("#DateCountdownLoc").empty();
					alert("시간이 저장되었습니다.");
				}else{
					
				}
			}
			,error : function(e){
				console.log(e);
			}
		});
	});
});

</script>

</head>

<body>

<div class="header">
    <tiles:insertAttribute name="header"/>
</div>
	

<div class="container">
    <tiles:insertAttribute name="body"/>
</div>

<div id="DateCountdownLoc" style="height:300px; width:300px;position: fixed;top: 113px;right: 0px;"></div>

<div class="footer">
    <tiles:insertAttribute name="footer"/>
</div>

<div class="smodal modal fade" id="myTimerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="timer-modal-dialog">
    <div class="modal-content" style="background: #FBFDF8;"></div>
  </div>
</div>

<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery.ui.datepicker-ko.js"></script>
<script src="<%=cp%>/resource/js/bootstrap.min.js"></script>
<script src="<%=cp%>/resource/js/jquery.fancybox.pack.js"></script>
<script src="<%=cp%>/resource/js/jquery.waypoints.min.js"></script>
<script src="<%=cp%>/resource/js/main.js"></script>
</body>
</html>