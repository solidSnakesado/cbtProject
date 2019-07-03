<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		/* 		$(document).ready(function() {
		 $("#header").load("co_header.html")
		 }); */
	</script>
	<header id="header"></header>
	<h3>시험 목록 세부 내용(기업)</h3>
	
	<table border="1">
		<tr>
			<th>상담코드</th>
			<td><input type="text" name="consultingId" id="consultingId" value="${consulting.consultingId}" readonly></td>
		</tr>
		<tr>
			<th>상담희망일</th>
			<td><input type="text" name="consultingDesiredDate" id="consultingDesiredDate" value="${consulting.consultingDesiredDate}" readonly></td>
		</tr>
		<tr>
			<th>상담내용</th>
			<td><textarea name="consultingContents" id="consultingContents" rows="10" cols="100" readonly>${consulting.consultingContents}"</textarea></td>
		</tr>
		<tr>
			<th>상담일</th>
			<td><input type="text" name="consultingDate" id="consultingDate" readonly="readonly" value="${consulting.consultingDate}"></td>
		</tr>
		<tr>
			<th>진행상태</th>
			<td><input type="text" name="consultingState" id="consultingState" readonly="readonly" value="${consulting.consultingState}"></td>
		</tr>
	</table>
	<br>

	<input type="button" onclick="location.href='../companyConSultingUpdate.do/${consulting.consultingId}'" value="수정하기">
	<input type="button" onclick="location.href='../companyConSultingDelete.do'" value="삭제하기">
	<input type="button" onclick='window.close()' value="확인">
</body>
</html>