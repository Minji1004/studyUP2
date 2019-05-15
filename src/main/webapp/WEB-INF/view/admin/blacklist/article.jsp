<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>.
<%
	String cp = request.getContextPath();
%>

<div class="modal-header">
   <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
   <h4 class="modal-title" id="myModalLabel" align="center">신고 상세</h4>
</div>
<div class="smodal-body modal-body row"> 	
 	<div class="col-xs-4 col-sm-7">
 		<div class="dialog-content-title"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>아이디:${rdto.reportedUserId }(닉네임: ${rdto.reportedNickName}) </div> 		
 		<div class="dialog-content"><span class="glyphicon glyphicon-tag" aria-hidden="true"></span>신고 횟수: ${userCount }</div> 		
 		<div class="dialog-content"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>신고자: ${rdto.reportUserId }(닉네임: ${rdto.reportUserNickName })</div> 		
 		<div class="dialog-content"><span class="glyphicon glyphicon-tag" aria-hidden="true"></span>신고 유형: ${rdto.reportType }</div>
 		<div class="dialog-content"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>신고 날짜: ${rdto.reportDate}</div>
 		<div class="dialog-content"><span class="glyphicon glyphicon-comment" aria-hidden="true"></span>신고 사유: ${rdto.reportCause }</div>
 	</div>
</div>
<div class="modal-footer">
	<input type="hidden" name="reportedUserNum" value="${rdto.reportNum }">
	<button type="button" class="btn btn-primary" id="blackApply" data-target ="#blackListApply">블랙리스트 추가</button>
	<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
</div>