<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h1 >기업 등록 페이지(관리자 화면)</h1>
	<hr>	
	</div>
<form action="${pageContext.request.contextPath }/managerAccountInsert.do" method="post" enctype="application/x-www-form-urlencoded">
<table align="center" border="1">
			<tr>
				<th>Company 아이디</th><td><input type="text" name="companyId"></td>
			</tr>
			<tr>
				<th>비밀번호</th><td><input type="password" name="companyPassword"></td>
			</tr>
			<tr>
				<th>회사명</th><td><input type="text" name="companyName"></td>
			</tr>
			<tr>
				<th>사업자번호</th><td><input type="text" name="businessNumber"></td>
			</tr>
			<tr>
			<th>회사분류</th><td>
					<my:select items="${E}" name="companyClassification" value="${result.companyClassification }"></my:select>
					</td>
			</tr>
			<tr>
			<th>세부업종 </th><td>
					<my:select items="${F}" name="companySectors" value="${result.companySectors }"></my:select>
					</td>
			</tr>
			<tr>
				<th>결제정보</th><td><input type="text" name="companyCredit"></td>
			</tr>
			<tr>
				<th>담당자</th><td><input type="text" name="companyManager"></td>
			</tr>
			<tr>	
				<th>담당자연락처</th><td><input type="text" name="companyManagerTelNum"></td>
			</tr>
			</table>
			<br>
	<input type="submit" id="submit" value="등록">&nbsp;&nbsp;&nbsp;
	<input type="reset" id="reset" onclick="location.href='managerAccountList.do'" value="돌아가기">
		</form>
	
</body>
</html>
    