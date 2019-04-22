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


$(function () {
  $('#example2').DataTable({
    'paging'      : false,
    'lengthChange': false,
    'searching'   : false,
    'ordering'    : true,
    'info'        : false,
    'autoWidth'   : false
  })
})
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
		<button type="button" class="btn makeLecture" style="float:right;">등록하기</button>	
		<table id="example2" class="table table-bordered table-hover dataTable">
                <thead>
                <tr>
                  <th>강의 이름</th>
                  <th>강의 설명</th>
                  <th class="sorting">가격</th>
                  <th>분야</th>                  
                  <th>위치</th>
                  <th>인원</th>
                  <th class="sorting">시작일</th>
                  <th class="sorting">종료일</th>
                  <th class="sorting">등록마감일</th>  
                </tr>
                </thead>
                <tbody>
                <tr>
                  <td>토익스피킹</td>
                  <td>토익스피킹 레벨7을 향하여!</td>
                  <td>100,000</td>
                  <td>토익스피킹</td>
                  <td>홍대입구역</td>
                  <td>5/20</td>
                  <td>2019-04-26</td>
                  <td>2019-04-26</td>
                  <td>2019-04-22</td>
                </tr>
                <tr>
                  <td>토익</td>
                  <td>토익스피킹 레벨7을 향하여!</td>
                  <td>5,000</td>
                  <td>토익스피킹</td>
                  <td>홍대입구역</td>
                  <td>5/20</td>
                  <td>2019-04-26</td>
                  <td>2019-04-26</td>
                  <td>2019-04-22</td>
                </tr>
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

