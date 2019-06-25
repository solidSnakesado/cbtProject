<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<title>CBT 시험 일정 확인</title>

<script>
	function showPopup(){
		var innerWidth = window.innerWidth/2;
		var innerHeight= window.innerHeight/2;
		
		window.open("candidateExaminationListDetail.jsp","a","height=innerHeight ,width=innerWidth,left=0,top=0");
	}
</script>
</head>

	
<body>
마이페이지(개인) 응시목록
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#header").load("candidateInHeader.jsp")
		});
	</script>
	<header id="header"></header>
   <section>
   <article>
      <ul>
         <li><button type="button">계정관리</button></li>
         <li><button type="button">응시목록</button></li>
      </ul>
   </article>
</section>
	<table border="1" align="center">
	<tr >
		<th>응시번호</th>
		<th>시험명</th>
		<th>점수</th>
		<th>합격여부</th>
	
	</tr>
	<tr onclick="showPopup();">
		<td>1</td>
		<td>2019 제1차 URACLE</td>
		<td>58</td>
		<td>불합격</td>
	</tr>
	<tr onclick="showPopup();">
		<td>2</td>
		<td>2019 제2차 URACLE</td>
		<td>78</td>
		<td>합격</td>
	</tr>
	<tr onclick="showPopup();">
		<td>3</td>
		<td>2019 제3차 URACLE</td>
		<td>58</td>
		<td>불합격</td>
		
	</tr>
	
	</table>
</body>
</html>