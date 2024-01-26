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
	<br>
	<form action="${contextPath}/notice/removeNotice" method="post"
		class="removeNoticeAct">
		<div class="menubar">
		<br>
		<input type="hidden" name="noticeNo" value="${notice.noticeNo}">
		<div>작성 시 등록한 PW를 입력하세요</div>
			<br>
		<div>
			<input type="password" name="noticePw" class="noticePw">
		</div>
			<br>
		</div>	
	</form>	
			<br>
	<button type="button" class="removeNoticeBtn btn btn-outline-info">삭제</button>
	</div>
	
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

