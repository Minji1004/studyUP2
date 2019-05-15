<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style type="text/css">
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

.bbs-reply {
    font-family: NanumGothic, 나눔고딕, "Malgun Gothic", "맑은 고딕", 돋움, sans-serif;
}

.bbs-reply-write {
    border: #d5d5d5 solid 1px;
    padding: 10px;
    min-height: 50px;
}
</style>

<script type="text/javascript">
function deleteBoard() {
<c:if test="${sessionScope.member.userId=='admin' || sessionScope.member.userId==dto.userId}">
  var query = "sFreeNum=${dto.sFreeNum}&${query}";
  var url = "<%=cp%>/study/free/delete?"+query;

  if(confirm("위 자료를 삭제 하시 겠습니까 ? "))
  	location.href=url;
</c:if>    
<c:if test="${sessionScope.member.userId!='admin' && sessionScope.member.userId!=dto.userId}">
  alert("게시물을 삭제할 수  없습니다.");
</c:if>
}

function updateBoard() {
<c:if test="${sessionScope.member.userId==dto.userId}">
  var query = "sFreeNum=${dto.sFreeNum}&page=${page}";
  var url = "<%=cp%>/study/free/update?"+query;

  location.href=url;
</c:if>

<c:if test="${sessionScope.member.userId!=dto.userId}">
 alert("게시물을 수정할 수  없습니다.");
</c:if>
}
</script>

<script type="text/javascript">
// 게시물 공감 추가
function sendLikeBoard(num) {
	var url="<%=cp%>/study/free/insertBoardLike";
	var sFreeNum="${dto.sFreeNum}";
	
	$.ajax({
		type:"post"
		,url:url
		,data:{sFreeNum:sFreeNum}
		,dataType:"json"
		,success:function(data) {
			var state=data.state;
			if(state=="true") {
				var count = data.boardLikeCount;
				$("#boardLikeCount").text(count);
			} else if(state=="false") {
				alert("좋아요는 한번만 가능합니다. !!!");
			}
		}
		,beforeSend : function(jqXHR) {
	        jqXHR.setRequestHeader("AJAX", true);
	    }
	    ,error:function(jqXHR) {
	    	if(jqXHR.status==403) {
	    		login();
	    		return;
	    	}
	    	console.log(jqXHR.responseText);
	    }
	});
}

// 댓글 --------------------------------------
function login() {
	location.href="<%=cp%>/member/login";
}

// 댓글 리스트
$(function(){
	listPage(1);
});

function listPage(page) {
	var url="<%=cp%>/study/free/listReply";
	var query="sFreeNum=${dto.sFreeNum}&pageNo="+page;
	
	$.ajax({
		type:"get"
		,url:url
		,data:query
		,success:function(data) {
			$("#listReply").html(data);
		}
	    ,beforeSend :function(jqXHR) {
	    	jqXHR.setRequestHeader("AJAX", true);
	    }
	    ,error:function(jqXHR) {
	    	if(jqXHR.status==403) {
	    		login();
	    		return;
	    	}
	    	console.log(jqXHR.responseText);
	    }
	});

}

// 댓글 추가
function sendReply() {
	var sFreeNum="${dto.sFreeNum}";
	var sfrContent=$("#sfrContent").val().trim();
	if(! sfrContent ) {
		alert("내용을 입력하세요 !!! ");
		$("#sfrContent").focus();
		return;
	}
	sfrContent = encodeURIComponent(sfrContent);
	
	var query="sFreeNum="+sFreeNum+"&sfrContent="+sfrContent+"&answer=0"+"&studyNum="+${studyNum}+"&left="+${left};
	var url="<%=cp%>/study/free/insertReply";
	$.ajax({
		type:"post"
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data) {
			$("#sfrContent").val("");
			
			var state=data.state;
			if(state=="true") {
				listPage(1);
			} else if(state=="false") {
				alert("댓글을 추가 하지 못했습니다.");
			}
		}
		,beforeSend : function(jqXHR) {
	        jqXHR.setRequestHeader("AJAX", true);
	    }
	    ,error:function(jqXHR) {
	    	if(jqXHR.status==403) {
	    		login();
	    		return;
	    	}
	    	console.log(jqXHR.responseText);
	    }
	});
	
}

