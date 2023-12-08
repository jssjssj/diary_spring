<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js">
</script>
<title>Insert title here</title>
</head>
<body>
	<form method="post" id="modifyMemberAct"
		action="${contextPath}/modifyMember">
		<h1>PW변경</h1>
		<input type="hidden" value="${loginMember.memberNo}">
		<table>
			<tr>
				<th>Id</th>
				<td><input type="text" readonly="readonly"
					value="${loginMember.memberId}"></td>
			</tr>

			<tr>
				<th>현재Pw</th>
				<td><input type="password" name="memberPw" id="memberPw"></td>
			</tr>

			<tr>
				<th>변경Pw</th>
				<td><input type="password" name="memberNewPw" id="memberNewPw"></td>
			</tr>

			<tr>
				<th>변경Pw확인</th>
				<td><input type="password" id="memberNewPwCk"></td>
			</tr>
		</table>
		<button id="modifyMemberBtn" type="button">변경하기</button>
	</form>
</body>

<script>
	$('#modifyMemberBtn').click(function() {
		if ($('#memberPw').val().length < 1) {
			alert("현재 PW를 입력하세요");
			return;
		} else if ($('#memberNewPw').val().length < 1) {
			alert("변경 PW를 입력하세요");
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



