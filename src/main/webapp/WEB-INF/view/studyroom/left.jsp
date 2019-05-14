<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<style type="text/css">
.studySidebar{
	max-width: 240px; 
	background: #E3CE9F22; 
	padding-Top:15px; 
	height: 1081px;
}

.studySidebar i, .studySidebar span {
	font-size: 20px;
	color: #0B614B;
}

.studySidebar .on {
	background: #454F40;
}

.studySidebar .on span,  .studySidebar .on i{
	color: white;
}


</style>

<!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar studySidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

      <!-- Sidebar Menu -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="studyMainLi ${active=='1'?'on':''}"><a href="<%=cp%>/studyroom/main"><i class="fa fa-link"></i> <span>스터디룸</span></a></li>
        <li class="myStudyMainLi ${active=='2'?'on':''}"><a href="<%=cp%>/studyroom/payment/bag"><i class="fa fa-link"></i> <span>결제하기</span></a></li>
        <li class="myStudyMainLi ${active=='3'?'on':''}"><a href="<%=cp%>/studyroom/payment/list"><i class="fa fa-link"></i> <span>결제목록</span></a></li>
      </ul>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>