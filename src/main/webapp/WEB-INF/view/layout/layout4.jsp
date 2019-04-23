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

<link rel="stylesheet" href="<%=cp%>/resource/jquery/css/smoothness/jquery-ui.min.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/resource/bootstrap/css/bootstrap-theme.min.css" type="text/css"/>


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
</style>
</head>
<body>

<div class="header">
    <tiles:insertAttribute name="header"/>
</div>

<section class="section" id="srcontianer" >
<div class="container" role="main">
    <div class="row row-offcanvas row-offcanvas-right">
        <div class="col-xs-6 col-sm-3 sidebar-offcanvas" style="max-width: 240px;" id="sidebar">
            <tiles:insertAttribute name="left"/>
        </div>
        <div class="col-xs-12 col-sm-9 body-frame-2">
                <tiles:insertAttribute name="body"/>
        </div>
     </div>
</div>
</section>

<div>
    <tiles:insertAttribute name="footer"/>
</div>

<script type="text/javascript" src="<%=cp%>/resource/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery.ui.datepicker-ko.js"></script>
</body>
</html>