<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<section class="features section">
	<div class="container" style="height:800px;">
        <form method="post">
			<div class="input-group">
				<input type="text" name="keyword" class="form-control input-sm keyword" placeholder="통합검색">
				<span class="input-group-btn" >
					<button type="button" class="btn btn-primary btn-sm"><i class="glyphicon glyphicon-search"></i></button>
				</span>
			</div>
		</form>
		
		<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px;">
		   <tr height="35">
		      <td align="left" width="50%">
		          개(/페이지)
		      </td>
		      <td align="right">
		          &nbsp;
		      </td>
		   </tr>
		</table>
		
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse;">
		  <tr align="center" bgcolor="#eeeeee" height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
		      <th width="100" style="color: #787878;">번호</th>
		      <th style="color: #787878;">아이디</th>
		      <th width="150" style="color: #787878;">닉네임</th>
		      <th width="150" style="color: #787878;">전화번호</th>		      
		      <th width="120" style="color: #787878;">회원가입일</th>		      
		  </tr>
		 
		<c:forEach var="dto" items="">
		  <tr align="center" bgcolor="#ffffff" height="35" style="border-bottom: 1px solid #cccccc;"> 
		      <td></td>
		      <td align="left" style="padding-left: 10px;">
		           <a href="">아이디</a>
		      </td>
		      <td>닉네임</td>
		      <td>전화번호</td>		      
		      <td>
				<c:if test="">
					<a href=""><img src=""></a>
				</c:if>
			</td>
		  </tr>
		 </c:forEach>

		</table>
		
		</div>
</section>