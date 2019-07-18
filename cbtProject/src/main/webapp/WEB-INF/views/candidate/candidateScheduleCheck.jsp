<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<script>
$(document).ready(function(){
	var arrTD = $("td[id^='Exam_List_']");
	for(var i = 0; i < arrTD.length; ++i){
		$(arrTD[i]).text($(arrTD[i]).text().replace("T"," "))
	}
});
function goList(p){
	searchFrm.page.value = p;
	searchFrm.submit();
}

</script>
<title>CBT 시험 일정 확인</title>
</head>
<body>
	<h1>응시가능한 시험</h1>
	<br>
	<form name="searchFrm">
		<input type = "hidden" name="page" value="1">
	</form>

	<table class="table text-center" border="1">
		<tr>
			<th>시험코드</th>
			<th>시험명</th>
			<th>시험시작시간</th>
			<th>시험종료시간</th>
			<th>문항수</th>
			<th>합격기준</th>
		</tr>

   	<c:forEach items="${candidateScheduleCheck.schedulePage}" var="examInfo" >
		<tr onclick="location.href='candidateExamDetialView.do/${examInfo.EXAM_ID}'">
			<td>${examInfo.EXAM_ID}</td>
			<td>${examInfo.EXAM_NAME}</td>
			<td>${examInfo.EXAM_START_TIME}</td>
			<td>${examInfo.EXAM_END_TIME}</td>
			<td>${examInfo.QUESTION_QUANTITY}</td>
			<td>${examInfo.PASSING_SCORE}</td>
		</tr>
	</c:forEach>  
	</table><br>

	<div align="center"><my:paging jsFunc="goList" paging="${result.paging}"/></div><br>
	
	<div align="right"><a href="candidateMain.do"><button>돌아가기</button></a></div>&nbsp;&nbsp;&nbsp;
</body>
</html>