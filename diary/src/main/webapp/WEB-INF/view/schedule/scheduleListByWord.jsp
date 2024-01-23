<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
		<h4>ID : ${loginMember.memberId}</h4>
	
		<c:if test="${resultMap.word==''}">전체 일정</c:if>	
		
		<c:if test="${resultMap.word!=''}">
			<div>'${resultMap.word}'가 포함된 일정</div>
		</c:if>
	</div>
	<br>
		<div class="center">
	<form action="${contextPath}/schedule/scheduleListByWord" method="get">
		<input type="text" name="word">
		<button type="submit">🍳</button>
	</form>
		</div>
	<c:if test="${resultMap.list.size()!=0}">
		<div>
			<table class="table table-hover">
				<tr>
					<th>메모</th>
					<th>일정일자</th>
				</tr>

				<c:forEach var="s" items="${resultMap.list}">
					<tr>
						<td>${s.scheduleMemo}</td>
						<td><a
							href="${contextPath}/schedule/scheduleOneByDay?scheduleDate=${s.scheduleDate}">${s.scheduleDate}</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</c:if>
	
	<!-- 페이징버튼 -->	
		<div class="center">
	<c:if test="${resultMap.currentPage != 1}">
		<a href="${contextPath}/schedule/scheduleListByWord?currentPage=1&word=${resultMap.word}" class="btn btn-primary">맨앞</a>
		<a href="${contextPath}/schedule/scheduleListByWord?currentPage=${resultMap.currentPage-1}&word=${resultMap.word}" class="btn btn-primary">이전</a>
	</c:if>
	
	<c:if test="${resultMap.currentPage != resultMap.lastPage}">
		<a href="${contextPath}/schedule/scheduleListByWord?currentPage=${resultMap.currentPage+1}&word=${resultMap.word}" class="btn btn-primary">다음</a>
		<a href="${contextPath}/schedule/scheduleListByWord?currentPage=${resultMap.lastPage}&word=${resultMap.word}" class="btn btn-primary">맨뒤</a>
	</c:if>
		</div>
		

</body>
</html>