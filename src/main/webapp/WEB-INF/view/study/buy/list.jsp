<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
$(function(){
	var IMP = window.IMP; // 생략가능
	IMP.init('imp75300319'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
});

function buy() {
	IMP.request_pay({
	    pg : 'inicis', // version 1.1.0부터 지원.
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '주문명:공구해여',
	    amount : 100,
	    buyer_email : 'sianhan@naver.com',
	    buyer_name : '한다혜',
	    buyer_tel : '010-9088-2740',
	    buyer_addr : '서울특별시 강남구 삼성동',
	    buyer_postcode : '123-456',
	    m_redirect_url : 'http://localhost:8080/studyUp/study/buy/list?studyNum=24&left=7'
	}, function(rsp) {
	    if ( rsp.success ) {
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


<!-- Main content -->
<section class="content container-fluid">
	<div>
		<div class="box-body">
	     <blockquote>
	       <p>당신과 함께할 스터디 <span class="text-green">${dto.studyName}</span></p>
	       <small>StudyUp은 언제나 당신을 응원합니다.</small>
	     </blockquote>
	   </div>
	</div>

	<div class="row">
		<div class="col-md-4 col-md-offset-2">
			<div class="box box-success">
			    <div class="box-header with-border">
			      <h3 class="box-title">스탑워치</h3>
			
			      <div class="box-tools pull-right">
			        <button class="btn btn-box-tool" type="button" data-widget="collapse"><i class="fa fa-minus"></i></button>
			      </div>
			    </div>
	            <!-- /.box-header -->
	            <div class="box-body">
	              <div class="table-responsive">
	               	<img alt="" src="<%=cp%>/resource/study/images/clock.jpg" style="width: 100%;">
	               	<span class="pull-right">색상은 랜덤입니다. 가격 3500원</span>
              	  </div>
              <!-- /.table-responsive -->
            </div>
            <!-- /.box-body -->
            <div class="box-footer clearfix">
            	<button class="pull-right" type="button" onclick="buy();">구매하기</button>
            </div>
            <!-- /.box-footer -->
            </div>
		</div>
		
		
		<div class="col-md-4">
			<div class="box box-success">
			    <div class="box-header with-border">
			      <h3 class="box-title">노트패드</h3>
			
			      <div class="box-tools pull-right">
			        <button class="btn btn-box-tool" type="button" data-widget="collapse"><i class="fa fa-minus"></i></button>
			      </div>
			    </div>
	            <!-- /.box-header -->
	            <div class="box-body">
	              <div class="table-responsive">
	               	<img alt="" src="<%=cp%>/resource/study/images/note.jpg" style="width: 100%;">
	               	<span class="pull-right">가격 3000원</span>
              	  </div>
              <!-- /.table-responsive -->
            </div>
            <!-- /.box-body -->
            <div class="box-footer clearfix">
            	<button class="pull-right" type="button" onclick="buy();">구매하기</button>
            </div>
            <!-- /.box-footer -->
            </div>
		</div>
	</div>
</section>

