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

	<div class="box box-primary" style="width: 80%; margin: 30px auto; padding: 10px;">
		<div class="box-header with-border">
			<h3 class="box-title">
				공지사항
			</h3>
		</div>
		<div class="box-body" style="width: 80%; margin: 0 auto;">
		<p>${dataCount}개(${page}/${total_page} 페이지)</p>
		     
		<table class="table" style="text-align:center;">
		  <tr> 
		      <th style="width:5%; text-align:center;">번호</th>
		      <th style="text-align:center;">제목</th>
		      <th style="width:10%; text-align:center;">첨부파일</th>
		      <th style="width:20%; text-align:center;">작성일</th>
		      <th style="width:8%; text-align:center;">조회수</th>
		  </tr>	 
		  
		  <c:forEach var="dto" items="${noticeList}">
			  <tr> 
			      <td><span style="display: inline-block; background: #ED4C00;color: #FFFFFF; padding: 1px 3px;">공지</span></td>
			      <td style="text-align:left;"><a href="${articleUrl}&sNoticeNum=${dto.sNoticeNum}">${dto.nSubject}</a></td>			 
			      <td>
			      <c:if test="${dto.snFileNum != 0}">
			      	<a href="<%=cp%>/study/notice/downloadZip?sNoticeNum=${dto.sNoticeNum}" style="color:#444;font-size: 15px;"><i class="fa fa-save"></i></a>
			      </c:if>
			      </td>
			      <td>${dto.created}</td>
			      <td>${dto.hitCount}</td>
			  </tr>
		 </c:forEach>
		<c:forEach var="dto" items="${list}">
			  <tr> 
			      <td>${dto.listNum}</td>
			      <td style="text-align:left;">
			           <a href="${articleUrl}&sNoticeNum=${dto.sNoticeNum}">${dto.nSubject}</a>
			           <c:if test="${dto.gap < 1}">
			               <img src='<%=cp%>/resource/images/new.gif'>
			           </c:if>
			      </td>
			      <td>
			      <c:if test="${dto.snFileNum != 0}">
			     	 <a href="#" style="color:#444;font-size: 15px;"><i class="fa fa-save"></i></a>
			      </c:if>
			      </td>
			      <td>${dto.created}</td>
			      <td>${dto.hitCount}</td>
			  </tr>
		</c:forEach>
  
		</table>
		
		<table style="width: 100%; margin: 20px auto; border-spacing: 0px;">
		   <tr height="40">
		      <td align="left" width="100">
		          <button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/study/notice/list?studyNum=${studyNum}&left=${left}';">새로고침</button>
		      </td>
		      <td align="center">   
		          <form name="searchForm" action="<%=cp%>/study/notice/list" method="get" style="width: 400px;">		
		          	<select name="condition" class="form-control" style="width: 90px; float: left; margin-right: 10px;">
					  <option value="all"       ${condition=="all"?"selected='selected'":""}>모두</option>
					  <option value="subject"   ${condition=="subject"?"selected='selected'":""}>제목</option>
					  <option value="content"   ${condition=="content"?"selected='selected'":""}>내용</option>
					  <option value="created"   ${condition=="created"?"selected='selected'":""}>등록일</option>
		            </select>           
		      <div class="input-group" style="width: 300px;">
		           <input type="text" name="keyword" class="form-control" value="${keyword}">
	              <span class="input-group-btn">
	                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
	                </button>	  
	              </span>
		       </div>
		       <input type="hidden" name="studyNum" value="${studyNum}">
		       <input type="hidden" name="left" value="${left}">
		        </form>
		      </td>
		      <td align="right" width="100">
		          <button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/study/notice/created?studyNum=${studyNum}&left=${left}';">글올리기</button>
		      </td>
		   </tr>
		</table>
		
		
		 
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		   <tr height="35">
			<td align="center">
 			        <c:if test="${dataCount==0 }">
			                등록된 게시물이 없습니다.
			         </c:if>
			        <c:if test="${dataCount!=0 }"> 
			              ${paging}
 			         </c:if>
			 </td>
		   </tr>
		</table>
		
	</div>
	</div>
</section>

