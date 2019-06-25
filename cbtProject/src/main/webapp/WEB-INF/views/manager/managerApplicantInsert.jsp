<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<title>Insert title here</title>
</head>
<body>
<nav id="nav2">
				<a href="candidateUserMain.html">로그아웃</a>
			</nav>
	<section>
		<article>
			<ul>
				<li><button type="button" onclick="location.href='managerAccountControl.html'">계정관리</button></li>
				<li><button type="button" onclick="location.href='managerRequestListAdmin.html'">의뢰목록</button></li>
				<li><button type="button" onclick="location.href='managerConsultingListAdmin.html'">상담목록</button></li>
				<li><button type="button" onclick="location.href='managerAdminChart.html'">통 계</button></li>
			</ul>
		</article>
	</section>
	<div align="center">
		<h1 >응시자 등록 페이지(관리자 화면)</h1>
	<hr>	
	</div>
<form>
		<table border="1" align="center">
		<tr>
			<td>성명</td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td>주민등록번호</td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td>E-mail</td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td>최종학력</td>
			<td><select name="job">
					<option>중졸</option>
					<option>고졸</option>
					<option>초대졸</option>
					<option>대졸</option>
					<option>석사</option>
					<option>박사</option>
			</select></td>
			<td></td>
		</tr>
		<tr>
			<td>연락처</td>
			<td></td>
			<td></td>
		</tr>
	</table>
	<br>
	<br>
	</form>			
	
	<button onclick="location.href='managerUserAccountList.html'">등록</button>&nbsp;&nbsp;&nbsp;<button onclick="location.href='managerUserAccountList.html'">돌아가기</button>

</body>
</html>
    