<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp=request.getContextPath();
%>
<style>
th{
	text-align: center;
}
</style>

<script>
function searchList(){
	var f=document.reportSearch;
	f.submit();
}
</script>

<section class="features section">
	<div class="container" style="height:600px; width: 90%; padding-top:80px;">
		<form method="post" name="reportSearch" action="<%=cp%>/admin/blacklist/list">
			<div class="input-group">
				<input type="text" name="keyword" value="${keyword}" class="form-control input-sm keyword" placeholder="통합검색">
				<span class="input-group-btn" >
					<button type="button" class="btn btn-primary btn-sm" onclick="searchList()"><i class="glyphicon glyphicon-search"></i></button>
				</span>
			</div>
		</form>
	
		<h5>신고목록</h5>
		<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px;">
		   <tr height="35">
		      <td align="left" width="50%">
		          ${dataCount}개(${page }/${total_page }페이지)
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
		  <tr align="center" height="28" style="border-bottom: 1px solid #cccccc;">
		      <th width="100">${rdto.rlistNum }</th>
		      <th><a href="${articleUrl}&reportNum=${rdto.reportNum}">${rdto.reportedUserId }</a></th>		      
		      <th width="150">${rdto.reportedNickName }</th>
		      <th width="150">${rdto.reportType }</th>
		      <th width="150">${rdto.reportUserNickName }</th>
		      <th width="120">${rdto.reportDate}</th>	     
		  </tr>
		</c:forEach>
		 
		</table>
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		   <tr height="35">
			<td align="center">
		        <c:if test="${dataReportCount==0 }">등록된 게시물이 없습니다.</c:if>
		        <c:if test="${dataReportCount!=0 }">${paging}</c:if>
			</td>
		   </tr>
		</table>
		

	</div>

	<div class="container" style="height:400px; width: 90%;">	
<c:if test="${not empty keyword }">
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
		      <th width="200" style="color: #787878;">닉네임</th>		      
		      <th width="160" style="color: #787878;">등록일</th>
		      <th width="160" style="color: #787878;">해제예정일</th>
		  </tr>
		  
		  <tr align="center" height="28" style="border-bottom: 1px solid #cccccc;"> 
		      <th width="100">번호</th>
		      <th>아이디</th>
		      <th width="200">닉네임</th>	      
		      <th width="160">등록일</th>
		      <th width="160">해제예정일</th>
		  </tr>
		  
		</table>
</c:if>
	</div>
</section>