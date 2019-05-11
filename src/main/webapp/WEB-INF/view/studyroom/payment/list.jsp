<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript">
	
	
	
</script>

<section class="studyroomSection" style="height:75vh; width:100%;">
	<div class="srContainer" style="width:100%;">
		
		<!-- 목록박스 -->
		
		<div class="srPayListBox">
			<div class="srBagTitleName" style="background-color: #6c2b5ecc;">
				결제목록
			</div>
			
			<div class="srPayListLine" style="width:100%;">
				<div style="position:relative; left:2%; width:10%; float:left;">
					<div class="srPayListTop">
						<div class="srBagInner">No.#</div>
					</div>
				</div>
				<div style="position:relative; left:0%; width:10%; float:left;">
					<div class="srPayListTop">
						<div class="srBagInner">결제번호</div>
					</div>
				</div>
				<div style="position:relative; left:18%; width:45%; float:left;">
					<div class="srPayListTop">
						<div class="srBagInner">구매목록</div>
					</div>
				</div>
				<div style="position:relative; left:5%; width:20%; float:left;">
					<div class="srPayListTop">
						<div class="srBagInner">결제일자</div>
					</div>
				</div>
				<div style="position:relative; left:3%; width:15%; float:left;">
					<div class="srPayListTop">
						<div class="srBagInner">결제금액</div>
					</div>
				</div>	
				<div style="margin-top: 32px; border-top: 2px solid #6c2b5e44 ; "></div>
			</div>
			
			<div class="srPayList" style="width:100%;">
				<div style="width:10%; float:left; text-align:center; font-weight:700;">
					003
				</div>
				<div style="width:10%; float:left; text-align:center;">
					000364
				</div>
				<div style="width:45%; float:left; text-align:center; font-weight:700;">
					쌍용스터디
				</div>
				<div style="width:20%; float:left; text-align:center;">
					2019-05-15
				</div>
				<div style="width:15%; float:left; text-align:center; font-weight:700;">
					12000
				</div>
				<div class="srPayListSpLine"></div>
			</div>
			
			<div class="srPayList" style="width:100%;">
				<div style="width:10%; float:left; text-align:center; font-weight:700;">
					002
				</div>
				<div style="width:10%; float:left; text-align:center;">
					000253
				</div>
				<div style="width:45%; float:left; text-align:center; font-weight:700;">
					한가람스터디  외 1개
				</div>
				<div style="width:20%; float:left; text-align:center;">
					2019-05-15
				</div>
				<div style="width:15%; float:left; text-align:center; font-weight:700;">
					23000
				</div>
				<div class="srPayListSpLine"></div>
			</div>
			<div class="srPayList" style="width:100%;">
				<div style="width:10%; float:left; text-align:center; font-weight:700;">
					001
				</div>
				<div style="width:10%; float:left; text-align:center;">
					000123
				</div>
				<div style="width:45%; float:left; text-align:center; font-weight:700;">
					한성스터디 외 1개
				</div>
				<div style="width:20%; float:left; text-align:center;">
					2019-05-14
				</div>
				<div style="width:15%; float:left; text-align:center; font-weight:700;">
					545000
				</div>
			</div>
			
			<div class="srPayListLine" style="width:100%;">
				<div style="margin-top: 2px; border-top: 2px solid #6c2b5e44 ; "></div>
			</div>
			
			<div class="srPayListLine" style="width:50%; float : right">
				<div class="btn-srModalCreate" style="background-color:#6c2b5e; cursor:pointer;">
					새로고침
				</div>
			</div>
		</div>
		
		
		
		
		
		<!-- 구매내역상자 -->
		<div>
			<div style="height:100px;"></div>
			<div class="srPayArticleBox">
				<div class="srBagTitleName" style="font-size: 12pt; background-color: #6c2b5ecc; margin-bottom:5px;">
					결제번호 : 000253
				</div>
				
				<div class="srPayListLine" style="width:100%;">
					<div style="width:50%; float:left;">
						<div class="srPayListTop">
							<div class="srBagInner">구매 내역</div>
						</div>
						<div style="float:left; text-align:left;">
							&nbsp;&nbsp;: 한가람스터디  외 1개
						</div>
					</div>
					<div style="width:25%; float:left;">
						<div class="srPayListTop">
							<div class="srBagInner">구매 일자</div>
						</div>
						<div style="float:left; text-align:left;">
							&nbsp;&nbsp;: 2019-05-14
						</div>
					</div>
					<div style="width:25%; float:left;">
						<div class="srPayListTop">
							<div class="srBagInner">총 금액</div>
						</div>
						<div style="float:left; text-align:left;">
							&nbsp;&nbsp;: 23000
						</div>
					</div>
				</div>
				
				<div class="srPayListLine" style="width:100%;">
					<div style="margin-top: 2px; border-top: 2px solid #6c2b5e44 ; "></div>
				</div>
				
				<!-- 내용보기 -->
				
				<div style="height:45px;"></div>
				<div class="srBagItems">
					<div class="srBagItemsBorder">
					
						<div class="srBagItemsName">한가람스터디카페</div>
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
				
				<!-- 내용보기 끝 -->
				
				<div class="srPayListLine" style="width:100%;">
					<div style="margin-top: 20px; border-top: 2px solid #6c2b5e44 ; "></div>
				</div>
				
				<div class="srPayListLine" style="width:50%; float : right">
					<div class="btn-srModalCreate" style="background-color:#6c2b5e; cursor:pointer;">
						닫기
					</div>
				</div>
			</div>
		</div>
		
		
	</div>
</section>