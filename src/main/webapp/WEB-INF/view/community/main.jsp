<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<style>
.nav-tabs a {
  color: #337ab7;	
}
</style>

<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery.form.js"></script>

<script type="text/javascript">
// ajax-Text 처리 함수
function ajaxText(url, query, type, selector) {
	$.ajax({
		type:type
		,url:url
		,data:query
		,success:function(data) {
			$(selector).html(data);	
		}
		,beforeSend : function(jqXHR) {
	        jqXHR.setRequestHeader("AJAX", true);
	    }
	    ,error:function(jqXHR) {
	    	if(jqXHR.status==403) {
	    		location.href="<%=cp%>/member/login";
	    		return;
	    	}
	    	console.log(jqXHR.responseText);
	    }
	});
}

//탭을 선택 한 경우
$(function(){
	$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
		// var active=$(this).attr("aria-controls");
		reloadBoard();
	});
});

$(function(){
	listPage(1);
});

// 글리스트 및 페이징 처리
function listPage(page) {
	var active=$("#boardTab").children(".active").children().attr("aria-controls");
	var selector=$("#boardTab").children(".active").children().attr("href");
	
	var url="<%=cp%>/community/"+active+"/list";
	var query="pageNo="+page;
	var search=$('form[name=customerSearchForm]').serialize();
	query=query+"&"+search;
	
	var selector=$("#boardTab").children(".active").children().attr("href");
	ajaxText(url, query, "get", selector);
}

// 검색
function searchList() {
	var f=document.customerSearchForm;
	f.condition.value=$("#condition").val();
	f.keyword.value=$.trim($("#keyword").val());

	listPage(1);
}

// 새로고침
function reloadBoard() {
	var f=document.customerSearchForm;
	f.condition.value="all";
	f.keyword.value="";
	
	listPage(1);
}

// 글쓰기폼
function insertForm() {
	var active=$("#boardTab").children(".active").children().attr("aria-controls");
	var selector=$("#boardTab").children(".active").children().attr("href");
	var url="<%=cp%>/community/"+active+"/created";
alert(url);

	var query="tmp="+new Date().getTime();
	ajaxText(url, query, "get", selector)
}

//글등록, 수정등록
function sendOk(mode, page) {
	var active=$("#boardTab").children(".active").children().attr("aria-controls");
	var url="<%=cp%>/community/"+active+"/" + mode;	
}

//글쓰기 취소, 수정 취소, 답변 취소
function sendCancel(page) {
	if(page==undefined || page=="")
		page="1";
	
	listPage(page);
}

//게시글 보기
function articleBoard(num, page) {
	var active=$("#boardTab").children(".active").children().attr("aria-controls");
	var selector=$("#boardTab").children(".active").children().attr("href");
	var url="<%=cp%>/community/"+active+"/article";

}
//글 수정폼
function updateForm(num, page) {
	var active=$("#boardTab").children(".active").children().attr("aria-controls");
	var selector=$("#boardTab").children(".active").children().attr("href");
	var url="<%=cp%>/community/"+active+"/update";

}
</script>

<section class="features section">
    <div class="body-title" style="margin-bottom: 20px;">
          <h3><span class="glyphicon glyphicon-envelope"></span> 커뮤니티 </h3>
    </div>

    <div>
	    <div role="tabpanel">
			  <ul id="boardTab" class="nav nav-tabs" role="tablist">
			      <li role="presentation" class="active"><a href="#tabFreeBoard" aria-controls="freeBoard" role="tab" data-toggle="tab">자유 게시판</a></li>
		          <li role="presentation"><a href="#tabQuestion" aria-controls="questionBoard" role="tab" data-toggle="tab">질문과 답변</a></li>
		          <li role="presentation"><a href="#tabWorry" aria-controls="worryBoard" role="tab" data-toggle="tab">고민 게시판</a></li>
			  </ul>
			
			  <div class="tab-content" style="padding: 5px; margin-top: 15px;">
			      <div role="tabpanel" class="tab-pane active" id="tabFreeBoard"></div>
			      <div role="tabpanel" class="tab-pane" id="tabQuestion"></div>
			      <div role="tabpanel" class="tab-pane" id="tabWorry"></div>
			  </div>
	    </div>
    </div>
    
	<form name="customerSearchForm" action="" method="post">
	    <input type="hidden" name="condition" value="all">
	    <input type="hidden" name="keyword" value="">
	</form>
	
</section>
