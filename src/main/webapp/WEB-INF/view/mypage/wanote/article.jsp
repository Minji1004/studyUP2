<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
	<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			<tr height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
			    <td colspan="2" align="center">
				   ${dto.subject }
			    </td>
			</tr>
			
			<tr height="35" style="border-bottom: 1px solid #cccccc;">
			    <td width="50%" align="right" style="padding-right: 5px;">
			       	작성일 :  ${dto.created } 
			    </td>
			</tr>
			
			<tr>
			  <td colspan="2" align="left" style="padding: 10px 5px;" valign="top" height="200">
			      ${dto.content }
		
			   	<c:forEach var="fdto" items="${flist }">
			   		<br>
			   		<img src="<%=cp%>/uploads/wanote/${fdto.saveFilename}">
			   	</c:forEach>
			   </td>
			  
			</tr>
			
			<tr height="35" style="border-bottom: 1px solid #cccccc;">
			    <td colspan="2" align="left" style="padding-left: 5px;">
			       첨&nbsp;&nbsp;부 :
			     <c:forEach var="fdto" items="${flist }">
		           	<a href="<%=cp%>/wanote/article/download?wanoteFileNum=${fdto.wanoteFileNum}">${fdto.originalFilename}</a>
		          </c:forEach>
		           
	
			    </td>
			</tr>
			
			<tr height="35" style="border-bottom: 1px solid #cccccc;">
			    <td colspan="2" align="left" style="padding-left: 5px;">
			       이전글 :
			     <c:if test="${not empty preReadDto }">
			     <a href="javascript:articleWanoteBoard('${preReadDto.waNum }')">${preReadDto.subject}</a>
			     </c:if>

			    </td>
			</tr>
			
			<tr height="35" style="border-bottom: 1px solid #cccccc;">
			    <td colspan="2" align="left" style="padding-left: 5px;">
			       다음글 :
				<c:if test="${not empty nextReadDto }">
			     <a href="javascript:articleWanoteBoard('${nextReadDto.waNum }')">${nextReadDto.subject }</a>
			     </c:if>
			    </td>
			</tr>
			</table>
			
			<table style="width: 100%; margin: 0px auto 20px; border-spacing: 0px;">
			<tr height="45">
			    <td width="300" align="left">
			    <button type="button" class="btn" onclick="updateWanoteBoard('${dto.waNum}')">수정</button>
			    <button type="button" class="btn" onclick="deletewanoteBoard('${dto.waNum}');">삭제</button>
			    </td>
			    <td align="right">
			        <button type="button" class="btn" onclick="location.href='<%=cp%>/mypage/wanote/main'">리스트</button>
			    </td>
			</tr>
			</table>