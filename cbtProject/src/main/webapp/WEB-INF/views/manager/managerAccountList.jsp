<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<li><button type="button" onclick="location.href='managerAccountControl.jsp'">계정관리</button></li>
				<li><button type="button" onclick="location.href='managerRequestList.jsp'">의뢰목록</button></li>
				<li><button type="button" onclick="location.href='managerConsultingList.jsp'">상담목록</button></li>
				<li><button type="button" onclick="location.href='managerChart.jsp'">통 계</button></li>
			</ul>
		</article>
	</section>
<h2>계정관리</h2>
<form>
<table border="1">
   <tr>
      <th>기업ID</th>
      <th>기업명</th>
      <th>가입일</th>
   </tr>
   <tr>
      <td><a href="managerAccountManageEdit.jsp">Google</a></td>
      <td>구글</td>
      <td>2019-04-12</td>
   </tr>
   <tr>
      <td><a href="managerAccountManageEdit.jsp">MS</a></td>
      <td>마이크로소프트</td>
      <td>2019-04-12</td>
   </tr>
   <tr>
      <td>Apple</td>
      <td>애플</td>
      <td>2019-04-12</td>
   </tr>
   <tr>
      <td>FaceBook</td>
      <td>페이스북</td>
      <td>2019-04-12</td>
   </tr>
   <tr>
      <td>ORACLE</td>
      <td>오라클</td>
      <td>2019-04-12</td>
   </tr>
   <tr>
      <td>LG</td>
      <td>엘지</td>
      <td>2019-04-12</td>
   </tr>
   <tr>
      <td>Sony</td>
      <td>소니</td>
      <td>2019-04-12</td>
   </tr>
</table>
</form>
</body>
</html>