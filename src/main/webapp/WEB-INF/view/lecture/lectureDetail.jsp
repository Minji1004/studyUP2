<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript">
function buy() {
	
	if("${sessionScope.member.userNum}"===""){
		alert("로그인이 필요합니다.");
		return;
	}	

	IMP.request_pay({
	    pg : 'inicis', 
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '${dto.studyName}',
	    amount : ${dto.price},
	    buyer_name : '${sessionScope.member.userName}',
	    buyer_tel : '${sessionScope.member.tel}'
	}, function(rsp) {		
	   if ( rsp.success ) {
	    	$.ajax({
	    		url: "<%=cp%>/payments/complete",
	    		type: 'POST',
	    		dataType: 'json',
	    		data: {
		    		lectureNum: ${dto.lectureNum}
	    		}
	    	}).done(function(data) {
			        var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;			    
			})
		} else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	    }
		alert(msg);
	});

}
</script>


<div class="modal-header">
   <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
   <h4 class="modal-title" id="myModalLabel" align="center">${dto.studyName} (${dto.applyCount}/${dto.headcount})</h4>
</div>
<div class="smodal-body modal-body row">
 	<div class="col-xs-8 col-sm-5" align="center">
 		<img class="img-circle img-dialog" src="<%=cp%>/uploads/lecture/${dto.studyImg}">
 	</div>
 	<div class="col-xs-4 col-sm-7">
 		<div class="dialog-content-title" style="padding-top: 10px;">${dto.studyIntro}</div>
 		<div class="dialog-content">선생님: ${dto.nickname}</div>
 		<div class="dialog-content">위치: ${dto.studyLocation}</div>
 		<div class="dialog-content">등록마감일: ${dto.registerEnd}</div> 		
 		<div class="dialog-content">기간: ${dto.studySday} ~ ${dto.studyEday}</div>
 		<div class="dialog-content">가격: <fmt:formatNumber value="${dto.price}" pattern="#,###"/>원</div>
 	</div>
</div>
<div class="modal-footer">
   <button type="button" class="btn btn-primary" onclick="buy()">구매하기</button>
   <button type="button" class="btn btn-primary" id="shoppingBasket" data-target ="#myStudyApply">장바구니</button>
   <button type="button" class="btn btn-default" data-dismiss="modal">취소하기</button>
</div>
    