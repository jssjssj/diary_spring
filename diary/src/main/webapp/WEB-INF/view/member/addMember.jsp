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

	<form method="post" action="${contextPath}/addMember"
		class="addMemberAct">
		
		<table>
			<tr>
				<td>ID</td>
				<td><input type="text" name="memberId" class="memberId"></td>
			</tr>

			<tr>
				<td>PW</td>
				<td><input type="password" name="memberPw" class="memberPw"></td>
			</tr>

			<tr>
				<td>PW확인</td>
				<td><input type="password" class="memberPwCk"></td>
			</tr>
			
			<tr>
				<td></td>
				<td colspan="2">
					<a href="${contextPath}/login"><button type="button" class="btn btn-outline-info">뒤로가기</button></a>
					<button type="button" class="addMemberBtn btn btn-outline-info">가입하기</button>
				</td>
			</tr>
		</table>
		
		
	</form>
</body>
<script>
	$('.addMemberBtn').click(function() {
		if ($('.memberId').val().length < 4) {
			alert('4글자 이상의 ID를 입력하세요');
			return;
		} else if ($('.memberPw').val().length < 4) {
			alert('4글자 이상의 PW를 입력하세요');
			return;
		} else if ($('.memberPw').val() != $('.memberPwCk').val()) {
			alert('PW를 확인하세요');
			return;
		} else {
			$('.addMemberAct').submit();
		}
	});
</script>
</html>