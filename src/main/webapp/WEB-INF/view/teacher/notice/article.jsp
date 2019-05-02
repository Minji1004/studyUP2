<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
	String cp = request.getContextPath();
%>


<script type="text/javascript" src="<%=cp%>/resource/se/js/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">
  // 좌우의 공백을 제거하는 함수
  if(typeof String.prototype.trim !== 'function') {
    String.prototype.trim = function() {
        var TRIM_PATTERN = /(^\s*)|(\s*$)/g;
        return this.replace(TRIM_PATTERN, "");
    };
  }  
  
  $(function(){
  		showLikeNum();
  		listPage(1);
  });
  
  function showLikeNum(){
	  var url = "<%=cp%>/teacher/notice/readLikeNum";		
		$.ajax({
			type:"get",
			url: url,
			dataType: "JSON",
			data: {
				tnoticeNum : ${dto.tnoticeNum}
			},
			success: function(data){
				$("#likeNum").html(data.count);
				if(data.state=="true"){
					$("#likeNum").next().css('color','#dd4b39');
				}else{
					$("#likeNum").next().css('color','');
				}
			},			
			error: function(e){
				console.log(e.responseText);
			}
		});	
  }
  
  function updateLike(){
	  var url = "<%=cp%>/teacher/notice/updateLikeNum";
	  $.ajax({
			type:"post",
			url: url,
			dataType: "JSON",
			data: {
				tnoticeNum : ${dto.tnoticeNum}
			},
			success: function(data){
				showLikeNum();
			},			
			error: function(e){
				console.log(e.responseText);
			}
		});	
  }
  
  function listPage(page){
	  var url="<%=cp%>/teacher/notice/readListReply";
	
		$.ajax({
			type:"get"
			,url:url
			,data:{
				tnoticeNum : ${dto.tnoticeNum},
				page : page
			}
			,success:function(data){
				$("#listReply").html(data);
			}
			,error:function(e) {
			    console.log(e.responseText);
			}		 
		});
  }
  
  function sendReply(){
		//값 있는 지 체크
		var content = $("#commentContent").val();
		
		if(content == ""){
			alert("댓글 내용을 입력해주세요.")
			return;	
		}
		
		var tnoticeNum = '${dto.tnoticeNum}';
		
		var url="<%=cp%>/teacher/notice/insertReply";
		var query="tnoticeNum="+tnoticeNum+"&content="+encodeURIComponent(content);
		
		$.ajax({
			type:"post",
			url: url,
			data: query,
			dataType: "json",
			success: function(data){	
					$("#commentContent").val("");
					listPage(${page});
			},  
			error: function(jqXHR){ 
				console.log(jqXHR.responseText);
			}			
		}); 
		
	}
  
  
  $("body").on("click", ".listAnswer", function(){
		var noticeNum = $(this).attr("data-tnoticeNum");
		
		/* $("#answerList" + noticeNum).html("성공했어!"); */
		
		alert("answerList" + noticeNum);
		
		$(this).closest(".test_answer").next("#answerList" + noticeNum).html("성공");
		
		<%-- var url="<%=cp%>/teacher/notice/listAnswer";
		  $.ajax({
			type:"get",
			url: url,
			data: {
				tnotice_r_num : noticeNum
			},
			success: function(data){
				$answerList.empty();
				$answerList.html(data);
			},  
			error: function(jqXHR){ 
				console.log(jqXHR.responseText);
			}			
		}); --%>
  });
  
  
 function listAnswer(tnotice_r_num){

	$("#answerList"+tnotice_r_num).html("성공했어!");
	alert("#answerList"+tnotice_r_num);
	
	 // $answerList.show();
		// 리스트 보여주기
<%-- 		var url="<%=cp%>/teacher/notice/listAnswer";
		  $.ajax({
				type:"get",
				url: url,
				data: {
					tnotice_r_num : tnotice_r_num
				},
				success: function(data){
					$answerList.empty();
					$answerList.html(data);
				},  
				error: function(jqXHR){ 
					console.log(jqXHR.responseText);
				}			
			});  --%>
	  /* var isVisible = $answerList.is(":visible");
	  
		if(isVisible){
			$answerList.hide();
		}else{
			
		}   */
  }
  
  function sendReplyAnswer(tnotice_r_num){
	//값 있는 지 체크
		var content = $("#answerList"+tnotice_r_num).find("textarea").val();	
		
		if(content == ""){
			alert("댓글 내용을 입력해주세요.")
			return;	
		}

		
		var url="<%=cp%>/teacher/notice/insertReplyAnswer"
		var query="tnoticeNum="+${dto.tnoticeNum}+"&tnotice_r_num="+tnotice_r_num+"&content="+encodeURIComponent(content);
		
		$.ajax({
			type:"post",
			url: url,
			data: query,
			dataType: "json",
			success: function(data){	
				$("#answerList"+tnotice_r_num).find("textarea").val("");
			},  
			error: function(jqXHR){ 
				console.log(jqXHR.responseText);
			}			
		});
  }

