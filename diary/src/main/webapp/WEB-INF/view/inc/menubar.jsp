<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<span>
		<a href="./logout"><button class="btn btn-outline-info" type="button">로그아웃</button></a>
		<a href="./modifyMember"><button class="btn btn-outline-info" type="button">정보수정</button>	</a>
		<%-- <!-- 회원탈퇴 - MariaDB 외래키 NO ACTION 설정 문제로 쿼리 등은 만들었으나 보류 --><a href="${pageContext.request.contextPath}/removeMember?memberNo=${loginMember.memberNo}">
			<button type="button">회원탈퇴</button></a> --%>
	</span>
			
	<span class="right">
		<a href="./home"><button class="btn btn-outline-info" type="button">Home</button></a>
		<a href="./noticeList"><button class="btn btn-outline-info" type="button">공지사항</button></a>
	</span>
</body>
</html>