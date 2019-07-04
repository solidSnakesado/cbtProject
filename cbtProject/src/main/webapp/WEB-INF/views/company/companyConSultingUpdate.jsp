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
	<h3>상담 수정(기업)</h3>
	<form action="${pageContext.request.contextPath}/companyConSultingUpdate.do" method="post">
		<table border = "1">
			<tr>
				<th>상담코드</th>
				<td><input type = "text" name = "consultingId" id = "consultingId" value="${consulting.consultingId}" readonly="readonly"></td>
			</tr>
			<tr>
				<th>상담희망일</th>
				<td><input type = "text" name = "consultingDesiredDate" id="consultingDesiredDate" value="${consulting.consultingDesiredDate}" ></td>
			</tr>
			<tr>
				<th>상담내용</th>
				<td><textarea name = "consultingContents" id="consultingContents" rows = "10" cols = "100" >${consulting.consultingContents}"</textarea></td>
			</tr>
			<tr>
				<th>상담일</th>
				<td><input type="text" name="consultingDate" id="consultingDate" value="${consulting.consultingDate}" readonly="readonly"></td>
			</tr>
			<tr>
				<th>진행상태</th>
				<td><input type="text" name="consultingState" id="consultingState" value="${consulting.consultingState}" readonly="readonly"></td>
			</tr>
		</table>
		<br>
		<input type="submit" value="수정하기">
		<input type = "button" onclick =  'window.close()' value = "취소">
	</form>
	


</body>
</html>