<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script type="text/javascript">
$(function(){
	$(document).on("change", "input[name=goalTime]", function(){
		
		var url = "<%=cp%>/timer/selectGoalTime";
		
		$.ajax({
			type : "POST"
			,url : url
			,success : function(data){
				if($("input:checkbox[name='goalTime']").is(":checked")){
					$("#goaltimeSelector").html(data);
				}else{
					$("#goaltimeSelector").empty();
				}

			}
			,error : function(e){
				console.log(e);
			}
			
		});
		
	});
	

});

function timerOn(){
	$(function(){
	
	});
} 


</script>


<div class="modal-header" style="width: 900;">
	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
 	<h4 class="modal-title" id="myModalLabel" align="center">타이머</h4>
</div>
<div class="timer-modal-body modal-body row" style="height: 200;">
 	<div class="dialog-content-location"><input type="checkbox" name="goalTime">&nbsp;<b>목표시간</b></div>
 		
 	<div id="goaltimeSelector"class="dialog-content dialog-content-location"></div>
 	
 		

		

</div>
<div class="modal-footer">
   <button type="button" class="btn btn-primary" onclick = "timerOn()">적용</button>
   <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
</div>



	
	
	
		
