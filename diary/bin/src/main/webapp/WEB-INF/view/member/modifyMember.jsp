<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<!-- jQuary -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
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

		<h1>PW변경</h1>

	<form method="post" id="modifyMemberAct"
	action="${contextPath}/modifyMember">
		<input type="hidden" value="${loginMember.memberNo}">
		<table class="table">
			<tr>
				<td>Id</td>
				<td><input type="text" readonly="readonly"
					value="${loginMember.memberId}"></td>
			</tr>

			<tr>
				<td>현재Pw</td>
				<td><input type="password" name="memberPw" id="memberPw"></td>
			</tr>

			<tr>
				<td>변경Pw</td>
				<td><input type="password" name="memberNewPw" id="memberNewPw"></td>
			</tr>

			<tr>
				<td>변경Pw확인</td>
				<td><input type="password" id="memberNewPwCk"></td>
			</tr>
		</table>
		<button id="modifyMemberBtn" class="btn btn-outline-info" type="button">변경하기</button>
	</form>
</div>
</body>

<script>
	$('#modifyMemberBtn').click(function() {
		if ($('#memberPw').val().length < 1) {
			alert("현재 PW를 입력하세요");
			return;
		} else if ($('#memberNewPw').val().length < 4) {
			alert("변경 PW를 입력하세요(4글자 이상)");
			return;
		} else if ($('#memberNewPw').val() != $('#memberNewPwCk').val()) {
			alert("변경 PW를 확인하세요");
			return;
		} else {
			$('#modifyMemberAct').submit();
		}
	});
</script>














</html>



