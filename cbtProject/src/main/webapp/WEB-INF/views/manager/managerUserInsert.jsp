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
	<div align="center">
		<h1 >응시자 등록 페이지(관리자 화면)</h1>
	<hr>	
	</div>
<form action="managerUserInsert.do" method="post" enctype="application/x-www-form-urlencoded">
<table align="center" border="1">
			<tr>
				<th>응시자ID</th><td><input type="text" name="takerId"></td>
			</tr>
			<tr>
				<th>성명</th><td><input type="text" name="takerName"></td>
			</tr>
			<tr>
				<th>주민등록번호 </th><td><input type="text" name="takerInfo"></td>
			</tr>
			<tr>
				<th>최종학력</th><td><select name="takerEducation">
					<option>중졸</option>
					<option>고졸</option>
					<option>초대졸</option>
					<option>대졸</option>
					<option>석사</option>
					<option>박사</option>
					</select></td>
			</tr>
			<tr>
				<th>E-mail</th><td><input type="text" name="takerEmail"></td>
			</tr>
			<tr>
				<th>연락처</th><td><input type="text" name="takerPhoneNum"></td>
			</tr>
			</table>
			<br>
	<input type="submit" id="submit" value="등록">
	<input type="reset" id="reset" onclick="location.href='managerUserAccountList.do'" value="돌아가기">
		</form>

</body>
</html>
    