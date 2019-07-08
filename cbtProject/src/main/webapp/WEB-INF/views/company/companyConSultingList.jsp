<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CBT 상담 목록</title>
</head>


<body>
	상담목록확인(기업)
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		/* $(document).ready(function() {
			$("#header").load("co_header.html")
		}); */
	</script>
	<header id="header"></header>
	<section>
		<article>
			<ul>
				<li><button type="button"
						onclick="location.href='companyAccount.do'">계정관리</button></li>
				<li><button type="button"
						onclick="location.href='companyRequestList.do'">의뢰목록</button></li>
				<li><button type="button"
						onclick="location.href='companyTestList.do'">시험목록</button></li>
			</ul>
		</article>
	</section>
	<table border="1" align="center">
		<tr>
			<th>제목</th>
			<th>상담신청일</th>
		</tr>
		<c:forEach items="${consultingList}" var="consulting">
			<tr onclick="location.href='companyConSultingDetail.do/${consulting.consultingId}'">
				<td>${consulting.consultingTitle}</td>
				<td>${consulting.consultingDesiredDate}</td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<button onclick="location.href='companyMain.do'">돌아가기</button>
</body>
</html>