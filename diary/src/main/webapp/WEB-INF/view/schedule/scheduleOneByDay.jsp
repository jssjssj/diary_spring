<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<h2>${loginMember.memberId}님의${targetYear}년${targetMonth+2}월
		${targetDay}일 일정</h2>
	<table border="1">
		<tr>
			<!-- <td>스케쥴 임티</td>  <-- 추후 예정 !  -->
			<td>스케쥴 메모</td>
			<td>작성일</td>
			<td>수정/삭제</td>
		</tr>

		<c:forEach var="s" items="${scheduleList}">
			<tr>
				<!-- <td><input type="text" name="scheduleEmoji" value="${s.scheduleEmoji}" class="scheduleEmoji"> </td> -->
				<td><input type="hidden" name="scheduleNo"
					value="${s.scheduleNo}"> <input type="text"
					name="scheduleMemo" value="${s.scheduleMemo}" readonly></td>
				<td>${s.createdate}</td>
				<td colspan="2"><a
					href="${contextPath}/modifySchedule?scheduleNo=${s.scheduleNo}&scheduleMemo=${s.scheduleMemo}&targetYear=${targetYear}&targetMonth=${targetMonth}&targetDay=${targetDay}"><button
							type="button">수정</button></a> <a
					href="${contextPath}/removeSchedule?scheduleNo=${s.scheduleNo}&targetYear=${targetYear}&targetMonth=${targetMonth}&targetDay=${targetDay}"><button
							type="button">삭제</button></a></td>
			</tr>
		</c:forEach>
	</table>

	<form method="post" class="addScheduleAct"
		action="${contextPath}/addSchedule?targetYear=${targetYear}&targetMonth=${targetMonth}&targetDay=${targetDay}">
		<input type="hidden" name="scheduleDate"
			value="${targetYear}-${targetMonth+2}-${targetDay}"> 스케쥴 추가<br>
		<textarea rows="10" cols="50" name="scheduleMemo" class="scheduleMemo"></textarea>

		<button type="button" class="addScheduleBtn">등록</button>
	</form>
</body>
<script>
	$('.addScheduleBtn').click(function() {
		if ($('.scheduleMemo').val().length < 1) {
			alert('메모를 입력하세요');
			return;
		} else {
			$('.addScheduleAct').submit();
		}
	});
</script>
</html>