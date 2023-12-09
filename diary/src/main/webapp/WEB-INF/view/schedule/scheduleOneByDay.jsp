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
	<form method="post" class="addScheduleAct"
		action="${contextPath}/addSchedule?targetYear=${targetYear}&targetMonth=${targetMonth}&targetDay=${targetDay}">
		<div class="center">
			<input type="hidden" name="scheduleDate"
				value="${targetYear}-${targetMonth+2}-${targetDay}"><br>
			<textarea style="width: 80%" name="scheduleMemo" class="scheduleMemo"></textarea>
			<br>
			<button type="button" class="addScheduleBtn , btn btn-outline-info">
				일정 추가</button>
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