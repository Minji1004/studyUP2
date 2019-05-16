<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div>

<select name="goaltimeH">
	<c:forEach begin="00" end="24" var="i" step="1">
		<option value="${i}">${i}시</option>
	</c:forEach>
</select>

<select name="goaltimeM">
	<c:forEach begin="00" end="50" var="i" step="10">
		<option value="${i}">${i}분</option>
	</c:forEach>
</select>

<select name="studyKindCategory">
	<c:forEach var="study" items="${categoryStudy}">
		<option value = "${study.studyName}">${study.studyName}</option>
	</c:forEach>
</select>
<form name="timerContent">
<table style="margin-top: 10px">
	<tr style="height: 40px;">
		<td>일정 제목:</td>
		<td><input type="text" name="subject" placeholder="제목을 입력해주세요" onfocus="this.placeholder = ''" onblur="this.placeholder = '제목을 입력해주세요'" /></td>
	</tr>
	<tr>
		<td>일정 내용:</td>
		<td><input type="text" name="content" placeholder="내용을 입력해주세요" onfocus="this.placeholder = ''" onblur="this.placeholder = '내용을 입력해주세요'" ></td>
	</tr>
</table>
</form>
</div>

