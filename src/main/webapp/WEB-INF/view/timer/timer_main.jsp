<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<div style="height:140px; width:100%;background: black; opacity: 0.5">
</div>
<div id="DateCountdown"  data-timer="70" style="width:100%; height : 420px ;position: fixed; top: 122px;">
<button class="btn btn-success start">시작</button>
<button class="btn btn-danger stop">정지</button>
<button class="btn btn-info restart">재시작</button>
<button class="btn btn-db">여기까지</button>
</div>
