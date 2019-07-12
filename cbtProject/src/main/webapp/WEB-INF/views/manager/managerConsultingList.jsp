<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />

</head>
<body>
<h2>기업상담목록(관리자)</h2>
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
<h2>관리자 상담목록</h2>
<form>
<table border="1" align="center">
   <tr>
   	  <th>선택</th>
      <th>제목</th>
      <th>상담희망일</th>
   </tr>
   <c:forEach items="${result.managerConsultingList}" var="ConsultingVO">
   <tr>
      <td><input type="checkbox" name="consultingList" value="${consulting.consultingId }"></td>
      <td>${consulting.consultingTitle}</td>
      <td id="consultingDesiredDate_${consulting.consultingId}">${consulting.consultingDesiredDate}</td>
   </tr>
   </c:forEach>
</table>
</form>
</body>
</html>