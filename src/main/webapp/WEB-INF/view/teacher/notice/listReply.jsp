<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String cp=request.getContextPath();
%>

<span style='font-weight: 700;'>댓글 총 ${replyCount}개</span>
	<table id="commentTable" class="table">
		<thead>
			<tr>
				<td><span style='font-weight: 700;'></span></td>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="dto" items="${listReply}">
		<tr>
			<td>
				<div class='post test_answer'>
					<div class='user-block'>
						<img class='img-circle img-bordered-sm' src='<%=cp%>/uploads/member_profile/${dto.picture}'>
						<span class='username'>${dto.nickname}	
							<a href='#' onclick='deleteComment("${dto.tnotice_r_num}");'  class='pull-right btn-box-tool'><i class='fa fa-trash-o'></i></a>
							<a href='#' onclick='updateComment("${dto.tnotice_r_num}");' class='pull-right btn-box-tool'><i class='fa fa-edit'></i></a>
							</span> <span class='description'>${dto.created}</span>
						</div>
						<p>${dto.content}</p>
						<div>
						 <a href="#" class="listAnswer link-black text-sm" data-tnoticeNum="${dto.tnotice_r_num}" style="font-size: 16px;">
						 <%-- <a href="#" class="link-black text-sm" onclick="listAnswer(${dto.tnotice_r_num})" style="font-size: 16px;"> --%>
						 	<i class="fa fa-comments-o margin-r-5"></i> 답글(${dto.answerCount})
						 </a>
						</div>						
					</div>
					<div id="answerList${dto.tnotice_r_num}" class='answerList'>
					날라리얌
					</div>								
				</td>
			</tr>
	</c:forEach>
			<tr>
				<td>${paging}</td>
			</tr>
		</tbody>
			
	</table>