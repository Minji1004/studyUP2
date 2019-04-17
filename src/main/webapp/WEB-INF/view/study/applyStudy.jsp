<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script>

function makeStudy() {
	var f = document.studyApplyForm;
	var str = f.goal.value;
	
	if(!str) {
		f.goal.focus();
		return false;
	}
	
	str = f.hope.value;
	
	if(!str) {
		f.hope.focus();
		return false;
	}
	
	// studyNum 고치기
	f.action = "<%=cp%>/study/applyStudy?studyNum=4";
	
	f.submit();	
}


</script>

<div class="modal-header">
   <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
   <h4 class="modal-title" id="myModalLabel" align="left">Apply for ${dto.studyName}</h4>
</div>

<div class="smodal-body modal-body row">

	<form class="form-horizontal studyForm" name="studyApplyForm" method="post">
 		<div class="col-xs-3 col-sm-12">
			<div class="form-group">
				<label class="col-sm-2 control-label">목표</label>
				<div class="col-sm-9">
					<textarea name="goal" class="form-control" rows="3"></textarea>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">바라는 점</label>
				<div class="col-sm-9">
					<textarea name="hope" class="form-control" rows="5"></textarea>
				</div>
			</div>
			
 		</div>
	</form> 
</div>

<div class="modal-footer">
   <button type="button" onclick="makeStudy();" class="btn btn-primary">Submit</button>
   <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
</div>