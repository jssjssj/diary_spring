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
				<h2 class="center">${targetYear}년${targetMonth+2}월
				${targetDay}일 일정</h2>
			</div>
			<div>
				ID:${loginMember.memberId}
			</div>
		</div>

				<br>
	<table style="text-align:center">
		<thead>
			<tr>
				<!-- <td>스케쥴 이모지</td>  <-- 추후 예정 !  -->
				<th>메모</th>
				<th>작성일</th>
				<th>수정/삭제</th>
			</tr>
		</thead>
		<c:forEach var="s" items="${scheduleList}">
			<tr>
				<!-- <td><input type="text" name="scheduleEmoji" value="${s.scheduleEmoji}" class="scheduleEmoji"> </td> -->
				<td><input type="hidden" name="scheduleNo"
					value="${s.scheduleNo}">${s.scheduleMemo}</td>
				<td>${s.createdate}</td>
				<td colspan="2"><a
					href="${contextPath}/modifySchedule?scheduleNo=${s.scheduleNo}&scheduleMemo=${s.scheduleMemo}&targetYear=${targetYear}&targetMonth=${targetMonth}&targetDay=${targetDay}">
						<button class="btn btn-outline-info" type="button">수정</button>
				</a> <a
					href="${contextPath}/removeSchedule?scheduleNo=${s.scheduleNo}&targetYear=${targetYear}&targetMonth=${targetMonth}&targetDay=${targetDay}"><button
							class="btn btn-outline-info" type="button">삭제</button></a></td>
			</tr>
		</c:forEach>
	</table>
	<br>
			<div class="center">하단 클릭 시 메모추가 가능</div>
	<form method="post" class="addScheduleAct"
		action="${contextPath}/addSchedule?targetYear=${targetYear}&targetMonth=${targetMonth}&targetDay=${targetDay}">
		<div class="center">
			<input type="hidden" name="scheduleDate"
				value="${targetYear}-${targetMonth+2}-${targetDay}"><br>
			<textarea name="scheduleMemo" class="scheduleMemo"></textarea>
			<br>
			<button type="button" class="addScheduleBtn , btn btn-outline-info">
				등록</button>
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