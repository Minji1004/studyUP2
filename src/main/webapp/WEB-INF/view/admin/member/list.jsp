<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<style>
li{
	text-align: center;
	float:left;
	
}
.line{
	align:center; 
	bgcolor:#eeeeee;
	height:35px;
	border-top: 1px solid #cccccc; 
	border-bottom: 1px solid #cccccc;
	padding-top: 7px;
}

.flist{
	text-align:center; 
	height:24px; 
	border-bottom: 1px solid #cccccc;"
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
		<div style="width: 100%; margin: 20px auto 0px; border-spacing: 0px;">
		   <ul style="height:35px;">
		      <li style="float:left; width:10%;">
		          ${dataCount }개(${page }/${total_page }페이지)
		      </li>
		      
		   </ul>
		</div>
		
		<div style="width: 100%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse;">
		  <ul class="line"> 
		      <li style="color: #787878; width:10%;">번호</li>		      
		      <li style="color: #787878; width:35%;">아이디</li>
		      <li style="color: #787878; width:35%;">닉네임</li>		      
		      <li style="color: #787878; width:20%;">회원가입일</li>
		  </ul>
		 
		<c:forEach var="mdto" items="${mlist}">
			<ul class="flist" onclick="location.href='${articleUrl }&userNum=${mdto.userNum}'"> 
		      <li style="width:10%;">${mdto.mlistNum }</li>
		      <li style="width:35%;">${mdto.userId }</li>
		      <li style="width:35%;">${mdto.nickname }</li>		      
		      <li style="width:20%;">${mdto.created }</li>
		  </ul>
		</c:forEach>

		</div>
		<div style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		   <ul style="height:25px;">
			<li style="width:100%;">
		        <c:if test="${dataCount==0 }">등록된 게시물이 없습니다.</c:if>
		        <c:if test="${dataCount!=0 }">${paging}</c:if>
			</li>
		   </ul>
		</div>
		</c:if>
		</div>
</section>