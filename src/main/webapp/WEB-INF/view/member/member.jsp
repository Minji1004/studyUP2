<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/js/util.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-ui.min.js"></script>
<link href="<%=cp %>/resource/jquery/css/jquery-ui.min.css" rel= "stylesheet" type="text/css">

<style type="text/css">
.certifyBtn{
	border-radius: 3px;
}
.inputEmail{
	border-radius: 3px;
}
.ui-dialog .ui-dialog-titlebar-close { 
	display: none; 
	position: absolute; 
	right: .3em; 
	top: 50%; 
	width: 19px; 
	margin: -10px 0 0 0; 
	padding: 1px; 
	height: 18px; 
}


</style>

<script type="text/javascript">
function registerMember(){
	var f = document.memberForm;
	
	var str = f.userId;
	if(!str.value){
		alert("이메일 채워 주세요");
		str.focus();
		return;
	}
	if(!isValidEmail(str.value)){
		alert("이메일 형식이 올바르지 않습니다");
		str.focus();
		return;
	}
	str = f.userPwd;
	if(!str.value){
		alert("비밀번호 채워 주세요");
		str.focus();
		return;
	}
	str = f.userPwdConfirm;
	if(!str.value){
		alert("비밀번호확인 채워 주세요");
		str.focus();
		return;
	}
	str = f.nickname;
	if(!str.value){
		alert("닉네임 채워 주세요");
		str.focus();
		return;
	}
	str = f.tel;
	if(!str.value){
		alert("전화번호 채워 주세요");
		str.focus();
		return;
	}

	f.action = "<%=cp%>/member/member";
	f.submit();
	
}


function certifyEmail(){
		$("#certifyEmailDialog").dialog({
			width : 900
			,modal : false
			,buttons :{
				Cancel : function(){
					$(this).dialog("close");
					$("input[name=userEmail]").val("");
					$("input[name=confirmEmailNum]").val("");
					
				}
			}
		});
}


$(function(){

	$("#certifyEmailDialog").hide();
	

	$("body").on("change", "#userPwdConfirm" , function(){
		var $password = $("input[name=userPwd]").val();
		var $passwordConfirm = $("input[name=userPwdConfirm]").val();
		
		if($password != $passwordConfirm){
			$("input[name=userPwdConfirm]").focus();
			$("#passwordConfirmText").html("<mark style='color: red;'>위의 비밀번호와 일치하지 않습니다.</mark>");
			
		}else{
			$("#passwordConfirmText").html("");
		}
		
	});
	
	$("body").on("change", ".inputEmail" , function(){
		var url = "<%=cp%>/member/userIdCheck";
		var userId =$(this).val();
		
		$.ajax({
			type : "POST",
			url : url,
			data : {userId : userId},
			dataType : "JSON",
			success:function(data){
				console.log(data.state);
				if(data.state=="false"){
					$("#checkUserId").html("<mark style='color:red;'>중복되는 아이디가 존재합니다.</mark>");
				}else {
					$("#checkUserId").html("<mark style='color:blue;'>사용 가능한 아이디 입니다.</mark>");
				}
			},
			beforeSend:function(jqXHR){
				jqXHR.setRequestHeader("AJAX", true);
			},
			error:function(jqXHR){
				console.log(jqXHR.responseText);
			}
		});
		
	});
	
});
</script>

