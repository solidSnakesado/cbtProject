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
		매니저 ID : <input type="text" name="managerId"><br>
		매니저 PW : <input type="password" name="managerPassword"><br>
		매니저 이름 : <input type="text" name="managerName"><br>
		
		<input type="submit" id="submit" value="등록">
		
	</form>
</body>
</html>