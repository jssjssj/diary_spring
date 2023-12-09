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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="${contextPath}/css/d1.css" rel="stylesheet">
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
	
	<form method="post"
		action="${contextPath}/modifySchedule?targetYear=${targetYear}&targetMonth=${targetMonth}&targetDay=${targetDay}"
		class="modifyScheduleAct">
<br>
	<div class="center">
		<h2>${targetYear}-${targetMonth+2}-${targetDay}일정 수정</h2>
		<input type="hidden" name="scheduleNo" value="${schedule.scheduleNo}">
	</div>	

		<table>
			<tr>
				<th style="text-align: center">메모</th>
				<!-- <th>이모지</th> -->
				
			</tr>
			<tr>
				<td><textarea name="scheduleMemo" class="scheduleMemo">${schedule.scheduleMemo}</textarea></td>			
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