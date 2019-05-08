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
 		<img class="img-circle img-dialog" src="<%=cp%>/uploads/lecture/${dto.studyImg}">
 	</div>
 	<div class="col-xs-4 col-sm-7">
 		<div class="dialog-content-title" style="padding-top: 10px;">${dto.studyIntro}</div>
 		<div class="dialog-content">선생님: ${dto.nickname}</div>
 		<div class="dialog-content">위치: ${dto.studyLocation}</div>
 		<div class="dialog-content">등록마감일: </div> 		
 		<div class="dialog-content">기간: ${dto.studySday} ~ ${dto.studyEday}</div>
 		<div class="dialog-content">가격: </div>
 	</div>
</div>
<div class="modal-footer">
   <button type="button" class="btn btn-primary" id="studyApply" data-target ="#myStudyApply">apply</button>
   <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
</div>
    