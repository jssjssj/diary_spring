<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div>${loginMember.memberId}님의 일정</div>
		
	<c:if test="${resultMap.currentPage != 1}">
	<a href="${contextPath}/scheduleListByWord?currentPage=1&word=${word}"><button type="button">맨앞</button></a>
	<a href="${contextPath}/scheduleListByWord?currentPage=${resultMap.currentPage-1}&word=${resultMap.word}"><button type="button">이전</button></a>
	</c:if>
	
	<c:if test="${resultMap.currentPage != resultMap.lastPage}">
	<a href="${contextPath}/scheduleListByWord?currentPage=${resultMap.currentPage+1}&word=${resultMap.word}"><button type="button">다음</button></a>
	<a href="${contextPath}/scheduleListByWord?currentPage=${resultMap.lastPage}&word=${resultMap.word}"><button type="button">맨뒤</button></a>
	</c:if>
		
	
	
	
	<table border="1">
		<tr>		
			<td>메모</td>
			<td>일정일자</td>	
		</tr>
		
		
		<c:forEach var="s" items="${resultMap.list}">
			<tr>
				<td>${s.scheduleMemo}</td>
				<td><a href="${contextPath}/scheduleOneByDay?scheduleDate=${s.scheduleDate}">${s.scheduleDate}</a></td>
			</tr>
		</c:forEach>
	</table>

	<div>
		<form action="${contextPath}/scheduleListByWord" method="get">
			<input type="text" name="word">
			<button type="submit">검색</button>
		</form>
	</div>

</body>
</html>