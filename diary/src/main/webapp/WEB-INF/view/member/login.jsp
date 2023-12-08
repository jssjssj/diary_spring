<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<form method="post" action="${contextPath}/login" class="loginAct">
		<table>
			<tr>
				<td>ID</td>
				<td><input type="text" name="memberId" class="memberId"></td>
			</tr>

			<tr>
				<td>PW</td>
				<td><input type="password" name="memberPw" class="memberPw"></td>
			</tr>
		</table>
		<button type="button" class="loginBtn">로그인</button>
		<a href="${contextPath}/addMember"><button type="button">회원가입</button></a>
	</form>
</body>
<script>
	$('.loginBtn').click(function() {
		if ($('.memberId').val().length < 1) {
			alert('ID를 입력하세요');
			return;
		} else if ($('.memberPw').val().length < 1) {
			alert('PW를 입력하세요');
			return;
		} else {
			$('.loginAct').submit();
		}
	});
</script>
</html>