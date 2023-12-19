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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
	<form action="${contextPath}/removeNotice" method="post"
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

