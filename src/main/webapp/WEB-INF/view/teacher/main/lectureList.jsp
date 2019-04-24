<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>


<script type="text/javascript">
$(function(){
	// 스터디 만들기
	$(document).on("click",".makeLecture", function(){
		
		var url = "<%=cp%>/teacher/lecture/makeLecture";
		
		$('#myStudyInput .modal-content').load(url, function() {
			$('#myStudyInput').modal('show');
		});
	});
});


/* $(function () {
  $('#example2').DataTable({ 
    'paging'      : false,
    'lengthChange': false,
    'searching'   : false,
    'ordering'    : true,
    'info'        : false,
    'autoWidth'   : false,
  });
}); */

$(function () {
	  $('#example2').DataTable({ 
		"pagingType": "simple_numbers",
	    'lengthChange': false,
	    'searching'   : false,
	    "columnDefs": [ 
	    	{"targets": 0, "orderable": true},
	    	{"targets": 1, "orderable": false},
	    	{"targets": 2, "orderable": true},
	    	{"targets": 3, "orderable": false},
	    	{"targets": 4, "orderable": false},
	    	{"targets": 5, "orderable": true},
	    	{"targets": 6, "orderable": true},
	    	{"targets": 7, "orderable": true},
	    	{"targets": 8, "orderable": true},
	    	{"targets": 9, "orderable": true}
	    	],
	    'info'        : true,
	    'autoWidth'   : false,
	  });
	});


</script>



<!-- Main content -->
<section class="content container-fluid">

	<div class="box box-primary" style="width: 1500px; margin: 30px auto; padding: 10px;">
		<div class="box-header with-border">
			<h3 class="box-title">
				강의 목록
			</h3>
		</div>
		<div class="box-body">
		<button type="button" class="btn makeLecture btn-default" style="float:right;">등록하기</button>	
		<table id="example2" class="table table-bordered table-hover dataTable">
                <thead>
                <tr>
                  <th>강의 이름</th>
                  <th>강의 설명</th>
                  <th>가격</th>
                  <th>분야</th>                  
                  <th>위치</th>
                  <th>참가인원</th>
                  <th>최대인원</th>
                  <th>시작일</th>
                  <th>종료일</th>
                  <th>등록마감일</th>  
                </tr>
                </thead>
                <tbody>
                <c:if test="${empty list}">
                <tr><td colspan="9" style="text-align: center;">등록된 강의가 존재하지 않습니다.</td></tr>
                </c:if>
                <c:if test="${not empty list}">
                	<c:forEach var="dto" items="${list}">
                		<tr>
                 		 <td>${dto.studyName}</td>
                 		 <td>${dto.studyIntro}</td>
                 		 <td>${dto.price}</td>
                 		 <td>
                 		 <c:if test="${not empty dto.categoryName}">
                 		 ${dto.categoryName}&nbsp;>
                 		 <c:forEach var="subject" items="${dto.courseName}">
                 		 &nbsp;${subject}
                 		 </c:forEach>
                 		 </c:if>
                 		 </td>
                 		 <td>${dto.studyLocation}</td>
                 		 <td>${dto.attendHeadCount}</td>
                 		 <td>${dto.headcount}</td>
                 		 <td>${dto.studySday}</td>
                 		 <td>${dto.studyEday}</td>
                 		 <td>${dto.registerEnd}</td>
              			</tr>
                	</c:forEach>                
                </c:if>                
                </tbody>
       	</table>
       	</div>
       				
		</div>
		
		<div class="smodal modal fade bs-example-modal-lg" id="myStudyInput" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  		<div class="modal-dialog modal-lg">
  		<div class="modal-content"></div>
  </div>
</div>

</section>

