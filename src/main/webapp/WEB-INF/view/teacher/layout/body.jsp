<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script type="text/javascript">
window.onload = function(){
	var e = document.getElementById('tBox');
    e.style.height = (e.scrollHeight) + 'px';
}
</script>

    <!-- Main content -->
    <section class="content container-fluid">

<div class="box box-primary" style=" width: 700px; margin: 30px; float: left; padding: 10px;">
	<img src="<%=cp%>/resource/images/team-1.jpg" class="profile-user-img img-circle">
	<div style="display: inline-block; vertical-align: top; padding: 0 20px; width: 450px;">
	<h1 class="profile-username" style="float:left;">홍길동 <small>선생님</small></h1>
	<br>
	<form name="private" method="post">
		<table class="table">
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
			<tr>			
				<c:if test="${mode eq 'teacher'}">
					<td colspan="2"><button class="btn" type="button" style="float:right;">수정하기</button></td>
				</c:if>
				<c:if test="${empty mode}">
					<td colspan="2">&nbsp;</td>
				</c:if>
			</tr>

		</table>		
	</form>
	</div>
	<hr class="no-margin">
	<div class="box-header">
		<h3 class="box-title">선생님 소개</h3>
	</div>
	<div class="box-body no-padding">
		<form name="introduce" method="post">
			<textarea id="tBox" readonly="readonly">여러분의 영어를 담당할 홍길동 선생님입니다! 잘 부탁드립니다.
			영어 회화, 토익 스피킹, OPIC 준시하시는 모든 분들 연락주세요.	
			</textarea>
			<c:if test="${mode eq 'teacher'}">
				<button class="btn" type="button" style="float:right; margin-right: 20px;">수정하기</button>
			</c:if>
		</form>
	</div>
	<hr class="no-margin">
	<div class="box-header">
		<h3 class="box-title">학력/경력</h3>
	</div>
	<div class="box-body no-padding">
		<form name="work" method="post">
			<table class="table table-striped">
			<tr>
				<td>나나고등학교 졸업</td>
			</tr>
			<tr>
				<td>라라고등학교 졸업</td>
			</tr>
			</table>
			<c:if test="${mode eq 'teacher'}">
				<button class="btn" type="button" style="float:right; margin-right: 20px;">수정하기</button>
			</c:if>
		</form>
	</div>
</div>

<div class="box box-primary" style=" width: 800px; margin: 30px; float: left;">
	<div class="box-header">
		<h3 class="box-title">선생님 리뷰</h3>
	</div>
	<div class="box-body no-padding">
	 <form name="guestForm" method="post" action="">
             <div class="guest-write">
                 <div style="clear: both;">
                         <span style="font-weight: bold;">방명록쓰기</span><span> - 타인을 비방하거나 개인정보를 유출하는 글의 게시를 삼가 주세요.</span>
                 </div>
                 <div style="clear: both; padding-top: 10px;">
                       <textarea name="content" id="content" class="boxTF" rows="3" style="display:block; width: 100%; padding: 6px 12px; box-sizing:border-box;" required="required"></textarea>
                  </div>
                  <div style="text-align: right; padding-top: 10px;">
                       <button type="button" class="btn" onclick="sendGuest();" style="padding:8px 25px;"> 등록하기 </button>
                  </div>           
            </div>
           </form>
	</div>
	           <div id="listGuest"> <!-- 블로그, 카페 게시판 다 ajax다. 모바일 프로그램도 다 ajax다. -->
                 <table style='width: 100%; margin: 10px auto 0px; border-spacing: 0px; border-collapse: collapse;'>
                   <thead>
                    <tr height='35'>
                        <td width='50%'>
                            <span style='color: #3EA9CD; font-weight: 700;'>방명록 1개</span>
                            <span>[목록]</span>
                        </td>
                        <td width='50%'>
                            &nbsp;
                        </td>
                    </tr>
                    </thead>
                    <tbody id="listGuestBody"></tbody>
                 </table>
           </div>
	</div>
    </section>

