<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Home</h1>

	<span>${loginMember.memberId}님 반갑습니다</span><br>
	
				
			<!-- 회원탈퇴 - MariaDB 외래키 NO ACTION 설정 문제로 쿼리 등은 만들었으나 보류 -->
	<%-- <a href="${pageContext.request.contextPath}/removeMember?memberNo=${loginMember.memberNo}"><button type="button">회원탈퇴</button></a> --%> 
	
	<br>
	<div>
		<a href="${contextPath}/logout"><button type="button">로그아웃</button></a>
		<a href="${contextPath}/modifyMember"><button type="button">정보수정</button></a>	
	</div>
	<div><a href="${contextPath}/noticeList"><button type="button">공지사항</button></a></div>	<br>
	
	<a href="${contextPath}/scheduleListByDate"><button type="button">날짜로 메모찾기</button></a>
	<a href="${contextPath}/scheduleListByWord"><button type="button">단어로 메모찾기</button></a>
	
	
	<!-- 캘린더 -->
	
	<h3  class="center">
		${calendarMap.targetYear}년
		${calendarMap.targetMonth + 1}월
	</h3>
	
	<div>
		<a href="${contextPath}/home?targetMonth=${calendarMap.targetMonth-1}&targetYear=${calendarMap.targetYear}"><button type="button" class="btn btn-outline-success">이전달</button></a>
		<a href="${contextPath}/home?targetMonth=${calendarMap.targetMonth+1}&targetYear=${calendarMap.targetYear}"><button type="button" class="btn btn-outline-success">다음달</button></a>
	</div>
		
	<table class= "table table-bordered , table-striped"> 
			<thead>
		<tr>
			<th style="color:Tomato;">일</th>
			<th>월</th>
			<th>화</th>
			<th>수</th>
			<th>목</th>
			<th>금</th>
			<th style="color:DodgerBlue;">토</th>
		</tr>
			</thead>
		<tr>
		
			<c:forEach var="i" begin="1" end="${calendarMap.totalTd}"> 
			
				<c:set var="d" value="${i-calendarMap.beginBlank}" />
				
				<td>
					<c:if test="${d < 1 || d> calendarMap.lastDate}"> &nbsp; </c:if>
					<c:if test="${!(d < 1 || d> calendarMap.lastDate)}">
					${d}
				<c:forEach var="s" items="${scheduleList}">
					<c:if test="${d == s.day}"><div>일정 ${s.cnt}개</div><%-- ${s.memo} // 메모 미리보기 : 가독성문제로 보류  --%></c:if>
			</c:forEach>
					<div>
					<a href="${contextPath}/scheduleOneByDay?targetMonth=${calendarMap.targetMonth-1}&targetYear=${calendarMap.targetYear}&targetDay=${d}">
					<button type="button" class="btn btn-outline-secondary">조회</button>
					</a>
					</div>
			
					</c:if> <!-- 한 행 당 7열 -->
					<c:if test="${i<calendarMap.totalTd && i%7==0}">
						</tr>
						<tr>
					</c:if>
				</td>
				
			</c:forEach>	
			
		</tr>
			
	</table>
			
	
			
	

</body>
</html> 
