<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<div class="alert alert-info">
	<i class="glyphicon glyphicon-info-sign"></i>게시글을 자유롭게 공유할 수 있는 게시판입니다.
</div>
	<div>
			<c:if test="${dataCount!=0}">
			<div style="clear: both; height: 30px; line-height: 30px;">
				<div style="float: left;">${dataCount}개(${page}/${total_page} 페이지)</div>
				<div style="float: right;">&nbsp;</div>
			</div>
			
			<div class="table-responsive" style="clear: both;">
				<table class="table table-hover">
					<thead>
						<tr>
							<th class="text-center" style="width: 70px;">번호</th>
							<th>제목</th>
							<th class="text-center" style="width: 100px;">글쓴이</th>
							<th class="text-center" style="width: 100px;">날짜</th>
							<th class="text-center" style="width: 70px;">조회수</th>
						</tr>
					</thead>
					<tbody>
			<c:forEach var="dto" items="${list}">
				<tr>
					<td class="text-center">${dto.listNum}</td>
					<td><a href="javascript:articleBoard('${dto.num}', '${pageNo}');">${dto.subject}</a></td>
					<td class="text-center">${dto.userName}</td>
					<td class="text-center">${dto.created}</td>
					<td class="text-center">${dto.hitCount}</td>
				</tr>
			</c:forEach>
					</tbody>
				</table>
			</div>
		</c:if>
			<div class="paging" style="text-align: center; min-height: 50px; line-height: 50px;">
				<c:if test="${dataCount==0}">등록된 게시물이 없습니다.</c:if>
				<c:if test="${dataCount!=0}">${paging}</c:if>
			</div>
			<div style="clear: both;">
				<div style="float: left; width: 20%; min-width: 85px;">
					<button type="button" class="btn btn-default btn-sm" onclick="reloadBoard();">새로고침</button>
				</div>
				<div style="float: left; width: 60%; text-align: cetner;">
					<form name="searchForm" action="" method="post" class="form-inline">
						<select class="form-control input-sm" name="condition">
							<option value="all" 	 ${condition=="all"?"selected='selected'":""}>모두</option>
							<option value="subject"  ${condition=="subject"?"selected='selected'":""}>제목</option>
							<option value="content"  ${condition=="content"?"selected='selected'":""}>내용</option>
							<option value="userName" ${condition=="userName"?"selected='selected'":""}>작성자</option>
							<option value="created"  ${condition=="created"?"selected='selected'":""}>등록일</option>
						</select>
						<input type="text" class="form-control input-sm input-search" name="keyword" value="${keyword}">
						<button type="button" class="btn btn-info btn-sm btn-search" onclick="searchList();"><span class="glyphicon glyphicon-search"></span>검색</button>
					</form>
				</div>
				<div style="float: left; width: 20%; min-width: 85px; text-align: right;">
					<button type="button" class="btn btn-primary btn-sm" onclick="insertForm();"><span class="glyphicon glyphicon glyphicon-pencil"></span>글쓰기</button>
				</div>
			</div>
		</div>