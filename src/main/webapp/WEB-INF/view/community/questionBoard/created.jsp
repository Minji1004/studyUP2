<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<style type="text/css">
.bs-write table {
    width: 100%;
    border: 0;
    border-spacing: 0;
}
.table tbody tr td {
    border-top: none;
    font-weight: normal;
	font-family: NanumGothic, 나눔고딕, "Malgun Gothic", "맑은 고딕", 돋움, sans-serif;
} 
.bs-write table td {
	padding: 3px 3px 3px 3px;
}

.bs-write .td1 {
    min-width: 100px;
    min-height: 30px;
    color: #666;
    vertical-align: middle;
}
</style>


	<div class="alert alert-info">
		<i class="glyphicon glyphichon-info-sign"></i> 질문과 답변을 할 수 있는 공간입니다.
	</div>
    
    <div>
        <form name="boardForm" method="post" enctype="multipart/form-data">
            <div class="bs-write">
                <table class="table">
                    <tbody id="tb">
                        <tr>
                            <td class="td1">작성자명</td>
                            <td class="td2 col-md-5 col-sm-5">
                                <p class="form-control-static">${sessionScope.member.userName}</p>
                            </td>
                            <td class="td1" align="center"></td>
                            <td class="td2 col-md-5 col-sm-5"></td>
                        </tr>
                        
                        <tr>
                            <td class="td1">제목</td>
                            <td colspan="3" class="td3">
                                <input type="text" name="subject" class="form-control input-sm" value="${dto.subject}" required="required">
                            </td>
                        </tr>
                        
                        <tr>
                            <td class="td1" colspan="4" style="padding-bottom: 0px;">내용</td>
                        </tr>
                        <tr>
                            <td colspan="4" class="td4">
                            	<textarea name="content" class="form-control" rows="15">${dto.content}</textarea>
                            </td>
                        </tr>
                        
                    </tbody>
                    
                    <tfoot>
                        <tr>
                            <td colspan="4" style="text-align: center; padding-top: 15px;">
                                  <button type="button" class="btn btn-primary" onclick="sendOk('${mode}', '${pageNo}');"> 확인 <span class="glyphicon glyphicon-ok"></span></button>
                                  <button type="button" class="btn btn-danger" onclick="sendCancel('${pageNo}');"> 취소 </button>
				                                  
					         <c:if test="${mode=='update'}">
					         	 <input type="hidden" name="boardNum" value="${dto.freePostnum}">
					        	 <input type="hidden" name="pageNo" value="${pageNo}">
					        </c:if>
					        <c:if test="${mode=='reply'}">
					        	<input type="hidden" name="pageNo" value="${pageNo}">
					        	<input type="hidden" name="groupNum" value="${dto.groupNum}">
					        	<input type="hidden" name="orderNo" value="${dto.orderNo}">
					        	<input type="hidden" name="depth" value="${dto.depth}">
					        	<input type="hidden" name="parent" value="${dto.freePostnum}">
					        </c:if>
	                       </td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </form>
    </div>