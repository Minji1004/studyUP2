<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp=request.getContextPath();
%>

<div class="modal-header">
   <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
   <h4 class="modal-title" id="myModalLabel" align="center">회원 상세</h4>
</div>
<div class="smodal-body modal-body row">
 	<div class="col-xs-8 col-sm-5" align="center">
 		<img class="img-circle img-dialog" style="max-width:60%; max-height:60%" src="<%=cp%>/uploads/member_profile/${mdto.picture}">
 	</div>
 	<div class="col-xs-4 col-sm-7">
 		<div class="dialog-content-title">회원번호: ${mdto.userNum}</div>
 		<div class="dialog-content-title"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>아이디: ${mdto.userId}(닉네임: ${mdto.nickname} ) </div> 		
 		<div class="dialog-content"><span class="glyphicon glyphicon-earphone" aria-hidden="true"></span>전화번호: ${mdto.tel}</div> 		
 		<div class="dialog-content"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>가입일: ${mdto.created}</div>
 		<div class="dialog-content"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>최근 접속일: ${mdto.lastLogin}</div> 	
 		 	
 	</div>
</div>
<div class="modal-footer">   
   <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
</div>
