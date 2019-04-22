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

.bs-write table {
    width: 100%;
    border: 0;
    border-spacing: 0;
}
.table tbody tr td {
    border-top: none;
    font-weight: normal;
	font-family: NanumGothic, 나눔고딕, "Malgun Gothic", "맑은 고딕", 돋움, sans-serif;
} 
.bs-write table td {
	padding: 3px 3px 3px 3px;
}

.bs-write .td1 {
    min-width: 100px;
    min-height: 30px;
    color: #666;
    vertical-align: middle;
}

</style>

<script type="text/javascript">
  function sendOk() {
        var f = document.noticeForm;

        if(! f.subject.value){
        	f.subject.focus();
        	return;
        }
        
        if(! f.content.value){
        	f.content.focus();
        	return;
        }

        f.action="<%=cp%>/customer/notice/${mode}";
        f.submit();
        
        return;
 }
  
 $(function(){
		$("body").on("change", "input[name=upload]", function(){
			if(! $(this).val()) {
				return;	
			}
			
			var b=false;
			$("input[name=upload]").each(function(){
				if(! $(this).val()) {
					b=true;
					return;
				}
			});
			if(b)
				return;

			var $tr, $td, $input;
			
		    $tr=$("<tr>");
		    $td=$("<td>", {class:"td1", html:"첨부"});
		    $tr.append($td);
		    $td=$("<td>", {class:"td3", colspan:"3"});
		    $input=$("<input>", {type:"file", name:"upload", class:"form-control input-sm", style:"height: 35px;"});
		    $td.append($input);
		    $tr.append($td);
		    
		    $("#tb").append($tr);
		});
		
 });
 <c:if test="${mode=='update'}">
 function deleteFile(fileNum) {
		var url="<%=cp%>/customer/notice/deleteFile";
		$.post(url, {fileNum:fileNum}, function(data){
			$("#f"+fileNum).remove();
		}, "json");
 }
</c:if>
</script>

<section class="section" id="srcontianer" >

<div class="container" role="main">
    <div class="row row-offcanvas row-offcanvas-right">
        <div class="col-xs-6 col-sm-3 sidebar-offcanvas" style="max-width: 240px;" id="sidebar">
            <jsp:include page="/WEB-INF/view/customer/left.jsp"/>
        </div>
        <div class="col-xs-12 col-sm-9 body-frame-2">
                
		    <div class="body-title">
		          <h3><span class="glyphicon glyphicon-book"></span> 공지사항 </h3>
		    </div>
		    
		    <div class="alert alert-info">
		        <i class="glyphicon glyphicon-info-sign"></i> 중요한 일정 및 알림, 이벤트 등은 공지사항 통해 고객님께 알려 드립니다.
		    </div>
		    
		    <div>
		        <form name="noticeForm" method="post" enctype="multipart/form-data">
		            <div class="bs-write">
		                <table class="table">
		                    <tbody id="tb">
		                        <tr>
		                            <td class="td1">작성자명</td>
		                            <td class="td2 col-md-5 col-sm-5">
		                                ${sessionScope.member.userName}
		                            </td>
		                            <td class="td1" align="center">공지여부</td>
		                            <td class="td2 col-md-5 col-sm-5">
		                                <input type="checkbox" name="noticeWhether" value="1" ${noticeWhether==1?"checked='checked'":""}>
		                            </td>
		                        </tr>
		                        <tr>
		                            <td class="td1">제목</td>
		                            <td colspan="3" class="td3">
		                                <input type="text" name="subject" class="form-control input-sm" value="${dto.subject}" required="required">
		                            </td>
		                        </tr>
		                        <tr>
		                            <td class="td1" colspan="4" style="padding-bottom: 0px;">내용</td>
		                        </tr>
		                        <tr>
		                            <td colspan="4" class="td4">
		                            	<textarea name="content" class="form-control" rows="15" required="required">${dto.content}</textarea>
		                            </td>
		                        </tr>

		                        <tr>
		                            <td class="td1">첨부</td>
		                            <td colspan="3" class="td3">
		                                <input type="file" name="upload" class="form-control input-sm" style="height: 35px;">
		                            </td>
		                        </tr>
		                        
								<c:if test="${mode=='update'}">
								   <c:forEach var="vo" items="${listFile}">
										  <tr id="f${vo.fileNum}"> 
										      <td class="td1">첨부된파일</td>
										      <td colspan="3" class="td3">
													${vo.originalFilename}
													| <a href="javascript:deleteFile('${vo.fileNum}');">삭제</a>	        
										      </td>
										  </tr>
								   </c:forEach>
								</c:if>
		                        
		                    </tbody>
		                    <tfoot>
		                        <tr>
		                            <td colspan="4" style="text-align: center; padding-top: 15px;">
		                                  <button type="button" class="btn btn-primary" onclick="sendOk();"> 확인 <span class="glyphicon glyphicon-ok"></span></button>
		                                  <button type="button" class="btn btn-danger" onclick="javascript:location.href='<%=cp%>/customer/notice/list';"> 취소 </button>
								         <c:if test="${mode=='update'}">
								         	 <input type="hidden" name="noticeNum" value="${dto.noticeNum}">
								        	 <input type="hidden" name="page" value="${page}">
								        </c:if>
		                                  
		                            </td>
		                        </tr>
		                    </tfoot>
		                </table>
		            </div>
		        </form>
		    </div>

        </div>
     </div>
</div>

</section>