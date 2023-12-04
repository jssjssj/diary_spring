<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<form action="${contextPath}/removeMember" method="post" class="removeMemberAct">
		<div>탈퇴를 위해 PW를 입력하세요</div>
		<div><input type="password" name="memberPw" class="memberPw"></div>
			<button type="button" class="removeMemberBtn">탈퇴하기</button>
	</form>
</body>
<script type="text/javascript">
	$('.removeMemberBtn').click(function() {
		if($('.memberPw').val().length<1){
			alert('PW를 입력하세요');
			return;
		} else {
			$('.removeMemberAct').submit();
		}
	});
</script>
</html>