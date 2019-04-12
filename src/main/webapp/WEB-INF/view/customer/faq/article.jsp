<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

	<div class="body-container" style=" width: 700px; margin: auto 0;">
		<div class="body-title">
			<h3>게시판</h3>
		</div>
		
		<div>
			<table style="width: 100%; margin: 20px auto 0px; border-spacing:0px; border-collapse: collapse; margin: auto 0;">
			<tr height="50" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
				<td colspan="2" align="center">
					${dto.subject}
				</td>
			</tr>
			
			<tr height="50" style="border-bottom: 1px solid #cccccc;">
				<td width="50%" align="left" style="padding-left: 5px;">
				 아이디 : ${dto.Id}	
				 </td>
				 <td width="50%" align="right" style="padding-left: 5px;">
				 	${dto.created} | 조회수 ${dto.views}
				 </td>
			</tr>
				 		
			<tr>
				<td colspan="2" align="left" style="padding: 10px 5px;" valign="top" height="200">
					${dto.content}
				</td>
			</tr>
			
			<tr style="border-bottom: 1px solid #cccccc;">
				<td colspan="2" align="center" style="padding-bottom: 15px;" height="50">
					<button type="button" class="btn btnSendBoardLike"><span style="font-family: Wingdings">C</span>&nbsp;&nbsp;<span id="boardLikeCount">${dto.b_Like}</span></button>
				</td>
			</tr>
			
			<tr height="35" style="border-bottom: 1px solid #cccccc;">
				<td colspan="2" align="left" style="padding-left: 5px;">
				첨부파일 : 
				<c:if test="${not empty dto.sv_FileNum}"><a href="<%=cp%>/board/download?num=${dto.fileNum}">${dto.og_FileName}</a>(<fmt:formatNumber value="${dto.fileSize/800}" pattern="#,##0.00"/>Kb)</c:if>
				</td>
			</tr>
				
			<tr height="35" style="border-bottom: 1px solid #cccccc;">
				<td colspan="2" align="left" style="padding-left: 5px;">
				이전글 : 
				<c:if test="${not empty preReadDto}">
					<a href="javascript:articleBoard('${preReadDto.num}')">${preReadDto.subject}</a>
				</c:if>
				</td>	
			</tr>
			
			<tr height="35" style="border-bottom: 1px solid #cccccc;">
				<td colspan="2" align="left" style="padding-left: 5px;">
				다음글 : 
				<c:if test="${not empty nextReadDto}">
					<a href="javascript:articleBoard('${nextReadDto.num}')">${nextReadDto.subject}</a>
				</c:if>	
				</td>
			</tr>
			</table>	
			<table style="width: 100%; margin: 0px auto 20px; border-spacing: 0px;">
			<tr height="45">
				<td width="300" align="left">
					<button type="button" class="btn" onclick="updateBoard('${dto.f_PostNum}')">수정</button>
					<button type="button" class="btn" onclick="deleteBoard('${dto.f_PostNum}')">삭제</button>
				</td>
				
				<td align="right">
					<button type="button" class="btn" onclick="listPage(pageNo)">리스트</button>
				</td>
			</tr>
			</table>
		</div>
	</div>
	
