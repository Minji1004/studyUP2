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

	<div class="box box-primary" style="width: 1500px; margin: 30px auto; padding: 10px;">
		<div class="box-header with-border">
			<h3 class="box-title">
				공지사항
			</h3>
		</div>
		<div class="box-body" style="width: 1200px; margin: 0 auto;">
		<p>dataCount개(page/total_page 페이지)</p>
		     
		<table class="table" style="text-align:center;">
		  <tr> 
		      <th style="width:5%; text-align:center;">번호</th>
		      <th style="text-align:center;">제목</th>
		      <th style="width:10%; text-align:center;">작성자</th>
		      <th style="width:10%; text-align:center;">작성일</th>
		      <th style="width:5%; text-align:center;">조회수</th>
		  </tr>	 

		  <tr> 
		      <td><span style="display: inline-block; background: #ED4C00;color: #FFFFFF; padding: 1px 3px;">공지</span></td>
		      <td style="text-align:left;"><a href="#">dto.subject</a></td>
		      <td>dto.userName</td>
		      <td>dto.created</td>
		      <td>dto.hitCount</td>
		  </tr>
		 

		  <tr> 
		      <td>dto.listNum</td>
		      <td style="text-align:left;">
		           <a href="#">dto.subject</a>
		               <img src='<%=cp%>/resource/images/new.gif'>
		      </td>
		      <td>dto.userName</td>
		      <td>dto.created</td>
		      <td>dto.hitCount</td>
		  </tr>

  
		</table>
		 
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		   <tr height="35">
			<td align="center">
<%-- 			        <c:if test="${dataCount==0 }">
			                등록된 게시물이 없습니다.
			         </c:if>
			        <c:if test="${dataCount!=0 }"> --%>
			               paging
<%-- 			         </c:if> --%>
			 </td>
		   </tr>
		</table>
		
		<table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
		   <tr height="40">
		      <td align="left" width="100">
		          <button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/notice/list';">새로고침</button>
		      </td>
		      <td align="center">   
		          <form name="searchForm" action="<%=cp%>/notice/list" method="post" style="width: 390px;">		
		          	<select name="condition" class="form-control" style="width: 75px; float: left; margin-right: 10px;">
		                  <option value="all">모두</option>
		                  <option value="subject">제목</option>
		                  <option value="content">내용</option>
		                  <option value="userName">작성자</option>
		                  <option value="created">등록일</option>
		            </select>           
		      <div class="input-group" style="width: 300px;">
		           <input type="text" name="keyword" class="form-control">
	              <span class="input-group-btn">
	                <button type="button" onclick="searchList()" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
	                </button>
	              </span>
		       </div>
		        </form>
		      </td>
		      <td align="right" width="100">
		          <button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/teacher/notice/created?tnum=${tnum}&left=${left}';">글올리기</button>
		      </td>
		   </tr>
		</table>
		</div>
	</div>
</section>

