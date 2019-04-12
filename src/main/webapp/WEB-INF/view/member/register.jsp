<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<script type="text/javascript">
$(document).ready(function(){  

	if('${mode}'=="teacher")
    	 $('#register').css('background-image', "url('<%=cp%>/resource/images/blackboard2.jpg')");  
	else  //아래에 스터디룸에 해당하는 이미지 넣으면 됨. 
		$('#register').css('background-image', "url('<%=cp%>/resource/images/studyroom.jpg')");  
	
 }); 
 
$(function(){
    $("input[type=checkbox]").click(function(){
        var chk = $(this).is(":checked");//.attr('checked');
        if(chk) $(".select_subject input").prop('checked', true);
        else  $(".select_subject input").prop('checked', false);
    });
});

function sendOk() {
    var f = document.registerForm;

	var str = f.blicenseNum.value;
    if(!str) {
        alert("사업자 번호를 입력하세요. ");
        f.blicenseNum.focus();
        return;
    }
    
    var str = f.bankNum.value;
    if(str=='') {
        alert("은행을 선택하세요 ");
        f.bank.focus();
        return;
    }   

	str = f.account.value;
    if(!str) {
        alert("계좌번호를 입력하세요. ");
        f.content.focus();
        return;
    }

	str = f.service.checked;
    if(!str) {
        alert("서비스 이용약관에 동의해주세요. ");
        f.content.focus();
        return;
    }
    
	str = f.privacy.checked;
    if(!str) {
        alert("개인정보 활용에 동의해주세요. ");
        f.content.focus();
        return;
    }

    
	f.action="<%=cp%>/register/submit";

 	f.submit();
    
}
</script> 

<section id="register" class="section">
<div id="registerBox" class="container">
<c:if test="${mode eq 'teacher'}">
	<h3>선생님 등록하기</h3>
</c:if>
<c:if test="${mode eq 'studyroom'}">
	<h3>스터디룸 주인 등록하기</h3>
</c:if>
	<hr>

	<form name="registerForm" method="post">
	<table>
		<tr><th>이름</th><td>${sessionScope.member.userName}</td></tr>
		<tr><th>전화번호</th><td>${tel}</td></tr>
	</table>
	<span>회원정보 변경은 마이페이지>회원정보에서 가능합니다.</span>
	<br>
	<hr>
	<table>
		<tr>
			<th>사업자번호</th>
			<td><input type="text" name="blicenseNum" placeholder=" 숫자만 가능합니다."></td>
		</tr>
		<tr>
			<th>매출입금은행</th>
			<td>
				<select name="bankNum"> 
					<option value="">은행 선택</option>
				<c:forEach var="bank" items="${bankList}">
					<option value="${bank.bankNum}">${bank.bankName}</option>
				</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<th>계좌번호</th>
			<td><input type="text" name="account" class="textBox" placeholder=" 숫자만 가능합니다."></td></tr>
	</table>
	<hr>

	<div class="check"><input type="checkbox" name="service" value="true"> 서비스 이용약관을 확인하였으며, 이에 동의합니다.<br></div>
	<textarea readonly="readonly"> 제1조(목적) 
이 약관은 (유)내고향시푸드(전자거래 사업자)이 운영하는 홈페이지(이하 "쇼핑몰"이라 한다)에서 제공하는 인터넷 관련 서비스(이하 "서비스"라 한다)를 이용함에 있어 (유)내고향시푸드와 이용자의 권리·의무 및 책임사항을 규정함을 목적으로 합니다. 
※ 「PC통신 등을 이용하는 전자거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다」 


제2조(정의)
① "쇼핑몰" 이란 사업자가 재화 또는 용역을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 또는 용역을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 쇼핑몰을 운영하는 사업자의 의미로도 사용합니다. 

② "이용자"란 "쇼핑몰"에 접속하여 이 약관에 따라 "쇼핑몰"이 제공하는 서비스를 받는 회원 및 비회원을 말합니다. 

