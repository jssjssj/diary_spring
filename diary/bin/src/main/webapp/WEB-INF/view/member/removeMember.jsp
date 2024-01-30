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


	<form action="${contextPath}/member/removeMember" method="post"
		id="removeMemberAct">
		탈퇴를 위해 PW를 입력하세요
		<table>
			<tr>
				<td>ID</td>
				<td><input readonly="readonly" value="${ member.memberId }" name="memberId"></td>
			</tr>
			
			<tr>
				<td>PW</td>
				<td><input type="password" name="memberPw" id="memberPw" placeholder="PW입력"></td>
			</tr>
		</table>
		<button type="button" class="btn btn-outline-danger" id="removeMemberBtn">탈퇴하기</button>
	</form>

</body>
<script>
	$('#removeMemberBtn').click(function() {
		if ($('#memberPw').val().length < 1) {
			alert('PW를 입력하세요');
			return;
		} else {
			$('#removeMemberAct').submit();
		}
	});
</script>
</html>