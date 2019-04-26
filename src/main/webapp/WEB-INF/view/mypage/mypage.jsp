<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<table
	style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">

	<tr height="100">
		<td colspan="2" align="left" style="padding-left: 5px;"><c:if
				test="${not empty dto.picture }">
				<img width="300px" height="300px" alt=""
					src="<%=cp%>/uploads/member_profile/${dto.picture}">
			</c:if></td>
	</tr>

	<tr height="20">
		<td colspan="2" align="left">아이디 : ${dto.userId }</td>
	</tr>

	<tr>
		<td colspan="2" align="left" style="padding: 10px 5px;" valign="top"
			height="50">닉네임 : ${dto.nickname }</td>
	</tr>
	<tr>
		<td colspan="2" align="left" style="padding: 10px 5px;" valign="top"
			height="50">전화 번호 : ${dto.tel }</td>
	</tr>

</table>

<table style="width: 100%; margin: 0px auto 20px; border-spacing: 0px;">
	<tr height="45">
		<td width="300" align="left">
			<button type="button" class="btn" onclick="mypageUpdate();">수정</button>
	</tr>
</table>
