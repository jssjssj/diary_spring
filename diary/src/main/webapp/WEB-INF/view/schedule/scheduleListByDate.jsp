<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="${contextPath}/css/d1.css" rel="stylesheet">
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
	<div>
		<c:if test="${(year!=null && year!='')}">
			${year}년
		</c:if>
		<c:if test="${(month!=null && month!='')}">
			${month}월
		</c:if>
		<c:if test="${(day!=null && day!='')}">
			${day}일
		</c:if>
		<c:if
			test="${(year == null || year == '') && 
					(month == null || month == '') && 
					(day == null || day == '')}">
		전체
		</c:if>
		일정
	</div>
</div>
	
	
	<form action="${contextPath}/scheduleListByDate" method="get"
		class="selectAct">
		<br>
		<div>조회할 연, 월, 일 을 입력하세요</div>
		<select name="year" class="year">
			<option value="">선택안함</option>
			<c:forEach var="i" begin="${resultMap.maxMinMap.minYear}"
				end="${resultMap.maxMinMap.maxYear}" step="1">
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

	


	<c:if test="${resultMap.list.size() != 0}">
		<div>
			<table class="table table-hover">
				<tr>
					<td>메모</td>
					<td>일정일자</td>
				</tr>

				<c:forEach var="list" items="${resultMap.list}">
					<tr>
						<td>${list.scheduleMemo}</td>
						<td><a
							href="${contextPath}/scheduleOneByDay?scheduleDate=${list.scheduleDate}">${list.scheduleDate}</a></td>
					</tr>
				</c:forEach>

			</table>
		</div>
	</c:if>
	<c:if test="${resultMap.list.size() == 0}">
		<div>해당 날짜의 일정이 없습니다.</div>
		<c:if
			test="${year != null && year !='' && month != null && month != '' && day != null && day != ''}">
			<div>
				<a
					href="${contextPath}/scheduleOneByDay?targetYear=${year}&targetMonth=${month-2}&targetDay=${day}"><button
						type="button">스케쥴 등록</button></a>
			</div>
		</c:if>
	</c:if>
	
	<!-- 페이징 버튼 -->
		<div class="center">
	<c:if test="${resultMap.currentPage != 1}">
		<a
			href="${contextPath}/scheduleListByDate?currentPage=1&year=${year}&month=${month}&day=${day}"><button class="btn btn-primary"
				type="button">맨앞</button></a>
		<a
			href="${contextPath}/scheduleListByDate?currentPage=${resultMap.currentPage-1}&year=${year}&month=${month}&day=${day}"><button class="btn btn-primary"
				type="button">이전</button></a>
	</c:if>

	<c:if test="${resultMap.currentPage != resultMap.lastPage}">
		<a
			href="${contextPath}/scheduleListByDate?currentPage=${resultMap.currentPage+1}&year=${year}&month=${month}&day=${day}"><button class="btn btn-primary"
				type="button">다음</button></a>
		<a
			href="${contextPath}/scheduleListByDate?currentPage=${resultMap.lastPage}&year=${year}&month=${month}&day=${day}"><button class="btn btn-primary"
				type="button">맨뒤</button></a>
	</c:if>
		</div>

	
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
</script>
</html>