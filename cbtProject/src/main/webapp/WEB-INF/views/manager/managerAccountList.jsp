<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<style>
</style>
</head>
<body>
<nav id="nav2">
				<a href="candidateUserMain.jsp">로그아웃</a>
			</nav>
	<section>
		<article>
			<ul>
				<li><button type="button" onclick="location.href='managerAccountControl.do'">계정관리</button></li>
				<li><button type="button" onclick="location.href='managerRequestList.do'">의뢰목록</button></li>
				<li><button type="button" onclick="location.href='managerConsultingList.do'">상담목록</button></li>
				<li><button type="button" onclick="location.href='managerChart.do'">통 계</button></li>
			</ul>
		</article>
	</section>
<h2>기업회원 관리</h2>
<form>
<table border="1">
   <tr>
      <th>기업ID</th>
      <th>기업명</th>
      <th>기업 담당자</th>
   </tr>
   <c:forEach items="${result.companyList }" var="CompanyVO">
		<tr>
			<td>${CompanyVO.companyId }</td>
			<td>${CompanyVO.companyName }</td>
			<td>${CompanyVO.companyManager }</td>
		</tr>
		</c:forEach>
</table>
</form>
</body>
</html>