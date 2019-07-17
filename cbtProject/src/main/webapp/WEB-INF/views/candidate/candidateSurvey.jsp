<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<title>설문조사</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	
}






</script>
</head>
<body>
<!--
 	<script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#header").load("candidateInHeader.do")
		});
	</script> 
-->


	<header id="header"></header>
	<h1>설문조사</h1>
	<br><br><br><br>
	<h2 align="center">2. 이 시험으로 인해 얻고자하는 기대효과는 무엇입니까?</h2>
	<br><br><br>
	<p align="center"><input type="radio" name="select" value="promote">진급 성공&nbsp;&nbsp;
	<input type="radio" name="select" value="certification">자격증 취득&nbsp;&nbsp;
	<input type="radio" name="select" value="enter">기업 입사&nbsp;&nbsp;
	<input type="radio" name="select" value="work">직무 평가</p>
	<br><br><br><br>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<button type="button">preview</button><button type="button">next</button>
	<div align="center"><input type="submit" value="제출" onclick="location.href='candidateTestResult.jsp'">&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="reset" value="초기화"></div>
	

</body>
</html>