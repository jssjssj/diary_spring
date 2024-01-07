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
	<jsp:include page="/WEB-INF/view/inc/menubar.jsp"></jsp:include>

	<form action="${contextPath}/removeMember" method="post"
		class="removeMemberAct">
		<div>탈퇴를 위해 PW를 입력하세요</div>
		<div>
			<input type="password" name="memberPw" class="memberPw">
		</div>
		<button type="button" class="removeMemberBtn">탈퇴하기</button>
	</form>
</body>
<script>
	$('.removeMemberBtn').click(function() {
		if ($('.memberPw').val().length < 1) {
			alert('PW를 입력하세요');
			return;
		} else {
			$('.removeMemberAct').submit();
		}
	});
</script>
</html>