<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
	<form method="post"
		action="${contextPath}/schedule/modifySchedule?targetYear=${targetYear}&targetMonth=${targetMonth}&targetDay=${targetDay}"
		class="modifyScheduleAct">
<br>
	<div class="center">
		<h2>${targetYear}년 ${targetMonth}월 ${targetDay}일 일정 수정</h2>
		<input type="hidden" name="scheduleNo" value="${schedule.scheduleNo}">
	</div>	

		<table>
			<tr>
				<th>메모</th>
				<!-- <th>이모지</th> -->
				
			</tr>
			<tr>
				<th><textarea name="scheduleMemo" class="scheduleMemo" rows="10" cols="160" style="resize: none;">${schedule.scheduleMemo}</textarea></th>			
				<%-- <td><input type="" name="scheduleEmoji" value="${schedule.scheduleEmoji}" class="scheduleEmoji"></td> --%>
			</tr>
		</table>
		<button type="button" class="btn btn-outline-info , modifyScheduleBtn">수정하기</button>
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