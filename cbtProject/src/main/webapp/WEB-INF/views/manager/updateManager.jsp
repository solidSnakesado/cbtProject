<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<title>updateManager.jsp</title>
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
         <li><button type="button" onclick="location.href='managerUserAccountEdit.do'">계정관리</button></li>
         <li><button type="button" onclick="location.href='candidateRequestList.do'">응시목록</button></li>
         <li><button type="button" onclick="location.href='managerChart.do'">통계</button></li>
      </ul>
   </article>
</section>
	<h1>매니저 정보 수정</h1>	
		
		<form action="${pageContext.request.contextPath }/updateManager.do" method="post">
			매니저 ID  : <input type="text" name="managerId" value="${manager.managerId }" readonly><br>
			매니저 PW  : <input type="password" name="managerPassword" value="${manager.managerPassword }"><br>
			매니저 이름 : <input type="text" name="managerName" value="${manager.managerName }"><br>
			<input type="submit" value="수정">
			<a href="${pageContext.request.contextPath }/deleteManager.do?managerId=${manager.managerId }">삭제</a>
			
		</form>
</body>
</html>