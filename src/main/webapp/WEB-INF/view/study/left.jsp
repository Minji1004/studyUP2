<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<style type="text/css">
.list-group-item.active, .list-group-item.active:focus, .list-group-item.active:hover {
    z-index: 2;
    color: #fff;
    background-color: #04B486;
    border-color: #04B486;
}
</style>


<script type="text/javascript">
$(function(){
	// 사이드바
	var idx="${subMenu}";
	if(!idx) idx=1;
	var subMenu=$(".list-group-item")[idx];
	$(subMenu).addClass("active");
});


</script>

<div class="list-group">
    <div class="list-group-item lefthead"><i></i> 스터디</div>
	<a href="<%=cp%>/study/main" class="list-group-item">모든 스터디</a>
	<a href="<%=cp%>/company/history" class="list-group-item">My 스터디</a>
</div>



        
