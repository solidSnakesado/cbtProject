<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/main.css" />
</head>
<body>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#header").load("co_header.html")
		});
	</script>
	<header id="header"></header>
	<h3>개별 시험 의뢰 목록 (기업화면)</h3>
	<input type = "hidden" name = "no" value = "${ dto.no }">
	<table border = "1">
		<tr>
			<th>시험 이름</th>
			<td>${selectedExam.examName}</td>
		</tr>
		<tr>
			<th>시작 시간</th>
			<td>${selectedExam.examStartTime}</td>
		</tr>
		<tr>
			<th>종료시간</th>
			<td>${selectedExam.examEndTime}</td>
		</tr>
	</table>
	
	<button onclick = "location.href = '${pageContext.request.contextPath }/companyExamListDetailGraph.do'" >통계보기</button>
	<input type = "button" onclick = "location.href = '${pageContext.request.contextPath }/companyExamList.do'" value = "돌아가기">
</body>
</html>