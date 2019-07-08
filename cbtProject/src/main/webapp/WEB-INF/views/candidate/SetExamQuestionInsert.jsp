<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>
	<script type="text/javascript">
/* 		$(document).ready(function() {
			$("#header").load("in_header.html")
		}); */
	</script>
	<header id="header"></header>

	<form action="insertSetExamQuestion.do" method="post">
		<table border="1" align="center">
			<tr>
				<td>EXAM_ID</td>
				<td><input type="text" name="examId" id="examId"></td>
			</tr>
			<tr>
				<td>QUESTION_ID</td>
				<td><input type="text" name="questionId" id="questionId"></td>
			</tr>
			<tr>
				<td>SET_EXAM_QUESTION_ID</td>
				<td><input type="hidden" name="setExamQuestionId" id="setExamQuestionId"></td>
			</tr>
			<tr>
				<td>POINT</td>
				<td><input type="text" name="point" id="point"></td>
			</tr>
		</table>
		<div align="center">
			<input type="submit" value="등록">
			<input type="reset" value="취소">
		</div>
	</form>
	<br>
	<br>
</body>
</html>