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
<form action="${pageContext.request.contextPath }/managerUserAccountEdit.do" method="post">
<table border="1">
   <tr>
      <th>응시자ID</th>
      <td>${result.takerId}</td> 
   </tr>
   <tr>
      <th>비밀번호</th>
      <td><input type="password" name="takerPassword" value="${result.takerPassword }"></td> 
   </tr>
   <tr>
      <th>이름</th>
      <td><input type="text" name="takerName" value="${result.takerName }"></td> 
   </tr>
   <tr>
      <th>주민번호 </th>
      <td><input type="text" name="takerInfo" value="${result.takerInfo }"></td> 
   </tr>
      <tr>
      <th>최종학력</th>
      <td><input type="text" name="takerEducation" value="${result.takerEducation }"></td> 
   </tr>
    <tr>
      <th>이메일</th>
      <td><input type="text" name="takerEmail" value="${result.takerEmail }"></td> 
   </tr>
   
</table>
<button type="button" >확인</button>
<button type="button" >삭제하기</button>
</form>

</body>
</html>