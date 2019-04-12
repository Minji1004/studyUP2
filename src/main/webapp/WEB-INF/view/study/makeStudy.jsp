<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script>
$('.studyDate').datepicker({
	 format: "yyyy-mm-dd",
	 language: "kr"
});
</script>

<div class="modal-header">
   <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
   <h4 class="modal-title" id="myModalLabel" align="center">Make your study</h4>
</div>


<form class="form-horizontal" name="studyForm" method="post">
	<div class="form-group">
		<label class="col-sm-2 control-label">스터디<br>이름</label>
		<div class="col-sm-9">
			<input type="text" class="form-control" id="studyName" placeholder="Your study name">
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-sm-2 control-label">스터디<br>설명</label>
		<div class="col-sm-9">
			<textarea id="studyIntro" class="form-control" rows="3"></textarea>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-sm-2 control-label">최대인원</label>
		<div class="col-sm-2">
			<input type="text" class="form-control" id="headcount" placeholder="인원">
		</div>

		<label class="col-sm-2 control-label">지역</label>
		<div class="col-sm-5">
			<input type="text" class="form-control" id="studyLocation" placeholder="studyLocation">
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-sm-2 control-label">시작일</label>
		<div class="col-sm-3">
			<input class="studyDate date form-control" id="studySday" placeholder="Start Day">
		</div>
		
		<label class="col-sm-2 col-md-offset-1 control-label">종료일</label>
		<div class="col-sm-3">
			<input class="studyDate date form-control" id="studyEday" placeholder="End Day">
		</div>
	</div>
	
	
	
</form>
<div class="modal-footer">
   <button type="button" class="btn btn-primary">Make</button>
   <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
</div>