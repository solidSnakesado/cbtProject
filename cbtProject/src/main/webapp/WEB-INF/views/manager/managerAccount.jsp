<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>관리자 메인</h2>
	<nav id="nav2">
				<a href="candidateUserMain.html">로그아웃</a>
			</nav>
	<section>
		<article>
			<ul>
				<li><button type="button" onclick="location.href='managerAccountControl.html'">계정관리</button></li>
				<li><button type="button" onclick="location.href='managerRequestListAdmin.html'">의뢰목록</button></li>
				<li><button type="button" onclick="location.href='managerConsultingListAdmin.html'">상담목록</button></li>
				<li><button type="button" onclick="location.href='managerAdminChart.html'">통 계</button></li>
			</ul>
		</article>
	</section>
</body>
</html>