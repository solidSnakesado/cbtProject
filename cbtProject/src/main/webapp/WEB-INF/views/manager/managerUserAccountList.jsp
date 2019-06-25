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
<h2>관리자 계정관리</h2>
<form>
<table border="1">
   <tr>
      <th>응시자ID</th>
      <th>이름</th>
      <th>가입일</th>
   </tr>
   <tr>
      <td><a href="managerUserAccountEdit.jsp">AA1</a></td>
      <td>홍길동</td>
      <td>2019-04-12</td>
   </tr>
   <tr>
      <td>AA2</td>
      <td>강감찬</td>
      <td>2019-04-12</td>
   </tr>
   <tr>
      <td>AA3</td>
      <td>이순신</td>
      <td>2019-04-12</td>
   </tr>
   <tr>
      <td>AA4</td>
      <td>을지문덕</td>
      <td>2019-04-12</td>
   </tr>
   <tr>
      <td>AA5</td>
      <td>연개소문</td>
      <td>2019-04-12</td>
   </tr>
   <tr>
      <td>AA6</td>
      <td>이방원</td>
      <td>2019-04-12</td>
   </tr>
   <tr>
      <td>AA7</td>
      <td>왕건</td>
      <td>2019-04-12</td>
   </tr>
</table>
</form>
<a href="managerApplicantInsert.jsp"><button type="button">응시자 추가</button></a>
<a href="managerUserAccountUpload.jsp"><button type="button">엑셀파일 업로드</button></a>
</body>
</html>