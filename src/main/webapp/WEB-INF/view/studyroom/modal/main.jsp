<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript">
	$(document).ready(function(){
		
		checked(); // 체크박스 없애기
		
		// datePicker 
		$(function() {
		    $( ".srModalDatePicker" ).datepicker({
		    });
		});
	});
	
	// modal안에 있는 체크박스 없애고, 기존에 체크 된 것 없애기
	function checked() {
		var ckdB = $(".srTimeCB[checked='checked']");
		
		ckdB.parent().css("background-color", "#e62849");
		ckdB.parent().children("span").css("background-color", "#fcd3e8");
		ckdB.parent().children("span").css("color","#a9142f")
		ckdB.remove();
		$(".srTimeCB").hide();
	};
	
</script>
		<!-- Modal body -->
		<div class="srModal-body">
			<div class="srModalDetail">
				<div class="col-xs-12 col-sm-12 col-md-12">
					<button type="button" class="btn-srModalUpClose" data-dismiss="modal"  onClick="close_pop();" style="display : inline-block; vartical-align:top;">x</button>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-4">	
					<div class="srFirstModal">
						<div class="srModalTitleArea">
							<h3 class="srModalTitle">${sr.cafeName}</h3>
						</div>
						<div class="srModalPicFrame">
							<div id="modalPic" class="carousel slide" data-ride="carousel" data-interval="false">
								<!-- Wrapper for slides -->
								<div class="carousel-inner" role="listbox">
									<c:if test="${not empty sr.fileList}">
										${sr.fileList}
									</c:if>
									<c:if test="${empty sr.fileList}">
										<div class="item active">
											<img class="srModalPic" src="<%=cp%>/resource/studyroom/images/coming_soon.jpg" alt="..." height="100%" width="100%">
										</div>
									</c:if>
								</div>
								<c:if test="${not empty sr.fileList}">
									<!-- Controls -->
									<a class="left carousel-control" href="#modalPic" role="button" data-slide="prev">
										<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
										<span class="sr-only">Previous</span>
									</a>
									<a class="right carousel-control" href="#modalPic" role="button" data-slide="next">
										<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
										<span class="sr-only">Next</span>
									</a>
								</c:if>
							</div>
						</div>
						
						<h5 class="modalName">기본 정보</h5>
						
						<div class="srModalTable">
							<table class="srModalInfo">
								<tr class="srTableLine" style="border">
									<td class="tableName">전화번호</td>
									<td class="tableContent">${sr.cafeTel}</td>
								</tr>
								<tr class="srTableLine">
									<td class="tableName">대표자</td>
									<td class="tableContent">${sr.cafeOwner}</td>
								</tr>
								<tr class="srTableLine">
									<td class="tableName">위치</td>
									<td class="tableContent">
										${sr.roadAddr}<c:if test="${not empty sr.buildName}">&nbsp;${sr.buildName}</c:if>&nbsp;${sr.detailAddr}
									</td>
								</tr>
							</table>
						</div>
						
						<div class="srModalIntro">
							<div class="srModalIntroContent">
								<div>${sr.cafeIntro}</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="col-xs-12 col-sm-6 col-md-4">
					<!-- 시간 선택 정보 -->
					<div class="srSecondOneModal">
						<div class="srModalTop">
							<h5 class="modalName">운영시간</h5>
						</div>
						<div class="scrollSecondOneModal" style="margin-top:15px;">
							 <span style="font-weight:700; color:blue">시작</span>&nbsp;:&nbsp;${sr.cafeOpen}:00 ~ <span style="font-weight:700; color: red">종료</span>&nbsp;:&nbsp;${sr.cafeClose}:00
							 <input type="hidden" name="srTimeButtonOpen" value="${sr.cafeOpen}">
							 <input type="hidden" name="srTimeButtonClose" value="${sr.cafeClose}">
						</div>
					</div>
					<div style="height:20px;"></div>
					<div class="srSecondOneModal">
						<div class="srModalTop">
							<h5 class="modalName">날짜 선택</h5>
						</div>
						<div class="scrollSecondOneModal">
							<input type="text" class="srModalDatePicker" id="srDatepicker"> 
						</div>
						<div style="height:80px;">
						</div>
					</div>
					
					<!-- 방별 기본 정보 -->
					<div class="srSecondTwoModal">
						<div class="srModalTop">
							<h5 class="modalName">인원 선택</h5>
						</div>
						<div class="scrollSecondTwoModal">
							<div style="margin: 10px 0px 0px 25px; text-align: left; text-size: 8pt;" >
								<c:if test="${radio_test=='oneP'}">
								  <div><span style="font-weight:700; font-size:12px;">기준가격 :</span>1인당/시간</div> 
								</c:if>
								<c:if test="${radio_test=='room'}">
								  <div><span style="font-weight:700; font-size:12px;">기준가격 :</span> 방/시간</div> 
								</c:if>
							</div>
							<table class="srSecondModalInfo">
								<tr class="srTableLine" style="border">
									<td class="secondTableName">방이름</td>
									<td class="secondTableName" style="background-color: #76956020; border : 1pt dotted #cccccc;">가격</td>
									<td class="secondTableName">최소/최대인원</td>
								</tr>
								<c:forEach var="modto" items="${sr.studyRoomList}">
									<tr class="srTableLine" style="border">
										<td class="secondTableName" style="background-color: #76956020">${modto.roomName}</td>
										<td class="secondTableContent">
											${modto.unitPrice}
										</td>
										<td class="secondTablePeople">
											${modto.minUser}/${modto.maxUser}명
											<input type="hidden" name="modalRoomName" value="${modto.roomName}">
											<input type="hidden" name="modalRoomNum" value="${modto.roomNum}">
											<c:forEach var="time" items="${modto.checkTimes}">
												<input type="hidden" name="roomTime${modto.roomNum}" value="${time}">
											</c:forEach>
										</td>
									</tr>
								</c:forEach>
							</table>
							<div class="srModalBottomSpace">&nbsp;</div>
						</div>
						
						
						<!-- 하단 버튼 -->
						<div class="srModalNext">
							<input type="text" class="srModalPeople" placeholder=" 인원수를 입력하세요. ">
							<button type="button" class="btn-srModalNext" id="srModalMainTime">다음</button>
						</div>
							
					</div>
				</div>
				
				
				
				<div class="col-xs-12 col-sm-12 col-md-4">
					<div class="srThirdModal">
						<div class="srModalTop">
							<h5 class="modalName">시간 선택</h5>
						</div>
						<!-- 각 스터디 별 체크  -->
						<div class="scrollThirdModal" id="scrollThirdModal"> 
							<div class="col-xs-12 col-sm-12 col-md-12">
								<h5> 가운데 하단에 <a style="font-weight:700; color:red;">"다음"</a>을 눌러주세요.</h5>
							</div>
							<div class="srModalBottomSpace">&nbsp;</div>
						</div>
						
						<!-- 하단 버튼 -->
						<div class="srModalNext">
							<button type="button" class="btn-srModalNext" data-dismiss="modal">장바구니</button>
							<button style="float: left; margin-left : 15px;" type="button" class="btn-srModalNext" onclick="initial();">초기화</button>
						</div>
					</div>
				</div>
										
				<div class="col-xs-12 col-sm-12 col-md-12">
					<div class="">
						&nbsp;
					</div>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-12">
					<div class="modalButtons">
						&nbsp;
						<button type="button" class="btn-srModal" onclick="#" style="float:left;">수정하기</button>
						<button type="button" class="btn-srModal" data-dismiss="modal" onClick="close_pop();">닫기</button>
					</div>
				</div>
			</div>
		</div>