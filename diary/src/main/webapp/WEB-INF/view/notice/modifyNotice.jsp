<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<h1>공지수정</h1>
	<form method="post" action="${contextPath}/modifyNotice"
		class="modifyAct">
		<table>

			<tr>
				<td>공지번호</td>
				<td><input type="text" readonly="readonly" name="noticeNo"
					value="${paramNotice.noticeNo}"></td>
			</tr>

			<tr>
				<td>제목</td>
				<td><input type="text" name="noticeTitle"
					value="${paramNotice.noticeTitle}" class="noticeTitle"></td>
			</tr>


			<tr>
				<td>내용</td>
				<td>
					<textarea rows="10" cols="50" name="noticeContent" class="noticeContent">${paramNotice.noticeContent}</textarea>
				</td>
			</tr>

			<tr>
				<td>작성일</td>
				<td><input type="text" readonly="readonly"
					value="${paramNotice.createdate}"></td>
			</tr>

		</table>
		<button type="button" class="modifyBtn">수정</button>
	</form>
</body>
<script type="text/javascript">
	$('.modifyBtn').click(function() {
		if ($('.noticeTitle').val().length < 1) {
			alert('제목을 입력하세요');
			return;
		} else if ($('.noticeContent').val().length < 1) {
			alert('내용을 입력하세요');
			return;
		} else {
			$('.modifyAct').submit();
		}
	});
</script>
</html>