<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>매니저 정보 수정</h1>	
		
		<form action="${pageContext.request.contextPath }/updateManager.do" method="post">
			<input type="hidden" name="seq" value="${board.seq}"/>
			매니저 ID  : <input type="text" name="manager_id" value="${manager.manager_id }" readonly><br>
			매니저 PW  : <input type="password" name="manager_pw" value="${manager.manager_pw }"><br>
			매니저 이름 : <input type="text" name="manager_name" value="${manager.manager_name }"><br>
			<input type="submit" value="수정">
			<a href="deleteManager.do?seq=${manager.manager_id }">삭제</a>
			
		</form>
</body>
</html>