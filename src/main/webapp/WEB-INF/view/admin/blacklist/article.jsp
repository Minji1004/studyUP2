<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<section class="features section">
<div class="modal-header">
   <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
   <h4 class="modal-title" id="myModalLabel" align="center">신고 상세</h4>
</div>
<div class="smodal-body modal-body row">
 	<div class="col-xs-8 col-sm-5" align="center">
 		<img class="img-circle img-dialog" src="">
 	</div>
 	<div class="col-xs-4 col-sm-7">
 		<div class="">아이디:${rdto.reportedUserId }(닉네임: ${rdto.reportedNickName}) </div> 		
 		<div class=""><span class="" aria-hidden=""></span>신고자: ${rdto.reportUserId }(닉네임: ${rdto.reportUserNickName })</div> 		
 		<div class=""><span class="" aria-hidden=""></span>신고 유형: ${rdto.reportType }</div>
 		<div class=""><span class="" aria-hidden=""></span>신고 사유: ${rdto.reportCause }</div>
 		<div class=""><span class="" aria-hidden=""></span>신고 날짜: ${rdto.reportDate}</div>
 	</div>
</div>
<div class="modal-footer">
   <button type="button" class="" id="" data-target ="">apply</button>
   <button type="button" class="" data-dismiss="">Close</button>
</div>
</section>