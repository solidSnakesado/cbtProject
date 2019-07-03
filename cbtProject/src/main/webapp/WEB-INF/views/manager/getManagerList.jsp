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
			<option value="managerId">관리자 아이디
			<option value="managerName">관리자 이름
		</select><br>
		<input type="text" name="searchManager">
		<button>검색</button>
	</form>
	<form action="deleteManager.do">
	<button id="">삭제</button>
	<table>
		<tr>
			<th>선택</th>
			<th>관리자 아이디</th>
			<th>관리자 이름</th>
		</tr>
		<c:forEach items="${result.managerList }" var="manager">
		<tr>
			<td><input type="checkbox" name="mngList" value="${manager.managerId }"></td>
			<td><a href="updateManager/${manager.managerId }">${manager.managerId }</a></td>
			<td>${manager.managerName }</td>
		</tr>
		</c:forEach>
	</table>
	</form>
	<a href="insertManager.do">매니저 등록</a>
</body>
</html>