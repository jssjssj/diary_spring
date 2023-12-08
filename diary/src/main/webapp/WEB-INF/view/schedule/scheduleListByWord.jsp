<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h4>ID : ${loginMember.memberId}</h4>
	<c:if test="${resultMap.word==''}"><div>전체 일정</div></c:if>	
	<c:if test="${resultMap.word!=''}">
		<div>'${resultMap.word}'가 포함된 일정</div>
	</c:if>
	<br>
	


<form action="${contextPath}/scheduleListByWord" method="get">
			<input type="text" name="word">
			<button type="submit">검색</button>
		</form>

	<c:if test="${resultMap.list.size()!=0}">
		<div>
			<table>
				<tr>
					<td>메모</td>
					<td>일정일자</td>
				</tr>

				<c:forEach var="s" items="${resultMap.list}">
					<tr>
						<td>${s.scheduleMemo}</td>
						<td><a
							href="${contextPath}/scheduleOneByDay?scheduleDate=${s.scheduleDate}">${s.scheduleDate}</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</c:if>
	
	<!-- 페이징버튼 -->	
		<div class="btn-group, btn-group-sm">
	<c:if test="${resultMap.currentPage != 1}">
		<a href="${contextPath}/scheduleListByWord?currentPage=1&word=${resultMap.word}"><button type="button" class="btn btn-primary">맨앞</button></a>
		<a href="${contextPath}/scheduleListByWord?currentPage=${resultMap.currentPage-1}&word=${resultMap.word}"><button type="button" class="btn btn-primary">이전</button></a>
	</c:if>
	
	<c:if test="${resultMap.currentPage != resultMap.lastPage}">
		<a href="${contextPath}/scheduleListByWord?currentPage=${resultMap.currentPage+1}&word=${resultMap.word}"><button type="button" class="btn btn-primary">다음</button></a>
		<a href="${contextPath}/scheduleListByWord?currentPage=${resultMap.lastPage}&word=${resultMap.word}"><button type="button" class="btn btn-primary">맨뒤</button></a>
	</c:if>
		</div>
		

</body>
</html>