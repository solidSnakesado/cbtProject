<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<script type="text/javascript">
		$(document).ready(function() {
			$("#header").load("in_header.html")
		});
	</script>

	<form action="companyUpdate.do" method="post">
		<table border="1" align="center">
			<tr>
				<td>기업ID</td>
				<td><input type="text" name="companyId" id="companyId" class="form-control" value="${company.companyId}"></td>
				<td><button>중복확인</button></td>
			</tr>
			<tr>
				<td>기업PW</td>
				<td><input type="password" name="companyPassword" id="companyPassword" class="form-control" value="${company.companyPassword}"></td>
				<td></td>
			</tr>
			<tr>
				<td>PW확인</td>
				<td><input type="password" name="companyPwCheck" id="companyPwCheck" class="form-control" ></td>
				<td></td>
			</tr>
			<tr>
				<td>기업명</td>
				<td><input type="text" name="companyName" id="companyName" class="form-control" value="${company.companyName}"></td>
				<td></td>
			</tr>
			<tr>
				<td>사업자번호</td>
				<td><input type="text" name="businessNumber" id="businessNumber" class="form-control" value="${company.businessNumber}"></td>
				<td><button>중복확인</button></td>
			</tr>
			<tr>
				<td>회사분류</td>
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
				<td>세부업종</td>
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
				<td>주거래 은행</td>
				<td><input type="text" name="companyCredit" id="companyCredit" class="form-control" value="${company.companyCredit}"></td>
				<td></td>
			</tr>
			<tr>
				<td>담당자</td>
				<td><input type="text" name="companyManager" id="companyManager" class="form-control" value="${company.companyManager}"></td>
				<td></td>
			</tr>
			<tr>
				<td>연락처</td>
				<td><input type="text" name="companyManagerTelNum" id="companyManagerTelNum" class="form-control" value="${company.companyManagerTelNum}"></td>
				<td></td>
			</tr>
		</table>
		<div align="right">
			<!-- <button onclick="location.href='companySignUp.do'">가입</button>&nbsp;&nbsp;&nbsp; -->
			<input type="submit" value="수정" class="btn btn-primary m-3 p-3">
			<input type="reset" value="취소" class="btn btn-warning m-3 p-3">
			<!-- <button onclick="location.href='companyMain.do'">돌아가기</button> -->
		</div>
	</form>
