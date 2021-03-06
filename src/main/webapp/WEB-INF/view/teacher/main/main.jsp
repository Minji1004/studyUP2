<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>


<script type="text/javascript">

var introduceMode = '${introduceMode}';
var workMode = '${workMode}';
var page = 1;

function resizeTextarea(){
	
	var e = document.getElementById('tBox');
	e.style.height = '1px';
	e.style.height = (e.scrollHeight) + 'px';
}

$(function(){
	resizeTextarea();	
	if(introduceMode=="createIntroduce")
		$("#tBox").next().html("등록하기");
	else if(introduceMode=="updateIntroduce")
		$("#tBox").next().html("수정하기");
	
	if(workMode=="createWork")
		$("form[name='work']").find("button").html("등록하기");
	else if(workMode=="updateWork")
		$("form[name='work']").find("button").html("수정하기");
	
	listWork();
	listPage(1);
	readSubject();
});

	
	function changeTextarea(){
		$("#tBox").removeClass("read");
		$("#tBox").attr("readonly",false);
		var $btn = $("#tBox").next();
		
		if(introduceMode=='createIntroduce')
			$btn.html("등록완료");
		else if(introduceMode=='updateIntroduce')
			$btn.html("수정완료");
		
		$btn.removeAttr("onclick");
		$btn.attr("onclick", "sendIntroduce();");

	}
	
	function sendIntroduce(){
		var url = "<%=cp%>/teacher/"+introduceMode;
		var content = $("#tBox").val();
		var $btn = $("#tBox").next();
		
		$.ajax({
			type:"post",
			url: url,
			dataType: "JSON",
			data: {
				content:content
			},
			success: function(data){
				$("#tBox").addClass("read");
				$("#tBox").attr("readonly",true);						
				$btn.html("수정하기");	
				introduceMode='updateIntroduce';
				$btn.removeAttr("onclick");
				$btn.attr("onclick", "changeTextarea();");
				resizeTextarea();
			},
			error: function(e){
				console.log(e.responseText);
			}
		});			
	}		
	
	//경력 관련된 부분
	
function listWork(){
		
		var url = "<%=cp%>/teacher/listWork";
			
			$.ajax({
				type:"get",
				url: url,
				data: {
					tnum:'${tnum}'
				},
				dataType: "json",
				success: function(data){	
					printWork(data);
				},  
				error: function(jqXHR){ 
					console.log(jqXHR.responseText);
				}		
			});			
	}
	
