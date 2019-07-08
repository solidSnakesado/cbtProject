<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertCondition.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<h1>상태 등록</h1>
	<form action="insertCondition.do" method="post" enctype="application/x-www-form-urlencoded">
		마스터 코드 : <input type="text" name="masterCd" ><br>
		마스터 이름 : <input type="text" name="masterNm"><br>
		상세 코드 : <input type="text" name="detailCd"><br>
		상세 이름 : <input type="text" name="detailNm"><br>
		사용 여부 : <input type="text" name="useYn" placeholder="Y or N"><br>
		
		<input type="submit" id="submit" value="등록">
		
	</form>
</body>
</html>