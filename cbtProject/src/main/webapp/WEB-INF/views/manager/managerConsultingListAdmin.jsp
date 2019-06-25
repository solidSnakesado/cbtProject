<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />


</head>
<body>
기업상담목록(관리자)
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
<h2>관리자 상담목록</h2>
<form>
<table border="1">
   <tr >
      <th>기업 ID</th>
      <th>기업명</th>
      <th>담당자</th>
      <th>상담희망일</th>
      <th>상담유무</th>
   </tr>
   <tr onclick="location.href='managerConsultingListDetailAdmin.jsp'">
      <td>AMAZON</td>
      <td>아마존</td>
      <td>제프 베조스</td>
      <td>2020.06.20 
		15:00 ~ 18:00</td>
      <td>진행완료</td>
   </tr>
   <tr onclick="location.href='managerConsultingListDetailAdmin.jsp'">
      <td>Google</td>
      <td>구글</td>
      <td>에릭 슈미트</td>
      <td>2020.06.20 
		15:00 ~ 18:00</td>
      <td>진행전</td>
   </tr>
   <tr>
      <td onclick="location.href='managerConsultingListDetailAdmin.jsp'">MS</td>
      <td>마이크로소프트</td>
      <td>빌게이츠</td>
      <td>2020.06.20 
		15:00 ~ 18:00</td>
      <td>진행완료</td>
   </tr>
   <tr>
      <td onclick="location.href='managerConsultingListDetailAdmin.jsp'">APPLE</td>
      <td>애플</td>
      <td>팀 쿡</td>
      <td>2020.06.20 
		15:00 ~ 18:00</td>
      <td>진행전</td>
   </tr>
</table>
</form>

</body>
</html>