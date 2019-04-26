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
       <div class="list-group-item lefthead"><i></i> 고객센터</div>
       <a href="<%=cp%>/customer/notice/list" class="list-group-item">공지사항</a>
       <a href="<%=cp%>/customer/inquiry/list" class="list-group-item">1:1 문의</a>
       <a href="<%=cp%>/customer/faq/list" class="list-group-item">자주하는 질문</a>
</div>
