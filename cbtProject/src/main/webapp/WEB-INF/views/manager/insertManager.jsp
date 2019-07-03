<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertManager.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<h1>매니저 등록</h1>
	<form action="insertManager.do" method="post" enctype="application/x-www-form-urlencoded">
		매니저 ID : <input type="text" name="manager_id"><br>
		매니저 PW : <input type="password" name="manager_pw"><br>
		매니저 PW 확인 : <input type="password" name="manager_pw"><br>
		매니저 이름 : <input type="text" name="manager_name"><br>
		
		<input type="submit" id="submit" value="등록">
		
	</form>
</body>
</html>