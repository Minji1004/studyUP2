<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
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

});


</script>

<div class="list-group">
    <div class="list-group-item lefthead"><i></i> 마이페이지</div>
	<a href="#" class="list-group-item">나의 기록</a>
	<a href="#" class="list-group-item">장바구니</a>
</div>
