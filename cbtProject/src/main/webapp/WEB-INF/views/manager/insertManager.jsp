<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<title>insertManager.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
<section>
   <article>
      <ul>
         <li><button type="button" onclick="location.href='managerUserAccountEdit.jsp'">계정관리</button></li>
         <li><button type="button" onclick="location.href='candidateRequestList.jsp'">응시목록</button></li>
         <li><button type="button" onclick="location.href='managerChart.jsp'">통계</button></li>
      </ul>
   </article>
</section>
	<h1>매니저 등록</h1>
	<form action="insertManager.do" method="post" enctype="application/x-www-form-urlencoded">
		매니저 ID : <input type="text" name="managerId"><br>
		매니저 PW : <input type="password" name="managerPassword"><br>
		매니저 이름 : <input type="text" name="managerName"><br>
		
		<input type="submit" id="submit" value="등록">
		
	</form>
</body>
</html>