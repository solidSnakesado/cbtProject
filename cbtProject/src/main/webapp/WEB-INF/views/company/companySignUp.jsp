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
	<h4 class="mx-auto pb-2">기업 회원 가입 페이지</h4>
	<form action="companySignUp.do" method="post">
		<table border="1" align="center">
			<tr>
				<td><label>기업ID</label></td>
				<td><input type="text" name="companyId" id="companyId" class="form-control"></td>
				<td><button>중복확인</button></td>
			</tr>
			<tr>
				<td><label>기업PW</label></td>
				<td><input type="password" name="companyPassword" id="companyPassword" class="form-control"></td>
				<td></td>
			</tr>
			<tr>
				<td><label>PW확인</label></td>
				<td><input type="password" name="companyPwCheck" id="companyPwCheck" class="form-control"></td>
				<td></td>
			</tr>
			<tr>
				<td><label>기업명</label></td>
				<td><input type="text" name="companyName" id="companyName" class="form-control"></td>
				<td></td>
			</tr>
			<tr>
				<td><label>사업자번호</label></td>
				<td><input type="text" name="businessNumber" id="businessNumber" class="form-control"></td>
				<td><button>중복확인</button></td>
			</tr>
			<tr>
				<td><label>회사분류</label></td>
				<td><select name="companyClassification" id="companyClassification" class="form-control">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
				</select></td>
				<td></td>
			</tr>
			<tr>
				<td><label>세부업종</label></td>
				<td><select name="companySectors" id="companySectors" class="form-control">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
				</select></td>
				<td></td>
			</tr>
			<tr>
				<td><label>주거래 은행</label></td>
				<td><input type="text" name="companyCredit" id="companyCredit" class="form-control"></td>
				<td></td>
			</tr>
			<tr>
				<td><label>담당자</label></td>
				<td><input type="text" name="companyManager" id="companyManager" class="form-control"></td>
				<td></td>
			</tr>
			<tr>
				<td><label>연락처</label></td>
				<td><input type="text" name="companyManagerTelNum" id="companyManagerTelNum" class="form-control"></td>
				<td></td>
			</tr>
		</table>
		<div align="right">
			<!-- <button onclick="location.href='companySignUp.do'">가입</button>&nbsp;&nbsp;&nbsp; -->
			<input type="submit" value="가입" class="btn btn-primary m-3 p-3">
			<input type="reset" value="취소" class="btn btn-warning m-3 p-3">
			<!-- <button onclick="location.href='companyMain.do'">돌아가기</button> -->
		</div>
	</form>
	<br>
	<br>

</body>
</html>