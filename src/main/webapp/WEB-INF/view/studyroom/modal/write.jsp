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
	
    
	// modal sendok
	function modalSendOk(){
		var f = document.srModalForm;
		
		// 카페이름
		var str = f.cafeName.value;
		if(!str) {
			alert("제목을 입력하세요.");
			f.cafeName.focus();
			return;
		}
		
		// 카페전화번호
		var str = f.cafeTel.value;
		if(!str) {
			alert("전화번호를 입력하세요.");
			f.cafeTel.focus();
			return;
		}
		
		// 카페대표자
		var str = f.cafeOwner.value;
		if(!str) {
			alert("대표자 성함을 입력하세요.");
			f.cafeOwner.focus();
			return;
		}
		
		// 주소입력확인
		var str = f.roadAddr.value;
		var str1 = f.detailAddr.value;
		if(!str || !str1) {
			alert("주소를 입력하세요.");
			if(!str1) {
				srPostcode();
			}
			return;
		}
		
		f.action="<%=cp%>/studyroom/modal/${mode}";
		
		f.submit();
	}
	
</script>	



		<!-- Modal body -->
		<div class="srModal-body">
			<div class="srModalDetail">
				<form name="srModalForm" method="post" enctype="multipart/form-data">
					<div class="col-xs-12 col-sm-12 col-md-12">
						<button type="button" class="btn-srModalUpClose" data-dismiss="modal"  onClick="close_pop();" style="display : inline-block; vartical-align:top;">x</button>
					</div>
					<div class="col-xs-12 col-sm-6 col-md-4">	
						<div class="srFirstModal">
							<div class="srModalBottomSpace"></div>
							<div class="srModalTitleArea">
								카페이름 : <input type="text" id="cafeName" name="cafeName" class="srModalTitle">
							</div>
							<div class="srModalPicFrame" style="min-height:110px;">
								<div class="col-xs-12 col-sm-12 col-md-12">
									<div class="srModalBottomSpace"></div>
								</div>
								<div class="col-xs-4 col-sm-4 col-md-4">
									<div class="srInsertPicClick">
										<input type="file" name="upload" class="srUpImage" size="53" style="height: 25px; width: 200px;">
										<input type="file" name="upload" class="srUpImage" size="53" style="height: 25px; width: 200px;">
										<input type="file" name="upload" class="srUpImage" size="53" style="height: 25px; width: 200px;">
									</div>
								</div>
								<!-- 
								<div class="col-xs-4 col-sm-4 col-md-4">
									<div class="srInsertPicClick">
										<img class="srInsertPic" src="<%=cp%>/resource/studyroom/images/picture.png">
										<span>2</span>
									</div>
								</div>
								<div class="col-xs-4 col-sm-4 col-md-4">
									<div class="srInsertPicClick">
										<img class="srInsertPic" src="<%=cp%>/resource/studyroom/images/picture.png">
										<span>3</span>
									</div>
								</div>
								 -->
								<div class="col-xs-12 col-sm-12 col-md-12">
									<div class="srModalBottomSpace"></div>
								</div>
								
							</div>
							
							<h5 class="modalName">기본 정보</h5>
							
							<div class="srModalWriteTable">
								<table class="srModalInfo">
									<tr class="srTableLine" style="border">
										<td class="tableName">전화번호</td>
										<td><input type="text" id="cafeTel" name="cafeTel" class="srInsertText" placeholder="010-XXXX-XXXX" style="padding-left:5px;"></td>
									</tr>
									<tr class="srTableLine">
										<td class="tableName">대표자</td>
										<td><input type="text" id="cafeOwner" name="cafeOwner" class="srInsertText" placeholder="실명으로 기입해야 합니다." style="padding-left:5px;"></td>
									</tr>
									<tr class="srTableLine">
										<td class="tableName">도로주소</td>
										<td>
											<input type="text" id="roadAddr" name="roadAddr" class="srInsertText" placeholder="검색 버튼을 눌러주세요" readonly="readonly" style="padding-left:5px; width:80%;">
											<img src="<%=cp%>/resource/studyroom/images/search.png" onclick="srPostcode();" style="float:right; cursor : pointer; height:19px;">
										</td>
									</tr>
									<tr class="srTableLine">
										<td class="tableName">지번주소</td>
										<td>
											<input type="text" id="normAddr" name="normAddr" class="srInsertText"  readonly="readonly" style="padding-left:5px;">
										</td>
									</tr>
									<tr class="srTableLine">
										<td class="tableName">건물명</td>
										<td>
											<input type="text" id="buildName" name="buildName" class="srInsertText" placeholder="" style="padding-left:5px;" readonly="readonly">
										</td>
									</tr>
									<tr class="srTableLine">
										<td class="tableName">상세위치</td>
										<td>
											<input type="text" id="detailAddr" name="detailAddr" class="srInsertText" placeholder="상세주소를 입력합니다." style="padding-left:5px;">
											<input type="hidden" id="bCode" name="bCode">
											<input type="hidden" id="sido" name="sido">
											<input type="hidden" id="sigungu" name="sigungu">
											<input type="hidden" id="bname" name="bname">
										</td>
									</tr>
									<tr>
										<td>
										</td>
										<td></td>
									</tr>
								</table>
							</div>
							<div class="srInsertIntro">
								<div class="srModalIntroContent">
									<textarea class="srInsertTextarea" id="cafeIntro" name="cafeIntro" placeholder=" 여기에 간략한 소개글을 입력하세요."></textarea>
								</div>
							</div>
						</div>
					</div>
					
					<div class="col-xs-12 col-sm-6 col-md-4">
						<!-- 시간 선택 정보 -->
						<div class="srSecondTwoModal" style="margin-top: 0px; height: 417px;">
							<div class="srModalTop">
								<h5 class="modalName">방정보 입력</h5>
							</div>
							
							<div style="margin: 10px 0px 0px 25px; text-align: left; text-size: 8pt;">
							    	기준&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp; 
							  	<input type="radio" name="timeOrRoom" value="room">룸&nbsp;&nbsp; 
							  	<input type="radio" name="timeOrRoom" value="oneP">1인
							</div>
	
							<div class="scrollSecondTwoModal" style="height: 282px;"> 
								<table class="srSecondModalInfo" id="srRoomInfoTable">
									<tr class="srTableLine" style="border">
										<td class="secondTableName">방이름</td>
										<td class="secondTableName" style="background-color: #76956020; border : 1pt dotted #cccccc;">가격</td>
										<td class="secondTableName">최소</td>
										<td class="secondTableName" style="background-color: #76956020; border : 1pt dotted #cccccc;">최대</td>
										<td class="secondTableName" style="width:5px;">
									</tr>
									<tr class="srTableLine" style="border">
										<td class="secondTableName" style="background-color: #76956020">
											<input type="text" id="" name="roomNames" class="srInsertText"  style="background-color: #76956001" placeholder="방이름">
										</td>
										<td class="secondTableContent">
											<input type="text" id="" name="unitPrices" class="srInsertText" placeholder="예) 8000">
										</td>
										<td class="secondTableContent">
											<input type="text" id="" name="minUsers" class="srInsertText" placeholder="예) 4">
										</td>
										<td class="secondTableContent">
											<input type="text" id="" name="maxUsers" class="srInsertText" placeholder="예) 8">
										</td>
										<td>
											<button class="srRemoveRow" type="button">X</button>
										</td>
									</tr>
								</table>
								<div class="srModalBottomSpace">&nbsp;</div>
							</div>
							
							<!-- 하단 버튼 -->
							<div class="srModalNext">
								<button type="button" class="btn-srModalNext" style="margin-right: 23px;" onclick="deleteLastRow();">삭제</button>
								<button type="button" class="btn-srModalNext" style="margin-right: 5px;" onclick="insertRow();">추가</button>
							</div>
						</div>
						
						<div class="srSecondOneModal" style="margin-top: 20px; height: 180px;">
							<div class="srModalTop" style="border:none;">
								<h5 class="modalName">사용불가 시간을 선택</h5>
							</div>
													
							<div class="scrollSecondOneModal" style="height: 75px;"> 
								<table class="srSecondModalInfo" style="margin: 12px 0px -3px 0px;">
									<tr class="srTableLine" style="border">
										<td class="secondTableName" style="font-size: 10pt;">Open</td>
										<td class="secondTableName" style="font-size: 10pt; background-color: #76956020; border : 1pt dotted #cccccc;">Close</td>
									</tr>
									<tr class="srTableLine" style="border">
										<td class="secondTablePeople">
											<input type="text" id="" name="cafeOpen" class="srInsertText" style="font-size: 10pt; text-align: center; border-right : 1pt dotted #cccccc; " placeholder="예) 10">
										</td>
										<td class="secondTablePeople">
											<input type="text" id="" name="cafeClose" class="srInsertText" style="font-size: 10pt; text-align: center;" placeholder="예) 23">
										</td>
									</tr>
								</table>
							</div>
							
							<!-- 하단 버튼 -->
							<div class="srModalNext" style="border:none;">
								<button type="button" class="btn-srModalNext" id="srModalFullTime">세부시간 선택</button>
							</div>
						</div>
					</div>			
					
									
					<div class="col-xs-12 col-sm-12 col-md-4">
						<div class="srThirdModal">
							<div class="srModalTop">
								<h5 class="modalName">운영시간 선택</h5>
							</div>
							<!-- 각 스터디 별 체크  -->
							<div class="scrollThirdModal"> 
								<div class="col-xs-12 col-sm-12 col-md-12" id="srModalRoomTime">
									<div class="roomNames">수성</div>
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
											<input class="srTimeCB" type="checkbox" autocomplete="off">
											<span>|20:00|</span>
										</label>
										
										<label class="srTimeColor">
											<input class="srTimeCB" type="checkbox" autocomplete="off">
											<span>|21:00|</span>
										</label>
										
										<label class="srTimeColor">
											<input class="srTimeCB" type="checkbox" autocomplete="off">
											<span>|22:00|</span>
										</label>
									</div>
									<div class="srModalBottomSpace">&nbsp;</div>
								</div>
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
							<button type="button" class="btn-srModal" style="float:left;" onclick="modalSendOk();">등록완료</button>
							<button type="button" class="btn-srModal" data-dismiss="modal" onClick="close_pop();">닫기</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		
