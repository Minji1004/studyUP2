<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<link rel="stylesheet" href="<%=cp%>/resource/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=cp%>/resource/css/font-awesome.css" />
<link rel="stylesheet" href="<%=cp%>/resource/css/ionicons.css" />
<link rel="stylesheet" href="<%=cp%>/resource/css/AdminLTE.css" />
<link rel="stylesheet" href="<%=cp%>/resource/css/blue.css" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
<link href="<%=cp %>/resource/jquery/css/jquery-ui.min.css" rel= "stylesheet" type="text/css">
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/js/util.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-ui.min.js"></script>


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
.banner {
    background-image: url('<%=cp%>/resource/images/banner.jpg');
    background-position: center top;
    background-repeat: no-repeat;
    background-size: cover;
    min-height: 1000px;
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
		alert($password + ":" + $passwordConfirm);
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
					sendMail();
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
<body class="hold-transition register-page banner" style="background-image: url('<%=cp%>/resource/images/banner.jpg')">
<div class="register-box">
  <div class="register-logo">
    <a><b>회원 가입</b></a>
  </div>

  <div class="register-box-body">
    <p class="login-box-msg">회원을 등록합니다.</p>

    <form name="memberForm" method="post" enctype="multipart/form-data">
      <div class="form-group has-feedback">
      	<input type="text" name="userId" class="form-control" readonly="readonly" placeholder="이메일">
      	
      </div>
      
      <div class="form-group has-feedback">
        <input type="password" name="userPwd" class="form-control" placeholder="비밀번호">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="text" name="nickname" class="form-control" placeholder="닉네임">
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
      </div>
       <div class="form-group has-feedback">
        <input type="text" name="tel" class="form-control" placeholder="전화번호">
        <span class="glyphicon glyphicon-phone form-control-feedback"></span>
      </div>
      
      
      <div class="form-group has-feedback">
      	프로필 사진
        <input type="file" name="pictureM" class="form-control" placeholder="프로필 사진">
      </div>
     
      

      <div class="row">
        <div id="passwordConfirmText" class="col-xs-12" style="height:20px;">
        </div>
        <div class="col-xs-4">
          <button type="button" class="btn btn-primary btn-block btn-flat" style ="float:left; background: #2C2323; border:2px solid #2C2323;font-weight: 200px" onclick="certifyEmail()">메일인증</button>
        </div>
        <div class="col-xs-4">
          <button type="button" class="btn btn-primary btn-block btn-flat" style ="float:left;" onclick="registerMember()">등록</button>
        </div>
        <div class="col-xs-4">
          <button type="button" class="btn btn-primary btn-block btn-flat" style ="float:left; background: #D25252; border:2px solid #D25252" onclick = "location.href = '<%=cp%>/main'">취소</button>
        </div>
      </div>
  	</form>
  </div>
</div>



<!-- Bootstrap 3.3.7 -->
<script src="<%=cp%>/resource/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="<%=cp%>/resource/js/icheck.min.js"></script>
<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' /* optional */
    });
  });
</script>

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
				<td width="150"><button class="certifyBtn" type="button">이메일 인증</button></td>
				<td id = "checkUserId" width="350"></td>
			</tr>
			<tr>		
			</tr>
 		</table>
 		<input type="hidden" name="temp">
 	</div>
</form>
</div>


</body>


