<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<title>CBT 시험 일정 확인</title>


</head>

	
<body>
마이페이지(개인) 응시목록 세부목록
	<script type="text/javascript">
		$(document).ready(function() {
			$("#header").load("candidateInHeader.do")
		});
	</script>
	<header id="header"></header>
	<table border = "1" align="center">
		<tr>
			<th>시험명</th>
			<td>2019년 제1차 ULACLE 신입공채 시험</td>
		</tr>
		<tr>
			<th>시험 일시</th>
			<td>2019/06/17 15:00</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>이승환</td>
		</tr>
		
		<tr>
			<th>주민번호</th>
			<td>920529-1******</td>
		</tr>
		<tr>
			<th>점수</th>
			<td>60</td>
		</tr>
		
		<tr>
			<th>합격여부</th>
			<td>합격</td>
		</tr>
	</table>
	
	<input type = "button" onclick =  'window.close()' value = "확인">
</body>
</html>