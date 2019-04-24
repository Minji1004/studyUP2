<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script>
$('.studyDate').datepicker({
    changeMonth: true,
    changeYear: true,
	 format: "yyyy-mm-dd",
	 language: "kr"
});

$('input[name=registerEnd]').datepicker("option", "minDate", new Date());
$('input[name=registerEnd]').datepicker("option", "onClose", function (selectedDate){
	$("input[name=studySday]").datepicker( "option", "minDate", selectedDate); 	
});

$('input[name=studySday]').datepicker("option", "maxDate", $("input[name=studyEday]").val());
$('input[name=studySday]').datepicker("option", "onClose", function (selectedDate){
	$("input[name=studyEday]").datepicker( "option", "minDate", selectedDate ); 
});

$('input[name=studyEday]').datepicker("option", "minDate", $("input[name=studySday]").val());
$('input[name=studyEday]').datepicker("option", "onClose", function (selectedDate){
    $("input[name=studySday]").datepicker( "option", "maxDate", selectedDate );
   });

function readURL(input) {

	  if (input.files && input.files[0]) {
	    var reader = new FileReader();

	    reader.onload = function(e) {
	      $('.input-img').attr('src', e.target.result);
	    }

	    reader.readAsDataURL(input.files[0]);
	  }
	}

$(".studyImg").change(function() {
	  readURL(this);
	});


function makeLecture() {
	var f = document.studyForm;
	var str = f.studyName.value;
	
	if(!str) {
		f.studyName.focus();
		return false;
	}
	
	str = f.studyIntro.value;
	
	if(!str) {
		f.studyIntro.focus();
		return false;
	}
	
	
	str = f.headcount.value;
	var format = /^[0-9]+$/g;
	
    if(! format.test(str)) {
        f.headcount.focus();
        return;
    }
	
	if(!str) {
		f.headcount.focus();
		return false;
	}
	
	str = f.studyLocation.value;
	
	if(!str) {
		f.studyLocation.focus();
		return false;
	}
	
	str = f.price.value;
	var format = /^[0-9]+$/g;
	
    if(! format.test(str)) {
        f.price.focus();
        return;
    }
	
	if(!str) {
		f.price.focus();
		return false;
	}	
	
	// 데이트피커
	str = f.registerEnd.value;
	
	if(!str) {
		f.registerEnd.focus();
		return false;
	}	
	
	str = f.studySday.value;
	
	if(!str) {
		f.studySday.focus();
		return false;
	}
	
	str = f.studyEday.value;
	
	if(!str) {
		f.studyEday.focus();
		return false;
	}
		
	f.action = "<%=cp%>/teacher/lecture/makeLecture";
	
	f.submit();	
}


function categoryList(){
	// 분류 선택하면 아래에 체크박스가 나와서 과목을 선택할 수 있게
	// categoryNum, courseNum
	var categoryNum = $("#category").val();
	
	var url = "<%=cp%>/study/course"
	$.ajax({
		url:url, 
		type:"get", 
		data:{categoryNum:categoryNum},
		dataType:"json",
		success: function(data) {
			// 기존내용 모두 지우기
			$("#courseList").empty();
			
			$("#courseList").append("<label class='col-sm-2 control-label'>과목</label>");
			
			for(var i=0; i<data.listCourse.length; i++){
				var courseNum = data.listCourse[i].courseNum;
				var courseName = data.listCourse[i].courseName;
				
				if(i/6==1 && i>0)
					$("#courseList").append("<div class='col-sm-2'>&nbsp;</div>")
					
			
				$("#courseList").append("<div class='col-sm-3'><input type='checkbox' name='courseNums' value="+courseNum+">"+courseName+"</div>");
			}			
		}, 
		error:function(jqXHR){
			console.log(jqXHR.responseText);
		}
		
	});		
}

</script>

<div class="modal-header">
   <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
   <h4 class="modal-title" id="myModalLabel" align="center">강의 등록</h4>
</div>

<div class="smodal-body modal-body row">

	<form class="form-horizontal" name="studyForm" method="post" enctype="multipart/form-data">
		<div class="col-xs-8 col-sm-3" align="center" style="margin-top: 40px;">
	 		<img class="img-circle img-dialog input-img" src="<%=cp%>/resource/study/images/404-error.png">
	 		<input type="file" name="upload" class="studyImg">
	 	</div>
 		<div class="col-xs-4 col-sm-9">
			<div class="form-group">
				<label class="col-sm-2 control-label">강의 이름</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" name="studyName">
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label">강의 설명</label>
				<div class="col-sm-9">
					<textarea name="studyIntro" class="form-control" rows="3"></textarea>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label">최대인원</label>
				<div class="col-sm-2">
					<input type="text" class="form-control" name="headcount">
				</div>
		
				<label class="col-sm-2 control-label">지역</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="studyLocation">
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label">가격</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="price">
				</div>
		
				<label class="col-sm-2 col-md-offset-1 control-label">등록마감일</label>
				<div class="col-sm-3">
					<input class="studyDate date form-control" name="registerEnd">
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label">시작일</label>
				<div class="col-sm-3">
					<input class="studyDate date form-control" name="studySday">
				</div>
				
				<label class="col-sm-2 col-md-offset-1 control-label">종료일</label>
				<div class="col-sm-3">
					<input class="studyDate date form-control" name="studyEday">
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label">분류</label>
				<div class="col-sm-5">
					<select id="category" onchange="categoryList();" class="selectField">
	                   <option value="">분류선택</option>
	                   <c:forEach var="dto" items="${categorylist}">
	                       <option value="${dto.categoryNum}" data-categoryNum="${dto.categoryNum}">${dto.categoryName}</option>
	                   </c:forEach>
	              	</select>				
				</div>
			</div>	
			
			<div class="form-group" id="courseList">				
				
			</div>			
			
 		</div>
	</form> 
</div>

<div class="modal-footer">
   <button type="button" onclick="makeLecture();" class="btn btn-primary">등록완료</button>
   <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
</div>