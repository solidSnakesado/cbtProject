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
			$("#header").load("in_header.html")
		});
	</script>
	<header id="header"></header>
   <br>
   <br>
	<a href="in_signUp.html"><img src="image/individual.png"></a>
	<a href="co_signUp.html"><img src="image/company.png"></a>
	<br><br>
	<br>
	<button onclick="location.href='userMain.html'">돌아가기</button>
</body>
    