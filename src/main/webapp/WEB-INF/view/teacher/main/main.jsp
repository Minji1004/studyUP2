<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>


<script type="text/javascript">

var introduceMode = '${introduceMode}';
var workMode = '${workMode}';

function resizeTextarea(){
	var e = document.getElementById('tBox');
	e.style.height = (e.scrollHeight) + 'px';
}

$(function(){
	resizeTextarea();	
	if(introduceMode=="createIntroduce")
		$("#tBox").next().html("등록하기");
	else if(introduceMode=="updateIntroduce")
		$("#tBox").next().html("수정하기");
	
	if(workMode=="createWork")
		$("form[name='work']").find("button").last().html("등록하기");
	else if(workMode=="updateWork")
		$("form[name='work']").find("button").last().html("수정하기");
});

	
	function changeTextarea(){
		$("#tBox").removeClass("read");
		$("#tBox").attr("readonly",false);
		var $btn = $("#tBox").next();
		
		if(introduceMode=='createIntroduce')
			$btn.html("등록완료");
		else if(introduceMode=='updateIntroduce')
			$btn.html("수정완료");
		
		$btn.removeAttr("onclick");
		$btn.attr("onclick", "sendIntroduce();");

	}
	
	function sendIntroduce(){
		var url = "<%=cp%>/teacher/"+introduceMode;
		var content = $("#tBox").val();
		var $btn = $("#tBox").next();
		
		$.ajax({
			type:"post",
			url: url,
			dataType: "JSON",
			data: {
				content:content
			},
			success: function(data){
				$("#tBox").addClass("read");
				$("#tBox").attr("readonly",true);						
				$btn.html("수정하기");	
				introduceMode='updateIntroduce';
				$btn.removeAttr("onclick");
				$btn.attr("onclick", "changeTextarea();");
				resizeTextarea();
			},
			error: function(e){
				console.log(e.responseText);
			}
		});			
	}		
	
	function changeWork(){
		var $btn = $("form[name='work']").find("button");
		if(workMode=='createWork'){
			$btn.html("등록완료");
			$("form[name='work']").find("p").remove();
		}
		else if(workMode=='updateWork'){
			$btn.find("button").html("수정완료");
			$(".workIcon").removeClass("workInactive");
		}
		
		$("form[name='work']").find("table")
		.append("<tr><td><input type='text' id='work' style='width: 500px;'><a href='#' class='pull-right btn-box-tool' style='font-size:15px;'><i class='fa fa-plus'></i></a></td></tr>");		
		
		$btn.removeAttr("onclick");
		$btn.attr("onclick", "completeWork();");
	}
	
	function listWork(){
		
	}
	
	function completeWork(){
		alert("완료했다.");
	}

			
</script>



<!-- Main content -->
<section class="content container-fluid">

	<div class="box box-primary"
		style="width: 700px; margin: 30px; float: left; padding: 10px;">
		<img src="<%=cp%>/uploads/member_profile/${teacher.picture}"
			class="profile-user-img img-circle">
		<div
			style="display: inline-block; vertical-align: top; padding: 0 20px; width: 450px;">
			<h1 class="profile-username" style="float: left;">
				${teacher.nickname}&nbsp;<small>선생님</small>
			</h1>
			<br>
			<form name="private" method="post">
				<table class="table">
					<tr>
						<th>분야</th>
						<td>
						영어회화
<%-- 						<c:if test="${empty teacher.subject}">
							가르치는 분야를 등록해주세요.
						</c:if>
						<c:forEach var="item" items="${teacher.subject}">
						${item}&nbsp;
						</c:forEach> --%>
						</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>${teacher.tel}</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>${teacher.userId}</td>
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
				<textarea id="tBox" class="read" readonly="readonly">${teacher.content}</textarea>
				<c:if test="${mode eq 'teacher'}">
					<button class="btn" type="button" style="float: right; margin: 0 30px 10px;" onclick="changeTextarea()"></button>
				</c:if>
		
			</form>
		</div>
		<hr class="no-margin">
		<div class="box-header">
			<h3 class="box-title">학력/경력</h3>
		</div>
		<div class="box-body no-padding">
			<form name="work" method="post">
				<c:if test="${empty teacher.work}"> 
					<p style="text-align: center;">등록된 자료가 없습니다.</p>
				</c:if>
				<table class="table table-striped">
				<c:forEach var="dto" items="${teacher.work}">
					<tr>
						<td>${dto}
						<a href="#" class="pull-right btn-box-tool workIcon workInactive"><i class="fa fa-trash"></i></a>
						<a href="#" class="pull-right btn-box-tool workIcon workInactive"><i class="fa fa-edit"></i></a>
						</td>
					</tr>
				</c:forEach>
<!-- 				<tr>
				<td><input type="text" id="work" style="width: 500px;"><a href="#" class="pull-right btn-box-tool" style="font-size:15px;"><i class="fa fa-plus"></i></a></td>
				</tr> -->
				</table>
				<c:if test="${mode eq 'teacher'}">
					<button class="btn" type="button"
						style="float: right; margin-right: 30px;" onclick="changeWork()"></button>
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
				<div class="star-box" style="text-align: center; margin: 10px;">
					<span class="star-input">
						<span class="input">
					    	<input type="radio" name="star-input" value="1" id="p1">
					    	<label for="p1">1</label>
					    	<input type="radio" name="star-input" value="2" id="p2">
					    	<label for="p2">2</label>
					    	<input type="radio" name="star-input" value="3" id="p3">
					    	<label for="p3">3</label>
					    	<input type="radio" name="star-input" value="4" id="p4">
					    	<label for="p4">4</label>
					    	<input type="radio" name="star-input" value="5" id="p5">
					    	<label for="p5">5</label>
					  	</span>
					  	<output for="star-input" ><b>0</b>점</output>						
					</span>		
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

