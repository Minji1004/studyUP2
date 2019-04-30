<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String cp=request.getContextPath();
%>

	<table id="commentTable" class="table">
		<thead>
			<tr>
				<td><span style='font-weight: 700;'></span></td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>
				<div class='post'>
					<div class='user-block'>
						<img class='img-circle img-bordered-sm' src='<%=cp%>/uploads/member_profile/${teacher.picture}'>
						<span class='username'>nickname	
							<a href='#' onclick='deleteComment("+num+");' class='pull-right btn-box-tool'><i class='fa fa-times'></i></a>
							</span> <span class='description'>created</span>
						</div>
						<p>content</p>
						<div>
						 <a href="#" class="link-black text-sm" style="font-size: 16px;">
						 	<i class="fa fa-comments-o margin-r-5"></i> 답글(5)
						 </a>
						</div>
					</div>
				</td>
			</tr>
		</tbody>
			
	</table>