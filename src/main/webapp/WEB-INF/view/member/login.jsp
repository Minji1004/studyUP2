<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<style type="text/css">
.lbl {
   position:absolute; 
   margin-left:15px; margin-top: 17px;
   color: #999999; font-size: 11pt;
}
.loginTF {
  width: 360px; height: 50px;
  padding: 5px;
  padding-left: 15px;
  border:1px solid #999999;
  color:#333333;
  margin-top:5px; margin-bottom:5px;
  font-size:14px;
  border-radius:4px;
}
.body-container {
    clear:both;
    box-sizing: border-box;  /* padding과 border는 크기에 포함되지 않음 */
    margin: 0px auto 15px;
    min-height: 500px;
    padding-top: 20px;
}
.btnConfirm {
    font-size: 15px; 
    border:none;
    color:#ffffff;
    background:#507CD1;
    width: 360px;
    height: 50px;
    line-height: 50px;
    border-radius:4px;
}
.radioUser{
	font: 10px;
}
.banner {
    background-image: url('<%=cp%>/resource/images/banner.jpg');
    background-position: center top;
    background-repeat: no-repeat;
    background-size: cover;
    min-height: 1000px;
}
</style>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-1.12.4.min.js"></script>

<script type="text/javascript">
function bgLabel(ob, id) {
    if(!ob.value) {
	    document.getElementById(id).style.display="";
    } else {
	    document.getElementById(id).style.display="none";
    }
}

function sendLogin() {
    var f = document.loginForm;

	var str = f.userId.value;
    if(!str) {
        alert("아이디를 입력하세요. ");
        f.userId.focus();
        return;
    }

    str = f.userPwd.value;
    if(!str) {
        alert("패스워드를 입력하세요. ");
        f.userPwd.focus();
        return;
    }

    f.action = "<%=cp%>/member/login";
    f.submit();
}

</script>

<div class="body-container banner">
    <div style="margin: 0px auto; padding-top:90px; width:360px;">
    	<div style="text-align: center;">
        	<span style="font-weight: bold; font-size:27px; color: #424951;">회원 로그인</span>
        </div>
        
		<form name="loginForm" method="post" action="">
		  <table style="margin: 15px auto; width: 360px; border-spacing: 0px;">
		  <tr align="center" height="60"> 
		      <td> 
                 <label for="userId" id="lblUserId" class="lbl" >아이디</label>
		        <input type="text" name="userId" id="userId" class="loginTF" maxlength="30"
		                   tabindex="1"
                           onfocus="document.getElementById('lblUserId').style.display='none';"
                           onblur="bgLabel(this, 'lblUserId');">
		      </td>
		  </tr>

		  <tr align="center" height="60"> 
		      <td>
		        <label for="userPwd" id="lblUserPwd" class="lbl" >패스워드</label>
		        <input type="password" name="userPwd" id="userPwd" class="loginTF" maxlength="30" 
		                   tabindex="2"
                           onfocus="document.getElementById('lblUserPwd').style.display='none';"
                           onblur="bgLabel(this, 'lblUserPwd');">
		      </td>
		  </tr>

		  <tr align="center" height="65" > 
		      <td>
		        <button type="button" onclick="sendLogin();" class="btnConfirm">로그인</button>
		      </td>
		  </tr>

		  <tr align="center" height="45">
		      <td>
		       		<a href="<%=cp%>/">아이디찾기</a>&nbsp;&nbsp;&nbsp;
		       		<a href="<%=cp%>/">패스워드찾기</a>&nbsp;&nbsp;&nbsp;
		       		<a href="<%=cp%>/member/member">회원가입</a>
		      </td>
		  </tr>
		  
		  <tr align="center" height="40" >
		    	<td><span style="color: blue;">${message}</span></td>
		  </tr>
		  
		  </table>
		</form>           
	</div>
	
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<div align="center">
	<a id="kakao-login-btn"></a>
	<a href="http://developers.kakao.com/logout"></a>
		<script type='text/javascript'>
		
	    
	
	    
	    $(function(){
	    	Kakao.init('65af174643593e739d37189cc96a7851');
	    	Kakao.Auth.createLoginButton({
		        container: '#kakao-login-btn',
		        success: function(authObj) {
		        	getKakaoInfo();
		        },
		        fail: function(err) {
		           alert(JSON.stringify(err));
		        }
		      });
	    });
          
			//보류
          function kakaoLoginForm() {
        	  
              Kakao.Auth.loginForm({
              	success:function(authObj){
              		
              	  	console.log("loginForm");
              	},
  		     	fail:function(errorObj){
  		     		console.log(errorObj)
  		     	}
              });
           }
          
         function getKakaoInfo(){
        	 
        	 Kakao.API.request({
                 url : '/v1/user/me',
                 success : function(res) {
                	 console.log("request");
                    var sPerson = JSON.stringify(res);
                    var oPerson = JSON.parse(sPerson);
                    var pPerson = JSON.stringify(oPerson.properties);
                    pPerson = JSON.parse(pPerson);
                    
                    var userId = "kakao_" + oPerson.id;
                    var nickname = pPerson.nickname;
                    console.log("id : " + userId +  " nickname : " +nickname);
                    
                    var query = "?userId=" + userId + "&nickname=" + nickname;
                  
                    var url = "<%=cp%>/member/kakaoLogin" + query;
                    location.href = url;

	              },
	              fail : function(error) {
	                 console.log("ERROR: " + error);
	              } 
					
              });
         }  	

         function kakaoLogout(){
        	 Kakao.Auth.logout(function(data){
        		 alert(data);
        	 });
         }
      </script>
	</div>
</div>