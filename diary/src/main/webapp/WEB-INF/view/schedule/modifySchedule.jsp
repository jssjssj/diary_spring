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
<form method="post" action="${contextPath}/modifySchedule?targetYear=${targetYear}&targetMonth=${targetMonth}&targetDay=${targetDay}" class="modifyScheduleAct">
	<h2>${targetYear}-${targetMonth+2}-${targetDay} 일정 수정</h2>
								<input type="hidden" name="scheduleNo" value="${schedule.scheduleNo}">
		<table border="1">
			<tr>
				<td>스케쥴 메모</td>
				<td><input type="text" name="scheduleMemo" value="${schedule.scheduleMemo}" class="scheduleMemo"></td>
				<%-- <td><input type="" name="scheduleEmoji" value="${schedule.scheduleEmoji}" class="scheduleEmoji"></td> --%>
			</tr>
		</table>
					<button type="button" class="modifyScheduleBtn">수정하기</button>
</form>
</body>
	<script>
		$('.modifyScheduleBtn').click(function() {
			if($('.scheduleMemo').val().length < 1){
				alert('메모를 입력하세요');
				return;
			} else {
				$('.modifyScheduleAct').submit();
			}
		});
	</script>
</html>