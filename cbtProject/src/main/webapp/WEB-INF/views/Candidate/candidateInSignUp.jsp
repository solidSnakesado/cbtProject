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
		$(document).ready(function() {
			$("#header").load("candidateInHeader.jsp")
		});
	</script>
	<header id="header"></header>
	<table border="1" align="center">
		<tr>
			<td>응시자ID</td>
			<td></td>
			<td><button>중복확인</button></td>
		</tr>
		<tr>
			<td>응시자PW</td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td>PW확인</td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td>성명</td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td>주민등록번호</td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td>E-mail</td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td>최종학력</td>
			<td><select name="job">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
			</select></td>
			<td></td>
		</tr>
		<tr>
			<td>연락처</td>
			<td></td>
			<td></td>
		</tr>
	</table>
	<br>
	<br>
	
	<div align="right"><button onclick="location.href='candidateUserMain.jsp'">가입</button>&nbsp;&nbsp;&nbsp;<button onclick="location.href='candidateSignUp.jsp'">돌아가기</button></div>
</body>
</html>