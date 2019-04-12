<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script type="text/javascript">

// 좌측 사이드바 메뉴버튼
	function srOpenNav() {
	    document.getElementById("srMySidenav").style.width = "120px";
	    $("#srMain").hide();
	    // document.body.style.backgroundColor = "#438042";
	}

// 좌측 사이드바 닫기 버튼
	function srCloseNav() {
	    document.getElementById("srMySidenav").style.width = "0";
	    $("#srMain").show();
	    //document.body.style.backgroundColor = "white";
	}
	
</script>

<section class="section" id="srcontianer" >
	<div class="container">
	<!-- 
		사이드 바
		#srMain 		: 메뉴 클릭		(앞 sr부분을 각 게시판에 맞게 수정하세요.)
		#srMySidenav 	: 사이드바 메뉴 	(앞 sr부분을 각 게시판에 맞게 수정하세요.)
		
		글어갈 때 필요한 것들
		1. 스크립트의 사이드바 function2개
		2. resource/studyroom/css/srmain.css 파일
		3. layout3에 css 링크넣기	
	-->
	
	<div id="srMain">
		<span style="font-size:40px; cursor:pointer" onclick="srOpenNav()">☰ </span>
	</div>
	<div id="srMySidenav" class="srMySidenav">
		<a>&nbsp;</a>		
		<a href="#">관리자룸</a>		
		<a href="#">장바구니</a>		
		<a href="#">예약현황</a>		
		<a href="#">예약취소</a>			
		<a href="javascript:void(0)" class="srClosebtn" onclick="srCloseNav()">X</a>
	</div>
	
	
	
	<div>
		<!-- 페이지 맨 윗단 소개글 -->
		<div class="col-md-12" style="padding: 20px 10px 10px 20px;">
			<img class="col-md-1" src="<%=cp%>/resource/studyroom/images/icons/idea.png" height="100%" width="100%" style="max-height: 100px; max-width: 100px;" alt="...">
			<div  class="col-md-11">
				<h2 style="font-weight: 700; font-family: '맑은고딕';">언제나, 목표를 향한 공간을</h2>
				<p style="font-family: '맑은고딕';">목표를 향한 노력에는 그에 알맞는 공간이 필요합니다. 'StudyUp'은 당신이 공간을 찾도록 돕겠습니다.</p>
			</div>
		</div>
	</div>
	
	</div>
	</section>	

		
