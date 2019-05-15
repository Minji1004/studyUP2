<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
   <div class="alert alert-info">
        <i class="glyphicon glyphicon-info-sign"></i> 질문과 답변을 할 수 있는 공간입니다.
    </div>
    
    <div class="table-responsive" style="clear: both;">
        <div class="bbs-article">
            <table class="table">
                 <thead>
                     <tr>
                         <th colspan="2" style="text-align: center;">
                                ${dto.subject}
                         </th>
                     </tr>
                <thead>
                 <tbody>
                     <tr>
                         <td style="text-align: left;">
                             이름 : ${dto.userName}
                         </td>
                         <td style="text-align: right;">
                          ${dto.created}<i></i>조회 ${dto.hitCount}
                         </td>
                     </tr>
                     <tr style="border-bottom:none;">
                         <td colspan="2" style="height: 170px;">
                              ${dto.content}
                         </td>
                     </tr>
                     <tr>
                         <td colspan="2" style="height: 40px; padding-bottom: 15px; text-align: center;">
                              <button type="button" class="btn btn-default btn-sm wbtn" style="background: white;" onclick="sendLikeBoard('${dto.num}')"><span class="glyphicon glyphicon-hand-up"></span> <span id="boardLikeCount">${boardLikeCount}</span></button>                            
                         </td>
                     </tr>
                     <tr>
                         <td colspan="2">
                              <span style="display: inline-block; min-width: 45px;">첨부</span> :
                              
                         </td>
                     </tr>
                     <tr>
                         <td colspan="2">
                              <span style="display: inline-block; min-width: 45px;">이전글</span> :
                              <c:if test="${not empty preReadDto}">
                                  <a href="javascript:articleBoard('${preReadDto.num}', '${pageNo}');">${preReadDto.subject}</a>
                              </c:if>					
                         </td>
                     </tr>
                     <tr>
                         <td colspan="2" style="border-bottom: #d5d5d5 solid 1px;">
                              <span style="display: inline-block; min-width: 45px;">다음글</span> :
                              <c:if test="${not empty nextReadDto}">
                                  <a href="javascript:articleBoard('${nextReadDto.num}', '${pageNo}');">${nextReadDto.subject}</a>
                              </c:if>
                         </td>
                     </tr>                                          
                </tbody>
                <tfoot>
                	<tr>
                		<td>
<c:if test="${sessionScope.member.userId==dto.userId}">
                		    <button type="button" class="btn btn-default btn-sm" onclick="updateForm('${dto.num}', '${pageNo}');">수정</button>
</c:if>
<c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin'}">	                		    
                		    <button type="button" class="btn btn-default btn-sm" onclick="deleteBoard('${dto.num}', '${pageNo}');">삭제</button>
</c:if>                		    
                		</td>
                		<td align="right">
                		    <button type="button" class="btn btn-default btn-sm" onclick="listPage('${pageNo}')"> 목록으로 </button>
                		</td>
                	</tr>
                </tfoot>
            </table>
       </div>
   </div>