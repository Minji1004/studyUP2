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
	<link rel="stylesheet" href="<%=cp%>/resource/css/lecture.css">
    <link rel="stylesheet" href="<%=cp%>/resource/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=cp%>/resource/css/jquery.fancybox.css">
    <link rel="stylesheet" href="<%=cp%>/resource/css/main.css">
    <link rel="stylesheet" href="<%=cp%>/resource/css/responsive.css">
    <link rel="stylesheet" href="<%=cp%>/resource/css/animate.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=cp%>/resource/jquery/css/smoothness/jquery-ui.min.css" type="text/css">

<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-1.12.4.min.js"></script>

<script type="text/javascript" src="<%=cp%>/resource/js/util-jquery.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/js/util.js"></script>
</head>

<body>

<div class="header">
    <tiles:insertAttribute name="header"/>
</div>
	
<div class="container">
    <tiles:insertAttribute name="body"/>
</div>

<div class="footer">
    <tiles:insertAttribute name="footer"/>
</div>

<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery.ui.datepicker-ko.js"></script>
<script src="<%=cp%>/resource/js/bootstrap.min.js"></script>
<script src="<%=cp%>/resource/js/jquery.fancybox.pack.js"></script>
<script src="<%=cp%>/resource/js/jquery.waypoints.min.js"></script>
<script src="<%=cp%>/resource/js/main.js"></script>
</body>
</html>