<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	<h3>개별 시험 상담 목록 (관리자화면)</h3>
	<table border = "1">
		<tr>
			<th>기업명</th>
			<td>구글</td>
		</tr>
		<tr>
			<th>업종</th>
			<td>IT</td>
		</tr>
		<tr>
			<th>담당자</th>
			<td>에릭슈미트</td>
		</tr>
		<tr>
			<th>연락처</th>
			<td>010-2222-3333</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>ceo@gmail.com</td>
		</tr>
		<tr>
			<th>상담내용</th>
			<td><textarea>상반기 정기 채용 시험 문의 입니다.시험 인원은 100 명시험 시간은 100분 정도 생각 하고 있습니다.</textarea></td>
		</tr>
		<tr>
			<th>상담희망일</th>
			<td>2019/06/17 15:00~18:00</td>
		</tr>
		<tr>
			<th>상담일</th>
			<td>2019/06/17 15:00~17:30</td>
		</tr>
	</table>
	
	<button onclick = "location.href = 'managerConsultingList.jsp'" >확인</button>
	<input type = "button" onclick = "location.href = 'managerConsultingList.jsp'" value = "상담	완료">


</body>
</html>