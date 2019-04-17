<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>


<script type="text/javascript">
	$(document).ready(function(){
		var e = document.getElementById('tBox');
		e.style.height = (e.scrollHeight) + 'px';
	});    
	
	$(document).ready(function(){
		var $star = $(".star_rating");
		var $result = $star.find("#output>b");
		
		 $(document)
		 .on("focusin", ".star_rating>a", function(){
			 $(this).parent().children("a").removeClass("on");
			 $(this).addClass("on").prevAll("a").addClass("on");
			 var index = $(".star_rating>a").index(this)+1;
			$result.text(index);
		 })

		 
	});
	
</script>



<!-- Main content -->
<section class="content container-fluid">

	<div class="box box-primary"
		style="width: 700px; margin: 30px; float: left; padding: 10px;">
		<img src="<%=cp%>/resource/images/team-1.jpg"
			class="profile-user-img img-circle">
		<div
			style="display: inline-block; vertical-align: top; padding: 0 20px; width: 450px;">
			<h1 class="profile-username" style="float: left;">
				홍길동 <small>선생님</small>
			</h1>
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
							<td colspan="2"><button class="btn" type="button"
									style="float: right;">수정하기</button></td>
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
				<textarea id="tBox" class="read" readonly="readonly">여러분의 영어를 담당할 홍길동 선생님입니다!잘 부탁드립니다.&#10;영어 회화, 토익 스피킹, OPIC 준시하시는 모든 분들 연락주세요.</textarea>
				<c:if test="${mode eq 'teacher'}">
					<button class="btn" type="button" style="float: right; margin: 0 20px 10px;">수정하기</button>
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
					<button class="btn" type="button"
						style="float: right; margin-right: 20px;">수정하기</button>
				</c:if>
			</form>
		</div>
	</div>

	<div class="box box-primary"
		style="width: 800px; margin: 30px; float: left;">
		<div class="box-header">
			<h3 class="box-title">
				선생님 평가 - 평균별점 <span class="score"><i class="fa fa-star"></i>4.5</span>
			</h3>
		</div>
		<div class="box-body" style="margin: 0 auto;">
			<form name="guestForm" method="post" action="">
				<div style="clear: both; padding-top: 10px;">
					<span style="font-weight: bold;">코멘트 쓰기</span><span> - 타인을
						비방하거나 개인정보를 유출하는 글의 게시를 삼가 주세요.</span>
				</div>
				<div class="star_rating">
					<a href="#">★</a>
				    <a href="#">★</a>
				    <a href="#">★</a>
				    <a href="#">★</a>
				    <a href="#">★</a>
				    <span id="output"><b>0</b>점</span>
				</div>
				<div style="clear: both; padding-top: 10px;">
					<textarea name="content" id="content" class="form-control"
						style="width: 100%; min-height: 80px; box-sizing: border-box;"
						required="required"></textarea>
				</div>
				<div style="text-align: right; padding-top: 10px;">
					<button type="button" class="btn" onclick="sendGuest();"
						style="padding: 8px 25px;">등록하기</button>
				</div>
			</form>
			<table class="table">
				<thead>
					<tr>
						<td><span style='font-weight: 700;'>코멘트 1개</span></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<div class="post">
								<div class="user-block">
									<img class="img-circle img-bordered-sm"	src="<%=cp%>/resource/images/team-2.jpg">
									<span class="username">이몽룡
									<span class="score"><i class="fa fa-star"></i>4.5</span>
								<c:if test="${mode eq 'teacher'}">
									 <a href="#" class="pull-right btn-box-tool"><i class="fa fa-times"></i></a>
								</c:if>
									</span> <span class="description">Shared publicly - 7:30 PM today</span>
								</div>
								<p>Lorem ipsum represents a long-held tradition for								
									designers, typographers and the like. Some people hate it and
									argue for its demise, but others ignore the hate as they create
									awesome tools to help create filler text for everyone from
									bacon lovers to Charlie Sheen fans.</p>
							</div>
						</td>
					</tr>
				<tr><td>
	              <ul class="pagination pagination-sm no-margin pull-right">
	                <li><a href="#">&laquo;</a></li>
	                <li><a href="#">1</a></li>
	                <li><a href="#">2</a></li>
	                <li><a href="#">3</a></li>
	                <li><a href="#">&raquo;</a></li>
	              </ul>
           		 </td></tr>
				</tbody>

			</table>
		</div>
	</div>
</section>

