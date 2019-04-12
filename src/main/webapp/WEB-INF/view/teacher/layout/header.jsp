<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<!-- Logo -->
  <a href="<%=cp%>/main" class="logo">
    <!-- mini logo for sidebar mini 50x50 pixels -->
    <span class="logo-mini"><b>S</b>UP</span>
    <!-- logo for regular state and mobile devices -->
    <span class="logo-lg"><b>Study</b>UP</span>
  </a>

  <!-- Header Navbar -->
  <nav class="navbar navbar-static-top" role="navigation">
    <!-- Sidebar toggle button-->
    <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
      <span class="sr-only">Toggle navigation</span>
    </a>

  <div id="login">
			<c:if test="${empty sessionScope.member}">
				<a href="<%=cp%>/member/login" style="color: white;">로그인</a>
                   		 &nbsp;|&nbsp;
               		 <a href="<%=cp%>/member/member" style="color: white;">회원가입</a>
			</c:if>
			<c:if test="${not empty sessionScope.member}">
				<span style="color: white;">${sessionScope.member.userName}</span>님
               		 	 &nbsp;|&nbsp;
               			 <a href="<%=cp%>/member/logout" style="color: white;">로그아웃</a>
				<c:if test="${sessionScope.member.userId=='admin'}">
                   			 &nbsp;|&nbsp;
                   		 	<a href="<%=cp%>/admin" style="color: white;">관리자</a>
				</c:if>
			</c:if>
		</div>
  </nav>
  
