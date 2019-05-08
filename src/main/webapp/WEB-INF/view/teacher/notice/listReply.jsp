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
				<div class='post'>
					<div class='user-block' id="user-block${dto.tnotice_r_num}">
						<img class='img-circle img-bordered-sm' src='<%=cp%>/uploads/member_profile/${dto.picture}'>
						<span class='username'>${dto.nickname}	
						<c:if test="${sessionScope.member.userId == dto.userId}">
							<a href='#' onclick="deleteComment('${dto.tnotice_r_num}', '${dto.answer}');"  class='pull-right btn-box-tool'><i class='fa fa-trash-o'></i></a>
							<a href='#' onclick="updateComment('${dto.tnotice_r_num}', '${dto.answer}');" class='pull-right btn-box-tool'><i class='fa fa-edit'></i></a>
						</c:if>
							</span> <span class='description'>${dto.created}</span>
						</div>
						<p>${dto.content}</p>
						<div>
						<a href="#" class="link-black text-sm" onclick="listAnswer(${dto.tnotice_r_num})" style="font-size: 16px;">
						 	<i class="fa fa-comments-o margin-r-5"></i> 답글(<span id="dataCount${dto.tnotice_r_num}">${dto.answerCount}</span>)
						 </a>
						</div>						
					</div>
					<div id="answerList${dto.tnotice_r_num}" class='answerList' style="display: none;"></div>								
				</td>
			</tr>
	</c:forEach>
			<tr>
				<td>${paging}</td>
			</tr>
		</tbody>
			
	</table>