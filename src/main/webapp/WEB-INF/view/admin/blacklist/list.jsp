<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp=request.getContextPath();
%>
<style>
li{
	text-align: center;
	float:left;
	
}
.line{
	align:center; 
	bgcolor:#eeeeee;
	height:35px;
	border-top: 1px solid #cccccc; 
	border-bottom: 1px solid #cccccc;
	padding-top: 7px;
}

.flist, .blist{
	text-align:center; 
	height:24px; 
	border-bottom: 1px solid #cccccc;"
}
</style>

<script>
function searchList(){
	var f=document.search;
	f.submit();
}

$(function(){	
	$(document).on("click", ".flist", function(){		
		var num=$(this).attr("data-reportNum");		
		var url="<%=cp%>/admin/blacklist/article?reportNum="+num+"&page=${page}";

		$('#reportModal .modal-content').load(url, function(){
			$('#reportModal').modal('show');
		});
	});	
});

$(function(){
	$(document).on("click", ".blist", function(){
		var num=$(this).attr("data-blackNum");		
		var url="<%=cp%>/admin/blacklist/brticle?blackNum="+num+"&bpage=${bpage}";

		$('#reportModal .modal-content').load(url, function(){
			$('#reportModal').modal('show');
		});
	});
});

$(function(){
	$("body").on("click","#blackApply", function(){
		var num=$(this).closest("div").children("input").val();
		
		var query="reportNum="+num;
		var url = "<%=cp%>/admin/blacklist/apply";		
		$.ajax({
			type : "post",
			url : url,
			data : query,
			dataType : "json",
			success : function(data){
				alert('블랙리스트에 추가되었습니다.');				
				return;
			}
		});
	});
});

$(function(){
	$("body").on("click", "#blackClear", function(){
		
		var num=$(this).closest("div").children("input").val();
		var query="blackNum="+num;
		var url= "<%=cp%>/admin/blacklist/cancle";
		$.ajax({
			type: "post",
			url : url,
			data : query,
			dataType : "json",
			success : function(data){
				alert("블랙리스트에서 해제되었습니다.");
				return;
			}
		});
	});
});


</script>

<section class="features section">
	<div class="container" style="height:550px; width: 90%; padding-top:80px;">
		<form method="post" name="search" action="<%=cp%>/admin/blacklist/list">
			<div class="input-group">
				<input type="text" name="keyword" value="${keyword}" class="form-control input-sm keyword" placeholder="통합검색">
				<span class="input-group-btn" >
					<button type="button" class="btn btn-primary btn-sm" onclick="searchList()"><i class="glyphicon glyphicon-search"></i></button>
				</span>
			</div>
		</form>
	
		<div style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; padding-top:35px;">
		<h5>신고목록</h5>		
		   <ul style="height:20px;">
		      <li style="float:left; width:10%;">
		          ${dataCount}개(${page}/${total_page}페이지)
		      </li>		      
		   </ul>
		</div>
		<div style="width: 100%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse;">
		  <ul class="line"> 
		      <li style="color: #787878; width:10%;">번호</li>
		      <li style="color: #787878; width:21%;">아이디</li>
		      <li style="color: #787878; width:21%;">닉네임</li>
		      <li style="color: #787878; width:15%;">신고유형</li>
		      <li style="color: #787878; width:15%;">신고자</li>
		      <li style="color: #787878; width:18%;">신고일</li>
		  </ul>
		</div>
		<c:forEach var="rdto" items="${rlist}">
		  <ul class="flist" data-reportNum="${rdto.reportNum}">
		      <li style="width:10%;">${rdto.rlistNum}</li>		      
		      <li style="width:21%;">${rdto.reportedUserId}</li>
		      <li style="width:21%;">${rdto.reportedNickName}</li>
		      <li style="width:15%;">${rdto.reportType}</li>
		      <li style="width:15%;">${rdto.reportUserNickName}</li>
		      <li style="width:18%;">${rdto.reportDate}</li>
		  </ul>
		</c:forEach>
		</div>
		<div style="width:100%; margin:0px auto; border-spacing:0px;">
		   <ul style="height:25px;">
			<li style="width:100%;">
		        <c:if test="${dataReportCount==0}">등록된 게시물이 없습니다.</c:if>
		        <c:if test="${dataReportCount!=0}">${paging}</c:if>
			</li>
		   </ul>
		</div>

	<div class="container" style="height:400px; width: 90%;">	
<c:if test="${not empty keyword}">
		<h5>블랙리스트</h5>
		<div style="width: 100%; margin: 20px auto 0px; border-spacing: 0px;">
		   <ul style="height:20px;">
		      <li style="width:10%; float:left;">
		          ${blackCount }개(${bpage }/${total}페이지)
		      </li>		      
		   </ul>
		</div>
		<div style="width: 100%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse;">
		  <ul class="line"> 
		      <li style="color: #787878; width:10%;">번호</li>
		      <li style="color: #787878; width:35%;">아이디</li>
		      <li style="color: #787878; width:30%;">닉네임</li>		      
		      <li style="color: #787878; width:25%;">등록일</li>		           
		  </ul>
		  <c:forEach var="bdto" items="${blist}" >
		  <ul class="blist" data-blackNum="${bdto.blackNum}">
		      <li style="width:10%;">${bdto.blistNum }</li>
		      <li style="width:35%;">${bdto.userId }</li>
		      <li style="width:30%;">${bdto.nickName }</li>
		      <li style="width:25%;">${bdto.blackStart}</li>
		  </ul>
		  </c:forEach> 
		</div>
		<div style="width:100%; margin:0px auto; border-spacing:0px;">
		   <ul style="height:25px;">
			<li style="width:100%;">
		        <c:if test="${dataBlackCount==0}">등록된 게시물이 없습니다.</c:if>
		        <c:if test="${dataBlackCount!=0}">${phase}</c:if>
			</li>
		   </ul>
		</div>
</c:if>
	</div>
</section>