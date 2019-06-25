<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#header").load("candidateInHeader.jsp")
		});
	</script>
	<header id="header"></header>
	<h2 align="center">수고하셨습니다.</h2>
	<table border="1" align="center">
		<tr>
			<th>시험명</th>
			<td></td>
		</tr>
		<tr>
			<th>응시자명</th>
			<td></td>
		</tr>
		<tr>
			<th>출제문항 / 정답</th>
			<td></td>
		</tr>
		<tr>
			<th>점수</th>
			<td></td>
		</tr>
		<tr>
			<th>합격여부</th>
			<td></td>
		</tr>
	</table>
	<div align="right"><button>설문작성 후 문제해설 보기</button>&nbsp;&nbsp;&nbsp;<button>메인으로</button></div>
</body>
</html>