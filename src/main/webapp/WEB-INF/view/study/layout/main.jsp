<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>


<script type="text/javascript">

</script>



<!-- Main content -->
<section class="content container-fluid">
	<div>
		<div class="box-body">
	     <blockquote>
	       <p>당신과 함께할 스터디 <span class="text-green">수능 1등급</span></p>
	       <small>StudyUp은 언제나 당신을 응원합니다.</small>
	     </blockquote>
	   </div>
	</div>

	<div class="row">
		<div class="col-md-4 col-md-offset-1">
			<div class="box box-danger">
			    <div class="box-header with-border">
			      <h3 class="box-title">공지사항</h3>
			
			      <div class="box-tools pull-right">
			        <button class="btn btn-box-tool" type="button" data-widget="collapse"><i class="fa fa-minus"></i></button>
			      </div>
			    </div>
	            <!-- /.box-header -->
	            <div class="box-body">
	              <div class="table-responsive">
	                <table class="table no-margin">
	                  <thead>
	                  <tr>
	                    <th class="text-center" style="width: 20%;">번호</th>
	                    <th class="text-center" style="width: 45%;">제목</th>
	                    <th class="text-center" style="width: 20%;">작성일</th>
	                    <th class="text-center" style="width: 15%;">조회수</th>
	                  </tr>
	                  </thead>
	                  <tbody>
	                  <tr>
	                    <td class="text-center" style="width: 20%;"><a href="pages/examples/invoice.html">5</a></td>
	                    <td class="text-left" style="width: 45%;">공지사항입니다.</td>
	                    <td class="text-center" style="width: 20%;">2019-04-30</td>
	                    <td class="text-center" style="width: 15%;">20</td>
	                  </tr>
	                  
	                   <tr>
	                    <td class="text-center" style="width: 20%;"><a href="pages/examples/invoice.html">4</a></td>
	                    <td class="text-left" style="width: 45%;">공지사항입니다.</td>
	                    <td class="text-center" style="width: 20%;">2019-04-30</td>
	                    <td class="text-center" style="width: 15%;">20</td>
	                  </tr>
	                  
	                   <tr>
	                    <td class="text-center" style="width: 20%;"><a href="pages/examples/invoice.html">3</a></td>
	                    <td class="text-left" style="width: 45%;">공지사항입니다.</td>
	                    <td class="text-center" style="width: 20%;">2019-04-30</td>
	                    <td class="text-center" style="width: 15%;">20</td>
	                  </tr>
	                  
	                   <tr>
	                    <td class="text-center" style="width: 20%;"><a href="pages/examples/invoice.html">2</a></td>
	                    <td class="text-left" style="width: 45%;">공지사항입니다.</td>
	                    <td class="text-center" style="width: 20%;">2019-04-30</td>
	                    <td class="text-center" style="width: 15%;">20</td>
	                  </tr>
	                  
	                   <tr>
	                    <td class="text-center" style="width: 20%;"><a href="pages/examples/invoice.html">1</a></td>
	                    <td class="text-left" style="width: 45%;">공지사항입니다.</td>
	                    <td class="text-center" style="width: 20%;">2019-04-30</td>
	                    <td class="text-center" style="width: 15%;">20</td>
	                  </tr>	                
                  </tbody>
                </table>
              </div>
              <!-- /.table-responsive -->
            </div>
            <!-- /.box-body -->
            <div class="box-footer clearfix">
              <span class="pull-right"><a href="<%=cp%>/study/notice/list?studyNum=${studyNum}&left=1">더보기...</a></span>
            </div>
            <!-- /.box-footer -->
            </div>
   		 </div>
   		 
   		 <div class="col-md-6">
			<div class="box box-success">
			    <div class="box-header with-border">
			      <h3 class="box-title">자유게시판</h3>
			
			      <div class="box-tools pull-right">
			        <button class="btn btn-box-tool" type="button" data-widget="collapse"><i class="fa fa-minus"></i></button>
			      </div>
			    </div>
	            <!-- /.box-header -->
	            <div class="box-body">
	              <div class="table-responsive">
	                <table class="table no-margin">
	                  <thead>
	                  <tr>
	                    <th class="text-center" style="width: 10%;">번호</th>
	                    <th class="text-center" style="width: 40%;">제목</th>
	                    <th class="text-center" style="width: 20%;">작성자</th>
	                    <th class="text-center" style="width: 20%;">작성일</th>
	                    <th class="text-center" style="width: 10%;">조회수</th>
	                  </tr>
	                  </thead>
	                  <tbody>
	                  <tr>
	                    <td class="text-center" style="width: 10%;"><a href="pages/examples/invoice.html">5</a></td>
	                    <td class="text-left" style="width: 40%;">질문있습니다.</td>
	                    <th class="text-center" style="width: 20%;">한다혜</th>
	                    <td class="text-center" style="width: 20%;">2019-04-30</td>
	                    <td class="text-center" style="width: 10%;">20</td>
	                  </tr>
	                  
	                  <tr>
	                    <td class="text-center" style="width: 10%;"><a href="pages/examples/invoice.html">4</a></td>
	                    <td class="text-left" style="width: 40%;">질문있습니다.</td>
	                    <th class="text-center" style="width: 20%;">한다혜</th>
	                    <td class="text-center" style="width: 20%;">2019-04-30</td>
	                    <td class="text-center" style="width: 10%;">20</td>
	                  </tr>
	                  
	                  <tr>
	                    <td class="text-center" style="width: 10%;"><a href="pages/examples/invoice.html">3</a></td>
	                    <td class="text-left" style="width: 40%;">질문있습니다.</td>
	                    <th class="text-center" style="width: 20%;">한다혜</th>
	                    <td class="text-center" style="width: 20%;">2019-04-30</td>
	                    <td class="text-center" style="width: 10%;">20</td>
	                  </tr>
	                  
	                  <tr>
	                    <td class="text-center" style="width: 10%;"><a href="pages/examples/invoice.html">2</a></td>
	                    <td class="text-left" style="width: 40%;">질문있습니다.</td>
	                    <th class="text-center" style="width: 20%;">한다혜</th>
	                    <td class="text-center" style="width: 20%;">2019-04-30</td>
	                    <td class="text-center" style="width: 10%;">20</td>
	                  </tr>
	                  
	                  <tr>
	                    <td class="text-center" style="width: 10%;"><a href="pages/examples/invoice.html">1</a></td>
	                    <td class="text-left" style="width: 40%;">질문있습니다.</td>
	                    <th class="text-center" style="width: 20%;">한다혜</th>
	                    <td class="text-center" style="width: 20%;">2019-04-30</td>
	                    <td class="text-center" style="width: 10%;">20</td>
	                  </tr>
	                  
	                
                  </tbody>
                </table>
              </div>
              <!-- /.table-responsive -->
            </div>
            <!-- /.box-body -->
            <div class="box-footer clearfix">              
            	<span class="pull-right">더보기...</span>
            </div>
            <!-- /.box-footer -->
            </div>
   		 </div>  
  </div>
</section>

	