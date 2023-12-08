<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<form method="post"
		action="${contextPath}/modifySchedule?targetYear=${targetYear}&targetMonth=${targetMonth}&targetDay=${targetDay}"
		class="modifyScheduleAct">
		<h2>${targetYear}-${targetMonth+2}-${targetDay}일정 수정</h2>
		<input type="hidden" name="scheduleNo" value="${schedule.scheduleNo}">
		<table>
			<tr>
				<th>메모</th>
				<!-- <th>이모지</th> -->
				
			</tr>
			<tr>
				<td><textarea rows="10" cols="50" name="scheduleMemo" class="scheduleMemo">${schedule.scheduleMemo}</textarea></td>			
				<%-- <td><input type="" name="scheduleEmoji" value="${schedule.scheduleEmoji}" class="scheduleEmoji"></td> --%>
			</tr>
		</table>
		<button type="button" class="btn btn-outline-secondary , modifyScheduleBtn">수정하기</button>
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