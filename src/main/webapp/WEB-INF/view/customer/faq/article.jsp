<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script type="text/javascript">
function updateFaq(){
	<c:if test="${sessionScope.member.userId==dto.userId}">
		var q="faqNum=${dto.faqNum}&page=${page}";
		var url="<%=cp%>/customer/faq/update?"+q;
		
		location.href=url;
		</c:if>
		
		<c:if test="${sessionScope.member.userId!=dto.userId}">
			alert("게시물 작성자만 게시물을 수정할 수 있습니다.")
		</c:if>
	}

function deleteFaq(){
	<c:if test="${sessionScope.member.userId==dto.userId}">
		var q="faqNum=${dto.faqNum}&${query}";
		var url="<%=cp%>/customer/faq/delete?"+q;
		if(confirm("게시물을 삭제하시겠습니까?")){
			location.href=url;
		}
</c:if>
<c:if test="${sessionScope.member.userId!=dto.userId}">
	alert("게시물 작성자만 게시물을 삭제할 수 있습니다.")
</c:if>
}
</script>

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

.bbs-article .table {
    margin-top: 15px;
}
.bbs-article .table thead tr, .bbs-article .table tbody tr {
    height: 30px;
}
.bbs-article .table thead tr th, .bbs-article .table tbody tr td {
    font-weight: normal;
    border-top: none;
    border-bottom: none;
}
.bbs-article .table thead tr {
    border-top: #d5d5d5 solid 1px;
    border-bottom: #dfdfdf solid 1px;
} 
.bbs-article .table tbody tr {
    border-bottom: #dfdfdf solid 1px;
}
.bbs-article .table i {
    background: #424951;
    display: inline-block;
    margin: 0 7px 0 7px;
    position: relative;
    top: 2px;
    width: 1px;
    height: 13px;    
}
</style>

<section class="section" id="srcontianer">

<div class="container" role="main">
    <div class="row row-offcanvas row-offcanvas-right">
        <div class="col-xs-6 col-sm-3 sidebar-offcanvas" style="max-width: 240px;" id="sidebar">
            <jsp:include page="/WEB-INF/view/customer/left.jsp"/>
        </div>
        <div class="col-xs-12 col-sm-9 body-frame-2">
                
		    <div class="body-title">
		          <h3><span class="glyphicon glyphicon-book"></span> 자주하는 질문 </h3>
		    </div>
		    
		    <div class="alert alert-info">
		        <i class="glyphicon glyphicon-info-sign"></i> 자주하는 질문을 확인할 수 있는 게시판입니다.
		    </div>
		    
		    <div class="table-responsive" style="clear: both;">
		        <div class="bbs-article">
		            <table class="table">
		                 <thead>
		                     <tr>
		                         <th colspan="2" style="text-align: center;">
		                         ${dto.subject}
		                         </th>
		                     </tr>
		                <thead>
		                 <tbody>
		                     <tr>
		                         <td style="text-align: left;">
		                            	 아이디 : ${dto.userId}
		                         </td>
		                         <td style="text-align: right;">
		                         </td>
		                     </tr>
		                     <tr>
		                         <td colspan="2" style="height: 230px;border-bottom: #d5d5d5 solid 1px;">
		                              ${dto.content}
		                         </td>
		                     </tr>
                                     
		                </tbody>
		                <tfoot>
		                	<tr>
		                		<td>
		                		    <button type="button" class="btn btn-default btn-sm wbtn" onclick="updateFaq()">수정</button>
		                		    <button type="button" class="btn btn-default btn-sm wbtn" onclick="deleteFaq()">삭제</button>
		                		</td>
		                		<td align="right">
		                		    <button type="button" class="btn btn-default btn-sm wbtn" onclick="javascript:location.href='<%=cp%>/customer/faq/list?${query}';"> 목록으로 </button>
		                		</td>
		                	</tr>
		                </tfoot>
		            </table>
		       </div>
		      
		   </div>

        </div>
     </div>
</div>

</section>