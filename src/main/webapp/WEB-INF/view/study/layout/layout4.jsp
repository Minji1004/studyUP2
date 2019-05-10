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
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Study</title>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="<%=cp%>/resource/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=cp%>/resource/css/font-awesome.css">
  <link rel="stylesheet" href="<%=cp%>/resource/css/ionicons.css">
  <link rel="stylesheet" href="<%=cp%>/resource/study/css/mystudy.css">
  <link rel="stylesheet" href="<%=cp%>/resource/css/skin-blue.css">
  <link rel="stylesheet" href="<%=cp%>/resource/css/teacher.css">
  <link rel="stylesheet" href="<%=cp%>/resource/css/dataTables.bootstrap.css">
  <link rel="stylesheet" href="<%=cp%>/resource/css/star.css">
  <link rel="stylesheet" href="<%=cp%>/resource/study/css/study.css">
  <link rel="stylesheet" href="<%=cp%>/resource/jquery/css/smoothness/jquery-ui.min.css" type="text/css">
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-1.12.4.min.js"></script>

<!-- star-->
<script src="<%=cp%>/resource/js/star.js"></script>

<script type="text/javascript">

	$(document).ready(function(){
		if(${left}>=10){
			$(".sidebar-menu li").eq(9).addClass("active");
			$(".treeview-menu li").eq(${left}-10).addClass("active");
		}
		
		$(".sidebar-menu li").eq(${left}).addClass("active");
	});  

</script>

</head>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

<div class="main-header">
    <tiles:insertAttribute name="header"/>
</div>

<div class="left">
    <tiles:insertAttribute name="left"/>
</div>

<div class="content-wrapper">
    <tiles:insertAttribute name="body"/>
</div>

<div class="footer">
    <tiles:insertAttribute name="footer"/>
</div>

</div>

<!-- dataTable-->
<script src="<%=cp%>/resource/js/jquery.dataTables.js"></script>
<script src="<%=cp%>/resource/js/dataTables.bootstrap.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="<%=cp%>/resource/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="<%=cp%>/resource/js/adminlte.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery.ui.datepicker-ko.js"></script>

</body>
</html>