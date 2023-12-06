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
	<table border="1">
		<tr>
		
		<td>no</td>
		<td>메모</td>
		<td>일정날짜</td>
		</tr>
		
		<c:forEach var="s" items="${list}">
			<tr>
				<td>${s.scheduleNo}</td>
				<td>${s.scheduleMemo}</td>
				<td><a href="${contextPath}/scheduleOneByDay?targetYear=&targetMonth=&targetDay=">${s.scheduleDate}</a></td>
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