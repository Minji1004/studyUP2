<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript">
	
	
	
</script>
<!-- http://rwdb.kr/mouseoverinteraction/ 마우스 오버효과 찾아보기 -->

<section class="studyroomSection" style="height:75vh; width:100%;">
	<div class="srContainer" style="width:100%;">
		<div>
			<div class="srBagLine"></div>
			<div class="col-sm-12 col-md-12">
			
				<div class="col-sm-12 col-md-9">
					<div class="srBag" style="background-color: #ffffff; margin-top:0px;" >
						
						<div class="srBagTitle">
							<div class="srBagTitleName">
								스터디룸 장바구니
							</div>
						</div>
						<div style="height:1px;"></div>
						
						<div class="srBagItems">
							<div class="srBagItemsBorder">
							
								<div class="srBagItemsName">자바스터디카페</div>
								<div class="srBagCloseBtn">
									<div>x</div>
								</div>
								<div class="srBagItemsImg">
									<img style="position:relative; top:2px;" height="95%" width="95%" src="<%=cp%>/resource/studyroom/images/pic02.jpg">
								</div>
								<div class="srBagContents">
									<div class="srBagContentsLine" style="width:100%">									
										<div class="srBagContentsTitle">
											<div class="srBagInner">
												주소
											</div>
										</div>
										<div class="srBagContentsText">
											<div class="srBagInner">
												서울시 영등포구 여의도동 여의벚길로 153 풍성빌딩 304호 자바스터디카페
											</div>
										</div>
									</div>
									<div class="srBagContentsLine">
										<div class="srBagContentsTitle" style="clear:left;">
											<div class="srBagInner">방이름</div>
										</div>
										<div class="srBagContentsText">
											<div class="srBagInner">
												JAVA반
											</div>
										</div>
									</div>
									<div class="srBagContentsLine">
										<div class="srBagContentsTitle">
											<div class="srBagInner">일자</div>
										</div>
										<div class="srBagContentsText">
											<div class="srBagInner">
												2019-06-29
											</div>
										</div>
									</div>
									<div class="srBagContentsLine" style="width:60%">
										<div class="srBagContentsTitle" style="clear:left;">
											<div class="srBagInner">기준</div>
										</div>
										<div class="srBagContentsText">
											<div class="srBagInner">
												방
											</div>
										</div>
									</div>
									<div class="srBagContentsLine" style="width:40%">
										<div class="srBagContentsTitle">
											<div class="srBagInner">시간당</div>
										</div>
										<div class="srBagContentsText">
											<div class="srBagInner">
												15000
											</div>
										</div>
									</div>
									<div class="srBagContentsLine" style="width:60%">
										<div class="srBagContentsTitle" style="clear:left;">
											<div class="srBagInner">사용시간</div>
										</div>
										<div class="srBagContentsText">
											<div class="srBagInner">
												15:00, 16:00, 17:00
											</div>
										</div>
									</div>
									<div class="srBagContentsLine" style="width:40%">
										<div class="srBagContentsTitle" style="clear:left;">
											<div class="srBagInner">이용금액</div>
										</div>
										<div class="srBagContentsText">
											<div class="srBagInner" name="lecturePrices">
												45000											
											</div>
										</div>
									</div>
								</div>
								
							</div>
						</div>
					</div>
					
					<!-- 강의부분 -->
					<div class="srBagLine">
						
					</div>
					<div class="srBag" style="background-color: #ffffff; margin-top:0px;" >
						<div class="srBagTitle">
							<div class="srBagTitleName" style="background-color: #749e3f">
								강의 장바구니
							</div>
						</div>
						<div style="height:1px;"></div>
						
						<div class="srBagItems">
							<div class="srBagItemsBorder">
							
								<div class="srBagItemsName" style="background-color: #bad698">6월 공무원 시험 대비 특강</div>
								<div class="srBagCloseBtn">
									<div>x</div>
								</div>
								<div class="srBagItemsImg">
									<img style="position:relative; top:2px;" height="95%" width="95%" src="<%=cp%>/resource/studyroom/images/coming_soon.jpg">
								</div>
								<div class="srBagContents">
									<div class="srBagContentsLine" style="width:100%">
										<div class="srBagContentsTitle" style="clear:left;">
											<div class="srBagInner">선생님</div>
										</div>
										<div class="srBagContentsText">
											<div class="srBagInner">
												이민지
											</div>
										</div>
									</div>
									<div class="srBagContentsLine" style="width:100%">
										<div class="srBagContentsTitle" style="clear:left;">
											<div class="srBagInner">위치</div>
										</div>
										<div class="srBagContentsText">
											<div class="srBagInner">
												홍대입구역 동교빌딩 204호 동교스터디
											</div>
										</div>
									</div>
									<div class="srBagContentsLine" style="width:50%">
										<div class="srBagContentsTitle">
											<div class="srBagInner">등록마감일</div>
										</div>
										<div class="srBagContentsText">
											<div class="srBagInner">
												2019-05-30
											</div>
										</div>
									</div>
									<div class="srBagContentsLine" style="width:50%">
										<div class="srBagContentsTitle" style="clear:left;">
											<div class="srBagInner">강의가격</div>
										</div>
										<div class="srBagContentsText">
											<div class="srBagInner" name="lecturePrices">
												500000
											</div>
										</div>
									</div>
									<div class="srBagContentsLine" style="width:50%">
										<div class="srBagContentsTitle">
											<div class="srBagInner">과목</div>
										</div>
										<div class="srBagContentsText">
											<div class="srBagInner">
												영어, 행정법
											</div>
										</div>
									</div>
								</div>
								
							</div>
						</div>
					</div>
					<!-- 강의부분 끝  -->
					
					
					
				</div>
				
				
				<div class="col-sm-12 col-md-3">
					<div class="srBagLine">
					</div>
					
					<div class="srBagPay" style="background-color: #ffffff; width: 200px; height : 353px; position:fixed;">
						<div class="srBagName">결제정보</div>
							<div class="srBagPayLine">
								<div class="srBagContentsTitle" style="clear:left; margin-top:10px; width:95%; position:relative; left: 5px;">
									<div class="srBagInner">
										<div>- 아이디</div>
										<input class="bagInput" type="text" name="srUserId" value="farland@gmail.com" readonly="readonly">
									</div>
								</div>
								<div class="srBagContentsTitle" style="clear:left; margin-top:10px; width:95%; position:relative; left: 5px;">
									<div class="srBagInner">
										<div>
											- 구매자
											<span class="srBagSub">(변경가능)</span>
										</div>
										<input class="bagInput" type="text" name="srUserName" value="이재민">
									</div>
								</div>
								<div class="srBagContentsTitle" style="clear:left; margin-top:10px; width:95%; position:relative; left: 5px;">
									<div class="srBagInner">
										<div>
											- 연락처
											<span class="srBagSub">(변경가능)</span>
										</div>
										<input class="bagInput" type="text" name="srUserTel" value="010-2323-4524">
									</div>
								</div>
								
								<div class="srBagContentsTitle" style="background-color: #fac2ad; clear:left; margin-top:30px; width:95%; position:relative; left: 5px;">
									<div class="srBagInner">
										<div style="font-size:11pt;">총 금액</div>
										<input class="bagInput" type="text" name="srPay" value="545000" readonly="readonly">
									</div>
								</div>
								
								<div class="srBagContentsTitleBtn">
									<div class="srBagPayBtn">
										<div style="font-size:11pt; color:#ffffff;">결제하기</div>
									</div>									
								</div>
							</div>
							
						
						
					</div>
				</div>
				
			</div>
			
		
		</div>
	</div>
</section>