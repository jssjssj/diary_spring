<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<!-- jQuary -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<style>
	.right{
  	float: right;
	}
	.center{
	text-align: center;
	margin-left: auto;
 	margin-right: auto;
	}
		
</style>
<title>Insert title here</title>
</head>
<body>	
	
<header>
	<nav>
	<span>
	<a href="${contextPath}/logout"><button class="btn btn-outline-info" type="button">로그아웃</button></a>
	<a href="${contextPath}/modifyMember"><button class="btn btn-outline-info" type="button">정보수정</button></a>
	<!-- 회원탈퇴 - MariaDB 외래키 NO ACTION 설정 문제로 쿼리 등은 만들었으나 보류 -->
	<%-- <a href="${pageContext.request.contextPath}/removeMember?memberNo=${loginMember.memberNo}"><button type="button">회원탈퇴</button></a> --%>
	</span>
		
	<span class="right">
	<a href="${contextPath}/noticeList"><button class="btn btn-outline-info" type="button">공지사항</button></a>
	</span>
	</nav>
</header>
		<div style="background-color: #B2EBF4;">
			<div class="center">
						<h1 class="center" style="font-size: 50px">Home</h1>
			<div>ID : ${loginMember.memberId}</div>
			</div>
			
<div>
	<form action="${contextPath}/scheduleListByDate" method="get"
		class="selectAct">
		<div>조회할 연, 월, 일 을 입력하세요</div>
		<select name="year" class="year">
			<option value="">선택안함</option>
			<c:forEach var="i" begin="${maxMinMap.minYear}"
				end="${maxMinMap.maxYear}" step="1">
				<option>${i}</option>
			</c:forEach>
		</select> <select name="month" class="month">
			<option value="">선택안함</option>
			<c:forEach var="i" begin="1" end="12" step="1">
				<option>${i}</option>
			</c:forEach>
		</select> <select name="day" class="day">
			<option value="">선택안함</option>
			<c:forEach var="i" begin="1" end="31" step="1">
				<option>${i}</option>
			</c:forEach>
		</select>
		<button type="button" class="selectBtn">🍳</button>
	</form>
	<form action="${contextPath}/scheduleListByWord" method="get">
		<input type="text" name="word" class="word" value="상세">
		<button type="submit">🍳</button>
	</form>
</div>
</div>
	<!-- 캘린더 Month controller -->
<div class="center">
	<div class="btn-group btn-group-lg">
		<a
			href="${contextPath}/home?targetMonth=${calendarMap.targetMonth-1}&targetYear=${calendarMap.targetYear}"><button
				type="button" class="btn btn-outline-info">◀</button></a> &nbsp;
		<h3 class="center">${calendarMap.targetYear}년
			${calendarMap.targetMonth + 1}월</h3>
		&nbsp; <a
			href="${contextPath}/home?targetMonth=${calendarMap.targetMonth+1}&targetYear=${calendarMap.targetYear}"><button
				type="button" class="btn btn-outline-info">▶</button></a>
		</div>
	</div>

	<table class="table table-bordered">
		<thead>
			<tr>
				<th style="background-color: #4ABFD3; color: Tomato;">일</th>
				<th style="background-color: #4ABFD3; color: white;">월</th>
				<th style="background-color: #4ABFD3; color: white;">화</th>
				<th style="background-color: #4ABFD3; color: white;">수</th>
				<th style="background-color: #4ABFD3; color: white;">목</th>
				<th style="background-color: #4ABFD3; color: white;">금</th>
				<th style="background-color: #4ABFD3; color: DodgerBlue;">토</th>
			</tr>
		</thead>
		<tr>

			<c:forEach var="i" begin="1" end="${calendarMap.totalTd}">

				<c:set var="d" value="${i-calendarMap.beginBlank}" />

				<td><c:if test="${d < 1 || d> calendarMap.lastDate}"> &nbsp; </c:if>
					<c:if test="${!(d < 1 || d> calendarMap.lastDate)}">
					<span style="font-size: 30px;">${d}</span>
				<c:forEach var="s" items="${scheduleList}">
							<c:if test="${d == s.day}">
								<div>일정 ${s.cnt}개</div>
								<%-- ${s.memo} // 메모 미리보기 : 가독성문제로 보류  --%>
							</c:if>
						</c:forEach>
						<div>
							<a
								href="${contextPath}/scheduleOneByDay?targetMonth=${calendarMap.targetMonth-1}&targetYear=${calendarMap.targetYear}&targetDay=${d}">
								<button type="button" class="btn btn-outline-secondary">조회</button>
							</a>
						</div>

					</c:if> <!-- 한 행 당 7열 --> <c:if test="${i<calendarMap.totalTd && i%7==0}">
		</tr>
		<tr>
			</c:if>
			</td>

			</c:forEach>

		</tr>

	</table>



</body>
<script>
	$('.selectBtn')
			.click(
					function() {
						if ($('.year').val().length < 1
								&& $('.month').val().length > 0) {
							alert('연 , 월 , 일 순서로 선택할 수 있습니다');
							return;
						} else if ($('.month').val().length < 1
								&& $('.day').val().length > 0) {
							alert('연 , 월 , 일 순서로 선택할 수 있습니다');
							return;
						} else if (($('.month').val() == 4
								|| $('.month').val() == 6
								|| $('.month').val() == 9 || $('.month').val() == 12)
								&& $('.day').val() == 31) {
							alert('해당 월은 31일이 존재하지 않습니다');
							return;
						} else if ($('.month').val() == 2
								&& $('.day').val() > 29) {
							alert('2월은 29일까지 설정가능합니다');
							return;
						} else {
							$('.selectAct').submit();
						}
					});
	$('.word').focus(function() {
		$('.word').val('');
	});
</script>
</html>
