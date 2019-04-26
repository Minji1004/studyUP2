<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<script type="text/javascript">
var activeTab="allStudy";
$(function(){
	listStudy(1);
});

function ajaxText(url, query, type, selector) {
	$.ajax({
		type:type
		,url:url
		,data:query
		,success:function(data) {
			// $(selector).html("");
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

function listStudy(page) {
	var selector="#"+activeTab;
	
	var url="<%=cp%>/study/list";
	var query=$("form[name=studySearchForm]").serialize();
	query+="&pageNo="+page;

	ajaxText(url, query, "get", selector);
}

function searchList() {	
	var selector="#"+activeTab;

	var condition=$("#selectCondition").val();
	var keyword=$("#inputKeyword").val();
	
	var f=document.studySearchForm;
	f.mode.value=activeTab;
	f.condition.value=condition;
	f.keyword.value=keyword;	
	
	var url="<%=cp%>/study/list";
	var query=$("form[name=studySearchForm]").serialize();
	alert(query);
	
	ajaxText(url, query, "get", selector);
}

$(function(){
	// 탭 클릭시	
	$('#studyTab a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
		$("#"+activeTab).html("");	
		
		activeTab=$(this).attr("aria-controls");
		
		var f=document.studySearchForm;
		f.mode.value=activeTab;
		f.condition.value="all";
		f.keyword.value="";
		
		$("#"+activeTab).html("");
		listStudy(1);
	});	
});

$(function(){
	// 스터디 상세 페이지 보기
	$(document).on("click",".study-content", function(){
		var studyTitle = $(this).find(".study-title").html();
		var num=$(this).attr("data-studyNum");
		var studyNum=1;
		var url = "<%=cp%>/study/studyDetail?studyNum="+num;
		
		$('#myStudyModal .modal-content').load(url, function() {
			// $('#myStudyModal .modal-title').html(studyTitle);
			$('#myStudyModal').modal('show');
		});
	});
});

$(function() {
	// apply for study - 스터디 가입신청
	$(document).on("click", "#studyApply", function() {
		var num=$(this).attr("data-studyNum");
		var studyNum=4;
		var url = "<%=cp%>/study/applyStudy?studyNum="+num;
		
		$('#myStudyApply .modal-content').load(url, function() {
			// $('#myStudyModal .modal-title').html(studyTitle);
			$('#myStudyApply').modal('show');
		});
				
	});
});

$(function(){
	// 스터디 만들기
	$(document).on("click",".makeStudy", function(){
		
		var url = "<%=cp%>/study/makeStudy";
		
		$('#myStudyInput .modal-content').load(url, function() {
			$('#myStudyInput').modal('show');
		});
	});
});


$(function() {
	// 이미지 미리보기
	$("div").on("change", ".studyForm input[type='file']", function(e) {
		var file = e.target.files[0];
		
		if(! file.type.match("image.*")){
			return;
		}
		
		var reader = new FileReader();
		reader.onload = function(e1) {
			$(".input-img").attr("src", e1.target.result);
		}
		reader.readAsDataURL(file);
	});
});
	
</script>
<div  style="width:66%; height: 100%; margin-left:17%;">
	<div class="studyBody" style="margin: 10px;">

		  	<button type="button" class="btn makeStudy" style="background: #04B486; float: right;">make 스터디</button>
               
			<div role="tabpanel">
		
			  <!-- Nav tabs -->
			  <ul class="nav nav-tabs" role="tablist" id="studyTab">
			    <li role="presentation" class="active"><a href="#allStudy" aria-controls="allStudy" role="tab" data-toggle="tab">전체</a></li>
			    <li role="presentation"><a href="#csat" aria-controls="csat" role="tab" data-toggle="tab">수능</a></li>
			    <li role="presentation"><a href="#toeic" aria-controls="toeic" role="tab" data-toggle="tab">토익</a></li>
			    <li role="presentation"><a href="#exam9" aria-controls="exam9" role="tab" data-toggle="tab">9급 공무원</a></li>
			    <li role="presentation"><a href="#exam7" aria-controls="exam7" role="tab" data-toggle="tab">7급 공무원</a></li>
			  </ul>
			
			  <!-- Tab panes -->
			  <div class="tab-content">
			    <div role="tabpanel" class="tab-pane active" id="allStudy"></div>
			    <div role="tabpanel" class="tab-pane" id="csat"></div>
			    <div role="tabpanel" class="tab-pane" id="toeic">토익</div>
			    <div role="tabpanel" class="tab-pane" id="exam9">9급</div>
			    <div role="tabpanel" class="tab-pane" id="exam7">7급</div>
  		</div>			
	</div>
 </div>
</div>

<form name="studySearchForm" method="post">
	<input type="hidden" name="condition" value="all">
	<input type="hidden" name="keyword">
	<input type="hidden" name="mode">
</form>


