<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>


<!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar" style = "	max-width: 240px;background: #222d32;padding-Top:15px;height: 1026px;">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

      <!-- Sidebar user panel (optional) -->
      <div class="user-panel">
        <div class="pull-left image">
          	
        </div>
        <div class="pull-left info">
          <p>선생님</p>
        </div>
      </div>

      <!-- /.search form -->

      <!-- Sidebar Menu -->
      <ul class="sidebar-menu" data-widget="tree">
        <!-- Optionally, you can add icons to the links -->
        <li><a href="javascript:location.href='<%=cp %>/mypage/main'"><i class="fa fa-link"></i> <span>마이페이지</span></a></li>
        <li><a href="javascript:location.href='<%=cp %>/mypage/wanote/main'"><i class="fa fa-link"></i> <span>WRONG PROBLEM NOTE</span></a></li>
		<li><a href="javascript:location.href='<%=cp %>/mypage/schedule/main'"><i class="fa fa-link"></i> <span>SCHEDULE</span></a></li>
		<li><a href="javascript:location.href='<%=cp %>/mypage/basket/main'"><i class="fa fa-link"></i> <span>SHOPPING BASKET</span></a></li>

       <li class="treeview">
          <a href="#"><i class="fa fa-link"></i> <span>RESERVATION</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="javascript:location.href='<%=cp %>/mypage/study/main'">STUDY</a></li>
            <li><a href="javascript:location.href='<%=cp %>/mypage/studyroom/main'">STUDYROOM</a></li>
          </ul>
  		</li>
      </ul>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>