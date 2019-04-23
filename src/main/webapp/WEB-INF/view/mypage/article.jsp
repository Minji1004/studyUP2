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
			    <td width="50%" align="left" style="padding-left: 5px;">
			       이름 : ${dto.userName}
			    </td>
			    <td width="50%" align="right" style="padding-right: 5px;">
			        ${dto.created } | 조회 ${dto.hitCount }
			    </td>
			</tr>
			
			<tr>
			  <td colspan="2" align="left" style="padding: 10px 5px;" valign="top" height="200">
			      ${dto.content }
			   </td>
			</tr>
			<tr style="border-bottom: 1px solid #cccccc;">
			  <td colspan="2" align="center" style="padding-bottom: 15px;" valign="top" height="40">
			      <button type="button" class = "btn btnSendBoardLike"><span style="font-family: Wingdings;">C</span>&nbsp;&nbsp;<span id="boardLikeCount">${dto.boardLikeCount }</span></button>
			   </td>
			</tr>
			
			<tr height="35" style="border-bottom: 1px solid #cccccc;">
			    <td colspan="2" align="left" style="padding-left: 5px;">
			       첨&nbsp;&nbsp;부 :
		           <c:if test="${not empty dto.saveFilename }">
		           	<a href="<%=cp%>/abbs/download?num=${dto.num}">${dto.originalFilename}</a>(<fmt:formatNumber value="${dto.filesize/1024 }" pattern="#,##0.00"/> KB)
		           </c:if>
			    </td>
			</tr>
			
			<tr height="35" style="border-bottom: 1px solid #cccccc;">
			    <td colspan="2" align="left" style="padding-left: 5px;">
			       이전글 :
			     <c:if test="${not empty preReadDto }">
			     <a href="javascript:articleBoard('${preReadDto.num }')">${preReadDto.subject}</a>
			     </c:if>

			    </td>
			</tr>
			
			<tr height="35" style="border-bottom: 1px solid #cccccc;">
			    <td colspan="2" align="left" style="padding-left: 5px;">
			       다음글 :
				<c:if test="${not empty nextReadDto }">
			     <a href="javascript:articleBoard('${nextReadDto.num }')">${nextReadDto.subject }</a>
			     </c:if>
			    </td>
			</tr>
			</table>
			
			<table style="width: 100%; margin: 0px auto 20px; border-spacing: 0px;">
			<tr height="45">
			    <td width="300" align="left">
			    <c:if test="${sessionScope.member.userId==dto.userId }">
			      <button type="button" class="btn" onclick="updateBoard('${dto.num}')">수정</button>
			    </c:if>
			    <c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId == 'admin'}">
			          <button type="button" class="btn" onclick="deleteBoard('${dto.num}');">삭제</button>
			    </c:if>
			    </td>
			
			    <td align="right">
			        <button type="button" class="btn" onclick="listPage(pageNo)">리스트</button>
			    </td>
			</tr>
			</table>
