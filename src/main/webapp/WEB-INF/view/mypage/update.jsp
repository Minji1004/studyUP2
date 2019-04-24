<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<form method="post" enctype="multipart/form-data">
<table>
	<tr>
		<td><img alt="" src="<%=cp%>/uploads/member_profile/${dto.picture}"> </td>
		<td><input type="file" name=pictureM></td>
	</tr>
	<tr>
		<td>아이디 : </td>
		<td>${dto.userId }</td>
	</tr>
	<tr>
		<td>이름 : </td>
		<td><input type="text" name="nickname" value="${dto.nickname }"></td>
	</tr>
	<tr>
		<td>전화번호 : </td>
		<td><input type="text" name="tel" value="${dto.tel }"></td>
	</tr>

</table>
</form>
<table style="width: 100%; margin: 0px auto 20px; border-spacing: 0px;">
			<tr height="45">
			    <td width="300" align="left">
			      <button type="button" class="btn" onclick="#">수정완료</button>
			</tr>
</table>