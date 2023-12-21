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
	<span>
		<a href="${contextPath}/logout"><button class="btn btn-outline-info" type="button">로그아웃</button></a>
		<a href="${contextPath}/modifyMember"><button class="btn btn-outline-info" type="button">정보수정</button>	</a>
		<%-- <!-- 회원탈퇴 - MariaDB 외래키 NO ACTION 설정 문제로 쿼리 등은 만들었으나 보류 --><a href="${pageContext.request.contextPath}/removeMember?memberNo=${loginMember.memberNo}">
			<button type="button">회원탈퇴</button></a> --%>
	</span>
			
	<span class="right">
		<a href="${contextPath}/home"><button class="btn btn-outline-info" type="button">Home</button></a>
		<a href="${contextPath}/noticeList"><button class="btn btn-outline-info" type="button">공지사항</button></a>
	</span>
<div class="center">
	
	
	<br>
	<br>
	<br>
	<h3>댓글PW 입력</h3>
	<br>
	<br>
	<br>
	
	<form method="post" action="${contextPath}/removeComment"
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