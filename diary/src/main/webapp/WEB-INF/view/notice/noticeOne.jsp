<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> 공지상세 </h1>
						<form method="post" action=""></form>
	<table border="1">
	
		<tr>
			<td>공지번호</td>				
			<td>${notice.noticeNo}</td>
		</tr>
			
		<tr>
			<td>제목</td>		
			<td>${notice.noticeTitle}</td>				
		</tr>
		
		
		<tr>
			<td>내용</td>			
			<td>${notice.noticeContent}</td>
		</tr>
		
		
		<tr>
			<td>작성일</td>		
			<td>${notice.createdate}</td>
		</tr>
			
	</table>
	<br><br><br><br><br><br>
	
		<table border="1">
		
			<tr>
				<td>작성자</td>
				<td>댓글내용</td>
			<%-- 		<c:if test="${loginMember.memberLevel==1">
				<td>삭제</td>
					</c:if>	 --%>
			</tr>	
			
		<c:forEach var="c" items="${commentList}">
			<tr>
				<td>${c.memberId}</td>			
				<td>${c.commentContent}</td>
			<%-- 		<c:if test="${loginMember.memberLevel==1">
				<td><a href="${contextPath}/removeComment?commentNo=${c.commentNo}"><button type="button">삭제</button></a></td>
					</c:if>		 --%>
			</tr>
		</c:forEach>
		</table>	
		
			<c:if test="${currentPage!=1}">
		<a href="${contextPath}/noticeOne?currentPage=1&noticeNo=${notice.noticeNo}"><button type="button">맨앞</button></a>
		<a href="${contextPath}/noticeOne?currentPage=${currentPage-1}&noticeNo=${notice.noticeNo}"><button type="button">이전</button></a>
			</c:if>
			
			<c:if test="${currentPage!=lastPage}">
		<a href="${contextPath}/noticeOne?currentPage=${currentPage+1}&noticeNo=${notice.noticeNo}"><button type="button">다음</button></a>
		<a href="${contextPath}/noticeOne?currentPage=${lastPage}&noticeNo=${notice.noticeNo}"><button type="button">맨뒤</button></a>
			</c:if>
		 
			
</body>
</html>