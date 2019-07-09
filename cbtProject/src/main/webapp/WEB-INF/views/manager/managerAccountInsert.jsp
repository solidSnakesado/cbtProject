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
		<h1 >기업 등록 페이지(관리자 화면)</h1>
	<hr>	
	</div>
<form action="managerAccountInsert.do" method="post" enctype="application/x-www-form-urlencoded">
<table align="center" border="1">
			<tr>
				<th>Company 아이디</th><td><input type="text" name="companyId"></td>
			</tr>
			<tr>
				<th>비밀번호</th><td><input type="password" name="companyPassword"></td>
			</tr>
			<tr>
				<th>회사명</th><td><input type="text" name="companyName"></td>
			</tr>
			<tr>
				<th>사업자번호</th><td><input type="text" name="businessNumber"></td>
			</tr>
			<tr>
			<th>회사분류</th><td><select name="companyClassification">
					<option selected>회사분류</option>
					<option>대기업</option>
					<option>중기업</option>
					<option>소기업</option>
					</select></td>
			</tr>
			<tr>
			<th>세부업종 </th><td><select name="companySectors">
					<option selected>세부업종</option>
					<option>경영·사무</option>
					<option>마케팅·광고·홍보</option>
					<option>IT·인터넷</option>
					<option>무역·유통</option>
					<option>영업·고객상담</option>
					<option>서비스</option>
					<option>연구개발·설계</option>
					<option>생산·제조</option>
					<option>교육</option>
					<option>건설</option>
					<option>의료</option>
					<option>미디어</option>
					<option>전문·특수직</option>
					</select></td>
			<tr>
				<th>결제정보</th><td><input type="text" name="companyCredit"></td>
			</tr>
			<tr>
				<th>담당자</th><td><input type="text" name="companyManager"></td>
			</tr>
			<tr>	
				<th>담당자연락처</th><td><input type="text" name="companyManagerTelNum"></td>
			</tr>
			</table>
			<br>
	<input type="submit" id="submit" value="등록">&nbsp;&nbsp;&nbsp;
	<input type="reset" id="reset" onclick="location.href='managerAccountList.do'" value="돌아가기">
		</form>
	
</body>
</html>
    