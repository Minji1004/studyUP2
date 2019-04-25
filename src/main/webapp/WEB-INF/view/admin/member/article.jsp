<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<section class="features section">
	<div class="modal-header">
	   <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	   <h4 class="modal-title" id="myModalLabel" align="center">회원 상세</h4>
	</div>
	<div class="smodal-body modal-body row">
	 	<div class="col-xs-8 col-sm-5" align="center">
	 		<img class="img-circle img-dialog" src="">
	 	</div>
	 	<div class="col-xs-4 col-sm-7">
	 		<div class="">회원번호: ${mdto.userNum}</div>
	 		<div class="">아이디: ${mdto.userId}(닉네임: ${mdto.nickname} ) </div> 		
	 		<div class=""><span class="" aria-hidden=""></span>전화번호: ${mdto.tel}</div> 		
	 		<div class=""><span class="" aria-hidden=""></span>가입일: ${mdto.created}</div>
	 		<div class=""><span class="" aria-hidden=""></span>최근 접속일: ${mdto.lastLogin}</div> 	
	 		<div class=""><span class="" aria-hidden=""></span>스터디:</div>
	 	
	 	</div>
	</div>
	<div class="modal-footer">
	   <button type="button" class="" id="" data-target ="">apply</button>
	   <button type="button" class="" data-dismiss="">Close</button>
	</div>
</section>