</script>



<!-- Main content -->
<section class="content container-fluid">

	<div class="box box-primary" style="width: 1500px; margin: 30px auto; padding: 10px;">
		<div class="box-header with-border">
			<h3 class="box-title">
				공지사항
			</h3>
		</div>
		<div class="box-body" style="width: 1200px; margin: 0 auto; min-height: 700px;">			
		            <table class="table" style="margin-top: 10px;">
		                 <thead>
		                     <tr>
		                         <th colspan="2" style="text-align: center; font-size: 20px;">
		                         ${dto.subject}
		                         </th>
		                     </tr>
		                <thead>
		                 <tbody>
		                     <tr>
		                         <td colspan="2" style="height: 300px;">
			                         <p class="pull-right">작성일: ${dto.created}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;조회수: ${dto.hitCount}</p>
			                         <p style="clear:both;">
			                         	${dto.content}
			                         </p>
		                         </td>
		                     </tr>
		                     <tr>
		                     	<td colspan="2" style="text-align: center; border: none;">
		                     		<a class="btn btn-app" style="background: white;" onclick="updateLike();">
						                <span id="likeNum" class="badge bg-red"></span>
						                <i class="fa fa-heart-o"></i> Likes
					              	</a> 
		                     	</td>
		                     </tr>
		                     <c:if test="${not empty listFile}">
			                     <tr>
			                         <td colspan="2">	                         
			                              <p><b style="font-size: 15px;">첨부파일 <span style="color: #dd4b39;">${fn:length(listFile)}</span>개</b>
			                              &nbsp;(<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${dto.totalFileSize/1024000}"/> MB)&nbsp;&nbsp;
			                              <a href="<%=cp%>/teacher/notice/downloadZip?tnoticeNum=${dto.tnoticeNum}">모두 저장</a></p>
			                         <c:forEach var="file" items="${listFile}">
			                              <div style="border: 1px solid #ddd; padding: 3px 5px;width: 500px;">
			                              <a href="<%=cp%>/teacher/notice/downloadFile?fileNum=${file.fileNum}" ><i class="fa fa-download"></i></a> 
			                              ${file.originalFilename} (<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${file.fileSize/1024000}"/> MB)
			                              </div>
			                         </c:forEach>
			                         </td>
			                     </tr> 
		                     </c:if>
		                     <tr>
		                     	<td colspan="2">이전글: <a href="<%=cp%>/teacher/notice/article?tnum=${teacher.userNum}&left=${left}&tnoticeNum=${preReadDto.tnoticeNum}">${preReadDto.subject}</a></td>		               
		                     </tr>     
		                     <tr style="border-bottom: #d5d5d5 solid 1px;">
		                     	<td colspan="2">다음글: <a href="<%=cp%>/teacher/notice/article?tnum=${teacher.userNum}&left=${left}&tnoticeNum=${nextReadDto.tnoticeNum}">${nextReadDto.subject}</a></td>		               
		                     </tr>                               
		                </tbody>
		                <tfoot>
		                	<tr>
		                		<td>
		                		    <button type="button" class="btn btn-default" onclick="updateFaq()"><i class="fa fa-edit"></i>&nbsp;수정</button>
		                		    <button type="button" class="btn btn-default" onclick="deleteFaq()"><i class="fa fa-trash-o"></i>&nbsp;삭제</button>
		                		</td>
		                		<td align="right">
		                		    <button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/teacher/notice/list?${query}';"> 목록으로 </button>
		                		</td>
		                	</tr>
		                </tfoot>
		            </table>
		            
		            
		           <!-- 댓글 -->
		           <form name="commentForm" method="post" action="" style="margin-top: 30px;">
						<span style="font-weight: bold;">댓글 쓰기</span><span> - 타인을
							비방하거나 개인정보를 유출하는 글의 게시를 삼가 주세요.</span>
					<div style="clear: both; padding-top: 10px;">
						<textarea id="commentContent" class="form-control"
							style="width: 100%; min-height: 80px; box-sizing: border-box;"
							required="required"></textarea>
					</div>
					<div style="text-align: right; padding-top: 10px;">
						<button type="button" class="btn btn-default" onclick="sendReply();">등록하기</button>
						</div>
				</form>
		           
		           <div id="listReply"></div>   
		         
		         
			</div>
		</div>
</section>
