<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<title>CBT 시험 일정 확인</title>

</head>
<body>
마이페이지(개인) 응시목록 세부목록
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
	</script>
	<c:set var="examName" value="${candidateExaminationListDetail.examName }" />
	<c:set var="examStartTime" value="${candidateExaminationListDetail.examStartTime }" />
	<c:set var="takerName" value="${candidateExaminationListDetail.takerName }" />
	<c:set var="takerInfo" value="${candidateExaminationListDetail.takerInfo }" />
	<c:set var="score" value="${candidateExaminationListDetail.score }" />
	<c:set var="passingScore" value="${candidateExaminationListDetail.passingScore }" />
	<table border = "1" align="center">
	<%-- <c:forEach items="candidateExaminationListDetail" var="list"> --%>
		<tr>
			<th>시험명</th>
			<td>${examName }</td>
		</tr>
		<tr>
			<th>시험 일시</th>
			<td>${examStartTime }</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${takerName }</td>
		</tr>
		
		<tr>
			<th>주민번호</th>
			<td>${takerInfo }</td>
		</tr>
		<tr>
			<th>점수</th>
			<td>${score } / ${passingScore }</td>
		</tr>
		
		<tr>
			<th>합격여부</th>
			<td>
				<c:if test="${passingScore lt score }">합격</c:if>
				<c:if test="${passingScore ge score }">불합격</c:if>
			</td>
		</tr>
	<%-- </c:forEach> --%>
	</table>
</body>
</html>