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
	
	<br>
			
		<div class="center">
		
	<h1>공지수정</h1>
	
	</div>
	<form method="post" action="${contextPath}/notice/modifyNotice"
		class="modifyAct">
		<table class="table">

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
					<textarea rows="30" cols="150" name="noticeContent" class="noticeContent">${paramNotice.noticeContent}</textarea>
				</td>
			</tr>

			<tr>
				<td>작성일</td>
				<td><input type="text" readonly="readonly"
					value="${paramNotice.createdate}">
				<button type="button" class="modifyBtn btn btn-outline-info">수정</button>	
				</td>
			</tr>

		</table>
		
			<br>
			<br>
			<br>
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