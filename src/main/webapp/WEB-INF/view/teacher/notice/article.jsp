<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
	String cp = request.getContextPath();
%>


<script type="text/javascript" src="<%=cp%>/resource/se/js/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">
  // 좌우의 공백을 제거하는 함수
  if(typeof String.prototype.trim !== 'function') {
    String.prototype.trim = function() {
        var TRIM_PATTERN = /(^\s*)|(\s*$)/g;
        return this.replace(TRIM_PATTERN, "");
    };
  }  
  
  function fileSizeFormat(var fileSize){
	  filesize = (fileSize/1024000).toFixed(2);
	  return filesize;
  }
  
</script>



<!-- Main content -->
<section class="content container-fluid">

	<div class="box box-primary" style="width: 1500px; margin: 30px auto; padding: 10px;">
		<div class="box-header with-border">
			<h3 class="box-title">
				공지사항
			</h3>
		</div>
		<div class="box-body" style="width: 1200px; margin: 0 auto; min-height: 700px;">			
		            <table class="table" style="margin-top: 10px;">
		                 <thead>
		                     <tr>
		                         <th colspan="2" style="text-align: center; font-size: 20px;">
		                         ${dto.subject}
		                         </th>
		                     </tr>
		                <thead>
		                 <tbody>
		                     <tr>
		                         <td colspan="2" style="height: 300px;">
			                         <p class="pull-right">작성일: ${dto.created}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;조회수: ${dto.hitCount}</p>
			                         <p style="clear:both;">
			                         	${dto.content}
			                         </p>
		                         </td>
		                     </tr>
		                     <tr>
		                     	<td colspan="2" style="text-align: center; border: none;">
		                     		<a class="btn btn-app" style="background: white;">
						                <span class="badge bg-red">531</span>
						                <i class="fa fa-heart-o" style="color: #dd4b39;"></i> Likes
					              	</a> 
		                     	</td>
		                     </tr>
		                     <c:if test="${not empty listFile}">
			                     <tr>
			                         <td colspan="2">	                         
			                              <p><b style="font-size: 15px;">첨부파일 <span style="color: #dd4b39;">${fn:length(listFile)}</span>개</b>&nbsp;&nbsp;(2MB)&nbsp;&nbsp;<a href="#">모두 저장</a></p>
			                         <c:forEach var="file" items="${listFile}">
			                              <div style="border: 1px solid #ddd;padding: 3px 5px;width: 500px;"><a href="#"><i class="fa fa-download"></i></a> ${file.originalFilename} (fileSizeFormat(${file.fileSize})MB)</div>
			                         </c:forEach>
			                         </td>
			                     </tr> 
		                     </c:if>
		                     <tr>
		                     	<td colspan="2">이전글: </td>		               
		                     </tr>     
		                     <tr style="border-bottom: #d5d5d5 solid 1px;">
		                     	<td colspan="2">다음글: </td>		               
		                     </tr>                               
		                </tbody>
		                <tfoot>
		                	<tr>
		                		<td>
		                		    <button type="button" class="btn btn-default" onclick="updateFaq()"><i class="fa fa-edit"></i>&nbsp;수정</button>
		                		    <button type="button" class="btn btn-default" onclick="deleteFaq()"><i class="fa fa-trash-o"></i>&nbsp;삭제</button>
		                		</td>
		                		<td align="right">
		                		    <button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/teacher/notice/list?${query}';"> 목록으로 </button>
		                		</td>
		                	</tr>
		                </tfoot>
		            </table>
		       </div>
		</div>
</section>