<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script type="text/javascript">
//마이페이지 수정 폼으로 
function mypageUpdate(){
	var url = "<%=cp%>/mypage/update";
	var query  = "userId=${sessionScope.member.userId}";
	$.ajax({
		type : "GET"
		,url : url
		,data : query
		,success : function(data){
			$("#myPageMain").html(data);
		}
		,error : function(data){	
		}
	});
}
//자기 프로필 사진  수정 시 바로 로드 
function LoadImg(value) 
{
	if(value.files && value.files[0]) 
	{
		var reader = new FileReader();

		reader.onload = function (e) {
			console.log(e);
			$('#LoadMyprofile').attr('src', e.target.result);
		}
	
		reader.readAsDataURL(value.files[0]);
	}
}
function updateMyprofile(){
	var f = document.mypageProfileUpdateForm;
	if(f.nickname.value == null){
		alert("닉네임을 입력해주십시오");
		return;
	}
	if(f.userPwd.value == null){
		alert("비밀번호를 입력해주십시오");
		return;
	}
	if(f.userPwdConfirm.value == null){
		alert("비밀번호 확인란을 입력해주십시오");
		return;
	}
	if(f.userPwd.value != f.userPwdConfirm.value){
		alert("비밀번호를 다시 한번 확인하십시오");
		return;
	}
	if(f.tel.value == null){
		alert("전화번호를 입력해주십시오");
		return;
	}
	
	var url = "<%=cp%>/mypage/update";
	var query = new FormData(f);
	console.log(query);
		$.ajax({
			type : "POST"
			,url : url
			,processData : false		//file 전송 시 필수!!(데이터를 쿼리 문자열로 변환 여부)
			,contentType : false		//file 전송 시 필수!!(인코딩 형식 사용 여부)
			,data : query
			,dataType : "JSON"
			,success:function(data){			
				if(data.state == "true"){
					var url = "<%=cp%>/mypage/main";
					location.href = url;
				}
			},
			beforeSend:function(jqXHR){
				jqXHR.setRequestHeader("AJAX", true);
			},
			error:function(jqXHR){
				if(jqXHR.status == 403){
					location.href = "<%=cp%>/member/login";
					return;
				}
				console.log(jqXHR.responseText);
			}
	});
}
</script>

<div id="myPageMain" class="box box-primary" style="margin-top: 50px; width: 400px; background: #E0F8E5;">
	<table
		style="margin-left:18px; margin-top:20px; border-spacing: 0px; border-collapse: collapse;">
	
		<tr height="100">
			<td colspan="2" align="left" style="padding-left: 5px;"><c:if
					test="${not empty dto.picture }">
					<img width="300px" height="300px" alt=""
						src="<%=cp%>/uploads/member_profile/${dto.picture}">
				</c:if></td>
		</tr>
	
		<tr style="height: 50">
			<td colspan="2" align="left" height="50px">아이디 : ${dto.userId }</td>
		</tr>
	
		<tr style="height: 50">
			<td colspan="2" align="left" height="50px" >닉네임 : ${dto.nickname }</td>
		</tr>
		<tr style="height: 50">
			<td colspan="2" align="left"  height="50px">전화 번호 : ${dto.tel }</td>
		</tr>
		<tr height="80">
			<td width="300" align="left">
				<button type="button" class="btn" onclick="mypageUpdate();">수정</button>
			</td>
		</tr>
	</table>
	
</div>