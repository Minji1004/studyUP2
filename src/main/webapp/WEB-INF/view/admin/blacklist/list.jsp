<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
th{
	text-align: center;
}
</style>

<section class="features section">
	<div class="container" style="height:600px; width: 90%;">
		<form method="post">
			<div class="input-group">
				<input type="text" name="keyword" class="form-control input-sm keyword" placeholder="통합검색">
				<span class="input-group-btn" >
					<button type="button" class="btn btn-primary btn-sm"><i class="glyphicon glyphicon-search"></i></button>
				</span>
			</div>
		</form>
	
		<h5>신고목록</h5>
		<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px;">
		   <tr height="35">
		      <td align="left" width="50%">
		          개(/페이지)
		      </td>
		      <td align="right">
		          &nbsp;
		      </td>
		   </tr>
		</table>
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse;">
		  <tr align="center" bgcolor="#eeeeee" height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
		      <th width="100" style="color: #787878;">번호</th>
		      <th style="color: #787878;">아이디</th>
		      <th width="150" style="color: #787878;">닉네임</th>
		      <th width="150" style="color: #787878;">신고유형</th>
		      <th width="150" style="color: #787878;">신고자</th>
		      <th width="120" style="color: #787878;">신고일</th>
		  </tr>
		  
		 <c:forEach var="rdto" items="${rlist}">
		  <tr align="center" bgcolor="#eeeeee" height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
		       <th width="100" style="color: #787878;">${rdto.rlistNum }</th>
		      <th style="color: #787878;">${rdto.reportedUserId}</th>
		      <th width="150" style="color: #787878;">${rdto.reportedNickname}</th>
		      <th width="150" style="color: #787878;">${rdto.reportType}</th>
		      <th width="150" style="color: #787878;">${rdto.reportUserId}</th>
		      <th width="120" style="color: #787878;">${rdto.reportDate}</th>
		  </tr>		  
		 </c:forEach>
		</table>
		
		

	</div>
</section>
<section style="">
	<div class="container" style="height:400px; width: 90%;">
		<h5>블랙리스트</h5>
		<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px;">
		   <tr height="35">
		      <td align="left" width="50%">
		          개(/페이지)
		      </td>
		      <td align="right">
		          &nbsp;
		      </td>
		   </tr>
		</table>
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse;">
		  <tr align="center" bgcolor="#eeeeee" height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
		      <th width="100" style="color: #787878;">번호</th>
		      <th style="color: #787878;">아이디</th>
		      <th width="150" style="color: #787878;">닉네임</th>
		      <th width="150" style="color: #787878;">전화번호</th>
		      <th width="120" style="color: #787878;">신고횟수</th>
		      <th width="120" style="color: #787878;">등록일</th>
		      <th width="120" style="color: #787878;">해제예정일</th>
		  </tr>
		</table>
	</div>
</section>