// 댓글 삭제
function deleteReply(sfReplyNum, page) {
	if(! confirm("게시물을 삭제하시겠습니까 ? "))
	    return;
		
	var url="<%=cp%>/study/free/deleteReply";
	var query="sfReplyNum="+sfReplyNum+"&studyNum="+${studyNum}+"&left="+${left};
		
	$.ajax({
		type:"post"
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data) {
			// var state=data.state;
			listPage(page);
		}
		,beforeSend : function(jqXHR) {
	        jqXHR.setRequestHeader("AJAX", true);
	    }
	    ,error:function(jqXHR) {
	    	if(jqXHR.status==403) {
	    		login();
	    		return;
	    	}
	    	console.log(jqXHR.responseText);
	    }
	});
}

</script>


<section class="content container-fluid">

	<div class="box box-primary" style="width: 1500px; margin: 30px auto; padding: 10px;">
		<div class="box-header with-border">
			<h3 class="box-title">
				자유게시판
			</h3>
		</div>
		<div class="box-body" style="width: 1200px; margin: 0 auto; min-height: 700px;">	
            <table class="table">
                 <thead>
                     <tr>
                         <th colspan="2" style="text-align: center;">
                                ${dto.fSubject}
                         </th>
                     </tr>
                <thead>
                 <tbody>
                     <tr>
                         <td style="text-align: left;">
                             이름 : ${dto.userName}
                         </td>
                         <td style="text-align: right;">
                          ${dto.created}<i></i>조회 ${dto.hitCount}
                         </td>
                     </tr>
                     <tr style="border-bottom:none;">
                         <td colspan="2" style="height: 170px;">
                              ${dto.fContent}
                         </td>
                     </tr>
                    
                     <tr>
                         <td colspan="2">
                              <span style="display: inline-block; min-width: 45px;">첨부</span> :
                              <c:if test="${not empty dto.saveFilename}">
                                  <a href="<%=cp%>/study/free/download?sFreeNum=${dto.sFreeNum}"><span class="glyphicon glyphicon-download-alt"></span> ${dto.originalFilename}</a>
                              </c:if>
                         </td>
                     </tr>
                     <tr>
                         <td colspan="2">
                              <span style="display: inline-block; min-width: 45px;">이전글</span> :
                              <c:if test="${not empty preReadDto }">
                                  <a href="<%=cp%>/study/free/article?${query}&sFreeNum=${preReadDto.sFreeNum}">${preReadDto.fSubject}</a>
                              </c:if>					
                         </td>
                     </tr>
                     <tr>
                         <td colspan="2" style="border-bottom: #d5d5d5 solid 1px;">
                              <span style="display: inline-block; min-width: 45px;">다음글</span> :
                              <c:if test="${not empty nextReadDto }">
                                  <a href="<%=cp%>/study/free/article?${query}&sFreeNum=${nextReadDto.sFreeNum}">${nextReadDto.fSubject}</a>
                              </c:if>
                         </td>
                     </tr>                                          
                </tbody>
                <tfoot>
                	<tr>
                		<td>
<c:if test="${sessionScope.member.userId==dto.userId}">
                		    <button type="button" class="btn btn-default btn-sm wbtn" onclick="updateBoard();">수정</button>
</c:if>
<c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin'}">	                		    
                		    <button type="button" class="btn btn-default btn-sm wbtn" onclick="deleteBoard();">삭제</button>
</c:if>                		    
                		</td>
                		<td align="right">
                		    <button type="button" class="btn btn-default btn-sm wbtn" onclick="javascript:location.href='<%=cp%>/study/free/list?${query}';"> 목록으로 </button>
                		</td>
                	</tr>
                </tfoot>
            </table>
            
            
            
		       <div class="bbs-reply">
		           <div class="bbs-reply-write">
		               <div style="clear: both;">
		           	       <div style="float: left;"><span style="font-weight: bold;">댓글쓰기</span><span> - 타인을 비방하거나 개인정보를 유출하는 글의 게시를 삼가 주세요.</span></div>
		           	       <div style="float: right; text-align: right;"></div>
		               </div>
		               <div style="clear: both; padding-top: 10px;">
		                   <textarea id="sfrContent" class="form-control" rows="3" style="resize : none;"></textarea>
		               </div>
		               <div style="text-align: right; padding-top: 10px;">
		                   <button type="button" class="btn btn-primary btn-sm" onclick="sendReply();"> 댓글등록 <span class="glyphicon glyphicon-ok"></span></button>
		               </div>           
		           </div>
		           <div id="listReply" class="table"></div>
		       </div>
		   </div>
       </div>
       

</section>