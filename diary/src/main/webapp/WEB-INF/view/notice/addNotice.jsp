<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<h2>공지 작성</h2>
	</div>
	<form method="post"
		action="${pageContext.request.contextPath}/addNotice"
		class="addNoticeAct">
		<table class="table">

			<tr>
				<td>제목</td>
				<td><input type="text" name="noticeTitle" class="noticeTitle"></td>
			</tr>

			<tr>
				<td>내용</td>
				<td><textarea cols="100" rows="20" name="noticeContent"
					class="noticeContent"></textarea>
			</tr>

			<tr>
				<td>등록PW</td>
				<td>
					<input type="password" name="noticePw" class="noticePw">
					<button type="button" class="addNoticeBtn btn btn-outline-info">등록</button>
				</td>
			</tr>
		</table>
		
		<input type="hidden" name="memberId" value="${loginMember.memberId}">
	</form>
</body>
<script>
	$('.addNoticeBtn').click(function() {
		if ($('.noticeTitle').val().length < 1) {
			alert('제목을 입력하세요');
			return;
		} else if ($('.noticeContent').val().length < 1) {
			alert('내용을 입력하세요');
			return;
		} else if ($('.noticePw').val().length < 1) {
			alert('등록PW를 입력하세요');
			return;
		} else {
			$('.addNoticeAct').submit();
		}
	});
</script>
</html>