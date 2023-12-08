<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<h1>공지 작성</h1>

	<form method="post"
		action="${pageContext.request.contextPath}/addNotice"
		class="addNoticeAct">
		<table>

			<tr>
				<td>제목</td>
				<td><input type="text" name="noticeTitle" class="noticeTitle"></td>
			</tr>

			<tr>
				<td>내용</td>
				<td><input type="text" name="noticeContent"
					class="noticeContent"></td>
			</tr>

			<tr>
				<td>등록PW</td>
				<td><input type="password" name="noticePw" class="noticePw"></td>
			</tr>

		</table>
		<button type="button" class="addNoticeBtn">등록</button>
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