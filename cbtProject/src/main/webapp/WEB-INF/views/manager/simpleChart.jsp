<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

</head>
<body>
	
	<section>
		<article>
			<ul>
				<li><button type="button" onclick="location.href='simpleExamList.do'">시험결과 보기</button></li>
				<li><button type="button" onclick="location.href='getSurveyResult.do'">설문결과 보기</button></li>
			</ul>
		</article>
	</section> 
	
	
	<table border="1" class="table text-center">
		<tr>
			<th>TAKE_EXAM_ID</th>
			<th>Q1</th>
			<th>Q2</th>
			<th>Q3</th>
			<th>Q4</th>
			<th>Q5</th>
			<th>Q6</th>
			<th>Q7</th>
			<th>Q8</th>
			<th>Q9</th>
		</tr>
		<c:forEach items="${simpleExamList}" var="list">
		<tr>
			<td>${list.takeExamId}</td>
			<td>${list.q1}</td>
			<td>${list.q2}</td>
			<td>${list.q3}</td>
			<td>${list.q4}</td>
			<td>${list.q5}</td>
			<td>${list.q6}</td>
			<td>${list.q7}</td>
			<td>${list.q8}</td>
			<td>${list.q9}</td>
		</tr>
		</c:forEach>
	</table>
	
	<form action="">
		
	</form>
	
</body>
</html>