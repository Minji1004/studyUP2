<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String cp=request.getContextPath();
%>
<table class="table">
<c:forEach var="dto" items="${listAnswerReply}">
	<tr><td>
		<div style='float: left; width: 2%;'>└</div>
		<div style='float: left; width: 98%;'>
		    <div class='user-block' id="user-block${dto.tnotice_r_num}" style="margin-bottom: 15px;">
				<img class='img-circle img-bordered-sm' src='<%=cp%>/uploads/member_profile/${dto.picture}'>
				<span class='username'>${dto.nickname}	
				<c:if test="${sessionScope.member.userId == dto.userId}">
					<a href='#' onclick="deleteComment('${dto.tnotice_r_num}', '${dto.answer}');"  class='pull-right btn-box-tool'><i class='fa fa-trash-o'></i></a>
					<a href='#' onclick="updateComment('${dto.tnotice_r_num}', '${dto.answer}');" class='pull-right btn-box-tool'><i class='fa fa-edit'></i></a>
				</c:if>
					</span> <span class='description'>${dto.created}</span>
				</div>
				<p>${dto.content}</p>
		</div>	
	</td></tr>
</c:forEach>
	<tr><td>	
		<div>
			<div style="clear: both; padding-top: 10px;">
				<textarea class="form-control"
					style="width: 100%; min-height: 80px; box-sizing: border-box;"></textarea>
			</div>
			<div style="text-align: right; padding-top: 10px;">
				<button type="button" class="btn btn-default" onclick="sendReplyAnswer(${tnotice_r_num});">등록하기</button>
			</div>
		</div>
	</td></tr>
	</table>