function printWork(data){		
	
	$("form[name='work']").find("table").empty();
	
		if(data.list.length==0){
			$("form[name='work']").prepend("<p style='text-align: center;'>등록된 자료가 없습니다.</p>");			
		}else{
			var out="";
			var tnum = '${tnum}';
			for(var idx=0; idx<data.list.length; idx++){
				var num = data.list[idx].num;
				var content = data.list[idx].content;
				
				out+="<tr>"
				out+=	"<td>"+content;
				out+=	"<a href='#' id='workNum"+num+"' onclick='deleteWork("+num+");' class='pull-right btn-box-tool workIcon workInactive'>";
				out+=		"<i class='fa fa-trash'></i></a>"
				out+=	"</td></tr>"			
			}
			$("form[name='work']").find("table").append(out);
		}
	}

			
	function changeWork(){
		var $btn = $("form[name='work']").find("button");
		if(workMode=='createWork'){
			$btn.html("등록완료");
			$("form[name='work']").find("p").remove();
		}
		else if(workMode=='updateWork'){
			$btn.html("수정완료");
			$(".workIcon").removeClass("workInactive");
		}
		
		var out="";
		out += "<tr><td>";
		out += 		"<input type='text' id='work' style='width: 500px;'>";
		out += 		"<a href='#' onclick='insertWork("+"${tnum}"+");' class='pull-right btn-box-tool' style='font-size:15px;'>";
		out += 			"<i class='fa fa-plus'></i>";
		out += 		"</a>";
		out += "</td></tr>";
		
		$("form[name='work']").find("table").append(out);		
		
		$btn.removeAttr("onclick");
		$btn.attr("onclick", "completeWork();");
	}
	

	function insertWork(tnum){
		var $input = $("form[name='work']").find("input");
		var content = $input.val();
		
		if(!content){
			alert("경력을 입력해주세요!");
			return;
		}
			
		
		var url="<%=cp%>/teacher/insertWork";
		var query="tnum="+tnum+"&content="+content;
		
		$.ajax({
			type:"post",
			url: url,
			data: query,
			dataType: "json",
			success: function(data){	
				var out ="<tr>";
					out+=	"<td>"+content;
					out+=	"<a href='#' id='workNum"+data.num+"' onclick='deleteWork("+data.num+");' class='pull-right btn-box-tool workIcon'>";
					out+=		"<i class='fa fa-trash'></i></a>";
					out+=	"</td></tr>"	;
				
					$input.closest("tr").before(out);
					$input.val("");	
			},  
			error: function(jqXHR){ 
				console.log(jqXHR.responseText);
			}			
		});
		
	}
	
	function deleteWork(num){
		var url="<%=cp%>/teacher/deleteWork";
		
		$.ajax({
			type:"post",
			url: url,
			data: {
				num:num
			},
			dataType: "json",
			success: function(data){	
					alert(data.state);
					$("#workNum"+num).closest("tr").remove();
			},  
			error: function(jqXHR){ 
				console.log(jqXHR.responseText);
			}			
		});
	}

	
	function completeWork(){
		var $btn = $("form[name='work']").find("button");
		$btn.html("수정하기");
		$btn.removeAttr("onclick");
		$btn.attr("onclick", "changeWork();");
		
		$("form[name='work']").find("input").closest("tr").remove();
		$(".workIcon").addClass("workInactive");		
	}
	
	
	//코멘트와 관련된 javascript
	function listPage(current_page){
		page = current_page;
		var url="<%=cp%>/teacher/listComment";
		var query="page="+page+"&tnum="+'${tnum}';
		
		$.ajax({
			type:"get",
			url: url,
			data: query,
			dataType: "json",
			success: function(data){	
					printComment(data);
			},  
			error: function(jqXHR){ 
				console.log(jqXHR.responseText);
			}			
		});
	}
	
	function printComment(data){		
		
		var $tbody = $("#commentTable").find("tbody");
		$tbody.empty();
		
		$("#commentTable >thead").find("span").html("코멘트 "+data.dataCount+"개");
		$("#avgScore").html(data.avgScore);
		if(data.list.length==0){
			$tbody.append("<tr><td style='text-align: center;'>등록된 코멘트가 없습니다.</td></tr>")			
		}else{
			var out="";
			var tnum = '${tnum}';
			for(var idx=0; idx<data.list.length; idx++){
				var num = data.list[idx].num;	
				var snum = data.list[idx].snum;
				var nickname = data.list[idx].nickname;
				var picture = data.list[idx].picture;
				var content = data.list[idx].content;
				var score = data.list[idx].score;
				var created = data.list[idx].created;
				
				out += "<tr><td>";
				out += 		"<div class='post'>";
				out += 			"<div class='user-block'>";
				out += 				"<img class='img-circle img-bordered-sm' src='<%=cp%>/uploads/member_profile/"+picture+"'>";
				out +=				"<span class='username'>"+nickname;
				out +=				"<span class='score'>&nbsp;<i class='fa fa-star'></i>"+score+"</span>";
				
				if('${sessionScope.member.userNum}'==snum){
					out += 			"<a href='#' id='comment"+num+"'; onclick='deleteComment("+num+");' class='pull-right btn-box-tool'><i class='fa fa-times'></i></a>";
				}
				
				out += 				"</span> <span class='description'>"+created+"</span>";
				out +=			"</div>";
				out += 			"<p>"+content+"</p>";
				out +=		"</div>";
				out +=	"</td></tr>";
			}
			
			out +=	"<tr><td>"+data.paging+"</td></tr>";				
			
			$tbody.append(out);
		}		
	}


	function sendComment(){
		//값 있는 지 체크
		var content = $("#commentContent").val();
		
		if(content == ""){
			alert("코멘트 내용을 입력해주세요.")
			return;	
		}
		
		var tnum = '${tnum}';
		var score = $("output >b").html();
	 	

		
		var url="<%=cp%>/teacher/insertComment";
		var query="tnum="+tnum+"&score="+score+"&content="+content;
		
		$.ajax({
			type:"post",
			url: url,
			data: query,
			dataType: "json",
			success: function(data){	
					$(".star-input").find("input:checked").removeAttr('checked');
					$("#commentContent").val("");
					listPage(1);
			},  
			error: function(jqXHR){ 
				console.log(jqXHR.responseText);
			}			
		}); 
		
	}

	function deleteComment(num){
		
		var url="<%=cp%>/teacher/deleteComment";
		var query="num="+num+"&page="+page;
		
		$.ajax({
			type:"post",
			url: url,
			data: query,
			dataType: "json",
			success: function(data){			
					listPage(page);
			},  
			error: function(jqXHR){ 
				console.log(jqXHR.responseText);
			}			
		}); 	
	}
	
	//분야 등록 수정하기
	function readSubject(){
		
		var url="<%=cp%>/teacher/readSubject"
		
		$.ajax({
			type:"get",
			url: url,
			data: {
				tnum:'${tnum}'
			},
			dataType: "json",
			success: function(data){			
					printSubject(data);
			},  
			error: function(jqXHR){ 
				console.log(jqXHR.responseText);
			}			
		}); 
		
	}
	
	function printSubject(data){
		
		$("#subjectInput").empty();
		$("#subjectTd").empty();
		
		if('${sessionScope.member.userNum}'=='${tnum}'){
			if(data.subject == null){
				$("#subjectInput").html("가르칠 과목을 등록해주세요.");
				$("#subjectTd").html("<button class='btn btn-default' type='button' onclick='changeSubject(\"insert\")' style='float: right;'>등록하기</button>");
			}else{
				$("#subjectInput").html(data.subject);	
				$("#subjectTd").html("<button class='btn btn-default' type='button' onclick='changeSubject(\"update\")' style='float: right;'>수정하기</button>");
			}			
		}else{
			if(data.subject == null)
				$("#subjectInput").html(" ");
			else
				$("#subjectInput").html(data.subject);			
		}
	}
	
	function changeSubject(mode){
		var content = $("#subjectInput").html();
		$("#subjectInput").empty();
		$("#subjectTd").empty();
		if(mode=='insert'){
			$("#subjectInput").html("<input type='text' style='width: 300px;'>");
			$("#subjectTd").html("<button class='btn btn-default' type='button' onclick='insertSubject()' style='float: right;'>등록완료</button>");
		}
		else if(mode=='update'){
			$("#subjectInput").html("<input type='text' style='width: 300px;' value='"+content+"'>");
			$("#subjectTd").html("<button class='btn btn-default' type='button' onclick='updateSubject()' style='float: right;'>수정완료</button>");
		}		
	}
	
	function insertSubject(){
		
		var url="<%=cp%>/teacher/insertSubject"
		var content = $("#subjectInput>input").val();
		var query = "tnum="+'${tnum}'+"&content="+content;
		
			$.ajax({
				type:"post",
				url: url,
				data: query,
				dataType: "json",
				success: function(data){			
						readSubject();
				},  
				error: function(jqXHR){ 
					console.log(jqXHR.responseText);
				}			
			});  	
	}
	
	function updateSubject(){
		
		var url="<%=cp%>/teacher/updateSubject"
			var content = $("#subjectInput>input").val();
			var query = "tnum="+'${tnum}'+"&content="+content;
			
				$.ajax({
					type:"post",
					url: url,
					data: query,
					dataType: "json",
					success: function(data){			
							readSubject();
					},  
					error: function(jqXHR){ 
						console.log(jqXHR.responseText);
					}			
				}); 
		
	}
	
