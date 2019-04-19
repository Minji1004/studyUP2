<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
