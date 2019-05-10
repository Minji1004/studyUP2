<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
      
<div class="modal-header">
   <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
   <h4 class="modal-title" id="myModalLabel" align="center">${dto.studyName} (${dto.applyCount}/${dto.headcount})</h4>
</div>
<div class="smodal-body modal-body row">
 	<div class="col-xs-8 col-sm-5" align="center">
 		<img class="img-circle img-dialog" src="<%=cp%>/uploads/study/${dto.studyImg}">
 	</div>
 	<div class="col-xs-4 col-sm-7">
 		<div class="dialog-content-title" data-applyForNum ="${dto.studyNum}">${dto.studyIntro}</div>
 		<div class="dialog-content"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> ${dto.nickname}</div>
 		<div class="dialog-content"><span class="glyphicon glyphicon-globe" aria-hidden="true"></span> ${dto.studyLocation}</div>
 		<div class="dialog-content"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> ${dto.studySday} ~ ${dto.studyEday}</div>
 	</div>
</div>
<div class="modal-footer">
   <button type="button" class="btn btn-primary" id="studyApply" data-target ="#myStudyApply">apply</button>
   <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
</div>
    