</script>



<!-- Main content -->
<section class="content container-fluid">

	<div class="box box-primary"
		style="width: 700px; margin: 30px; float: left; padding: 10px;">
		<img src="<%=cp%>/uploads/member_profile/${teacher.picture}"
			class="profile-user-img img-circle">
		<div
			style="display: inline-block; vertical-align: top; padding: 0 20px; width: 450px;">
			<h1 class="profile-username" style="float: left;">
				${teacher.nickname}&nbsp;<small>선생님</small>
			</h1>
			<br>
			<form name="private" method="post">
				<table class="table">
					<tr>
						<th>분야</th>
						<td id="subjectInput">
						</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>${teacher.tel}</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>${teacher.userId}</td>
					</tr>
					<tr>
						<td colspan="2" id="subjectTd"></td>
					</tr>

				</table>
			</form>
		</div>
		<hr class="no-margin">
		<div class="box-header">
			<h3 class="box-title">선생님 소개</h3>
		</div>
		<div class="box-body no-padding">
			<form name="introduce" method="post">			
				<textarea id="tBox" class="read" readonly="readonly">${teacher.content}</textarea>
				<c:if test="${mode eq 'teacher'}">
					<button class="btn btn-default" type="button" style="float: right; margin: 0 30px 10px;" onclick="changeTextarea()"></button>
				</c:if>
		
			</form>
		</div>
		<hr class="no-margin">
		<div class="box-header">
			<h3 class="box-title">학력/경력</h3>
		</div>
		<div class="box-body no-padding">
			<form name="work" method="post">
				<table class="table table-striped">
				</table>
				<c:if test="${mode eq 'teacher'}">
					<button class="btn btn-default" type="button"
						style="float: right; margin-right: 30px;" onclick="changeWork()"></button>
				</c:if>
			</form>
		</div>
	</div>

	<div class="box box-primary"
		style="width: 800px; margin: 30px; float: left;">
		<div class="box-header">
			<h3 class="box-title">
				선생님 평가 - 평균별점 <span class="score"><i class="fa fa-star"></i><span id="avgScore">4.5</span></span>
			</h3>
		</div>
		<div class="box-body" style="margin: 0 auto;">
			<form name="commentForm" method="post" action="">
				<div style="clear: both; padding-top: 10px;">
					<span style="font-weight: bold;">코멘트 쓰기</span><span> - 타인을
						비방하거나 개인정보를 유출하는 글의 게시를 삼가 주세요.</span>
				</div>
				<div class="star-box" style="text-align: center; margin: 10px;">
					<span class="star-input">
						<span class="input">
					    	<input type="radio" name="star-input" value="1" id="p1">
					    	<label for="p1">1</label>
					    	<input type="radio" name="star-input" value="2" id="p2">
					    	<label for="p2">2</label>
					    	<input type="radio" name="star-input" value="3" id="p3">
					    	<label for="p3">3</label>
					    	<input type="radio" name="star-input" value="4" id="p4">
					    	<label for="p4">4</label>
					    	<input type="radio" name="star-input" value="5" id="p5">
					    	<label for="p5">5</label>
					  	</span>
					  	<output for="star-input" ><b>0</b>점</output>						
					</span>		
				</div>
				<div style="clear: both; padding-top: 10px;">
					<textarea id="commentContent" class="form-control"
						style="width: 100%; min-height: 80px; box-sizing: border-box;"
						required="required"></textarea>
				</div>
				<div style="text-align: right; padding-top: 10px;">
					<button type="button" class="btn btn-default" onclick="sendComment();" style="padding: 8px 25px;">등록하기</button>
				</div>
			</form>
			<table id="commentTable" class="table">
				<thead>
					<tr>
						<td><span style='font-weight: 700;'></span></td>
					</tr>
				</thead>
				<tbody>
				</tbody>

			</table>
		</div>
	</div>
</section>

