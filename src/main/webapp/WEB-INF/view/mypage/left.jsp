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
        <!-- Optionally, you can add icons to the links -->
        <li class="studyMainLi ${active=='1'?'on':''}"><a href="javascript:location.href='<%=cp %>/mypage/main'"><i class="fa fa-link"></i> <span>마이페이지</span></a></li>
        <li class="studyMainLi ${active=='2'?'on':''}"><a href="javascript:location.href='<%=cp %>/mypage/wanote/main'"><i class="fa fa-link"></i> <span>오답노트</span></a></li>
		<li class="studyMainLi ${active=='3'?'on':''}"><a href="javascript:location.href='<%=cp %>/mypage/schedule/main'"><i class="fa fa-link"></i> <span>일정</span></a></li>
		<li class="studyMainLi ${active=='4'?'on':''}"><a href="javascript:location.href='<%=cp %>/mypage/basket/main'"><i class="fa fa-link"></i> <span>장바구니</span></a></li>

       <li class="treeview">
          <a href="#"><i class="fa fa-link"></i> <span>예약확인</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
          </a>
          <ul class="treeview-menu">
            <li class="studyMainLi ${active=='5'?'on':''}"><a href="javascript:location.href='<%=cp %>/mypage/study/main'">  <span>STUDY</span> </a></li>
            <li class="studyMainLi ${active=='6'?'on':''}"><a href="javascript:location.href='<%=cp %>/mypage/studyroom/main'">  <span>STUDYROOM</span> </a></li>
          </ul>
  		</li>
      </ul>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>