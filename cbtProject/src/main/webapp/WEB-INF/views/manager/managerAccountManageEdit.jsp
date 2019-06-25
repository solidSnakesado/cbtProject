<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../css/main.css" />
<style>

</style>
</head>
<body>
<section>
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
<h2>관리자 기업 계정관리</h2>
<form>
<table border="1">

   <tr>
      <th>기업명</th>
      <td> URACLE </td> 
   </tr>
   <tr>
      <th>업종</th>
      <td> IT </td> 
   </tr>
   <tr>
      <th>담당자 </th>
      <td> <input type="text" name="company_charge" placeholder="에릭슈미트"> </td> 
   </tr>
      <tr>
      <th>연락처</th>
      <td> <input type="text" name="company_charge" placeholder="010-222-333"> </td> 
   </tr>
   <tr>
      <th>이메일</th>
      <td>  <input type="text" name="company_charge" placeholder="ceo@gmail.com"> </td> 
   </tr>
</table>
<button type="button" value="submit">수정하기</button>
<button type="button" >확인</button>
<button type="button" >삭제하기</button>
</form>

</body>
</html>