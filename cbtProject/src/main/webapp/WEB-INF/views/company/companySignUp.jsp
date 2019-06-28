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
			$("#header").load("in_header.html")
		});
	</script>
	<header id="header"></header>
	<table border="1" align="center">
		<tr>
			<td>기업ID</td>
			<td></td>
			<td><button>중복확인</button></td>
		</tr>
		<tr>
			<td>기업PW</td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td>PW확인</td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td>기업명</td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td>사업자번호</td>
			<td></td>
			<td><button>중복확인</button></td>
		</tr>
		<tr>
			<td>회사분류</td>
			<td><select name="company">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
				</select></td>
			<td></td>
		</tr>
		<tr>
			<td>세부업종</td>
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
			<td>담당자</td>
			<td></td>
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
	<div align="right"><button onclick="location.href='companyMain.html'">가입</button>&nbsp;&nbsp;&nbsp;<button onclick="location.href='signUp.html'">돌아가기</button></div>
</body>
</html>