③ "회원"이라 함은 "쇼핑몰"에 개인정보를 제공하여 회원등록을 한 자로서, "쇼핑몰"의 정보를 지속적으로 제공받으며, "쇼핑몰"이 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.

④ "비회원"이라 함은 회원에 가입하지 않고 "쇼핑몰"이 제공하는 서비스를 이용하는 자를 말합니다. 


제3조 (약관의 명시와 개정)
① "쇼핑몰"은 이 약관의 내용과 상호, 영업소 소재지, 대표자의 성명, 사업자등록번호, 연락처(전화, 팩스, 전자우편 주소 등) 등을 이용자가 알 수 있도록 사이트의 초기 서비스화면(전면)에 게시합니다. 

② "쇼핑몰"은 약관의 규제 등에 관한 법률, 전자거래기본법, 전자서명법, 정보통신망 이용촉진 등에 관한 법률, 방문판매 등에 관한법률, 소비자보호법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다. 

③ "쇼핑몰"이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 홈페이지의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 

④ "쇼핑몰"이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 "쇼핑몰"에 송신하여 "쇼핑몰"의 동의를 받은 경우에는 개정약관 조항이 적용됩니다. 

⑤ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 정부가 제정한 전자거래소비자보호지침 및 관계법령 또는 상관례에 따릅니다. 
</textarea>
	
	<br><br>
	
	<div class="check"><input type="checkbox" name="privacy" value="true">개인정보 수집 및 이용동의를 확인하였으며, 이에 동의합니다.<br></div>
	<textarea readonly="readonly"> 제1조(목적) 
이 약관은 (유)내고향시푸드(전자거래 사업자)이 운영하는 홈페이지(이하 "쇼핑몰"이라 한다)에서 제공하는 인터넷 관련 서비스(이하 "서비스"라 한다)를 이용함에 있어 (유)내고향시푸드와 이용자의 권리·의무 및 책임사항을 규정함을 목적으로 합니다. 
※ 「PC통신 등을 이용하는 전자거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다」 


제2조(정의)
① "쇼핑몰" 이란 사업자가 재화 또는 용역을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 또는 용역을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 쇼핑몰을 운영하는 사업자의 의미로도 사용합니다. 

② "이용자"란 "쇼핑몰"에 접속하여 이 약관에 따라 "쇼핑몰"이 제공하는 서비스를 받는 회원 및 비회원을 말합니다. 

③ "회원"이라 함은 "쇼핑몰"에 개인정보를 제공하여 회원등록을 한 자로서, "쇼핑몰"의 정보를 지속적으로 제공받으며, "쇼핑몰"이 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.

④ "비회원"이라 함은 회원에 가입하지 않고 "쇼핑몰"이 제공하는 서비스를 이용하는 자를 말합니다. 


제3조 (약관의 명시와 개정)
① "쇼핑몰"은 이 약관의 내용과 상호, 영업소 소재지, 대표자의 성명, 사업자등록번호, 연락처(전화, 팩스, 전자우편 주소 등) 등을 이용자가 알 수 있도록 사이트의 초기 서비스화면(전면)에 게시합니다. 

② "쇼핑몰"은 약관의 규제 등에 관한 법률, 전자거래기본법, 전자서명법, 정보통신망 이용촉진 등에 관한 법률, 방문판매 등에 관한법률, 소비자보호법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다. 

③ "쇼핑몰"이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 홈페이지의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 

④ "쇼핑몰"이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 "쇼핑몰"에 송신하여 "쇼핑몰"의 동의를 받은 경우에는 개정약관 조항이 적용됩니다. 

⑤ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 정부가 제정한 전자거래소비자보호지침 및 관계법령 또는 상관례에 따릅니다. 
</textarea><br>

<input type="hidden" name="mode" value="${mode}">
	<div class="buttons">
		<button type="button" class="btn btn-large" onclick="sendOk();">등록하기</button>
		<button type="reset" class="btn btn-large">다시입력</button>
		<button type="button" class="btn btn-large" onclick="location.href='<%=cp%>/main'">메인으로</button>
	</div>
	</form>
</div>
</section>