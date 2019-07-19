<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>candidateTestResult.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	function surveyDo(){
		location.href="candidateSurvey.do";
	}
	
	function mainDo(){
		location.href="candidateMain.do";
	}
</script>
</head>
<body>
   <script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
	</script>
	<header id="header"></header>
	<h2 align="center">수고하셨습니다.</h2>
	<table border="1" align="center">
		<tr>
			<th>시험명</th>
			<td>${examVO.examName}</td>
		</tr>
		<tr>
			<th>응시자명</th>
			<td>${candiVO.takerName}</td>
		</tr>
		<tr>
			<th>출제문항 / 정답</th>
			<td>${examVO.questionQuantity} / ${takeExamVO.answerCount}</td>
		</tr>
		<tr>
			<th>점수</th>
			<td>${takeExamVO.sumTakerScore}</td>
		</tr>
		<tr>
			<th>합격점수</th>
			<td>${examVO.passingScore}</td>
		</tr>
		<tr>
			<th>합격 여부</th>
			<td>
				<c:set var="point" value="${takeExamVO.sumTakerScore}"/>
				<c:set var="passingScore" value="${examVO.passingScore}" />
				<c:if test="${passingScore lt point}">합격</c:if>
				<c:if test="${passingScore ge point}">불합격</c:if>
			</td>
		</tr>
	</table> 
	<br>
	<!-- 경로 수정 (7/19) june -->
	<div align="right"><button onclick="surveyDo()">설문작성 후 문제해설 보기</button>&nbsp;&nbsp;&nbsp;<button onclick="mainDo()">메인으로</button></div>
</body>
</html>