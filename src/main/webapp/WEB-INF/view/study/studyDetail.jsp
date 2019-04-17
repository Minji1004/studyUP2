<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
      
<div class="modal-header">
   <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
   <h4 class="modal-title" id="myModalLabel" align="center">수능 1등급 (1/5)</h4>
</div>
<div class="smodal-body modal-body row">
 	<div class="col-xs-8 col-sm-5" align="center">
 		<img class="img-circle img-dialog" src="<%=cp%>/resource/study/images/study1.jpg" alt="...">
 	</div>
 	<div class="col-xs-4 col-sm-7">
 		<div class="dialog-content-title">의대 가고 싶은 사람 모여</div>
 		<div class="dialog-content"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> 나야나</div>
 		<div class="dialog-content"><span class="glyphicon glyphicon-globe" aria-hidden="true"></span> 서울시 마포구</div>
 		<div class="dialog-content"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> 2018-10-12 ~ 2019-04-12</div>
 	</div>
</div>
<div class="modal-footer">
   <button type="button" class="btn btn-primary" id="studyApply" data-target ="#myStudyApply">apply</button>
   <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
</div>
    