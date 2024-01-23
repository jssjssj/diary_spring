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
	
	
	<br>
	<br>
	<br>
	<h3>댓글PW 입력</h3>
	<br>
	<br>
	<br>
	
	<form method="post" action="${contextPath}/comment/removeComment"
		class="removeCommentAct">

		<div>
			<input type="hidden" name="commentNo" value="${comment.commentNo}">
			<input type="hidden" name="noticeNo" value="${comment.noticeNo}">
		</div>

		<table class="table">
		<tr>
			<td colspan="2">comment
				<input type="text" name="commentContent"
					value="${comment.commentContent}" readonly>
			</td>
		</tr>
		
		<tr>
			<td colspan="2">password
				<input type="password" name="commentPw" class="commentPw">
			</td>
		</tr>
		
		<tr>
			<td></td>
			<td><button type="button" class="removeCommentBtn btn btn-outline-info">삭제</button></td>
		</tr>
		</table>
	</form>
</div>
</body>
<script>
	$('.removeCommentBtn').click(function() {
		if ($('.commentPw').val().length < 1) {
			alert('댓글 작성 시 입력한 PW를 입력하세요');
			return;
		} else {
			$('.removeCommentAct').submit();
		}
	});
</script>
</html>