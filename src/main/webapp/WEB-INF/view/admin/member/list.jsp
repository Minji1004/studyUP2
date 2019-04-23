<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<style>
th{
	text-align: center;
}
.line{
	align:center; 
	bgcolor:#eeeeee;
	height:35px;
	border-top: 1px solid #cccccc; 
	border-bottom: 1px solid #cccccc;
}
</style>
<script>
function searchMember(){
	var f=document.memberSearch;
	f.submit();
}
</script>
<section class="features section">
	<div class="container" style="height:800px; width:90%; padding-top: 80px;">
        <form method="post" name="memberSearch" action="<%=cp%>/admin/member/list">
			<div class="input-group">
				<input type="text" name="keyword" value="${keyword}" class="form-control input-sm keyword" placeholder="통합검색">
				<span class="input-group-btn" >
					<button type="button" class="btn btn-primary btn-sm" onclick="searchMember()"><i class="glyphicon glyphicon-search"></i></button>
				</span>
			</div>
		</form>
		<c:if test="${not empty keyword}">
		<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px;">
		   <tr height="35">
		      <td align="left" width="50%">
		          ${dataCount }개(${page }/${total_page }페이지)
		      </td>
		      <td align="right">
		          &nbsp;
		      </td>
		   </tr>
		</table>
		
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse;">
		  <tr class="line"> 
		      <th width="100" style="color: #787878;">번호</th>		      
		      <th style="color: #787878;">아이디</th>
		      <th style="color: #787878;">닉네임</th>		      
		      <th width="200" style="color: #787878;">회원가입일</th>
		  </tr>
		 
		<c:forEach var="mdto" items="${mlist }">
			<tr align="center"height="28" style="border-bottom: 1px solid #cccccc;"> 
		      <th>${mdto.mlistNum }</th>
		      <th><a href="${articleUrl }&userNum=${mdto.userNum}">${mdto.userId }</a></th>
		      <th>${mdto.nickname }</th>		      
		      <th>${mdto.created }</th>
		  </tr>
		</c:forEach>

		</table>
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		   <tr height="35">
			<td align="center">
		        <c:if test="${dataCount==0 }">등록된 게시물이 없습니다.</c:if>
		        <c:if test="${dataCount!=0 }">${paging}</c:if>
			</td>
		   </tr>
		</table>
		</c:if>
		</div>
</section>