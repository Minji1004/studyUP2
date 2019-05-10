<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<style type="text/css">
.right-callout {
	border-left: none; 
	border-right: 5px solid #eee; 
	text-align: right;
	background-color: #E0ECF8;
	border-color: #81BEF7;
}
</style>

<!-- Main content -->
<section class="content container-fluid">
	<div class="row">
		<div class="col-md-5 col-md-offset-1">
          <!-- DIRECT CHAT SUCCESS -->
          <div class="box box-success">
            <div class="box-header with-border">
              <h3 class="box-title">Member</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body"  style="height: 900px;">
            	<div class="callout chatting-room-btn" data-userId="${sessionScope.member.userId}" data-room="study${studyNum}${sessionScope.member.userId}">
	                <h4>${sessionScope.member.userName}</h4>
	             </div>
	             
	             <c:forEach var="dto" items="${memberList}">
	             	<c:if test="${dto.userId ne sessionScope.member.userId}">	             	
			             <div class="callout right-callout chatting-room-btn" data-userId="${dto.userId}" data-room="study${studyNum}${dto.userId}">
			             	<h4>${dto.nickname}</h4>
			             </div>	              	
	             	</c:if>		             
	             </c:forEach>             
            </div>
            <!-- /.box-body -->
            <div class="box-footer">
            </div>
            <!-- /.box-footer-->
          </div>
        </div>	
        
        <div class="col-md-5">
          <!-- DIRECT CHAT SUCCESS -->
          <div class="box box-success">
            <div class="box-header with-border">
              <h3 class="box-title">가입신청</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body"  style="height: 900px;">
	             <c:forEach var="dto" items="${applyList}">	             	             
	            	<div class="callout chatting-room-btn" data-userId="${dto.userId}">
		                <h4>이름 : ${dto.userName}</h4>
	            		<h4>아이디 : ${dto.userId}</h4>
	            		<button class="btn btn-success" type="button" style="float: right;" 
	            			onclick="javascript:location.href='<%=cp%>/study/member/approve?studyNum=${studyNum}&left=${left}&applyNum=${dto.applyNum}';">승인</button>	            		
		             </div>		             
	             </c:forEach>             
            </div>
            <!-- /.box-body -->
            <div class="box-footer">
            </div>
            <!-- /.box-footer-->
          </div>
        </div>					
	</div>
</section>

