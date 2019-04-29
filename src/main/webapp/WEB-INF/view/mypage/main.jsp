<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery.form.js"></script>

<script type="text/javascript">
var pageNo = 1;
var condition = "all";
var keyword = "";
$(function(){
	listPage(1);
});
 
function searchList(){
	//검색
	condition = $("#condition").val();
	keyword = $("#keyword").val();
	
	listPage(1);
}
function ajaxHTML(url, type, query, id){
	$.ajax({
		type : type,
		url : url,
		data : query,
		success:function(data){
			$("#" + id).html(data);
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

function ajaxJSON(url, type, query, mode){
	$.ajax({
		type : type
		,url : url
		,data : query
		,dataType : "JSON"
		,success:function(data){
			if(mode=="delete"){
				if(data.state == "false"){
					alert("삭제 권한이 없습니다.");
				}else{
					listPage(pageNo);	
				}
				
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

function ajaxFileJSON(url, query, mode){
	//파일 업로드를 위한 ajax() 함수 
	$.ajax({
		type : "POST"
		,url : url
		,processData : false		//file 전송 시 필수!!(데이터를 쿼리 문자열로 변환 여부)
		,contentType : false		//file 전송 시 필수!!(인코딩 형식 사용 여부)
		,data : query
		,dataType : "JSON"
		,success:function(data){
			alert(mode);
			// listPage(1);
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
function ajaxMypageMain(mode){
	var uid="${sessionScope.member.userId}";
	var url = "";
	if(!uid){
		var url = "<%=cp%>/member/login";
		location.href = url;
	}
	
	if(mode == "mypage"){
		url = "<%=cp%>/mypage/mypage";
		alert(url);
	}else{
		url = "<%=cp%>/mypage/" + mode + "/main";
	}
	
	$.ajax({
		type : "GET"
		,url : url
		,success : function(data){
			$("#myPageMain").html(data);
		}
		,beforeSend:function(jqXHR){
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
//---------------------------------------------------------

//마이페이지 > 내 정보
function mypageMain(){ajaxMypageMain("mypage");}
//마이페이지 > 오답노트 > 리스트
function mypageWanote(){ajaxMypageMain("wanote");}
//마이페이지 > 일정 > 리스트	
function mypageSchedule(){ajaxMypageMain("schedule");}
//마이페이지 > 장바구니 > 리스트
function mypageBasket(){ajaxMypageMain("basket");}
//마이페이지 > 예약 > 스터디 > 리스트	
function mypageStudy(){ajaxMypageMain("reservation/study");}
//마이페이지 > 예약 > 스터디룸 > 리스트	
function mypageStudyroom(){ajaxMypageMain("/reservation/studyroom");}	
	


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
	ajaxFileJSON(url, query, "aaaa");
	
	/*
		$.ajax({
			type : "POST"
			,url : url
			,processData : false		//file 전송 시 필수!!(데이터를 쿼리 문자열로 변환 여부)
			,contentType : false		//file 전송 시 필수!!(인코딩 형식 사용 여부)
			,data : query
			,dataType : "JSON"
			,success:function(data){			
				if(data.state == "true"){
					mypageMain();
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
   */	
}

//-------------------------------------
function sendwanote(mode){
	var f = document.wanoteCreateForm;
	
	if(!f.subject.value){
		alert("제목을 입력하세요.");
		return;
	}
	if(!f.content.value){
		alert("내용을 입력하세요");
		return;
	}
	var url = "<%=cp%>/mypage/wanote/create";
	var query = new FormData(f);
	
	$.ajax({
		type : "POST"
		,url : url
		,processData : false		
		,contentType : false		
		,data : query
		,dataType : "JSON"
		,success:function(data){			
			//create 성공 후 
			//오류 리스트로 가야한다.
			//오류 리스트로 
			mypageWanote();
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
function reloadWanote(){
	//새로고침
	condition = "all";
	keyword = "";
	
	listPage(1);
}
//오답노트 올리기 폼
function insertWanote(){
	var url = "<%=cp%>/mypage/wanote/create";
	$.ajax({
		type : "GET"
		,url : url
		,success : function(data){
		
			$("#myPageMain").html(data);
		}
		,error : function(e){
			console.log(e);
		}
	});
}
</script>



<div id="myPageMain"></div>