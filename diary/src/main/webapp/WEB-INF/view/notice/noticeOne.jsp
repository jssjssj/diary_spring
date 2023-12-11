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

	<div class="center , menubar">
			<br> 
			<br>
		<h2>공지상세</h2>
			<br>
	</div>
			<br>

	<c:if test="${loginMember.memberLevel==1}">
		<div class="center">
			<a href="${contextPath}/modifyNotice?noticeNo=${notice.noticeNo}"><button
					class="btn btn-outline-info" type="button">수정</button></a>
		</div>
	</c:if>

	<table class="table">
		<tr>
			<td>공지번호</td>
			<td>${notice.noticeNo}</td>
		</tr>

		<tr>
			<td>제목</td>
			<td>${notice.noticeTitle}</td>
		</tr>

		<tr>
			<td>내용</td>
			<td><textarea rows="60" readonly>${notice.noticeContent}</textarea></td>
		</tr>

		<tr>
			<td>작성일</td>
			<td>${notice.createdate}</td>
		</tr>
	</table>
	<div class="menubar">
		<br>
			<div class="center">댓글작성 후 삭제가능/수정불가로 신중히 작성해주세요.</div>
		<br>
	</div>
	<div class="center">
		<form method="post" action="${contextPath}/addComment"
			id="addCommentAct">
			<input type="hidden" name="noticeNo" value="${notice.noticeNo}">
			<input type="hidden" name="memberId" value="${loginMember.memberId}">
			<table class="table table-sm">
				<tr>
					<td>댓글내용</td>
					<td><input type="text" name="commentContent"
						id="commentContent"></td>
					<td></td>
					<td></td>
				</tr>

				<tr>
					<td>댓글PW</td>
					<td><input type="password" name="commentPw" id="commentPw"></td>
					<td></td>
					<td></td>
				</tr>

				<tr>
					<td>작성자</td>
					<td>${loginMember.memberId}</td>
					<td><input type="checkbox" name="isSecret" id="isSecret">비밀글</td>
					<td><button class="btn btn-outline-info" type="submit"
							id="addCommentBtn">등록</button></td>

				</tr>
			</table>
		</form>
	</div>

		<br>
		<br>

	<table class="center">
		<tr>
			<th>작성자</th>
			<th>댓글내용</th>			
			<th>삭제</th>
	
		</tr>

		<c:forEach var="c" items="${commentList}">
			<tr>
				<c:if
					test="${c.isSecret=='N' || c.memberId==loginMember.memberId || loginMember.memberLevel==1}">
					<td>${c.memberId}</td>
				</c:if>
				<c:if
					test="${!(c.isSecret=='N' || c.memberId==loginMember.memberId || loginMember.memberLevel==1)}">
					<td>******</td>
				</c:if>

				<c:if test="${c.isSecret=='N'}">
					<td>${c.commentContent}</td>
				</c:if>

				<c:if test="${!(c.isSecret=='N')}">

					<c:if
						test="${loginMember.memberLevel == 1 || c.memberId==loginMember.memberId}">
						<td>${c.commentContent}(비밀글로 작성되었습니다)</td>

					</c:if>


					<c:if
						test="${!(loginMember.memberLevel == 1 || c.memberId==loginMember.memberId)}">
						<td>비밀글 : 관리자만 확인가능</td>
					</c:if>

				</c:if>

				<c:if test="${loginMember.memberLevel == 1}">
					<!-- 관리자용 즉시삭제 -->
					<td><a
						href="${contextPath}/removeComment_manager?commentNo=${c.commentNo}&noticeNo=${notice.noticeNo}"><button
								class="btn btn-outline-info" type="button">삭제</button></a></td>
				</c:if>

				<c:if
					test="${loginMember.memberLevel != 1 && loginMember.memberId == c.memberId}">
					<!--회원용 삭제페이지 이동 -->
					<td><a
						href="${contextPath}/removeComment?commentNo=${c.commentNo}&noticeNo=${notice.noticeNo}&commentContent=${c.commentContent}"><button
								class="btn btn-outline-info" type="button">삭제</button></a></td>
				</c:if>
			</tr>
		</c:forEach>

	</table>

	<!-- 페이징 버튼 -->
			<c:if test="${currentPage!=1}">
				<a href="${contextPath}/noticeOne?currentPage=1&noticeNo=${notice.noticeNo}"><button type="button">맨앞</button></a>
				<a href="${contextPath}/noticeOne?currentPage=${currentPage-1}&noticeNo=${notice.noticeNo}"><button type="button">이전</button></a>
			</c:if>
			
			<c:if test="${currentPage!=lastPage}">
				<a href="${contextPath}/noticeOne?currentPage=${currentPage+1}&noticeNo=${notice.noticeNo}"><button type="button">다음</button></a>
				<a href="${contextPath}/noticeOne?currentPage=${lastPage}&noticeNo=${notice.noticeNo}"><button type="button">맨뒤</button></a>
			</c:if>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

<!-- 하단바 추가전까지 임시 공간확보 -->
	
			
</body>
<script>
	$('#addCommentBtn').click(function() {
		if($('#commentContent').val().length<1){
			alert('내용을 입력하세요');
			return;
		} else if($('#commentPw').val().length<1){
			alert('댓글PW를 입력하세요');
			return;
		} else {
			$('#addCommentAct').submit();
		}
	 });
	

 if($('#isSecret').change(function(){
	 $('#isSecret').val('Y');
 });
 ) else {
	 $('#isSecret').val('N');
 }  
</script>
</html>