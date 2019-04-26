<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<script type="text/javascript">
var pageNo = 1;
var condition = "all";
var keyword = "";

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
			listPage(pageNo);
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

$(function(){
	//listPage(1);
});
 
function listPage(page){
	//페이징
	pageNo = page;
	
	var id = "board-body";
	var url = "<%=cp%>/abbs/list";
	var query = "pageNo=" + page;
	if(keyword != ""){
		query += "&condition=" + condition  + "&keyword=" + encodeURIComponent(keyword);
	}
	
	ajaxHTML(url,"get",query, id);
}
function reloadBoard(){
	//새로고침
	condition = "all";
	keyword = "";
	
	listPage(1);
}
function searchList(){
	//검색
	condition = $("#condition").val();
	keyword = $("#keyword").val();
	
	listPage(1);
}
function mypageWanote(){
	var url = "<%=cp%>/mypage/wanote/main";
	if(${sessionScope.member.userId == null}){
		var url = "<%=cp%>/member/login";
		location.href = url;
	}
	$.ajax({
		type : "GET"
		,url : url
		,success : function(data){
			$("#myPageMain").html(data);
		}
		,error : function(data){
			
		}
	});
}
function mypageSchedule(){
	var url = "<%=cp%>/mypage/schedule/main";
	alert("asflkdjf");
	$.ajax({
		type : "GET"
		,url : url
		,success : function(data){
			$("#myPageMain").html(data);
		
		}
		,error : function(data){
			
		}
	});
}
function mypageBasket(){
	var url = "<%=cp%>/mypage/basket/main";
	$.ajax({
		type : "GET"
		,url : url
		,success : function(data){
			$("#myPageMain").html(data);
		}
		,error : function(data){
			
		}
	});
}
function mypageStudy(){
	var url = "<%=cp%>/mypage/reservation/study/main";
	$.ajax({
		type : "GET"
		,url : url
		,success : function(data){
			$("#myPageMain").html(data);
		}
		,error : function(data){
			
		}
	});
}
function mypageStudyroom(){
	var url = "<%=cp%>/mypage/reservation/studyroom/main";
	$.ajax({
		type : "GET"
		,url : url
		,success : function(data){
			$("#myPageMain").html(data);
		}
		,error : function(data){
			
		}
	});
}
//나의 정보 메인
function mypageMain(){
	var url = "<%=cp%>/mypage/mypage";
	if(${sessionScope.member.userId == null}){
		var url = "<%=cp%>/member/login";
		location.href = url;
	}
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
}

</script>



<div id="myPageMain"></div>