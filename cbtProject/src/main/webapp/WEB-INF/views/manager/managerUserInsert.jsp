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
				<li><button type="button" onclick="location.href='managerAccountControl.jsp'">계정관리</button></li>
				<li><button type="button" onclick="location.href='managerRequestList.jsp'">의뢰목록</button></li>
				<li><button type="button" onclick="location.href='managerConsultingList.jsp'">상담목록</button></li>
				<li><button type="button" onclick="location.href='managerChart.jsp'">통 계</button></li>
			</ul>
		</article>
	</section>
	<div align="center">
		<h1 >응시자 등록 페이지(관리자 화면)</h1>
	<hr>	
	</div>
<form action="managerUserInsert.do" method="post" enctype="application/x-www-form-urlencoded">
			응시자ID : <input type="text" name="takerId">
			성명 : <input type="text" name="takerName">
			주민등록번호 : <input type="text" name="takerInfo">
			최종학력 : <select name="takerEducation">
					<option>중졸</option>
					<option>고졸</option>
					<option>초대졸</option>
					<option>대졸</option>
					<option>석사</option>
					<option>박사</option>
					</select>
			E-mail : <input type="text" name="takerEmail">
			연락처 : 	<input type="text" name="takerPhoneNum">
		</form>
	<button onclick="location.href='managerUserAccountList.jsp'">등록</button>&nbsp;&nbsp;&nbsp;
	<button onclick="location.href='managerUserAccountList.jsp'">돌아가기</button>
</body>
</html>
    