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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="${contextPath}/css/d1.css" rel="stylesheet">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<span>
		<a href="${contextPath}/logout"><button class="btn btn-outline-info" type="button">로그아웃</button></a>
		<a href="${contextPath}/modifyMember"><button class="btn btn-outline-info" type="button">정보수정</button>	</a>
		<%-- <!-- 회원탈퇴 - MariaDB 외래키 NO ACTION 설정 문제로 쿼리 등은 만들었으나 보류 --><a href="${pageContext.request.contextPath}/removeMember?memberNo=${loginMember.memberNo}">
			<button type="button">회원탈퇴</button></a> --%>
	</span>
			
	<span class="right">
		<a href="${contextPath}/home"><button class="btn btn-outline-info" type="button">Home</button></a>
		<a href="${contextPath}/noticeList"><button class="btn btn-outline-info" type="button">공지사항</button></a>
	</span>

	<div class="center">
		<h4>ID : ${loginMember.memberId}</h4>
	
		<c:if test="${resultMap.word==''}">전체 일정</c:if>	
		
		<c:if test="${resultMap.word!=''}">
			<div>'${resultMap.word}'가 포함된 일정</div>
		</c:if>
	</div>
	<br>
		<div class="center">
	<form action="${contextPath}/scheduleListByWord" method="get">
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
							href="${contextPath}/scheduleOneByDay?scheduleDate=${s.scheduleDate}">${s.scheduleDate}</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</c:if>
	
	<!-- 페이징버튼 -->	
		<div class="center">
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