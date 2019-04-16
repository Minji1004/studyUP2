<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<style type="text/css">
.list-group-item.active, .list-group-item.active:focus, .list-group-item.active:hover {
    z-index: 2;
    color: #fff;
    background-color: #04B486;
    border-color: #04B486;
}
</style>

<script type="text/javascript">
	
$(function(){
	// 탭 클릭시	
	$('#studyTab a').click(function (e) {
		  e.preventDefault();
		  $(this).tab('show');
	});
});

$(function(){
	// 스터디 상세 페이지 보기
	$(document).on("click",".study-content", function(){
		var studyTitle = $(this).find(".study-title").html();
		// var num=$(this).attr("data-num");
		var num=1;
		var url = "<%=cp%>/study/studyDetail?num="+num;
		
		$('#myStudyModal .modal-content').load(url, function() {
			// $('#myStudyModal .modal-title').html(studyTitle);
			$('#myStudyModal').modal('show');
		});
	});
});


$(function(){
	// 스터디 만들기
	$(document).on("click",".makeStudy", function(){
		
		var url = "<%=cp%>/study/makeStudy";
		
		$('#myStudyInput .modal-content').load(url, function() {
			$('#myStudyInput').modal('show');
		});
	});
});



// 사이드바
$(function(){
	var idx="${subMenu}";
	if(!idx) idx=1;
	var subMenu=$(".list-group-item")[idx];
	$(subMenu).addClass("active");
});


$(function() {
	// 이미지 미리보기
	$("div").on("change", ".studyForm input[type='file']", function(e) {
		var file = e.target.files[0];
		
		if(! file.type.match("image.*")){
			return;
		}
		
		var reader = new FileReader();
		reader.onload = function(e1) {
			$(".input-img").attr("src", e1.target.result);
		}
		reader.readAsDataURL(file);
	});
});

	
</script>


