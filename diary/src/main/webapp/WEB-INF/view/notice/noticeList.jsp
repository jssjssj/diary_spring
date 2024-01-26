<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/view/inc/header.jsp"></jsp:include>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menubar.jsp"></jsp:include>
	
	<div class="center">
	<h1>공지사항</h1>
	</div>
	<c:if test="${loginMember.memberLevel == 1}">
			<div class="center">
		<a href="${pageContext.request.contextPath}/notice/addNotice" class="btn btn-outline-info">공지추가</a>
			</div>
			<br>
	</c:if>
	<table class="table">
		<thead>
			<tr>
				<th>공지번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>등록일</th>
				<c:if test="${loginMember.memberLevel == 1}">
					<th>수정/삭제</th>
				</c:if>
			</tr>
		</thead>
		<c:forEach var="n" items="${list}">
		<tbody>
			<tr>
				<td>${n.noticeNo}</td>
				<td><a href="${contextPath}/notice/noticeOne?noticeNo=${n.noticeNo}">${n.noticeTitle}</a></td>
				<td>
					<c:if test="${ loginMember.memberLevel == 1 }">${ n.memberId }</c:if>
					<c:if test="${ loginMember.memberLevel == 0 }">관리자</c:if>
				</td>
				<td>${n.createdate}</td>
				<c:if test="${loginMember.memberLevel == 1}">
					<td colspan="2"><a class="btn btn-outline-info"
						href="${contextPath}/notice/modifyNotice?noticeNo=${n.noticeNo}">수정</a> <a class="btn btn-outline-info"
						href="${contextPath}/notice/removeNotice?noticeNo=${n.noticeNo}">삭제</a></td>
				</c:if>
			</tr>
		</tbody>
		</c:forEach>
	</table>
	
	<!-- 페이징 버튼 -->
	<div class="pagination justify-content-center">
		<c:if test="${ currentPage > 1 }">
			<a class="page-link paging" href="/notice/noticeList?currentPage=${ currentPage-1 }">이전</a>
		</c:if>
			<a class="page-link paging">${ currentPage }</a>
		<c:if test="${ currentPage < lastPage }">
			<a class="page-link paging" href="/notice/noticeList?currentPage=${ currentPage+1 }">다음</a>
		</c:if>
    </div>
	
</body>
</html>