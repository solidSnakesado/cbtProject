<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getManagerList.jsp</title>
</head>
<body>
	<h3>매니저 목록</h3>
	<form>
		검색조건<select name="searchManager">
			<option value="manager_id">관리자 아이디
			<option value="manager_name">관리자 이름
		</select><br>
		<input type="text" name="searchManager">
		<button>검색</button>
	</form>
	<table>
		<tr>
			<th>관리자 아이디</th>
			<th>관리자 이름</th>
		</tr>
		<c:forEach items="${managerList }" var="manager">
		<tr>
			<td>${manager.manager_id }</td>
			<td><a href="updateManagerForm.do?seq=${manager.manager_id }">${manager.manager_id }</a></td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>