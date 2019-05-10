<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

   	<div>
		<!-- 페이지 맨 윗단 소개글 -->
		<div class="col-md-12" style="padding: 20px 10px 10px 20px;" align="center">
			<div  class="col-md-12">
				<h2 style="font-weight: 700; font-family: '맑은고딕';"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 당신과 함께할 스터디</h2>
				<p style="font-family: '맑은고딕';">당신과 함께할 스터디를 찾으세요. 'StudyUp'에서는 당신과 함께할 메이트들이 기다리고 있습니다.</p>
			</div>
		</div>						

		<div class="col-xs-12 col-md-10 col-md-offset-1">
			<!-- select -->
			<div class= "searchStudy col-xs-12 col-md-12">
				<div class="col-xs-4">
					<select class="form-control" id="selectCondition">
						<option value="all">전체검색</option>
						<option value="studyName">스터디이름검색</option>
						<option value="userId">Master검색</option>
						<option value="courseName">과목검색</option>
					</select>
				</div>
				<div class="col-xs-6">
					<input class="form-control" type="text" placeholder="Search" aria-label="Search" id="inputKeyword" style="width: 100%">
				</div>	
				<div class="col-xs-1" align="center">
					<button  class="btn btn-unique btn-rounded btn-sm" type="button" onclick="searchList();" style="background: #04B486;">Search</button>
				</div>								
			</div>
					
		<div class="col-xs-12" style="height:10px"></div>
			
			<!-- 페이지 글 목록 -->
			<c:forEach var="dto" items="${list}">
			<div class="study-content col-xs-12 col-sm-6 col-md-4" data-studyNum="${dto.studyNum}" data-categoryName="${dto.categoryName}">
				<div class="col-xs-12 col-sm-12" style="background: ${dto.color}; margin-bottom: 2px">&nbsp;</div>
				<div class="thumbnail" style="text-align: center; cursor:pointer;">
					<div style="padding-top: 5px">
						<img class="img-rounded" src="<%=cp%>/uploads/study/${dto.studyImg}" alt="...">
					</div>
					<div onclick="location.href='#';">
						<div style="">
							<div class="study-title">${dto.studyName}</div>
							<div class="studyIntro">${dto.studyIntro}</div>
							<div>${dto.applyCount}/${dto.headcount}</div>
							<div class="row" style="margin-bottom: 10px" >
							
								<c:forEach var="courses" items="${dto.courseLists}" varStatus="status">	
								    <span class="sPicTagContent">#${courses.courseName}</span>
										  
								</c:forEach>
								
							</div>
						</div>
					</div>
				</div>
			</div>	
			</c:forEach>						
			
		<!-- 페이징 처리 -->
		<div class="col-xs-12 col-sm-12 col-md-12 studyPaging" align="center">
            <c:if test="${dataCount==0 }">등록된 게시물이 없습니다.</c:if>
            <c:if test="${dataCount!=0 }">${paging}</c:if>							
		</div>									
	</div>
</div>
