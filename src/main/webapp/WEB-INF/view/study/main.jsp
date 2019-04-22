<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>


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
		var num=$(this).attr("data-studyNum");
		var studyNum=1;
		var url = "<%=cp%>/study/studyDetail?studyNum="+num;
		
		$('#myStudyModal .modal-content').load(url, function() {
			// $('#myStudyModal .modal-title').html(studyTitle);
			$('#myStudyModal').modal('show');
		});
	});
});

$(function() {
	// apply for study - 스터디 가입신청
	$(document).on("click", "#studyApply", function() {
		var num=$(this).attr("data-studyNum");
		var studyNum=4;
		var url = "<%=cp%>/study/applyStudy?studyNum="+num;
		
		$('#myStudyApply .modal-content').load(url, function() {
			// $('#myStudyModal .modal-title').html(studyTitle);
			$('#myStudyApply').modal('show');
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

	<div class="body-frame-2">

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
							<c:forEach var="dto" items="${list}">
							<div class="study-content col-xs-12 col-sm-6 col-md-4" data-studyNum="${dto.studyNum}" data-categoryName="${dto.categoryName}">
								<div class="col-xs-12 col-sm-12" style="background: ${dto.color}; margin-bottom: 2px">&nbsp;</div>
								<div class="thumbnail" style="text-align: center; cursor:pointer;">
									<div style="padding-top: 5px">
										<img class="img-rounded" src="<%=cp%>/uploads/study/${dto.studyImg}" alt="...">
									</div>
									<div onclick="location.href='#';">
										<div style="">
											<div class="study-title" style="padding: 20px 10px 0px 20px; font-family:'맑은고딕'; font-weight: 600; font-size: 14pt;">${dto.studyName}</div>
											<div class="studyIntro">${dto.studyIntro}</div>
											<div>1/${dto.headcount}</div>
											<div class="row" style="margin-bottom: 10px" >
												<div class="sPicTagContent col-xs-6 col-sm-4" align="right">#수학</div>
												<div class="sPicTagContent col-xs-4 col-sm-4">#영어</div>
												<div class="sPicTagContent col-xs-2 col-sm-4" align="left">#과학</div>							
											</div>
										</div>
									</div>
								</div>
							</div>	
							</c:forEach>						
							
						<!-- 페이징 처리 -->				
						<div class="paging" style="text-align: center; min-height: 50px; line-height: 50px;">
				            <c:if test="${dataCount==0 }">등록된 게시물이 없습니다.</c:if>
				            <c:if test="${dataCount!=0 }">${paging}</c:if>
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

<div class="smodal modal fade" id="myStudyApply" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content" style="background: #FBFDF8;"></div>
  </div>
</div>
