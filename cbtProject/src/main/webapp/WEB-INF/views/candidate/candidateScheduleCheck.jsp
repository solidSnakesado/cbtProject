<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<title>CBT 시험 일정 확인</title>
</head>
<body>
	<h1>CBT 시험 일정 확인</h1>
	<h3>연간 시험일정</h3>
	<p>1. 원서접수시간은 원서접수 09:00부터 18:00까지 임.</p>
	<p>2. 주말 및 공휴일, 회사창립기념일에는 시험 원서 접수 불가</p>
	
	<form action="#" method="post">
	<table border="1" align="center">
	<tr>
		<th>시험명</th>
		<th>문항수</th>
		<th>시험시작</th>
		<th>시험종료</th>
		<th>합격기준</th>
		<th>응시하기</th>
	</tr>
	<c:forEach var="examInfo" items="${result}">
	<tr>
		<td>${examInfo.examName}</td>
		<td>${examInfo.questionQuantity}</td>
		<td>${examInfo.examStartTime}</td>
		<td>${examInfo.examEndTime}</td>
		<td>${examInfo.passingScore}</td>
		<td>ff</td>
	</tr>
	</c:forEach>
	</table>
	<br>
	<div align="right"><a href="candidateMain.do"><button>돌아가기</button></a></div>&nbsp;&nbsp;&nbsp;
</body>
</html>