<section class="section" id="srcontianer" >
	<div class="container">
	 
	 <div class="row row-offcanvas row-offcanvas-right">
	 
        <div class="col-xs-6 col-sm-3 sidebar-offcanvas" style="max-width: 240px;" id="sidebar">
			<div class="list-group">
			       <div class="list-group-item lefthead"><i></i> 스터디</div>
			       <a href="<%=cp%>/company/info" class="list-group-item">모든 스터디</a>
			       <a href="<%=cp%>/company/history" class="list-group-item">My 스터디</a>
			</div>        
        </div>
        
        <div class="col-xs-12 col-sm-9"> 
		  	<button type="button" class="btn makeStudy" style="background: #04B486; float: right;" >make 스터디</button>
               
			<div role="tabpanel">
		
			  <!-- Nav tabs -->
			  <ul class="nav nav-tabs" role="tablist" id="studyTab">
			    <li role="presentation" class="active"><a href="#allStudy" aria-controls="allStudy" role="tab" data-toggle="tab">전체</a></li>
			    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">수능</a></li>
			    <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">9급 공무원</a></li>
			    <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">7급 공무원</a></li>
			  </ul>
			
			  <!-- Tab panes -->
			  <div class="tab-content">
			    <div role="tabpanel" class="tab-pane active" id="allStudy">
			    
			    	<div>
						<!-- 페이지 맨 윗단 소개글 -->
						<div class="col-md-12" style="padding: 20px 10px 10px 20px;" align="center">
							<div  class="col-md-12">
								<h2 style="font-weight: 700; font-family: '맑은고딕';"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 당신과 함께할 스터디</h2>
								<p style="font-family: '맑은고딕';">당신과 함께할 스터디를 찾으세요. 'StudyUp'에서는 당신과 함께할 메이트들이 기다리고 있습니다.</p>
							</div>
						</div>						
				
						<div class="col-xs-12 col-md-10 col-md-offset-1">
							
							<!-- select -->
							<div style="padding:5px 0px 5px 0px; height: 45px ;background-color: #dddddd; border-radius: 5px;" >
								<div class="col-xs-4">
									<select class="form-control">
										<option>전체검색</option>
										<option>스터디이름검색</option>
										<option>Master검색</option>
										<option>과목검색</option>
									</select>
								</div>
								<form class="form-inline mr-auto" name="studySearch">
									<div class="col-xs-6">
	  									<input class="form-control" type="text" placeholder="Search" aria-label="Search" id="search" style="width: 100%">
	  								</div>	
	  								<div class="col-xs-2" style="padding:2px 0px 0px 0px;">
	  									<button class="btn btn-unique btn-rounded btn-sm my-0" type="submit">Search</button>
									</div>
								</form>						
								
							</div>
							<div class="col-xs-12" style="height:10px"></div>
							
							<!-- 페이지 글 목록 -->
							<div class="study-content col-xs-12 col-sm-6 col-md-4" data-num="${dto.num}">
								<div class="col-xs-12 col-sm-12" style="background: #CEF6EC; margin-bottom: 2px">&nbsp;</div>
								<div class="thumbnail" style="text-align: center; cursor:pointer;">
									<div style="padding-top: 5px">
										<img class="img-rounded" src="<%=cp%>/resource/study/images/study1.jpg" alt="...">
									</div>
									<div onclick="location.href='#';">
										<div style="">
											<div class="study-title" style="padding: 20px 10px 0px 20px; font-family:'맑은고딕'; font-weight: 600; font-size: 14pt;">수능 1등급!!!</div>
											<div class="studyIntro">의대 가고 싶은 사람 모여라</div>
											<div>1/5</div>
											<div class="row" style="margin-bottom: 10px" >
												<div class="sPicTagContent col-xs-6 col-sm-4" align="right">#수학</div>
												<div class="sPicTagContent col-xs-4 col-sm-4">#영어</div>
												<div class="sPicTagContent col-xs-2 col-sm-4" align="left">#과학</div>							
											</div>
										</div>
									</div>
								</div>
							</div>
							
							
							
							
							<div class="col-xs-12 col-sm-6 col-md-4">
							<div class="col-xs-12 col-sm-12" style="background: #CEF6EC; margin-bottom: 2px">&nbsp;</div>
								<div class="thumbnail" style="text-align: center; cursor:pointer;">
									<div style="padding-top: 5px">
										<img class="img-rounded" src="<%=cp%>/resource/study/images/study3.jpg" alt="...">
									</div>
									<div onclick="location.href='#';">
										<div style="">
											<div style="padding: 20px 10px 0px 20px; font-family:'맑은고딕'; font-weight: 600; font-size: 14pt;">어머니</div>
											<div class="studyIntro">저를 전적으로 믿으셔야 합니다.</div>
											<div>3/5</div>
											<div class="row" style="margin-bottom: 10px" >
												<div class="sPicTagContent col-xs-8 col-sm-6" align="right">#언어</div>
												<div class="sPicTagContent col-xs-6 col-sm-6" align="left">#사탐</div>					
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xs-12 col-sm-6 col-md-4">
								<div class="col-xs-12 col-sm-12" style="background: #F8E0F1; margin-bottom: 2px">&nbsp;</div>
								<div class="thumbnail" style="text-align: center; cursor:pointer;">
									<div style="padding-top: 5px">
										<img class="img-rounded" src="<%=cp%>/resource/study/images/study4.jpg" alt="...">
									</div>
									<div onclick="location.href='#';">
										<div style="">
											<div style="padding: 20px 10px 0px 20px; font-family:'맑은고딕'; font-weight: 600; font-size: 14pt;">한길쌤</div>
											<div class="studyIntro">답이 안보여요ㅠㅠ</div>
											<div>1/10</div>
											<div class="row" style="margin-bottom: 10px" >
												<div class="sPicTagContent col-xs-12 col-sm-12">#한국사</div>					
											</div>
										</div>
									</div>
								</div>
							</div>
							
							
							
							<div class="col-xs-12 col-sm-6 col-md-4">
								<div class="col-xs-12 col-sm-12" style="background: #F6CECE; margin-bottom: 2px">&nbsp;</div>
								<div class="thumbnail" style="text-align: center; cursor:pointer;">
									<div style="padding-top: 5px">
										<img class="img-rounded" src="<%=cp%>/resource/study/images/study5.jpg" alt="...">
									</div>
									<div onclick="location.href='#';">
										<div style="">
											<div style="padding: 20px 10px 0px 20px; font-family:'맑은고딕'; font-weight: 600; font-size: 14pt;">토익 박살내기</div>
											<div class="studyIntro">박살은 내가 나여....</div>
											<div>2/5</div>
											<div class="row" style="margin-bottom: 10px" >
												<div class="sPicTagContent col-xs-12 col-sm-12">#영어</div>			
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xs-12 col-sm-6 col-md-4">
								<div class="col-xs-12 col-sm-12" style="background: #CEF6EC; margin-bottom: 2px">&nbsp;</div>
								<div class="thumbnail" style="text-align: center; cursor:pointer;">
									<div style="padding-top: 5px">
										<img class="img-rounded" src="<%=cp%>/resource/study/images/study2.jpg" alt="...">
									</div>
									<div onclick="location.href='#';">
										<div style="">
											<div style="padding: 20px 10px 0px 20px; font-family:'맑은고딕'; font-weight: 600; font-size: 14pt;">수능 1등급!!!</div>
											<div class="studyIntro"  style="font-family:'맑은고딕'; font-weight: 600; font-size: 10pt; color : #cccccc;">의대 가고 싶은 사람 모여</div>
											<div>4/5</div>
											<div class="row" style="margin-bottom: 10px" >
												<div class="sPicTagContent col-xs-6 col-sm-4" align="right">#수학</div>
												<div class="sPicTagContent col-xs-4 col-sm-4">#영어</div>
												<div class="sPicTagContent col-xs-2 col-sm-4" align="left">#과학</div>							
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xs-12 col-sm-6 col-md-4">
							<div class="col-xs-12 col-sm-12" style="background: #CEF6EC; margin-bottom: 2px">&nbsp;</div>
								<div class="thumbnail" style="text-align: center; cursor:pointer;">
									<div style="padding-top: 5px">
										<img class="img-rounded" src="<%=cp%>/resource/study/images/study3.jpg" alt="...">
									</div>
									<div onclick="location.href='#';">
										<div style="">
											<div style="padding: 20px 10px 0px 20px; font-family:'맑은고딕'; font-weight: 600; font-size: 14pt;">어머니</div>
											<div class="studyIntro">저를 전적으로 믿으셔야 합니다.</div>
											<div>3/5</div>
											<div class="row" style="margin-bottom: 10px" >
												<div class="sPicTagContent col-xs-8 col-sm-6" align="right">#언어</div>
												<div class="sPicTagContent col-xs-6 col-sm-6" align="left">#사탐</div>					
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xs-12 col-sm-6 col-md-4">
								<div class="col-xs-12 col-sm-12" style="background: #F8E0F1; margin-bottom: 2px">&nbsp;</div>
								<div class="thumbnail" style="text-align: center; cursor:pointer;">
									<div style="padding-top: 5px">
										<img class="img-rounded" src="<%=cp%>/resource/study/images/study4.jpg" alt="...">
									</div>
									<div onclick="location.href='#';">
										<div style="">
											<div style="padding: 20px 10px 0px 20px; font-family:'맑은고딕'; font-weight: 600; font-size: 14pt;">한길쌤</div>
											<div>5/5</div>
											<div class="studyIntro">답이 안보여요ㅠㅠ</div>
											<div class="row" style="margin-bottom: 10px" >
												<div class="sPicTagContent col-xs-12 col-sm-12">#한국사</div>					
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xs-12 col-sm-6 col-md-4">
								<div class="col-xs-12 col-sm-12" style="background: #F6CECE; margin-bottom: 2px">&nbsp;</div>
								<div class="thumbnail" style="text-align: center; cursor:pointer;">
									<div style="padding-top: 5px">
										<img class="img-rounded" src="<%=cp%>/resource/study/images/study5.jpg" alt="...">
									</div>
									<div onclick="location.href='#';">
										<div style="">
											<div style="padding: 20px 10px 0px 20px; font-family:'맑은고딕'; font-weight: 600; font-size: 14pt;">토익 박살내기</div>
											<div>2/5</div>
											<div class="studyIntro">박살은 내가 나여....</div>
											<div class="row" style="margin-bottom: 10px" >
												<div class="sPicTagContent col-xs-12 col-sm-12">#영어</div>			
											</div>
										</div>
									</div>
								</div>
							</div>
						<!-- 페이징 처리 -->
						<div class="col-xs-12 col-sm-12 col-md-12" align="center">
							<nav>
								<ul class="pagination">
									<li class="disabled"><a href="#" aria-label="previous"><span aria-hidden="true">&lt;</span></a></li>
									<li class="active"><a href="#">1<span class="sr-only">(current)</span></a></li>
									<li class="disabled"><a href="#">2<span class="sr-only">(current)</span></a></li>
									<li class="disabled"><a href="#">3<span class="sr-only">(current)</span></a></li>
									<li class="disabled"><a href="#">4<span class="sr-only">(current)</span></a></li>
									<li class="disabled"><a href="#">5<span class="sr-only">(current)</span></a></li>
									<li class="disabled"><a href="#" aria-label="next"><span aria-hidden="true">&gt;</span></a></li>
								</ul>
							</nav>
						</div>
						
					</div>
				</div>
			    
			    
		  	</div>
		    <div role="tabpanel" class="tab-pane" id="profile">profile</div>
		    <div role="tabpanel" class="tab-pane" id="messages">messages</div>
		    <div role="tabpanel" class="tab-pane" id="settings">settings</div>
  		</div>			
	</div>
 </div>
</div>
</div>
</section>

<div class="smodal modal fade" id="myStudyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content" style="background: #FBFDF8;"></div>
  </div>
</div>

<div class="smodal modal fade bs-example-modal-lg" id="myStudyInput" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content" style="background: #FBFDF8;"></div>
  </div>
</div>
