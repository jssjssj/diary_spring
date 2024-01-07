<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/view/inc/header.jsp"></jsp:include>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<form method="post" action="${contextPath}/login" class="loginAct">
		<table class="table table-border">
			<tr>
				<td>ID</td>
				<td><input type="text" name="memberId" class="memberId"></td>
			</tr>

			<tr>
				<td>PW</td>
				<td><input type="password" name="memberPw" class="memberPw"></td>
			</tr>	
			<tr>
				<td></td>
				<td colspan="2">
					<button type="button" class="loginBtn btn btn-outline-info">로그인</button>
					<a href="${contextPath}/addMember"><button type="button" class="btn btn-outline-info">회원가입</button></a>		
				</td>
			</tr>		
		</table>
		
	</form>
</div>

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