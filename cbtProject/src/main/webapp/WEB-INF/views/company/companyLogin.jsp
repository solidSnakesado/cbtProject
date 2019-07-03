<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="companyLogin.do" method="post">
		id : <input type="text" name="companyId" value="${companyVO.companyId}"><br>
		pw : <input type="password" name="companyPassword"><br>
		<button>로그인</button>
	</form>
	
	<a href="companySignUp.do">가입하기</a>
</body>
</html>