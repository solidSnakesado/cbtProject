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

	${companyVO.companyId}
	<form action="companyUpdate.do" method="post">
		<table border="1" align="center">
			<tr>
				<td>기업ID</td>
				<td><input type="text" name="companyId" id="companyId"></td>
				<td><button>중복확인</button></td>
			</tr>
			<tr>
				<td>기업PW</td>
				<td><input type="password" name="companyPassword" id="companyPassword"></td>
				<td></td>
			</tr>
			<tr>
				<td>PW확인</td>
				<td><input type="password" name="companyPwCheck" id="companyPwCheck"></td>
				<td></td>
			</tr>
			<tr>
				<td>기업명</td>
				<td><input type="text" name="companyName" id="companyName"></td>
				<td></td>
			</tr>
			<tr>
				<td>사업자번호</td>
				<td><input type="text" name="businessNumber" id="businessNumber"></td>
				<td><button>중복확인</button></td>
			</tr>
			<tr>
				<td>회사분류</td>
				<td><select name="companyClassification" id="companyClassification">
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
				<td><select name="companySectors" id="companySectors">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
				</select></td>
				<td></td>
			</tr>
			<tr>
				<td>주거래 은행</td>
				<td><input type="text" name="companyCredit" id="companyCredit"></td>
				<td></td>
			</tr>
			<tr>
				<td>담당자</td>
				<td><input type="text" name="companyManager" id="companyManager"></td>
				<td></td>
			</tr>
			<tr>
				<td>연락처</td>
				<td><input type="text" name="companyManagerTelNum" id="companyManagerTelNum"></td>
				<td></td>
			</tr>
		</table>
		<div align="right">
			<!-- <button onclick="location.href='companySignUp.do'">가입</button>&nbsp;&nbsp;&nbsp; -->
			<input type="submit" value="가입">
			<input type="reset" value="취소">
			<!-- <button onclick="location.href='companyMain.do'">돌아가기</button> -->
		</div>
	</form>
	<br>
	<br>

</body>
</html>