<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
<h1> 공지상세 </h1>
						
	<table border="1">
	
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
			<td>${notice.noticeContent}</td>
		</tr>
		
		
		<tr>
			<td>작성일</td>		
			<td>${notice.createdate}</td>
		</tr>
			
	</table>
	<br><br><br>
	
	<span class="addCommentMsg"></span>
	<form method="post" action="${contextPath}/addComment" id="addCommentAct">
			  <input type="hidden" name="noticeNo" value="${notice.noticeNo}">
		댓글내용<input type="text" name="commentContent" id="commentContent">	<input type="checkbox" name="isSecret" id="isSecret">비밀글<br>
		댓글PW<input type="password" name="commentPw" id="commentPw"> <br>
		작성자<input type="text" name="memberId" value="${loginMember.memberId}" readonly>
		<button type="submit" id="addCommentBtn">등록</button> <!-- 해당페이지만 제이쿼리 적용불가로 버튼 type=button이 아닌 submit으로 즉시등록 가능처리. / 추후 확인예정 -->
	</form>
	
	<br>
	
		<table border="1">
		
			<tr>
				<td>작성자</td>
				<td>댓글내용</td>
			 		<c:if test="${loginMember.memberLevel == 1}">
				<td>삭제</td>
					</c:if>	 
			</tr>	
			
		<c:forEach var="c" items="${commentList}">
			<tr>
				<td>${c.memberId}</td>			
				<td>${c.commentContent}</td>
			 		<c:if test="${loginMember.memberLevel == 1}"> <!-- 관리자용 즉시삭제 -->
				<td><a href="${contextPath}/removeComment_manager?commentNo=${c.commentNo}&noticeNo=${notice.noticeNo}"><button type="button">삭제</button></a></td>
					</c:if>	
					
					<c:if test="${loginMember.memberLevel != 1 && loginMember.memberId == c.memberId}"> <!--회원용 삭제페이지 이동 -->
				<td><a href="${contextPath}/removeComment?commentNo=${c.commentNo}&noticeNo=${notice.noticeNo}&commentContent=${c.commentContent}"><button type="button">삭제</button></a></td>
					</c:if>		 
			</tr>
		</c:forEach>
		</table>	
		
			<c:if test="${currentPage!=1}">
		<a href="${contextPath}/noticeOne?currentPage=1&noticeNo=${notice.noticeNo}"><button type="button">맨앞</button></a>
		<a href="${contextPath}/noticeOne?currentPage=${currentPage-1}&noticeNo=${notice.noticeNo}"><button type="button">이전</button></a>
			</c:if>
			
			<c:if test="${currentPage!=lastPage}">
		<a href="${contextPath}/noticeOne?currentPage=${currentPage+1}&noticeNo=${notice.noticeNo}"><button type="button">다음</button></a>
		<a href="${contextPath}/noticeOne?currentPage=${lastPage}&noticeNo=${notice.noticeNo}"><button type="button">맨뒤</button></a>
			</c:if>
	  
			
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
	
	$('#commentContent').keyup(function() {
		if($('#commentContent').val().length>0){
			$('#addCommentMsg').val('댓글작성 후 삭제 가능하나 수정 불가하니 신중하게 작성해주세요');
		} else {
			$('#addCommentMsg').val('');
		}
	});
	


 if($('.isSecret').change(function(){
	 $('.isSecret').val('Y');
 });
 ) else {
	 $('.isSecret').val('N');
 }
  
</script>
</html>