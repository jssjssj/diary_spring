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
	<form method="post" action="${contextPath}/addMember"
		class="addMemberAct">
		
		<table>
			<tr>
				<td>ID</td>
				
				<c:if test="${alreadyId==null}">
				<td><input type="text" name="memberId" class="memberId"></td>
				</c:if>
				
				<c:if test="${alreadyId!=null}">
				<td colspan="2"><input type="text" name="memberId" class="memberId">
				${alreadyId}</td>	<!-- 중복체크될 시 ID입력창 및 중복안내 메시지 함께표시 -->
				</c:if>					
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