<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1> 공지사항 </h1>
		<c:if test="${loginMember.memberLevel == 1}">
	<a href="${pageContext.request.contextPath}/addNotice"><button type="button">공지추가</button></a>	
		</c:if>
	<a href="${contextPath}/home"><button type="button">홈으로</button></a>
	<table border="1">
		<tr>
				<th>공지번호</th>
				<th>제목</th>				
				<th>등록일</th>
			<c:if test="${loginMember.memberLevel == 1}">
				<th>수정/삭제</th>
			</c:if>
		</tr>	
		
			<c:forEach var="n" items="${list}">
		<tr>
				<td>${n.noticeNo}</td>
				<td><a href="${contextPath}/noticeOne?noticeNo=${n.noticeNo}">${n.noticeTitle}</a></td>
				<td>${n.createdate}</td>
			<c:if test="${loginMember.memberLevel == 1}">
				<td colspan="2"><a href="${contextPath}/modifyNotice?noticeNo=${n.noticeNo}"><button type="button">수정</button></a>
								<a href="${contextPath}/removeNotice?noticeNo=${n.noticeNo}"><button type="button">삭제</button></a></td>
			</c:if>
		</tr>
			</c:forEach>				
	</table>
		<c:if test="${currentPage!=1}">
	<a href="${contextPath}/noticeList?currentPage=1"><button type="button">처음</button></a>	
		
		
	<a href="${contextPath}/noticeList?currentPage=${currentPage-1}"><button type="button">이전</button></a>
		</c:if>	
		<c:if test="${currentPage!=lastPage}">
	<a href="${contextPath}/noticeList?currentPage=${currentPage+1}"><button type="button">다음</button></a>	
	
	
	<a href="${contextPath}/noticeList?currentPage=${lastPage}"><button type="button">마지막</button></a>	
		</c:if>
	
	
		
	
</body>
</html>