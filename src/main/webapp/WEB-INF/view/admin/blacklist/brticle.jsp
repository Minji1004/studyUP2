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
 		<div class="dialog-content-title"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>아이디:${bdto.userId }</div>
 		<div class="dialog-content-title"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>닉네임: ${bdto.nickName}</div>
 		<div class="dialog-content-title"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>전화번호: ${bdto.tel}</div>
 		<div class="dialog-content"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>등록 날짜: ${bdto.blackStart}</div>
 		<div class="dialog-content"><span class="glyphicon glyphicon-comment" aria-hidden="true"></span>해제예정일: </div>
 	</div>
</div>
<div class="modal-footer">
   <button type="button" class="btn btn-primary" id="blackEnd" data-target ="">블랙리스트 해제</button>
   <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
</div>