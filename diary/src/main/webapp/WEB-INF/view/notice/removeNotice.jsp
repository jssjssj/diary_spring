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
	<form action="${contextPath}/removeNotice" method="post"
		class="removeNoticeAct">
		<input type="hidden" name="noticeNo" value="${notice.noticeNo}">
		<div>작성 시 등록한 PW를 입력하세요</div>
		<div>
			<input type="password" name="noticePw" class="noticePw">
		</div>
		<button type="button" class="removeNoticeBtn">삭제</button>
	</form>
</body>
<script>
	$('.removeNoticeBtn').click(function() {
		if ($('.noticePw').val().length < 1) {
			alert('삭제를 위해 작성 시 입력한 PW를 입력하세요');
			return;
		} else {
			$('.removeNoticeAct').submit();
		}
	});
</script>
</html>

