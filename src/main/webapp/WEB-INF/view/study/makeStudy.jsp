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

<div class="smodal-body modal-body row">

	<form class="form-horizontal studyForm" name="studyForm" method="post" enctype="multipart/form-data">
		<div class="col-xs-8 col-sm-3" align="center">
	 		<img class="img-circle img-dialog input-img" src="<%=cp%>/resource/study/images/404-error.png">
	 		<input type="file" id="studyImg">
	 	</div>
 		<div class="col-xs-4 col-sm-9">
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
 		</div>
	</form> 
</div>

<div class="modal-footer">
   <button type="submit" class="btn btn-primary">Make</button>
   <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
</div>