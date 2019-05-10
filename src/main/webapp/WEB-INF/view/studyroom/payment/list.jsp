<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript">
	
	
	
</script>

<section class="studyroomSection" style="height:75vh; width:100%;">
	<div class="srContainer" style="width:100%;">
		<div class="srPayListBox">
			<div class="srBagTitleName">
				결제목록
			</div>
			
			<div class="srBagContentsLine" style="width:100%;">
				<div style="width:10%; float:left;">
					<div class="srBagContentsTitle">
						<div class="srBagInner">No.#</div>
					</div>
				</div>
				<div style="width:10%; float:left;">
					<div class="srBagContentsTitle">
						<div class="srBagInner">결제번호</div>
					</div>
				</div>
				<div style="width:50%; float:left;">
					<div class="srBagContentsTitle">
						<div class="srBagInner">구매목록</div>
					</div>
				</div>
				<div style="width:20%; float:left;">
					<div class="srBagContentsTitle">
						<div class="srBagInner">결제일자</div>
					</div>
				</div>
				<div style="width:10%; float:left;">
					<div class="srBagContentsTitle">
						<div class="srBagInner">결제금액</div>
					</div>
				</div>	
			</div>
			
			<div class="srBagContentsLine" style="width:100%;">
			</div>
			
			<div class="srBagContentsLine" style="width:100%;">
			</div>
			
			<div class="srBagContentsLine" style="width:100%;">
			</div>
			
			<div class="srBagContentsLine" style="width:50%;">
				<div class="btn-srModalCreate" style="background-color:#646b8c; cursor:pointer;">
					Reload
				</div>
			</div>
		</div>
	</div>
</section>