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
   <link rel="stylesheet" href="<%=cp%>/resource/css/timer.css" type="text/css">
   
   <!-- 추가 -->
   <link rel="stylesheet" href="<%=cp%>/resource/css/font-awesome.css">
  <link rel="stylesheet" href="<%=cp%>/resource/css/ionicons.css">
  <link rel="stylesheet" href="<%=cp%>/resource/css/AdminLTE.css">
  <link rel="stylesheet" href="<%=cp%>/resource/css/skin-blue.css">
  <link rel="stylesheet" href="<%=cp%>/resource/css/dataTables.bootstrap.css">
   <!-- 추가 마무리 -->
   
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

.content-wrapper {
  min-height: 100%;
  background-color: #FDFFF8;
}
</style>
<script type="text/javascript">


</script>
</head>
<body>

<div class="header">
    <tiles:insertAttribute name="header"/>
               	 <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
				      <span class="sr-only">Toggle navigation</span>
				 </a>
</div>

<section class="section" style = "padding: 74px 0;" id="srcontianer" >
<div class="container" role="main">
    <div class="row row-offcanvas row-offcanvas-right">
        <div class="col-xs-6 col-sm-3 sidebar-offcanvas" style="max-width: 240px;left: 0px;position: absolute;" id="sidebar">
            <tiles:insertAttribute name="left"/>
        </div>
        <div class="col-xs-12 col-sm-9 container-fluid content-wrapper">
                <tiles:insertAttribute name="body"/>
        </div>
     </div>
</div>
</section>

<div>
    <tiles:insertAttribute name="footer"/>
</div>
<script src="<%=cp%>/resource/js/jquery.dataTables.js"></script>
<script src="<%=cp%>/resource/js/dataTables.bootstrap.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=cp%>/resource/js/adminlte.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery.ui.datepicker-ko.js"></script>
<script src="<%=cp%>/resource/js/jquery.fancybox.pack.js"></script>
<script src="<%=cp%>/resource/js/jquery.waypoints.min.js"></script>
<script src="<%=cp%>/resource/js/main.js"></script>
</body>




<div class="smodal modal fade" id="myStudyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="z-index: 1050">
  <div class="modal-dialog">
    <div class="modal-content" style="background: #FBFDF8;"></div>
  </div>
</div>

<div class="smodal modal fade bs-example-modal-lg" id="myStudyInput" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content" style="background: #FBFDF8;"></div>
  </div>
</div>

<div class="smodal modal fade" id="myStudyApply" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content" style="background: #FBFDF8;"></div>
  </div>
</div>

<div class="modal modal-center" id="srModal">
	<div class="modal-dialog modal-center modal-eight">
		<div class="modal-content modal-eight">
		</div>
	</div>	
</div>	
	

</html>