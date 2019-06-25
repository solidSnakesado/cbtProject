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
<h2>관리자 기업의뢰목록</h2>
<select>
	<option>전체보기</option>
	<option>기업별</option>
	<option>미결제</option>
	<option>결제완료</option>
</select>
<form>
<table border="1">
   <tr>
      <th>기업 ID</th>
      <th>기업명</th>
      <th>시험이름</th>
      <th>시험일시</th>
      <th>결제여부</th>
   </tr>
   <tr onclick="location.href='managerRequestListDetail.jsp'">
      <td>AMAZON</td>
      <td>아마존</td>
      <td>아마존 신입 공채 시험</td>
      <td>2020.06.20 
		15:00 ~ 18:00</td>
      <td>완료</td>
   </tr>
   <tr onclick="location.href='managerRequestListDetail.jsp'"> 
      <td>Google</td>
      <td>구글</td>
      <td>구글 신입 공채 시험</td>
      <td>2020.06.20 
		15:00 ~ 18:00</td>
      <td>진행전</td>
   </tr>
   <tr onclick="location.href='managerRequestListDetail.jsp'">
      <td>MS</td>
      <td>마이크로소프트</td>
      <td>MS 신입 공채 시험</td>
      <td>2020.06.20 
		15:00 ~ 18:00</td>
      <td>완료</td>
   </tr>
   <tr onclick="location.href='managerRequestListDetail.jsp'">
      <td>APPLE</td>
      <td>애플</td>
      <td>애플 신입 공채 시험</td>
      <td>2020.06.20 
		15:00 ~ 18:00</td>
      <td>미결</td>
   </tr>
</table>
</form>
   
</body>
</html>