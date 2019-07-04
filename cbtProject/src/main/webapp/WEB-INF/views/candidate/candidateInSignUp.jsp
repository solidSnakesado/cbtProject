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
			$("#header").load("candidateInHeader.do")
		});
	</script>
	<header id="header"></header>
<!-- 2019.07.02 장세준 - 테이블 간격 및 양식, 입력변수 조정, form 태그로 전환  -->
	<form action="insertCandidate.do" method="post">
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
					<option value="중졸">중졸</option>
					<option value="고졸">고졸</option>
					<option value="초대졸">초대졸</option>
					<option value="학사">학사</option>
					<option value="석사">석사</option>
					<option value="박사">박사</option>
			</select></td>
		</tr>
	</table>
	<br>
	<br>
	<div align="center"><input type="submit" value ="가입"/> &nbsp; <input type="reset" value ="취소"/></div>
	</form>
</body>
</html>