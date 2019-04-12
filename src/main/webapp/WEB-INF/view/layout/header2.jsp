<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

        <header id="header" class="fixed2">
            <div class="header-content clearfix">
                <a class="logo" href="<%=cp%>/main"><img src="<%=cp%>/resource/images/logo.png" alt=""></a>
                <nav class="navigation" role="navigation">
                    <ul class="primary-nav">
						<li><a href="<%=cp%>/mypage/main">마이페이지</a></li>
						<li><a href="<%=cp%>/timer/main">타이머</a></li>
						<li><a href="<%=cp%>/study/main">스터디</a></li>
						<li><a href="<%=cp%>/studyroom/main">스터디룸</a></li>
						<li><a href="<%=cp%>/lecture/main">강의</a></li>
						<li><a href="<%=cp%>/community/main">커뮤니티</a></li>
                    </ul>
                </nav>
                <a href="#" class="nav-toggle">Menu<span></span></a>
                <div class="header-right">

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
	</div>
            </div><!-- header content -->

        </header><!-- header -->



