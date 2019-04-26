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
	color: white;
	font-size: 20px;
}

.studySidebar .studyMainLi {
	background: #454F40;
}


.studySidebar .myStudyMainLi span,  .studySidebar .myStudyMainLi i{
	color: #0B614B;
}


</style>

<script type="text/javascript">
$(function(){
	$(".modal-backdrop").css("z-index" , "auto");
});
</script>

<!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar studySidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

      <!-- Sidebar Menu -->
      <ul class="sidebar-menu" data-widget="tree">
        <!-- Optionally, you can add icons to the links -->
        <li class="studyMainLi"><a href="<%=cp%>/study/main"><i class="fa fa-link"></i> <span>스터디</span></a></li>
        <li class="myStudyMainLi"><a href="#"><i class="fa fa-link"></i> <span>My스터디</span></a></li>

      </ul>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>