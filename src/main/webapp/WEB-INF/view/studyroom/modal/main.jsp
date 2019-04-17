<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript">
	$(document).ready(function(){
		
		// modal안에 있는 체크박스 없애고, 기존에 체크 된 것 없애기
		var ckdB = $(".srTimeCB[checked='checked']");
		
		ckdB.parent().css("background-color", "#e62849");
		ckdB.parent().children("span").css("background-color", "#fcd3e8");
		ckdB.parent().children("span").css("color","#a9142f")
		ckdB.remove();
		$(".srTimeCB").hide();
		
		// datePicker 
		$(function() {
		    $( ".srModalDatePicker" ).datepicker({
		    });
		});
	});
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
						
						<h5 class="modalName">기본 정보</h5>
						
						<div class="srModalTable">
							<table class="srModalInfo">
								<tr class="srTableLine" style="border">
									<td class="tableName">전화번호</td>
									<td class="tableContent">010-####-1234</td>
								</tr>
								<tr class="srTableLine">
									<td class="tableName">대표자</td>
									<td class="tableContent">권오성</td>
								</tr>
								<tr class="srTableLine">
									<td class="tableName">위치</td>
									<td class="tableContent">서울 영등포구 여의도동 벚길로 294-2 풍성빌딩 1203호</td>
								</tr>
							</table>
						</div>
						
						<div class="srModalIntro">
							<div class="srModalIntroContent">쾌적한 공간을 제공해드립니다!</div>
						</div>
					</div>
				</div>
				
				<div class="col-xs-12 col-sm-6 col-md-4">
					<!-- 시간 선택 정보 -->
					<div class="srSecondOneModal">
						<div class="srModalTop">
							<h5 class="modalName">날짜 선택</h5>
						</div>
						<div class="scrollSecondOneModal">
							<input type="text" class="srModalDatePicker" id="srDatepicker"> 
						</div>
						
						<!-- 하단 버튼 -->
						<button type="button" class="btn-srModalNext" data-dismiss="modal">다음</button>
						
					</div>
					
					<!-- 방별 기본 정보 -->
					<div class="srSecondTwoModal">
						<div class="srModalTop">
							<h5 class="modalName">인원 선택</h5>
						</div>
						<div class="scrollSecondTwoModal">
							<form style="margin: 10px 0px 0px 25px; text-align: left; text-size: 8pt;">
							  <input type="radio" name="srPay" value="room">룸
							  <input type="radio" name="srPay" value="oneP">1인
							</form>
							<table class="srSecondModalInfo">
								<tr class="srTableLine" style="border">
									<td class="secondTableName">방이름</td>
									<td class="secondTableName" style="background-color: #76956020; border : 1pt dotted #cccccc;">가격</td>
									<td class="secondTableName">최소/최대인원</td>
								</tr>
								<tr class="srTableLine" style="border">
									<td class="secondTableName" style="background-color: #76956020">수성</td>
									<td class="secondTableContent">
										8,000원
									</td>
									<td class="secondTablePeople">
										4/6명
									</td>
								</tr>
								<tr class="srTableLine" style="border">
									<td class="secondTableName" style="background-color: #76956020">금성</td>
									<td class="secondTableContent">
										7,000원
									</td>
									<td class="secondTablePeople">
										6/10명
									</td>
								</tr>
								<tr class="srTableLine" style="border">
									<td class="secondTableName" style="background-color: #76956020">화성</td>
									<td class="secondTableContent">
											12,000원
									</td>
									<td class="secondTablePeople">
										12/20명
									</td>
								</tr>
								<tr class="srTableLine" style="border">
									<td class="secondTableName" style="background-color: #76956020">수성</td>
									<td class="secondTableContent">
										8,000원
									</td>
									<td class="secondTablePeople">
										4/6명
									</td>
								</tr>
								<tr class="srTableLine" style="border">
									<td class="secondTableName" style="background-color: #76956020">금성</td>
									<td class="secondTableContent">
										7,000원
									</td>
									<td class="secondTablePeople">
										6/10명
									</td>
								</tr>
								<tr class="srTableLine" style="border">
									<td class="secondTableName" style="background-color: #76956020">화성</td>
									<td class="secondTableContent">
										12,000원
									</td>
									<td class="secondTablePeople">
										12/20명
									</td>
								</tr>
								<tr class="srTableLine" style="border">
									<td class="secondTableName" style="background-color: #76956020">수성</td>
									<td class="secondTableContent">
										8,000원
									</td>
									<td class="secondTablePeople">
										4/6명
									</td>
								</tr>
								<tr class="srTableLine" style="border">
									<td class="secondTableName" style="background-color: #76956020">금성</td>
									<td class="secondTableContent">
										7,000원
									</td>
									<td class="secondTablePeople">
										6/10명
									</td>
								</tr>
								<tr class="srTableLine" style="border">
									<td class="secondTableName" style="background-color: #76956020">화성</td>
									<td class="secondTableContent">
										12,000원
									</td>
									<td class="secondTablePeople">
										12/20명
									</td>
								</tr>
							</table>
							<div class="srModalBottomSpace">&nbsp;</div>
						</div>
						
						
						<!-- 하단 버튼 -->
						<div class="srModalNext">
							<input type="text" class="srModalPeople" placeholder=" 인원수를 입력하세요. ">
							<button type="button" class="btn-srModalNext" data-dismiss="modal">다음</button>
						</div>
							
					</div>
				</div>
				
				
				
				<div class="col-xs-12 col-sm-12 col-md-4">
					<div class="srThirdModal">
						<div class="srModalTop">
							<h5 class="modalName">시간 선택</h5>
						</div>
						<!-- 각 스터디 별 체크  -->
						<div class="scrollThirdModal"> 
							<div class="col-xs-12 col-sm-12 col-md-12">
								<div class="srRoomName">수성</div>
								<div class="srTimeButton">
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|11:00|</span>
									</label>
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|12:00|</span>
									</label>
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|13:00|</span>
									</label>
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|14:00|</span>
									</label>
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|15:00|</span>
									</label>
									
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|16:00|</span>
									</label>
									
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|17:00|</span>
									</label>
									
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|18:00|</span>
									</label>
									
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|19:00|</span>
									</label>
									
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off" checked="checked">
										<span>|20:00|</span>
									</label>
									
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off" checked="checked">
										<span>|21:00|</span>
									</label>
									
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off" checked="checked">
										<span>|22:00|</span>
									</label>
								</div>
							</div>
							
							<div class="col-xs-12 col-sm-12 col-md-12">
								<div class="srRoomName">금성</div>
								<div class="srTimeButton">
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|11:00|</span>
									</label>
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|12:00|</span>
									</label>
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|13:00|</span>
									</label>
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|14:00|</span>
									</label>
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|15:00|</span>
									</label>
									
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|16:00|</span>
									</label>
									
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|17:00|</span>
									</label>
									
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|18:00|</span>
									</label>
									
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|19:00|</span>
									</label>
									
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off" checked="checked">
										<span>|20:00|</span>
									</label>
									
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off" checked="checked">
										<span>|21:00|</span>
									</label>
									
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off" checked="checked">
										<span>|22:00|</span>
									</label>
								</div>
							</div>
							
							<div class="col-xs-12 col-sm-12 col-md-12">
								<div class="srRoomName">지구</div>
								<div class="srTimeButton">
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|11:00|</span>
									</label>
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|12:00|</span>
									</label>
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|13:00|</span>
									</label>
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|14:00|</span>
									</label>
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|15:00|</span>
									</label>
									
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|16:00|</span>
									</label>
									
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|17:00|</span>
									</label>
									
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|18:00|</span>
									</label>
									
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|19:00|</span>
									</label>
									
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off" checked="checked">
										<span>|20:00|</span>
									</label>
									
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off" checked="checked">
										<span>|21:00|</span>
									</label>
									
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off" checked="checked">
										<span>|22:00|</span>
									</label>
								</div>
							</div>

							<div class="col-xs-12 col-sm-12 col-md-12">
								<div class="srRoomName">화성</div>
								<div class="srTimeButton">
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|11:00|</span>
									</label>
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|12:00|</span>
									</label>
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|13:00|</span>
									</label>
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|14:00|</span>
									</label>
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|15:00|</span>
									</label>
									
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|16:00|</span>
									</label>
									
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|17:00|</span>
									</label>
									
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|18:00|</span>
									</label>
									
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|19:00|</span>
									</label>
									
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off" checked="checked">
										<span>|20:00|</span>
									</label>
									
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off" checked="checked">
										<span>|21:00|</span>
									</label>
									
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off" checked="checked">
										<span>|22:00|</span>
									</label>
								</div>
							</div>								
							
							<div class="col-xs-12 col-sm-12 col-md-12">
								<div class="srRoomName">목성</div>
								<div class="srTimeButton">
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|11:00|</span>
									</label>
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|12:00|</span>
									</label>
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|13:00|</span>
									</label>
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|14:00|</span>
									</label>
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|15:00|</span>
									</label>
									
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|16:00|</span>
									</label>
									
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|17:00|</span>
									</label>
									
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|18:00|</span>
									</label>
									
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|19:00|</span>
									</label>
									
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off" checked="checked">
										<span>|20:00|</span>
									</label>
									
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off" checked="checked">
										<span>|21:00|</span>
									</label>
									
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off" checked="checked">
										<span>|22:00|</span>
									</label>
								</div>
							</div>
							
							<div class="col-xs-12 col-sm-12 col-md-12">
								<div class="srRoomName">토성</div>
								<div class="srTimeButton">
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|11:00|</span>
									</label>
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|12:00|</span>
									</label>
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|13:00|</span>
									</label>
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|14:00|</span>
									</label>
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|15:00|</span>
									</label>
									
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|16:00|</span>
									</label>
									
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|17:00|</span>
									</label>
									
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|18:00|</span>
									</label>
									
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|19:00|</span>
									</label>
									
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off" checked="checked">
										<span>|20:00|</span>
									</label>
									
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off" checked="checked">
										<span>|21:00|</span>
									</label>
									
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off" checked="checked">
										<span>|22:00|</span>
									</label>
								</div>
							</div>
							
							<div class="col-xs-12 col-sm-12 col-md-12">
								<div class="srRoomName">천왕성</div>
								<div class="srTimeButton">
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|11:00|</span>
									</label>
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|12:00|</span>
									</label>
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|13:00|</span>
									</label>
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|14:00|</span>
									</label>
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|15:00|</span>
									</label>
									
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|16:00|</span>
									</label>
									
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|17:00|</span>
									</label>
									
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|18:00|</span>
									</label>
									
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off">
										<span>|19:00|</span>
									</label>
									
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off" checked="checked">
										<span>|20:00|</span>
									</label>
									
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off" checked="checked">
										<span>|21:00|</span>
									</label>
									
									<label class="srTimeColor">
										<input class="srTimeCB" type="checkbox" autocomplete="off" checked="checked">
										<span>|22:00|</span>
									</label>
								</div>
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
						<button type="button" class="btn-srModal" onClick="#" style="float:left;">수정하기</button>
						<button type="button" class="btn-srModal" data-dismiss="modal" onClick="close_pop();">닫기</button>
					</div>
				</div>
			</div>
		</div>