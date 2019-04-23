<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<section class="features section">
	<div class="container" style="height:600px; width: 90%; padding-top:80px;">
<h5>회원상세</h5>
<ul>
	<li>회원번호</li>
	<li>${mdto.userNum}</li>
</ul>
<ul>
	<li>아이디</li>
	<li>${mdto.userId }</li>
</ul>
<ul>
	<li>닉네임</li>
	<li>${mdto.nickname}</li>	
</ul>
<ul>
	<li>가입일</li>
	<li>${mdto.created}</li>	
</ul>
<ul>
	<li>최근접속일</li>
	<li>${mdto.lastLogin}</li>	
</ul>
<ul>
	<li>전화번호</li>
	<li>${mdto.tel}</li>	
</ul>
</div>
</section>