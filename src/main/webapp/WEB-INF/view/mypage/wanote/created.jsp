<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<h3>
<b>
|&nbsp;오답노트 
${mode=="created"?"작성":"수정"}
</b>
</h3>

<form name="wanoteCreateForm" method="post" enctype="multipart/form-data">
			  <table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			  <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
			      <td style="padding-left:10px;"> 
			        <input type="text" name="subject" maxlength="100" class="boxTF" style="width: 95%;" value="${dto.subject }">
			      </td>
			  </tr>
			
		
			  <tr align="left" style="border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center; padding-top:5px;" valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
			      <td valign="top" style="padding:5px 0px 5px 10px;"> 
			        <textarea name="content" rows="12" class="boxTA" style="width: 95%;">${dto.content}</textarea>
			      </td>
			  </tr>
			  
			  <tr align="left" height="40" style="border-bottom: 1px solid #cccccc;">
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">첨&nbsp;&nbsp;&nbsp;&nbsp;부</td>
			      <td style="padding-left:10px;"> 
			          <input type="file" name="upload" class="boxTF" size="53" style="height: 25px;" multiple="multiple">
			       </td>
			  </tr> 
			  
				<c:if test="${mode=='update' }">
				  <tr align="left" height="40" style="border-bottom: 1px solid #cccccc;">
				      <td width="100" bgcolor="#eeeeee" style="text-align: center;">첨부된파일</td>
				       <td style="padding-left:10px;"> 
				      <c:if test="${flist != null }">
					   		<table>
					   		<c:forEach var="fdto" items="${flist}">	
						      <tr style="padding-left:10px;">  	
      							<td>
						          <img alt="" src="<%=cp%>/uploads/wanote/${fdto.saveFilename}" width="200px">
						          ${fdto.originalFilename }  
						          <c:if test="${not empty fdto.saveFilename}">
						          		| <span style="cursor:pointer;" data-num="${fdto.wanoteFileNum }" id="deleteWanoteFile">파일삭제</span>
						          </c:if>
						     	</td>
						       </tr>
						       </c:forEach>
						      </table>
						
				       </c:if>
				       </td>
				  </tr>
				  </c:if>
			  </table>
					
			  <table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
			     <tr height="45"> 
			      <td align="center" >
			        <button type="button" class="btn" onclick="sendWanote('${mode}');">${mode=='update'?'수정완료':'등록하기'}</button>	
		
			        <button type="reset" class="btn">
			        	다시입력
			        </button>
			        <button type="button" class="btn" onclick="location.href='<%=cp%>/mypage/wanote/main'">${mode=='update'?'수정취소':'등록취소'}</button>
			        <c:if test="${mode=='update'}">
			         	 <input type="hidden" name="waNum" value="${dto.waNum}">
			        	 <input type="hidden" name="page" value="${page}">
			        </c:if>
			        
			      </td>
			    </tr>
			  </table>
			</form>