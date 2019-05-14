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

<div id="myPageMain" class="box box-primary" style="width : 1000px; height: 430px; border-top :4px dashed #95004a66 ;">
	<div class="col-xs-5">
		<div class="myPageMainPicFrame">
			<c:if test="${not empty dto.picture}">
				<img class="myPageMainPic" width="300px" height="300px" alt=""
					 src="<%=cp%>/uploads/member_profile/${dto.picture}">
			</c:if>
			<c:if test="${empty dto.picture}">
				<img class="myPageMainPic" width="300px" height="300px" alt=""
					 src="<%=cp%>/resource/studyroom/images/picture.png">
			</c:if>
		</div>
	</div>
	<div class="col-xs-7" style="padding-left:0px;">
		<h3 style="margin-top:30px; font-weight :900;">나의 기본 정보</h3>
		<div style="height:20px;"></div>
		<div style="width:100%; float:left; margin-top : 10px">
			<div class="srBagContentsTitle" style="width:83px;font-size: 13pt; background-color: #884794aa; color : #ffffff;">
				<div class="srBagInner" >아 이 디</div>
			</div> 
			<div class="srBagContentsText">
				<div class="srBagInner" style="font-size: 13pt;">&nbsp;${dto.userId}</div>
			</div>
		</div>
		<div style="width:100%; float:left; margin-top : 10px">	
			<div class="srBagContentsTitle" style="width:83px;font-size: 13pt; background-color: #884794aa; color : #ffffff;">
				<div class="srBagInner" style="font-size: 13pt;">닉 네 임</div>
			</div> 
			<div class="srBagContentsText">
				<div class="srBagInner" style="font-size: 13pt;">&nbsp;${dto.nickname}</div>
			</div>
		</div>
		<div style="width:100%; float:left; margin-top : 10px">
			<div class="srBagContentsTitle" style="font-size: 13pt; background-color: #884794aa; color : #ffffff;">
				<div class="srBagInner" style="font-size: 13pt;">전화번호</div>
			</div> 
			<div class="srBagContentsText">
				<div class="srBagInner" style="font-size: 13pt;">&nbsp;${dto.tel}</div>
			</div>
		</div>
		<div style="width:100%; float:left; margin-top : 10px">	
			<div class="srBagContentsTitle" style="font-size: 13pt; background-color: #884794aa; color : #ffffff; z-index: 1000;">
				<div class="srBagInner" style="font-size: 13pt;">자기소개</div>
			</div>
			<div class="srBagContentsText" style="border-left: 1px solid #dddddd;border-top: 1px solid #dddddd;border-right: 3px solid #dddddd;border-bottom: 3px solid #dddddd;background-color:#eeeeee22; width:80%; height: 130px; position: relative; top: -2px; border-radius: 5px; ">
				<div class="srBagInner" style="top:10%; left: 10px; padding:10px;font-size: 10pt;">안녕하세요.<br>"교육행정직" 교육스터디원을 찾습니다.<br>010-23xx-5242로 문자 한통만 넣어주세요.<br>감사합니다.</div>
			</div>
		</div>
		
		<button type="button" class="btn" onclick="mypageUpdate();" style="position:relative; top:10px; left:495px;">수정</button>
	</div>
</div>