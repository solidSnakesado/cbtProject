<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<title>CBT 시험 일정 확인</title>
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#header").load("candidateInHeader.html")
		});
	</script>
	<header id="header"></header>
	<h1>CBT 시험 일정 확인</h1>
	<h3>연간 시험일정</h3>
	<p>1. 원서접수시간은 원서접수 09:00부터 18:00까지 임.</p>
	<p>2. 주말 및 공휴일, 회사창립기념일에는 시험 원서 접수 불가</p>
	
	<table border="1" align="center">
	<tr>
		<th>년도별<br>회차별</th>
		<th>시험 이름</th>
		<th>문항수</th>
		<th>시험시간</th>
		<th>시험날짜</th>
		<th>배점</th>
		<th>합격기준</th>
		<th>응시하기</th>
	</tr>
	<tr>
		<td>2019년 / 제 1회</td>
		<td>URACLE 신입공채 시험</td>
		<td>100문항</td>
		<td>100분</td>
		<td>2019.03.04 13:30 ~<br>&nbsp;&nbsp;&nbsp;2019.03.04 15:30</td>
		<td>100점</td>
		<td>60점 이상</td>
		<td><button type="button" onclick="location.href='candidateApplication.html'">응시하기</button></td>
	</tr>
	<tr>
		<td>2019년 / 제 2회</td>
		<td>URACLE 신입공채 시험</td>
		<td>100문항</td>
		<td>100분</td>
		<td>2019.03.07 13:30 ~<br>&nbsp;&nbsp;&nbsp;2019.03.07 15:30</td>
		<td>100점</td>
		<td>60점 이상</td>
		<td><button type="button" onclick="location.href='candidateApplication.html'">응시하기</button></td>
	</tr>
	<tr>
		<td>2019년 / 제 1회</td>
		<td>(주)YEDAM 진급 시험</td>
		<td>20문항</td>
		<td>30분</td>
		<td>2019.06.22 13:00 ~<br>&nbsp;&nbsp;&nbsp;2019.03.04 13:30</td>
		<td>100점</td>
		<td>70점 이상</td>
		<td><button type="button" onclick="location.href='candidateApplication.html'">응시하기</button></td>
	</tr>
	<tr>
		<td>2020년 / 제 1회</td>
		<td>URACLE 신입공채 시험</td>
		<td>100문항</td>
		<td>100분</td>
		<td>2020.03.04 13:30 ~<br>&nbsp;&nbsp;&nbsp;2020.03.04 15:30</td>
		<td>100점</td>
		<td>60점 이상</td>
		<td><button type="button" onclick="location.href='candidateApplication.html'">응시하기</button></td>
	</tr>
	<tr>
		<td>2020년 / 제 1회</td>
		<td>(주)YEDAM 신입공채 시험</td>
		<td>100문항</td>
		<td>100분</td>
		<td>2020.05.07 13:30 ~<br>&nbsp;&nbsp;&nbsp;2020.05.07 15:30</td>
		<td>100점</td>
		<td>60점 이상</td>
		<td><button type="button" onclick="location.href='candidateApplication.html'">응시하기</button></td>
	</tr>
	</table>
	<br>
	<div align="right"><button onclick="location.href='candidateUserMain.html'">돌아가기</button></div>&nbsp;&nbsp;&nbsp;
</body>
</html>