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
	<div>${loginMember.memberId}님의
		<c:if test="${(year!=null && year!='')}">
			${year}년
		</c:if>
		<c:if test="${(month!=null && month!='')}">
			${month}월
		</c:if>
		<c:if test="${(day!=null && day!='')}">
			${day}일
		</c:if>
		일정
	</div>
	<c:if test="${resultMap.currentPage != 1}">
	<a href="${contextPath}/scheduleListByDate?currentPage=1&year=${year}&month=${month}&day=${day}"><button type="button">맨앞</button></a>
	<a href="${contextPath}/scheduleListByDate?currentPage=${resultMap.currentPage-1}&year=${year}&month=${month}&day=${day}"><button type="button">이전</button></a>
	</c:if>
	<c:if test="${resultMap.currentPage != resultMap.lastPage}">
	<a href="${contextPath}/scheduleListByDate?currentPage=${resultMap.currentPage+1}&year=${year}&month=${month}&day=${day}"><button type="button">다음</button></a>
	<a href="${contextPath}/scheduleListByDate?currentPage=${resultMap.lastPage}&year=${year}&month=${month}&day=${day}"><button type="button">맨뒤</button></a>
	</c:if>
		<table border="1">
			<tr>
				<td>메모</td>
				<td>일정일자</td>
			</tr>
		
		<c:forEach var="list" items="${resultMap.list}">
			<tr>
				<td>${list.scheduleMemo}</td>
				<td><a href="${contextPath}/scheduleOneByDay?scheduleDate=${list.scheduleDate}">${list.scheduleDate}</a></td>
			</tr>
		
		
		</c:forEach>		
		</table>
		
	
	<form action="${contextPath}/scheduleListByDate" method="get" class="selectAct">	
			<br>
		<div>조회할 연, 월, 일 을 입력하세요</div>
			<select name="year" class="year">
			<option value="">선택안함</option>
				<c:forEach var="i" begin="${resultMap.maxMinMap.minYear}" end="${resultMap.maxMinMap.maxYear}" step="1">
				<option>${i}</option>
				</c:forEach>
			</select>
			
			<select name="month" class="month">
			<option value="">선택안함</option>
				<c:forEach var="i" begin="1" end="12" step="1">
				<option>${i}</option>
				</c:forEach>
			</select>
			
			<select name="day"   class="day">
			<option value="">선택안함</option>
				<c:forEach var="i" begin="1" end="31" step="1">
				<option>${i}</option>
				</c:forEach>
			</select>
		
		
			<button type="button" class="selectBtn">검색</button>
	</form>
</body>

<script>
$('.selectBtn').click(function(){
	if($('.year').val().length<1 && $('.month').val().length>0){
		alert('연 , 월 , 일 순서로 선택할 수 있습니다');
		return;
	} else if($('.month').val().length<1 && $('.day').val().length>0){
		alert('연 , 월 , 일 순서로 선택할 수 있습니다');
		return;
	} else if(($('.month').val() == 4 || $('.month').val() == 6
			|| $('.month').val() == 9 || $('.month').val() == 12) && $('.day').val() == 31) {				
		alert('해당 월은 31일이 존재하지 않습니다');
		return;		
	} else if( $('.month').val() == 2 && $('.day').val()>29) {
		alert('2월은 29일까지 설정가능합니다');
		return;
	} else {
		$('.selectAct').submit();
	}
});
	
	
	
	
	


</script>
</html>


		