<div style="width : 900px ; margin:30px auto 0; border: 1px solid black; border-radius: 3px">
<form name="memberForm" method="post" enctype="multipart/form-data">
	<div>
	<table style="width: 900px; height: 500px;">
		<tbody><tr>
			<td style="width: 150; padding-left: 30">이메일 :</td>
			<td><input  type="text" name="userId" readonly="readonly" style="width: 300"> </td>
			<td><button type="button" onclick="certifyEmail()">인증</button></td>
		</tr>
		<tr>
			<td style="width: 150; padding-left: 30">비밀번호 :</td>
			<td><input type="password" name="userPwd" style="width: 300"></td>
		</tr>
		<tr>
			<td style="width: 150; padding-left: 10">비밀번호확인 :</td>
			<td><input id = "userPwdConfirm" type="password" name="userPwdConfirm" style="width: 300"></td>
			<td id="passwordConfirmText" style="width: 300; padding-left: 10"></td>
		</tr>
		<tr>
			<td style="width: 150; padding-left: 30">닉네임 :</td>
			<td><input type="text" name="nickname" style="width: 300"></td>
		</tr>
		<tr>
			<td style="width: 150; padding-left: 30">전화번호 :</td>
			<td><input type="text" name="tel" style="width: 300"></td>
		</tr>
		<tr>
			<td style="width: 100; padding-left: 30">프로필 사진 :</td>
			<td><input type="file" name="pictureM" style="width: 300; border: 1px solid #eee; border-radius: 3px"></td>
		</tr>
		
	
		
		</tbody>

	</table>
	
	<table style="width: 900px;">
		<tr style="width: 100%" align="center">
			<td colspan="2">
				<button type="button" onclick="registerMember()">등록하기</button>
				<button type="button" onclick = "location.href = '<%=cp%>/main'">등록취소</button>
			</td>
		</tr>
	</table>
	</div>

	
		

	
	
	
</form>
</div>

<!-- ------------------------------------------------- -->

<script type="text/javascript">

    function sendMail() {
        var f = document.emailCertifyForm;
        var str = f.userEmail;

      	if(!str.value){
      		str.focus();
      		alert("이메일 입력해주세요");
      		return;
      	}
      	if(!isValidEmail(str.value)){
      		str.focus();
      		alert("이메일 형식이 올바르지 않습니다.");
      		return;
      	}

      	
      	var url = "<%=cp%>/mail/send";
      	var query  = "userEmail=" + str.value;
      	
      	$.ajax({
			type : "POST",
			url : url,
			data : query,
			dataType : "JSON",
			success:function(data){
				
				//state, message, confirmKey
				if(data.state == "true"){
					alert(data.message);
				 	var $tr = $(".certifyBtn").closest("tr").next();
				 	var confirmKey = data.confirmKey;
				 	console.log(confirmKey);
				 	var str = "<td width='100'>인증번호 :</td>";
				 	str += "<td width='300'><input style='width:298;' type='text' name='confirmEmailNum'></td>";
				 	str += "<td width='150'><button type='button' onclick = 'confirmEmailNumF(\""+ confirmKey +"\");'>인증번호인증</button></td>";
			      	$tr.html(str);
				}else if(data.state == "false"){
					alert(data.message);
				}
			},
			beforeSend:function(jqXHR){
				jqXHR.setRequestHeader("AJAX", true);
			},
			error:function(jqXHR){
				console.log(jqXHR.responseText);
			}
		});
      	
     	
    }
    
 	// 이메일 형식 검사
    function isValidEmail(data){
        var format = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
        return format.test(data); // true : 올바른 포맷 형식
    }
 	


    
    function confirmEmailNumF(confirmKey){
 		var $confirmKey = $("input[name=confirmEmailNum]").val();
 		var $userEmail = $("input[name=userEmail]").val();
 		var f = document.memberForm;
 		if(confirmKey == $confirmKey){
 			alert("일치합니다.");
 			f.userId.value = $userEmail;
 			
 		}else{
 			alert("불일치합니다.");
 		}
 			
		$("#certifyEmailDialog").dialog("close");			
		$("input[name=userEmail]").val("");
		$("input[name=confirmEmailNum]").val("");
 	}
   		
   		
   		
   		
   		
   		
  
  
    
    

</script>

<div id="certifyEmailDialog" title="이메일 인증">
<form name="emailCertifyForm" method="post">	
 	<div style="margin: 30px auto 0; width: 900; height: 100;">
 		<table>
			<tr>
				<td width="100">이메일 :</td>
				<td width="300"><input class="inputEmail" style="width: 298;" type="text" name="userEmail"></td>
				<td width="150"><button class="certifyBtn" type="button" onclick="sendMail()">이메일 인증</button></td>
				<td id = "checkUserId" width="350"></td>
			</tr>
			<tr>		
			</tr>
 		</table>
 		<input type="hidden" name="temp">
 	</div>
</form>
</div>

