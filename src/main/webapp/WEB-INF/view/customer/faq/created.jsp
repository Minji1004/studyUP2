<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
	<form name="boardForm" method="post" enctype="multipart/form-data">
		<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse;">
			<tr align="left" height="50" style="border-top : 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
				<td width="100" bgcolor="#eeeeee" style="text-align: center;">제목</td>
				<td style="padding-left:10px;">
					<input type="text" name="subject" maxlength="100" class="boxTF" style="width: 95%;" value="${dto.subject}">
				</td>
			</tr>
		
			<tr align="left" height="50" style="border-bottom: 1px solid #cccccc;">
				<td width="100" bgcolor="#eeeeee" style="text-align: center;">작성자</td>
				<td style="padding-left:10px;">
					${sessionScope.memberInfo.userName}
				</td>
			</tr>
		
			<tr align="left" style="border-bottom: 1px solid #cccccc;">
				<td width="100" bgcolor="#eeeeee" style="text-align: center; padding-top:5px;" valign="top">내용</td>
				<td valign="top" style="padding:5px 0px 5px 10px;">
					<textarea name="content" maxlength="500" class="boxTF" style="width: 95%;">${dto.content}</textarea>
				</td>
			</tr>
			
			<tr align="left" height="50" style="border-bottom: 1px solid #cccccc;">
				<td width="100" bgcolor="#eeeeee" style="text-align: center;">첨부</td>
				<td style="padding-left:10px;">
					<input type="file" name="upload" class="boxTF" size="53" style="height: 25px;">
				</td>
			</tr>
		</table>
		<c:if test="${mode=='update'}">
			<td align="left" height="50" style="border-bottom: 1px solid #cccccc;">첨부된파일</td>
			<td style="padding-left: 10px;">
				${dto.og_FileName}
		<c:if test="${not empty dto.sv_FileName}"></c:if>
		</c:if>
	</form>