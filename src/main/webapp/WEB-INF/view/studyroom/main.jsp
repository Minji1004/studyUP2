<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
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

// 자동으로 열리는 modal
	$(document).ready(function(){
		$('#srModal').show();
	});
	function close_pop(flag){
		$('#srModal').hide();
	};
</script>


<section class="srcontianer" style="height:75vh;">
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
		<div class="srMenuBtn" onclick="srOpenNav()">☰ </div>
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
			<!-- <img class="col-md-1" src="<%=cp%>/resource/studyroom/images/icons/idea.png" height="100%" width="100%" style="max-height: 100px; max-width: 100px;" alt="...">  -->
			<div  class="col-md-12">
				<h2 style="font-weight: 700; font-family: '맑은고딕';">언제나, 목표를 향한 공간을</h2>
				<p style="font-family: '맑은고딕';">목표를 향한 노력에는 그에 알맞는 공간이 필요합니다. 'StudyUp'은 당신이 공간을 찾도록 돕겠습니다.</p>
			</div>
		</div>

		<div class="col-xs-12 col-md-8">
			
			<!-- select -->
			<div class="srSelect">
				<div class="col-xs-4">
					<select class="form-control">
						<option>시/도</option>
						<option>서울</option>
						<option>인천</option>
						<option>경기</option>
						<option>강원</option>
					</select>
				</div>
				<div class="col-xs-4">
					<select class="form-control">
						<option>시군구</option>
						<option>구로구</option>
						<option>영등포구</option>
						<option>마포구</option>
						<option>중구</option>
					</select>
				</div>
				<div class="col-xs-4">
					<select class="form-control">
						<option>동/리</option>
						<option>서교동</option>
						<option>홍제동</option>
						<option>연남동</option>
					</select>
				</div>
			</div>
			<div class="col-xs-12" style="height:10px"></div>
			
			<!-- 페이지 글 목록 -->
			<div class="col-xs-12 col-sm-6 col-md-4">
				<div class="thumbnail">
					<!-- 사진 슬라이드 넘기는 곳 -->
					<div id="slidePic1" class="carousel slide" data-ride="carousel" data-interval="false">
						<!-- Indicators -->
						<ol class="carousel-indicators">
							<li data-target="#slidePic1" data-slide-to="0"></li>
							<li data-target="#slidePic1" data-slide-to="1"></li>
							<li data-target="#slidePic1" data-slide-to="2"></li>
						</ol>
						
						<!-- Wrapper for slides -->
						<div class="carousel-inner" role="listbox">
							<div class="item active">
								<img class="srPic" src="<%=cp%>/resource/studyroom/images/pic01.jpg" alt="..." height="100%" width="100%">
							</div>
							<div class="item">
								<img class="srPic" src="<%=cp%>/resource/studyroom/images/pic02.jpg" alt="..." height="100%" width="100%">
							</div>
							<div class="item">
								<img class="srPic" src="<%=cp%>/resource/studyroom/images/pic03.jpg" alt="..." height="100%" width="100%">
							</div>
						</div>
						
						<!-- Controls -->
						<a class="left carousel-control" href="#slidePic1" role="button" data-slide="prev">
							<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
							<span class="sr-only">Previous</span>
						</a>
						<a class="right carousel-control" href="#slidePic1" role="button" data-slide="next">
							<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>
					
					<!-- 사진 관련 태그들 -->
					<div>
						<div style="min-height:150px;">
							<div style="padding: 20px 10px 0px 10px; font-family:'맑은고딕'; font-weight: 600; font-size: 14pt;">NHK</div>
							<div style="font-family:'맑은고딕'; font-weight: 600; font-size: 9pt; color : #cccccc;">평점 : ★★★☆☆</div>
							<div class="srPicTagContent">
								<div>어서오세요. NHK에! 이제부터 잘해드릴게요 아하하하하</div>
							</div>
							<div style="height:28px;">
								<button type="button" class="btn-srModal" data-toggle="modal" data-target="#srModal">More...</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-4">
				<div class="thumbnail" style="text-align: center; cursor:pointer;">
					<div>	
						<div id="slidePic2" class="carousel slide" data-ride="carousel" data-interval="false">
							<!-- Indicators -->
							<ol class="carousel-indicators">
								<li data-target="#slidePic2" data-slide-to="0"></li>
								<li data-target="#slidePic2" data-slide-to="1"></li>
								<li data-target="#slidePic2" data-slide-to="2"></li>
							</ol>
							
							<!-- Wrapper for slides -->
							<div class="carousel-inner" role="listbox">
								<div class="item active">
								<img class="srPic" src="<%=cp%>/resource/studyroom/images/pic02.jpg" alt="..." height="100%" width="100%">
							</div>
							<div class="item">
								<img class="srPic" src="<%=cp%>/resource/studyroom/images/pic03.jpg" alt="..." height="100%" width="100%">
							</div>
							<div class="item">
								<img class="srPic" src="<%=cp%>/resource/studyroom/images/pic04.jpg" alt="..." height="100%" width="100%">
							</div>
						</div>
							<!-- Controls -->
							<a class="left carousel-control" href="#slidePic2" role="button" data-slide="prev">
								<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
								<span class="sr-only">Previous</span>
							</a>
							<a class="right carousel-control" href="#slidePic2" role="button" data-slide="next">
								<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
								<span class="sr-only">Next</span>
							</a>
						</div>
					</div>
					<div>
						<div style="min-height:150px;">
							<div style="padding: 20px 10px 0px 10px; font-family:'맑은고딕'; font-weight: 600; font-size: 14pt;">오성스터디카페</div>
							<div style="font-family:'맑은고딕'; font-weight: 600; font-size: 9pt; color : #cccccc;">평점 : ★★★★☆</div>
							<div class="srPicTagContent">
								<div>쾌적한 공간을 제공해드립니다!</div>
							</div>
							<div style="height:28px;">
								<button type="button" class="btn-srModal" data-toggle="modal" data-target="#srModal">More...</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-4">
				<div class="thumbnail" style="text-align: center; cursor:pointer;">
					<div>	
						<div id="slidePic3" class="carousel slide" data-ride="carousel" data-interval="false">
							<!-- Indicators -->
							<ol class="carousel-indicators">
								<li data-target="#slidePic3" data-slide-to="0"></li>
								<li data-target="#slidePic3" data-slide-to="1"></li>
								<li data-target="#slidePic3" data-slide-to="2"></li>
							</ol>
							
							<!-- Wrapper for slides -->
							<div class="carousel-inner" role="listbox">
								<div class="item active">
								<img class="srPic" src="<%=cp%>/resource/studyroom/images/pic03.jpg" alt="..." height="100%" width="100%">
							</div>
							<div class="item">
								<img class="srPic" src="<%=cp%>/resource/studyroom/images/pic04.jpg" alt="..." height="100%" width="100%">
							</div>
							<div class="item">
								<img class="srPic" src="<%=cp%>/resource/studyroom/images/pic01.jpg" alt="..." height="100%" width="100%">
							</div>
						</div>
							<!-- Controls -->
							<a class="left carousel-control" href="#slidePic3" role="button" data-slide="prev">
								<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
								<span class="sr-only">Previous</span>
							</a>
							<a class="right carousel-control" href="#slidePic3" role="button" data-slide="next">
								<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
								<span class="sr-only">Next</span>
							</a>
						</div>
					</div>
					<div>
						<div style="min-height:150px;">
							<div style="padding: 20px 10px 0px 10px; font-family:'맑은고딕'; font-weight: 600; font-size: 14pt;">라쿠니라챠</div>
							<div style="font-family:'맑은고딕'; font-weight: 600; font-size: 9pt; color : #cccccc;">평점 : ★★☆☆☆</div>
							<div class="srPicTagContent">
								<div>너굴맨이 얼렸으니 조심하라구!!</div>
							</div>
							<div style="height:28px;">
								<button type="button" class="btn-srModal" data-toggle="modal" data-target="#srModal">More...</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-4">
				<div class="thumbnail" style="text-align: center; cursor:pointer;">
					<div>	
						<div id="slidePic4" class="carousel slide" data-ride="carousel" data-interval="false">
							<!-- Indicators -->
							<ol class="carousel-indicators">
								<li data-target="#slidePic4" data-slide-to="0"></li>
								<li data-target="#slidePic4" data-slide-to="1"></li>
								<li data-target="#slidePic4" data-slide-to="2"></li>
							</ol>
							
							<!-- Wrapper for slides -->
							<div class="carousel-inner" role="listbox">
								<div class="item active">
								<img class="srPic" src="<%=cp%>/resource/studyroom/images/pic04.jpg" alt="..." height="100%" width="100%">
							</div>
							<div class="item">
								<img class="srPic" src="<%=cp%>/resource/studyroom/images/pic01.jpg" alt="..." height="100%" width="100%">
							</div>
							<div class="item">
								<img class="srPic" src="<%=cp%>/resource/studyroom/images/pic02.jpg" alt="..." height="100%" width="100%">
							</div>
						</div>
							<!-- Controls -->
							<a class="left carousel-control" href="#slidePic4" role="button" data-slide="prev">
								<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
								<span class="sr-only">Previous</span>
							</a>
							<a class="right carousel-control" href="#slidePic4" role="button" data-slide="next">
								<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
								<span class="sr-only">Next</span>
							</a>
						</div>
					</div>
					<div>
						<div style="min-height:150px;">
							<div style="padding: 20px 10px 0px 10px; font-family:'맑은고딕'; font-weight: 600; font-size: 14pt;">기가스터딥</div>
							<div style="font-family:'맑은고딕'; font-weight: 600; font-size: 9pt; color : #cccccc;">평점 : ★☆☆☆☆</div>
							<div class="srPicTagContent">
								<div>메가로는 모자라다!! 기가급으로 승부하자!</div>
							</div>
							<div style="height:28px;">
								<button type="button" class="btn-srModal" data-toggle="modal" data-target="#srModal">More...</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-4">
				<div class="thumbnail" style="text-align: center; cursor:pointer;">
					<div>	
						<div id="slidePic5" class="carousel slide" data-ride="carousel" data-interval="false">
							<!-- Indicators -->
							<ol class="carousel-indicators">
								<li data-target="#slidePic5" data-slide-to="0"></li>
								<li data-target="#slidePic5" data-slide-to="1"></li>
								<li data-target="#slidePic5" data-slide-to="2"></li>
							</ol>
							
							<!-- Wrapper for slides -->
							<div class="carousel-inner" role="listbox">
								<div class="item active">
								<img class="srPic" src="<%=cp%>/resource/studyroom/images/pic01.jpg" alt="..." height="100%" width="100%">
							</div>
							<div class="item">
								<img class="srPic" src="<%=cp%>/resource/studyroom/images/pic02.jpg" alt="..." height="100%" width="100%">
							</div>
							<div class="item">
								<img class="srPic" src="<%=cp%>/resource/studyroom/images/pic03.jpg" alt="..." height="100%" width="100%">
							</div>
						</div>
							<!-- Controls -->
							<a class="left carousel-control" href="#slidePic5" role="button" data-slide="prev">
								<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
								<span class="sr-only">Previous</span>
							</a>
							<a class="right carousel-control" href="#slidePic5" role="button" data-slide="next">
								<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
								<span class="sr-only">Next</span>
							</a>
						</div>
					</div>
					<div>
						<div style="min-height:150px;">
							<div style="padding: 20px 10px 0px 10px; font-family:'맑은고딕'; font-weight: 600; font-size: 14pt;">이to스</div>
							<div style="font-family:'맑은고딕'; font-weight: 600; font-size: 9pt; color : #cccccc;">평점 : ★★★★☆</div>
							<div class="srPicTagContent">
								<div>옆집 메가보단 쌉니다.!옆집 메가보단 쌉니다.!옆집 메가보단 쌉니다.!옆집 메가보단 쌉니다.!옆집 메가보단 쌉니다.!옆집 메가보단 쌉니다.!옆집 메가보단 쌉니다.!옆집 메가보단 쌉니다.!</div>
							</div>
							<div style="height:28px;">
								<button type="button" class="btn-srModal" data-toggle="modal" data-target="#srModal">More...</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-4">
				<div class="thumbnail" style="text-align: center; cursor:pointer;">
					<div>	
						<div id="slidePic6" class="carousel slide" data-ride="carousel" data-interval="false">
							<!-- Indicators -->
							<ol class="carousel-indicators">
								<li data-target="#slidePic6" data-slide-to="0"></li>
								<li data-target="#slidePic6" data-slide-to="1"></li>
								<li data-target="#slidePic6" data-slide-to="2"></li>
							</ol>
							
							<!-- Wrapper for slides -->
							<div class="carousel-inner" role="listbox">
								<div class="item active">
								<img class="srPic" src="<%=cp%>/resource/studyroom/images/pic02.jpg" alt="..." height="100%" width="100%">
							</div>
							<div class="item">
								<img class="srPic" src="<%=cp%>/resource/studyroom/images/pic03.jpg" alt="..." height="100%" width="100%">
							</div>
							<div class="item">
								<img class="srPic" src="<%=cp%>/resource/studyroom/images/pic04.jpg" alt="..." height="100%" width="100%">
							</div>
						</div>
							<!-- Controls -->
							<a class="left carousel-control" href="#slidePic6" role="button" data-slide="prev">
								<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
								<span class="sr-only">Previous</span>
							</a>
							<a class="right carousel-control" href="#slidePic6" role="button" data-slide="next">
								<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
								<span class="sr-only">Next</span>
							</a>
						</div>
					</div>

					<div>
						<div style="min-height:150px;">
							<div style="padding: 20px 10px 0px 10px; font-family:'맑은고딕'; font-weight: 600; font-size: 14pt;">카페나라</div>
							<div style="font-family:'맑은고딕'; font-weight: 600; font-size: 9pt; color : #cccccc;">평점 : ★★★★★</div>
							<div class="srPicTagContent">
								<div>사랑스러운 동물들이 함께 하는 카페나라입니다.</div>
							</div>
							<div style="height:28px;">
								<button type="button" class="btn-srModal" data-toggle="modal" data-target="#srModal">More...</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			
		</div>
		<!-- 지도를 넣을 장소 -->
		<div class="col-xs-12 col-sm-12 col-md-4" style="border-radius: 5px; border: 1px solid #eeeeee;" >
			<img src="<%=cp%>/resource/studyroom/images/map.png" alt="..." height="100%" width="100%" style="display: flex;">
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
	
	
	
	<!-- The Modal -->
	<div class="modal modal-center" id="srModal">
		<div class="modal-dialog modal-center modal-eight">
			<div class="modal-content modal-eight">
				<!-- Modal body -->
				<div class="srModal-body">
					<div class="srModalDetail">
						<div class="col-xs-12 col-sm-12 col-md-12">
							<button type="button" class="btn-srModalUpClose" data-dismiss="modal"  onClick="close_pop();" style="display : inline-block; vartical-align:top;">x</button>
						</div>
						<div class="col-xs-12 col-sm-6 col-md-4">	
							<div class="srFirstModal">
								<div class="srModalTitleArea">
									<h3 class="srModalTitle">오성스터디카페</h3>
								</div>
								<div class="srModalPicFrame">
									<div id="modalPic" class="carousel slide" data-ride="carousel" data-interval="false">
										<!-- Indicators -->
										<ol class="carousel-indicators">
											<li data-target="#modalPic" data-slide-to="0"></li>
											<li data-target="#modalPic" data-slide-to="1"></li>
											<li data-target="#modalPic" data-slide-to="2"></li>
										</ol>
										
										<!-- Wrapper for slides -->
										<div class="carousel-inner" role="listbox">
											<div class="item active">
												<img class="srModalPic" src="<%=cp%>/resource/studyroom/images/pic02.jpg" alt="..." height="100%" width="100%">
											</div>
											
											<div class="item">
												<img class="srModalPic" src="<%=cp%>/resource/studyroom/images/pic03.jpg" alt="..." height="100%" width="100%">
											</div>
											<div class="item">
												<img class="srModalPic" src="<%=cp%>/resource/studyroom/images/pic04.jpg" alt="..." height="100%" width="100%">
											</div>
											
											
										</div>
										<!-- Controls -->
										<a class="left carousel-control" href="#modalPic" role="button" data-slide="prev">
											<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
											<span class="sr-only">Previous</span>
										</a>
										<a class="right carousel-control" href="#modalPic" role="button" data-slide="next">
											<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
											<span class="sr-only">Next</span>
										</a>
									</div>
								</div>
								
								<div class="srModalTable">
									<table class="srModalInfo">
										<tr class="srTableLine">
											<td class="tableName">전화번호</td>
											<td class="tableContent">010-####-1234</td>
										</tr>
										<tr class="srTableLine">
											<td class="tableName">대표자</td>
											<td class="tableContent">권오성</td>
										</tr>
										<tr class="srTableLine">
											<td class="tableName">위치</td>
											<td class="tableContent">서울 영등포구 여의도동</td>
										</tr>
									</table>
								</div>
								<div class="srModalIntro">
									<div class="srModalIntroContent">쾌적한 공간을 제공해드립니다!</div>
								</div>
							</div>
						</div>
						<div class="col-xs-12 col-sm-6 col-md-4">
							&nbsp;
						</div>
						<div class="col-xs-12 col-sm-12 col-md-4">
							&nbsp;
						</div>
						<div class="col-xs-12 col-sm-12 col-md-12">
							<div class="modalButtons">
								<button type="button" class="btn-srModal" data-dismiss="modal" onClick="close_pop();">Close</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>	
		
		
	
	</div>
</section>