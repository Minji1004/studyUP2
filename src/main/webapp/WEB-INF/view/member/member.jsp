<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-1.12.4.min.js"></script>
<div style = "height : 700px">
<form>
	<div style = "height : 100%; margin:30px auto 0">
	<table style="width: 600px; height: 500px;" >
		<tr>
			<td style="width: 100">아이디 :</td>
			<td><input type="text" name = "userId"> </td>
		</tr>
		<tr>
			<td>닉네임</td>
			<td></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td></td>
		</tr>
		<tr>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td></td>
			<td></td>
		</tr>
	</table>
	</div>
</form>
</div>