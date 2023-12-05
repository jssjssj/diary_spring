<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath}" var="contextPath"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
				<h2>삭제를 위해 작성 시 입력한 댓글PW를 입력해주세요</h2>
	<form method="post" action="${contextPath}/removeComment" class="removeCommentAct">	
	
		<div><input type="hidden" name="commentNo" value="${comment.commentNo}">
				<input type="hidden" name="noticeNo" value="${comment.noticeNo}"></div> <!-- 삭제 후 리다이렉트위한 파라미터값 전달 -->
				
				
		<div>댓글내용 : <input type="text" name="commentContent" value="${comment.commentContent}" readonly></div>
		<div>댓글 PW : <input type="password" name="commentPw" class="commentPw"></div>
				<button type="button" class="removeCommentBtn">삭제하기</button>
	</form>
</body>
	<script>
		$('.removeCommentBtn').click(function() {
			if($('.commentPw').val().length<1) {
				alert('댓글 작성 시 입력한 pw를 입력하세요');
				return;
			} else {
				$('.removeCommentAct').submit();
			}
		});	
	</script>
</html>