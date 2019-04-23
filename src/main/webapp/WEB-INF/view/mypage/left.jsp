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
        <li><a href="<%=cp%>/teacher/main?tnum=${tnum}&left=0"><i class="fa fa-link"></i> <span>강사소개</span></a></li>
        <li><a href="#"><i class="fa fa-link"></i> <span>강의목록</span></a></li>
		<li><a href="#"><i class="fa fa-link"></i> <span>공지사항</span></a></li>
		<li><a href="#"><i class="fa fa-link"></i> <span>질문답변</span></a></li>
		
        <li class="treeview">
          <a href="#"><i class="fa fa-link"></i> <span>강의 관리</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="<%=cp%>/teacher/lecture/teacherLecture?tnum=${tnum}&left=5">강의 등록/수정</a></li>
            <li><a href="#">매출 현황</a></li>
          </ul>
  		</li>
      </ul>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>