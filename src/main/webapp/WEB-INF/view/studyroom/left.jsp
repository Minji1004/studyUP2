<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar" style = "	max-width: 200px;background: #6e826e29 ; border-right:2px solid #dddd9922; padding-Top:15px;height: 1026px;">

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
        <li><a href="<%=cp%>/studyroom/main"><i class="fa fa-link"></i> <span>스터디룸리스트</span></a></li>
        <li><a href="<%=cp%>/studyroom/payment/list"><i class="fa fa-link"></i> <span>결제하기</span></a></li>
		<!-- 
		<li><a href="#"><i class="fa fa-link"></i> <span>예약현황</span></a></li>
		<li><a href="#"><i class="fa fa-link"></i> <span>예약취소</span></a></li>
        <li style="background-color:#ce75a64d; border: #454af54d;"><a href="#"><i class="fa fa-link" style="color:#5623b9;"></i> <span style="font-weight:800;color:#5623b9;">관리자룸</span></a></li>
         -->
      </ul>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>