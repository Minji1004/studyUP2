<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<section class="banner" role="banner">
        <header id="header">
            <div class="header-content clearfix">
                <a class="logo" href="<%=cp%>/main"><img src="<%=cp%>/resource/images/logo3.png" alt=""></a>
                <nav class="navigation" role="navigation">
                    <ul class="primary-nav">
						<li><a href="<%=cp%>/mypage/main">마이페이지</a></li>
						<li><a href="<%=cp%>/study/main">스터디</a></li>
						<li><a href="<%=cp%>/studyroom/main">스터디룸</a></li>
						<li><a href="<%=cp%>/lecture/main">강의</a></li>
						<li><a href="<%=cp%>/community/main">커뮤니티</a></li>
						<li><img src="<%=cp%>/resource/images/stopwatch.png" style="width: 30px; margin-left: 30px;" class="timer"></li>
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
        <div class="container">
            <div class="col-md-10 col-md-offset-1">
                <div class="banner-text text-center">
                    <h1>공부의 모든걸 도와드립니다. <span style="color: #e84545">StudyUp</span>과 함께하세요!</h1>
                    <p>스터디 모임, 스터디룸 예약, 현장 강의, 커뮤니티까지 모든 걸 지원합니다!<br>당신의 꿈을 StudyUp과 함께하세요.</p>
                    <a href="<%=cp%>/study/main" class="btn btn-large">스터디 보러가기</a>
                </div><!-- banner text -->
            </div>
        </div>
	</section>

