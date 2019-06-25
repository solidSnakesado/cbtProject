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
				<a href="candidateUserMain.html">로그아웃</a>
			</nav>
	<section>
		<article>
			<ul>
				<li><button type="button" onclick="location.href='accountControl.html'">계정관리</button></li>
				<li><button type="button" onclick="location.href='request_list_admin.html'">의뢰목록</button></li>
				<li><button type="button" onclick="location.href='consulting_list_admin.html'">상담목록</button></li>
				<li><button type="button" onclick="location.href='admin_chart.html'">통 계</button></li>
			</ul>
		</article>
	</section>
<h2>관리자 계정관리</h2>
<form>
<table border="1">

   <tr>
      <th>응시자ID</th>
      <td> AA1 </td> 
   </tr>
   <tr>
      <th>이름</th>
      <td> 홍길동 </td> 
   </tr>
   <tr>
      <th>주민번호 </th>
      <td> 111111-1******* </td> 
   </tr>
      <tr>
      <th>최종학력</th>
      <td> 대졸 </td> 
   </tr>
   </tr>
      <tr>
      <th>연락처</th>
      <td> 010-111-1111 </td> 
   </tr>
   <tr>
      <th>이메일</th>
      <td>ceo@gmail.com</td> 
   </tr>
</table>
<button type="button" >확인</button>
<button type="button" >삭제하기</button>
</form>

</body>
</html>