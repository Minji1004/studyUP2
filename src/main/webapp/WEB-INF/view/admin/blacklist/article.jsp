<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div style="width:100%">
<h5>신고 상세</h5>
<ul>
	<li>아이디</li>
	<li>${rdto.reportedUserId }</li>
</ul>
<ul>
	<li>닉네임</li>
	<li>${rdto.reportedNickName}</li>	
</ul>
<ul>
	<li>신고자</li>
	<li>${rdto.reportUserId }</li>		
</ul>
<ul>
	<li>신고자 닉네임</li>
	<li>${rdto.reportUserNickName }</li>
</ul>
<ul>
	<li>신고사유</li>
	<li>${rdto.reportCause }</li>
</ul>
<ul>
	<li>신고유형</li>
	<li>${rdto.reportType }</li>		
</ul>
</div>
</body>
</html>