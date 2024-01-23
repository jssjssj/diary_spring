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

		 <div class="center">
			<div>
				<h2 class="center">${targetYear}년${targetMonth}월
				${targetDay}일 일정</h2>
			</div>
			<div>
				ID:${loginMember.memberId}
			</div>
		</div>

				<br>
	<table class="table table-hover">
		<thead>
			<tr>
				<!-- <td>스케쥴 이모지</td>  <-- 추후 예정 !  -->
				<th>메모</th>
				<th>작성일</th>
				<th>수정/삭제</th>
			</tr>
		</thead>
		<c:forEach var="s" items="${scheduleList}">
			<tbody>
				<tr>
					<!-- <td><input type="text" name="scheduleEmoji" value="${s.scheduleEmoji}" class="scheduleEmoji"> </td> -->
					<td><input type="hidden" name="scheduleNo"
						value="${s.scheduleNo}">${s.scheduleMemo}</td>
					<td>${s.createdate}</td>
					<td colspan="2"><a class="btn btn-outline-info"
						href="${contextPath}/schedule/modifySchedule?scheduleNo=${s.scheduleNo}&scheduleMemo=${s.scheduleMemo}&targetYear=${targetYear}&targetMonth=${targetMonth}&targetDay=${targetDay}">
							수정	</a> 
							<a class="btn btn-outline-info"
						href="${contextPath}/schedule/removeSchedule?scheduleNo=${s.scheduleNo}&targetYear=${targetYear}&targetMonth=${targetMonth}&targetDay=${targetDay}">삭제</a></td>
				</tr>
			</tbody>
		</c:forEach>
	</table>
	<br>
	<form method="post" class="addScheduleAct"
		action="${contextPath}/schedule/addSchedule?targetYear=${targetYear}&targetMonth=${targetMonth}&targetDay=${targetDay}">
		<div class="center">
			<input type="hidden" name="scheduleDate"
				value="${targetYear}-${targetMonth+2}-${targetDay}"><br>
			<textarea name="scheduleMemo" class="scheduleMemo" rows="10" cols="100" style="resize: none;"></textarea>
			<br>
			<button type="button" class="addScheduleBtn , btn btn-outline-info">
				추가</button>
		</div>
	</form>
	
	<br>
	<br>
	<br>
	
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