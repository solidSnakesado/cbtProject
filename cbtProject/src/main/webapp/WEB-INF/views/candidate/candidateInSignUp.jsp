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
	<form action="candidateInSignUp.do" method="post">
	<table border="1" align="center">
		<tr>
			<td>응시자ID</td>
			<td><input type="text" name = "takerId"></td>
			<td><button>중복확인</button></td>
		</tr>
		<tr>
			<td>응시자PW</td>
			<td colspan="2"><input type="text" name = "takerPassword"></td>
		</tr>
		<tr>
			<td>PW확인</td>
			<td colspan="2"><input type="text" name = "takerPasswordRe"></td>
		</tr>
		<tr>
			<td>성명</td>
			<td colspan="2"><input type="text" name = "takerName"></td>
		</tr>
		<tr>
			<td>주민등록번호</td>
			<td colspan="2"><input type="text" name = "takerInfo"></td>
		</tr>
		<tr>
			<td>E-mail</td>
			<td colspan="2"><input type="text" name = "takerEmail"></td>
		</tr>
		<tr>
			<td>최종학력</td>
			<td colspan="2"><select name="takerEducation">
					<option value="1">중졸</option>
					<option value="2">고졸</option>
					<option value="3">초대졸</option>
					<option value="4">학사</option>
					<option value="5">석사</option>
					<option value="6">박사</option>
			</select></td>
		</tr>
	</table>
	<br>
	<br>
	<div align="center"><input type="submit" value ="가입"/> &nbsp; <input type="reset" value ="취소"/></div>
	</form>
</body>
</html>