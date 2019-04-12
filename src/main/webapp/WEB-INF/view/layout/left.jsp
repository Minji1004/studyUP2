<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<script type="text/javascript">
$(function(){
	var idx="${subMenu}";
	if(!idx) idx=1;
	var subMenu=$(".list-group-item")[idx];
	$(subMenu).addClass("active");
});
</script>

<div class="list-group">
       <div class="list-group-item lefthead"><i></i> 회사소개</div>
       <a href="<%=cp%>/company/info" class="list-group-item">인사말</a>
       <a href="<%=cp%>/company/history" class="list-group-item">회사연혁</a>
       <a href="#" class="list-group-item">사업분야</a>
       <a href="#" class="list-group-item">조직도</a>
       <a href="#" class="list-group-item">찾아오시는길</a>
</div>
