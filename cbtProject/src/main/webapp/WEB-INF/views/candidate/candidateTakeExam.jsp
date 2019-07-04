<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../css/main.css" />
<title>Insert title here</title>
</head>
<body>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#header").load("candidateInHeader.do")
		});
	</script>

	<header id="header"></header>
	<table border="1">
		<tr>
			<td><h2 align="center">OO 시험응시</h2></td>
			<td rowspan="3" width="200">
				<!-- 답안지 작성 -->
				<c:forEach items="${takeExamList}" var="list">
				<table>
					<tr>
						<td>01.</td>
						<td>1</td>
						<td><input type="radio" name="01_1" value="####"></td>
						<td>2</td>
						<td><input type="radio" name="01_1" value="####"></td>
						<td>3</td>
						<td><input type="radio" name="01_1" value="####"></td>
						<td>4</td>
						<td><input type="radio" name="01_1" value="####"></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td><h2 align="center">TIMER 20:57</h2></td>
		</tr>
		<tr>
			<td align="left" valign="top" style="">
				<!---------------------내용시작------------------>
				
				<table width="800">
					<tr>
						<td>
							<!--테이블 시작 -->
							<table width="820">
								<tr>
									<th valign="top">${list.questionContent}</th>
									<td>배점 : ${list.point}</td>
								</tr>
								<tr>
									<td>1. ${list.example1}</td>
									<td><input type="radio" name="${list.questionId }" value=""><br></td>
								</tr>
								<tr>
									<td>2. ${list.example2}</td>
									<td><input type="radio" name="${list.questionId }" value=""><br></td>
								</tr>
								<tr>
									<td>3. ${list.example3}</td>
									<td><input type="radio" name="${list.questionId }" value=""><br></td>
								</tr>
								<tr>
									<td>4. ${list.example4}</td>
									<td><input type="radio" name="${list.questionId }" value=""><br></td>
								</tr>

							</table>

						</td>
					</tr>
				</table>
				</c:forEach>
					<tr>
						<td align="center"><a href="#" class="previous">&laquo;
								Previous</a> &nbsp; &nbsp; <a href="#" class="next">Next &raquo;</a>
						</td>
					</tr>
		<tr>
			<td colspan="2" align="center" valign="top"><input type='submit'>
				<input type='reset'></td>
		</tr>
	</table>


</body>
</html>