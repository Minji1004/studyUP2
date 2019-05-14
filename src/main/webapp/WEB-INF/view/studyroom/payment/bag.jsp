<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
		var sum = 0;
		$("input[name=ItemPrices]").each(function() {
			sum += Number($(this).val());
		})
		
		$("input[id=srPay]").val(sum);
		
		
		// 글 삭제
		$(".srBagCloseBtn").click(function(){
			var url = "<%=cp%>/studyroom/payment/deleteBag";
			var reserveNum = $(this).children().last().children().val();
			var parent = $(this).parent().parent();
			var f = $(this).children().last();
			
			if (confirm("해당 아이템을 삭제하시겠습니까??") == true){   
			    f.attr("action",  url);
			    f.submit();
			    parent.remove();
			} else {   
			    return;
			}
		});
		
		// 결제하기
		$(".srBagContentsTitleBtn").click(function(){
			var email = $("input[name=srUserId]").val();
			var tel   = $("input[name=srUserTel]").val();
			var name  = $("input[name=srUserName]").val();
			var price = $("input[name=srPay]").val();
			price = 10;
			
			alert(email+" : "+tel+" : "+name+" : "+price);
			
			buy(email, tel, name, price);
		});
	});
	
	
	
	$(document).on("change",".srBag", function(){
		var sum = 0;
		$("input[name=ItemPrices]").each(function() {
			sum += Number($(this).val());
		})
		
		$("input[id=srPay]").val(sum);
	});
	
	$(function(){
		var IMP = window.IMP; 
		IMP.init('imp75300319');
	});
	
	// 결제관련
	function buy(email, tel, name, price) {
		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '주문명:결제테스트', // 주문명
		    amount : price, // 금액
		    buyer_email : email, // 구매자 이메일(없어도 됨)
		    buyer_tel : tel, // 구매자 연락처(없어도 됨)
		    buyer_name : name, // 구매자 이름(없어도 됨)
		    m_redirect_url : 'http://localhost:9090/studyUp/studyroom/buy/list?studyNum=24&left=7' // 여기에는 본인들 주소 쓰세여
		}, function(rsp) {
		    if ( rsp.success ) {
				// 여기에서 결제 정보 넘겨요
				// https://github.com/iamport/iamport-manual/blob/master/인증결제/README.md 
				// 참고
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		});
	}
	
	
</script>
<!-- http://rwdb.kr/mouseoverinteraction/ 마우스 오버효과 찾아보기 -->

<section class="studyroomSection" style="height:75vh; width:100%;">
	<div class="srContainer" style="width:100%;">
		<div>
			<div class="srBagLine"></div>
			<div class="col-sm-12 col-md-12">
			
				<div class="col-sm-12 col-md-9">
					<div class="srBag" style="background-color: #ffffff; margin-top:0px; height:56px ;">
						<div class="srBagTitle">
							<div class="srBagTitleName">
								스터디룸 장바구니
							</div>
						</div>
					</div>
					<div class="srBag" style="background-color: #ffffff; margin-top:0px;" >
						
						<div style="height:1px;"></div>
						
						<c:forEach var="dto" items="${list}">
							<div class="srBagItems">
								<div class="srBagItemsBorder">
								
									<div class="srBagItemsName">${dto.cafeName}</div>
									<div class="srBagCloseBtn">
										<div>x</div>
										<form method="post">
											<input type="hidden" name="reserveNum" value="${dto.reserveNum}">
										</form> 
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
													${dto.roadAddr}${dto.buildName}&nbsp;${dto.detailAddr}
												</div>
											</div>
										</div>
										<div class="srBagContentsLine">
											<div class="srBagContentsTitle" style="clear:left;">
												<div class="srBagInner">방이름</div>
											</div>
											<div class="srBagContentsText">
												<div class="srBagInner">
													${dto.roomName}
												</div>
											</div>
										</div>
										<div class="srBagContentsLine">
											<div class="srBagContentsTitle">
												<div class="srBagInner">일자</div>
											</div>
											<div class="srBagContentsText">
												<div class="srBagInner">
													${dto.useDate}
												</div>
											</div>
										</div>
										<div class="srBagContentsLine" style="width:30%">
											<div class="srBagContentsTitle" style="clear:left;">
												<div class="srBagInner">기준</div>
											</div>
											<div class="srBagContentsText">
												<div class="srBagInner">
													${dto.timeOrRoom=='oneP'?'1인':'룸'}
												</div>
											</div>
										</div>
										<div class="srBagContentsLine" style="width:30%">
											<div class="srBagContentsTitle" style="clear:left;">
												<div class="srBagInner">인원</div>
											</div>
											<div class="srBagContentsText">
												<div class="srBagInner">
													${dto.peopleNum}
												</div>
											</div>
										</div>
										<div class="srBagContentsLine" style="width:40%">
											<div class="srBagContentsTitle">
												<div class="srBagInner">시간당</div>
											</div>
											<div class="srBagContentsText">
												<div class="srBagInner">
													${dto.unitPrice}
												</div>
											</div>
										</div>
										<div class="srBagContentsLine" style="width:60%">
											<div class="srBagContentsTitle" style="clear:left;">
												<div class="srBagInner">사용시간</div>
											</div>
											<div class="srBagContentsText">
												<div class="srBagInner">
													${dto.timelists}
												</div>
											</div>
										</div>
										<div class="srBagContentsLine" style="width:40%">
											<div class="srBagContentsTitle" style="clear:left;">
												<div class="srBagInner">이용금액</div>
											</div>
											<div class="srBagContentsText">
												<div class="srBagInner" name="lecturePrices">
													${dto.itemPrice}
													<input type="hidden" name="ItemPrices" value="${dto.itemPrice}">
												</div>
											</div>
										</div>
									</div>
									
								</div>
							</div>
						</c:forEach>
					</div>
					
					<!-- 강의부분 -->
					<div class="srBagLine" style="height:20px;">
						
					</div>
					<div class="srBag" style="background-color: #ffffff; margin-top:0px; height:56px ;">
						<div class="srBagTitle">
							<div class="srBagTitleName" style="background-color: #749e3f">
								강의 장바구니
							</div>
						</div>
					</div>
					<div class="srBag" style="background-color: #ffffff; margin-top:0px;" >
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
												<input type="hidden" name="ItemPrices" value="500000">
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
					
					
					<div style="height:20px;"></div>
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
											<input class="bagInput" type="text" name="srUserId" value="${info.userId}" readonly="readonly">
										</div>
									</div>
									<div class="srBagContentsTitle" style="clear:left; margin-top:10px; width:95%; position:relative; left: 5px;">
										<div class="srBagInner">
											<div>
												- 구매자
												<span class="srBagSub">(변경가능)</span>
											</div>
											<input class="bagInput" type="text" name="srUserName" value="${info.userName}">
										</div>
									</div>
									<div class="srBagContentsTitle" style="clear:left; margin-top:10px; width:95%; position:relative; left: 5px;">
										<div class="srBagInner">
											<div>
												- 연락처
												<span class="srBagSub">(변경가능)</span>
											</div>
											<input class="bagInput" type="text" name="srUserTel" value="${info.tel}">
										</div>
									</div>
									
									<div class="srBagContentsTitle" style="background-color: #fac2ad; clear:left; margin-top:30px; width:95%; position:relative; left: 5px;">
										<div class="srBagInner">
											<div style="font-size:11pt;">총 금액</div>
											<input id="srPay" class="bagInput" type="text" name="srPay" readonly="readonly">
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