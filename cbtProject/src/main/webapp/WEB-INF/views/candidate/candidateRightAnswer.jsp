<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>

	<script type="text/javascript">
			$(document).ready(function() {
				$("#header").load("candidateInHeader.do")
			});
			
		</script>
	<header id="header"></header>
	<table border="1">

		<tr>
			<td><h2 align="center">OO 풀이 및 해설</h2></td>
		</tr>
	</table>
	<c:forEach items="${rightAnswer}" var="list">
	<table>
			<tr>
				<td colspan="2" align="left" valign="top" style="">
					<!---------------------내용시작------------------>
					<table>
						<tr>
							<td>
								<!--테이블 시작 -->
								<table width="940" style="padding: 5px 0 5px 0;">
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
								<div id="">정답 : ${list.rightAnswer}</div>
								<div id="">해설 : ${list.rightCommentary}</div>
							</td>
						</tr>

					</table> </c:forEach>
				<tr>
				<td><a href="#" class="previous">&laquo; Previous</a> <a
					href="#" class="next">Next &raquo;</a></td>
					</tr>
		<tr><td colspan="2" align="center" valign="top">
					<button>이의제기</button>&nbsp;<a href="candidateMain.jsp"><button>메인으로</button></a>
				</td>
			</tr>

		</table>



</body>
</html>