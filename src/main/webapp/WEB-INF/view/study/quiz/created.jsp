<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

  function check() {
        var f = document.boardForm;

    	var str = f.subject.value;
        if(!str) {
            alert("제목을 입력하세요. ");
            f.subject.focus();
            return false;
        }

        str = f.content.value;
        if(!str || str=="<p>&nbsp;</p>") {
        	 alert("내용을 입력하세요. ");
            f.content.focus();
            return false;
        }

    	str = f.pwd.value;
        if(!str) {
            alert("패스워드를 입력하세요. ");
            f.pwd.focus();
            return false;
        }
    	
       	f.action = "<%=cp%>/teacher/notice/created";
       	
       	return true;
  }
  
  $(function(){
		$("body").on("change", "input[name=upload]", function(){
			if(! $(this).val()) {
				return;	
			}
			//style='display:none;'
			var out = "";
			for(var i=0; i< this.files.length; i++){
				var filename = this.files[i].name;
				var filesize = (this.files[i].size/1024000).toFixed(2); //MB로 나타내겠다.
				
				out += "<p><a href='#' id='deleteFile' class='btn-box-tool workIcon'><i class='fa fa-trash'></i></a>";
				out += "&nbsp;&nbsp;"+filename+" <span class='filesize'>"+filesize+"MB</span></p>";
			}
			$("#tableList").empty();
			$("#tableList").append(out);
			
		});		
		
		$("body").on("click", "#deleteFile", function(){			
			this.closest("p").remove();	
		}); 
});
  
</script>



<!-- Main content -->
<section class="content container-fluid">

	<div class="box box-primary" style="width: 1500px; margin: 30px auto; padding: 10px;">
		<div class="box-header with-border">
			<h3 class="box-title">
				공지사항 등록
			</h3>
		</div>
		<div class="box-body" style="width: 1200px; margin: 0 auto;">

<form name="boardForm" method="post" onsubmit="return submitContents(this);"  enctype="multipart/form-data">
  <table class="table">
  <tr align="left" style="border-top: 2px solid #cccccc;"> 
      <th width="80" bgcolor="#eeeeee" style="text-align: center;">제&nbsp;&nbsp;&nbsp;&nbsp;목</th>
      <td style="padding-left:10px;"> 
        <input type="text" name="nSubject" maxlength="100" class="boxTF" style="width: 97%;" value="${dto.nSubject}">
      </td>
  </tr>
  <tr align="left"> 
      <th width="80" bgcolor="#eeeeee" style="text-align: center;">공&nbsp;&nbsp;&nbsp;&nbsp;지</th>
      <td style="padding-left:10px;"> 
        <label><input type="checkbox" name="notice" value="1">공지여부</label>
      </td>
  </tr>
  <tr align="left"> 
      <th width="80" bgcolor="#eeeeee" style="text-align: center; padding-top:5px;" valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</th>
      <td valign="top" style="padding:5px 10px 5px 10px;"> 
        <textarea name="nContent" id="content" style="width:95%; height: 450px;">${dto.nContent}</textarea>
      </td>
  </tr>

  <tr align="left" style="border-bottom: 1px solid #cccccc;">
  	<th width="80" bgcolor="#eeeeee" style="text-align: center; vertical-align: middle;">첨부파일</th>
  	<td>
	  	<div class="btn btn-default btn-file">
			<i class="fa fa-paperclip"></i> 첨부파일
			<input type="file"  name="upload" multiple="multiple">
		</div>		
		<p class="filesize">최대 32MB</p>
		<div id="tableList" style="padding: 10px 10px 0;">
		</div>	
  	</td>
  </tr>
  </table>

  <table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
     <tr height="45"> 
      <td align="center" >
        <button type="submit" class="btn btn-danger">${mode=='update'?'수정완료':'등록하기'}</button>
        <button type="reset" class="btn btn-default" onclick="resetEditor();">다시입력</button>
        <button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/study/notice/list?studyNum=${studyNum}&left=1';">${mode=='update'?'수정취소':'등록취소'}</button>
		</td>
    </tr>
  </table>
</form>
</div>
		</div>
</section>

<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "content",
	sSkinURI: "<%=cp%>/resource/se/SmartEditor2Skin.html",	
	htParams : {bUseToolbar : true,
		fOnBeforeUnload : function(){
			//alert("아싸!");
		}
	}, //boolean
	fOnAppLoad : function(){
		//예제 코드
		//oEditors.getById["content"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
	},
	fCreator: "createSEditor2"
});

function pasteHTML() {
	var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
	oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
}

function showHTML() {
	var sHTML = oEditors.getById["content"].getIR();
	alert(sHTML);
}
	
function submitContents(elClickedObj) {
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	
	// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("content").value를 이용해서 처리하면 됩니다.
	
	try {
		// elClickedObj.form.submit();
		return check();
	} catch(e) {}
}

function setDefaultFont() {
	var sDefaultFont = '돋움';
	var nFontSize = 24;
	oEditors.getById["content"].setDefaultFont(sDefaultFont, nFontSize);
}

//다시입력 할 때 
function resetEditor(){
	var tableList = document.getElementById("tableList");
	tableList.innerHTML = "";
	oEditors.getById["content"].exec("SET_IR", [""]); 	
}
</script>    

