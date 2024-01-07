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



