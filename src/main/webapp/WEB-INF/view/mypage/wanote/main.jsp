<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script type="text/javascript">
var pageNo = 1;
var keyword = "";
var condition = "all";

function sendWanote(mode){
	var f = document.wanoteCreateForm;
	
	if(!f.subject.value){
		alert("제목을 입력하세요.");
		return;
	}
	if(!f.content.value){
		alert("내용을 입력하세요");
		return;
	}
	var url = "<%=cp%>/mypage/wanote/created";
	var query = new FormData(f);
	
	console.log(query);
	$.ajax({
		type : "POST"
		,url  : url
		,processData : false		
		,contentType : false		
		,data : query
		,dataType : "JSON"
		,success:function(data){			
			location.href = "<%=cp%>/mypage/wanote/main";
		},
		beforeSend:function(jqXHR){
			jqXHR.setRequestHeader("AJAX", true);
		},
		error:function(jqXHR){
			if(jqXHR.status == 403){
				location.href = "<%=cp%>/member/login";
				return;
			}
			console.log(jqXHR.responseText);
		}
	});	
}

//오답노트 올리기 폼
function insertWanote(){
	var url = "<%=cp%>/mypage/wanote/created";
	
	$.ajax({
		type : "GET"
		,url : url
		,success : function(data){
			$("#wanoteMain").html(data);
		}
		,error : function(e){
			console.log(e);
		}
	});
}

function searchWanoteList(){
	var url = "<%=cp%>/mypage/wanote/main";
	pageNo = ${pageNo};
	condition = $("#condition").val();
	keyword = $("#keyword").val();
	var query = "?page="+pageNo + "&condition=" + condition + "&keyword=" + encodeURIComponent(keyword);
	
	url += query;
	location.href = url;
}
function articleWanoteBoard(waNum){
	var url = "<%=cp%>/mypage/wanote/article";
	var query = "page=" + pageNo + "&waNum=" + waNum;
	if(keyword != ""){
		query += "&condition=" + condition  + "&keyword=" + encodeURIComponent(keyword);
	}
	
	$.ajax({
		type : "GET"
		,url : url
		,data : query
		,success : function(data){

			$("#wanoteMain").html(data);

		}
		,error : function(e){
			console.log(e);
		}
	});
	
}
function updateWanoteBoard(waNum){
	
}
function deleteWanoteBoard(waNum){
	
}
</script>

<div id="wanoteMain">
	<table style="width: 80%; margin: 20px auto 0px; border-spacing: 0px;">
		   <tr height="35">
		      <td align="left" width="50%">
		          ${dataCount }개(${pageNo }/${total_page }페이지)
		      </td>
		      <td align="right">
		          &nbsp;
		      </td>
		   </tr>
		</table>
		
		<table style="width: 80%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse;">
		  <tr align="center" bgcolor="#eeeeee" height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
		      <th width="60" style="color: #787878;">번호</th>
		      <th style="color: #787878;">제목</th>
		      <th width="80" style="color: #787878;">작성일</th>
		  </tr>
		 
		<c:forEach var="dto" items="${list }">
		  <tr align="center" bgcolor="#ffffff" height="35" style="border-bottom: 1px solid #cccccc;"> 
		      <td>${dto.listNum }</td>
		      <td align="left" style="padding-left: 10px;">
		           <a href="javascript:articleWanoteBoard('${dto.waNum }')">${dto.subject }</a>
		      </td>
		      <td>${dto.created }</td>
		   
		  </tr>
		</c:forEach>

		</table>
		 
		<table style="width: 80%; margin: 0px auto; border-spacing: 0px;">
		   <tr height="35">
			<td align="center">
		        ${dataCount == 0 ? "등록된 자료가 없습니다 ." : paging }
			</td>
		   </tr>
		</table>
		<c:if test="${wanoteNull == 0}">
		<table style="width: 80%; margin: 0px auto; border-spacing: 0px;">
		   <tr height="35">
			<td align="center">
		       <a href="<%=cp%>/mypage/wanote/main">찾으시는 자료가 삭제되었습니다.</a>
			</td>
		   </tr>
		</table>
		
		</c:if>
		
		<table style="width: 80%; margin: 10px auto; border-spacing: 0px;">
		   <tr height="40">
		      <td align="left" width="100">
		          <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/mypage/wanote/main'">새로고침</button>
		      </td>
		      <td align="center">
		      
		              <select name="condition" id="condition" class="selectField">
		                  <option value="all" ${condition == "all" ? "selected = 'selected'" : "" }>모두</option>
		                  <option value="subject" ${condition == "subject" ? "selected = 'selected'" : "" }>제목</option>
		                  <option value="content" ${condition == "content" ? "selected = 'selected'" : "" }>내용</option>
		                  <option value="created" ${condition == "created" ? "selected = 'selected'" : "" }>등록일</option>
		            </select>
		            <input type="text" name="keyword" id="keyword" value = "${keyword }"class="boxTF">
		            <!-- input type text가 하나밖에없기 때문에 바로 서버로 간다 그래서 form 태그를 삭제한다. -->
		            <button type="button" class="btn" onclick="searchWanoteList()">검색</button>
		       
		      </td>
		      <td align="right" width="100">
		          <button type="button" class="btn" onclick="insertWanote();">글올리기</button>
		      </td>
		   </tr>
		</table>
</div>


   