<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

    <!-- Main content -->
    <section class="content container-fluid">

<div class="box box-primary" style=" width: 700px; margin: 30px; float: left;">
	<img src="<%=cp%>/resource/images/team-1.jpg" class="profile-user-img img-circle">
	<div style="display: inline-block; vertical-align: top; padding: 20px;">
	<h1 class="profile-username">홍길동 <small>선생님</small></h1>
	<br>
	<table>
		<tr>
			<th>분야</th>
			<td>영어회화</td>	
		</tr>
		<tr>
			<th>전화번호</th>
			<td>010-0000-0000</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>aaa@google.com</td>
		</tr>
	
	</table>
	</div>
</div>

<div class="box box-primary" style=" width: 700px; margin: 30px; float: left;">
	<img src="<%=cp%>/resource/images/team-1.jpg" class="profile-user-img img-circle">
	<div style="display: inline-block; vertical-align: top; padding: 20px;">
	<h1 class="profile-username">홍길동 <small>선생님</small></h1>
	<br>
	<table>
		<tr>
			<th>분야</th>
			<td>영어회화</td>	
		</tr>
		<tr>
			<th>전화번호</th>
			<td>010-0000-0000</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>aaa@google.com</td>
		</tr>
	
	</table>
	</div>
</div>
    </section>

