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

	<div class="row">
		<div class="col-md-5 col-md-offset-1">
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
	                    <th class="text-center" style="width: 50%;">제목</th>
	                    <th class="text-center" style="width: 20%;">작성일</th>
	                    <th class="text-center" style="width: 10%;">조회수</th>
	                  </tr>
	                  </thead>
	                  <tbody>
	                  <tr>
	                    <td class="text-center" style="width: 20%;"><a href="pages/examples/invoice.html">5</a></td>
	                    <td class="text-left" style="width: 50%;">공지사항입니다.</td>
	                    <td class="text-center" style="width: 20%;">2019-04-30</td>
	                    <td class="text-center" style="width: 10%;">20</td>
	                  </tr>
	                  
	                   <tr>
	                    <td class="text-center" style="width: 20%;"><a href="pages/examples/invoice.html">4</a></td>
	                    <td class="text-left" style="width: 50%;">공지사항입니다.</td>
	                    <td class="text-center" style="width: 20%;">2019-04-30</td>
	                    <td class="text-center" style="width: 10%;">20</td>
	                  </tr>
	                  
	                   <tr>
	                    <td class="text-center" style="width: 20%;"><a href="pages/examples/invoice.html">3</a></td>
	                    <td class="text-left" style="width: 50%;">공지사항입니다.</td>
	                    <td class="text-center" style="width: 20%;">2019-04-30</td>
	                    <td class="text-center" style="width: 10%;">20</td>
	                  </tr>
	                  
	                   <tr>
	                    <td class="text-center" style="width: 20%;"><a href="pages/examples/invoice.html">2</a></td>
	                    <td class="text-left" style="width: 50%;">공지사항입니다.</td>
	                    <td class="text-center" style="width: 20%;">2019-04-30</td>
	                    <td class="text-center" style="width: 10%;">20</td>
	                  </tr>
	                  
	                   <tr>
	                    <td class="text-center" style="width: 20%;"><a href="pages/examples/invoice.html">1</a></td>
	                    <td class="text-left" style="width: 50%;">공지사항입니다.</td>
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
              
            </div>
            <!-- /.box-footer -->
            </div>
   		 </div>
   		 
   		 <div class="col-md-5">
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
              
            </div>
            <!-- /.box-footer -->
            </div>
   		 </div>      
  </div>
</section>

