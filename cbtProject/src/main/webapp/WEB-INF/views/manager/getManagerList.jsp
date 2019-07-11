<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<title>getManagerList.jsp</title>
</head>
<body>
      <script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#header").load("candidateInHeader.jsp")
		});
	</script>
	<header id="header"></header>
<section>
   <article>
      <ul>
         <li><button type="button" onclick="location.href='managerUserAccountEdit.do'">계정관리</button></li>
         <li><button type="button" onclick="location.href='candidateRequestList.do'">응시목록</button></li>
         <li><button type="button" onclick="location.href='managerChart.do'">통계</button></li>
      </ul>
   </article>
</section>
	<header id="header"></header>
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