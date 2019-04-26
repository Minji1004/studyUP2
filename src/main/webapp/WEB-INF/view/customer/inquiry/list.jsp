<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style type="text/css">
.bodyFrame2{
	padding-top: 10px;
	margin-bottom: 5px;
}
.body-title {
    color: #424951;
    padding-bottom: 5px;
    margin: 0 0 20px 0;
    border-bottom: 1px solid #dddddd;
}
.body-title h3{
	min-width:300px;
    font-family: "Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
    font-weight: bold;
    margin: 0 0 -5px 0;
    padding-bottom: 5px;
    display: inline-block;
    border-bottom: 3px solid #424951;
}
.list-group .lefthead {
    color: #fff;	
    background-color: #337ab7;	
    border-color: #337ab7;
    font-family: "Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
    font-size: 14px;
    font-weight: bold;    
}

.list-group .lefthead i {
    background: #ffffff;
    display: inline-block;
    margin: 0 10px 0 3px;
    position: relative;
    top: 2px;
    width: 3px;
    height: 15px;    
}
.list-group-item.active, .list-group-item.active:focus, .list-group-item.active:hover {
    color: #424951;
    font-weight: bold;
    background:none;
    background-color: #F6F6F6;
    border-color: #D5D5D5;
}    

.table th, .table td {
    font-weight: normal;
    border-top: none;
}
.table thead tr th{
     border-bottom: none;
} 
.table thead tr{
    border: #d5d5d5 solid 1px;
     background: #eeeeee; color: #787878;
} 
.table td {
    border-bottom: #d5d5d5 solid 1px;
}
.table td a{
    color: #000;
}
</style>

<script type="text/javascript">
function searchList() {
		var f=document.searchForm;
		f.submit();
}
</script>


<section class="section" id="srcontianer" >

<div class="container" role="main">
    <div class="row row-offcanvas row-offcanvas-right">
        <div class="col-xs-6 col-sm-3 sidebar-offcanvas" style="max-width: 240px;" id="sidebar">
            <jsp:include page="/WEB-INF/view/customer/left.jsp"/>
        </div>
        <div class="col-xs-12 col-sm-9 body-frame-2">
                
		    <div class="body-title">
		          <h3><span class="glyphicon glyphicon-book"></span> 1:1 문의 </h3>
		    </div>
		    
		    <div class="alert alert-info">
		        <i class="glyphicon glyphicon-info-sign"></i> 문의를 남겨 두시면 답변해 드리겠습니다.
		    </div>
		
		    <div>
		        <div style="clear: both; height: 30px; line-height: 30px;">
		            <div style="float: left;">${dataCount}개(${page}/${total_page} 페이지)</div>
		            <div style="float: right;">&nbsp;</div>
		        </div>
		        
		        <div class="table-responsive" style="clear: both;"> <!-- 테이블 반응형 -->
		            <table class="table table-hover">
		                <thead>
		                    <tr>
		                        <th class="text-center" style="width: 70px;">번호</th>
		                        <th >제목</th>
		                        <th class="text-center" style="width: 100px;">글쓴이</th>
		                        <th class="text-center" style="width: 100px;">날짜</th>
		                    </tr>
		                </thead>
		                <tbody>
		        <c:forEach var="dto" items="${list}">
		                    <tr>
		                        <td class="text-center">${dto.listNum}</td>
		                        <td>
		                        	<a href="${articleUrl}&inquiryNum=${dto.inquiryNum}">${dto.subject}</a>
		                        </td>
		                        <td class="text-center">${dto.userId}</td>
		                        <td class="text-center">${dto.created}</td>		                     
		                    </tr>
		       </c:forEach>             
		                </tbody>
		
		            </table>
		        </div>
		
		        <div class="paging" style="text-align: center; min-height: 50px; line-height: 50px;">
		           1 2 3
		        </div>        
		        
		        <div style="clear: both;">
		        		<div style="float: left; width: 20%; min-width: 85px;">
		        		    <button type="button" class="btn btn-default btn-sm wbtn" onclick="javascript:location.href='<%=cp%>/';">새로고침</button>
		        		</div>
		        		<div style="float: left; width: 60%; text-align: center;">
		        		     <form name="searchForm" action="<%=cp%>/customer/notice/list" method="post" class="form-inline">
								  <select class="form-control input-sm" name="condition" >
									  <option value="all"     ${condition=="all"?"selected='selected'":""}>모두</option>
									  <option value="subject" ${condition=="subject"?"selected='selected'":""}>제목</option>
									  <option value="content" ${condition=="content"?"selected='selected'":""}>내용</option>
									  <option value="userName"    ${condition=="name"?"selected='selected'":""}>작성자</option>
									  <option value="created" ${condition=="created"?"selected='selected'":""}>등록일</option>
								  </select>
								  <input type="text" class="form-control input-sm input-search" name="keyword" value="${keyword}">
								  <button type="button" class="btn btn-info btn-sm btn-search" onclick="searchList();"><span class="glyphicon glyphicon-search"></span> 검색</button>
		        		     </form>
		        		</div>
		        		<div style="float: left; width: 20%; min-width: 85px; text-align: right;">
		        		    <button type="button" class="btn btn-primary btn-sm bbtn" onclick="javascript:location.href='<%=cp%>/customer/inquiry/created';"><span class="glyphicon glyphicon glyphicon-pencil"></span> 글쓰기</button>
		        		</div>
		        </div>
		        
		    </div>


        </div>
     </div>
</div>
    
</section>