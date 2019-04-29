<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<script type="text/javascript">
$(function(){
	var msg = $("form[name=mypageProfileUpdateForm] input[name=userPwdConfirm]").closest("td").next("td").children("span");
	msg.hide();
	
	$("form[name=mypageProfileUpdateForm]").on("change", "input[name=userPwdConfirm]", function(){
		var pwd = $("input[name=userPwd]").val();
		var pwdC = $("input[name=userPwdConfirm]").val();
		
		if(pwd != pwdC){
			var msg = $(this).closest("td").next("td").children("span");
			msg.show();
			return;
		}else{
			var msg = $(this).closest("td").next("td").children("span");
			msg.hide();
			return;
		}
	})
});
</script>

<form name="mypageProfileUpdateForm" method="post" enctype="multipart/form-data">
<table>
	<tr>
		<td><img width="300px" height="300px" id = "LoadMyprofile" alt="" src="<%=cp%>/uploads/member_profile/${dto.picture}"> </td>
		<td><input type="file" name="pictureM" onchange="LoadImg(this)"></td>
	</tr>
	<tr>
		<td>아이디 : </td>
		<td>${dto.userId }</td>
	</tr>
	<tr>
		<td>이름(닉네임) : </td>
		<td><input type="text" name="nickname" value="${dto.nickname }"></td>
	</tr>
	<tr>
		<td>비밀번호 : </td>
		<td colspan="2"><input type="password" name="userPwd" value ="${dto.userPwd }"></td>
	</tr>
	
	<tr>
		<td>비밀번호 확인: </td>
		<td><input type="password" name="userPwdConfirm" value ="${dto.userPwd }" ></td>
		<td><span style="color:red">위의 비밀 번호와 다릅니다.</span></td>
	</tr>
	<tr>
		<td>전화번호 : </td>
		<td><input type="text" name="tel" value="${dto.tel }"></td>
	</tr>
	
</table>
<input type="hidden" name="userId" value="${dto.userId }">
</form>
<table style="width: 100%; margin: 0px auto 20px; border-spacing: 0px;">
			<tr height="45">
			    <td width="300" align="left">
			      <button type="button" class="btn" onclick="updateMyprofile();">수정완료</button>
			    </td>
			    <td>
			    	<button type="button" class="btn" onclick="mypageMain();">취소</button>
			    </td>
			</tr>
</table>