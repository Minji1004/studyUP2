<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

      <!-- Sidebar user panel (optional) -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="#" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>${sessionScope.member.userName}님</p>
        </div>
      </div>

      <!-- search form (Optional) -->
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search...">
          <span class="input-group-btn">
              <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
              </button>
            </span>
        </div>
      </form>
      <!-- /.search form -->

      <!-- Sidebar Menu -->
      <ul class="sidebar-menu" data-widget="tree">
        <!-- Optionally, you can add icons to the links -->
		<li><a href="#"><i class="fa fa-link"></i> <span>공지사항</span></a></li>
        <li class="treeview">
          <a href="#"><i class="fa fa-link"></i> <span>게시판</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="#">자유게시판</a></li>
            <li><a href="#">퀴즈게시판</a></li>
          </ul>
        </li>
        <li><a href="#"><i class="fa fa-link"></i> <span>일정</span></a></li>
        <li><a href="#"><i class="fa fa-link"></i> <span>순공시간</span></a></li>
		<li><a href="#"><i class="fa fa-link"></i> <span>채팅</span></a></li>
		<li><a href="#"><i class="fa fa-link"></i> <span>메이트관리</span></a></li>
      </ul>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>