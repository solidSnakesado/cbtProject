<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<style>
</style>
</head>
<body>
<nav id="nav2">
				<a href="candidateUserMain.jsp">로그아웃</a>
			</nav>
	<section>
		<article>
			<ul>
				<li><button type="button" onclick="location.href='managerAccountControl.do'">계정관리</button></li>
				<li><button type="button" onclick="location.href='managerRequestList.do'">의뢰목록</button></li>
				<li><button type="button" onclick="location.href='managerConsultingList.do'">상담목록</button></li>
				<li><button type="button" onclick="location.href='managerChart.do'">통 계</button></li>
			</ul>
		</article>
	</section>
<h2>응시자 계정관리</h2>
<button type="button" onclick="location.href='managerUserInsert.do'">응시자 추가</button>
<a href="managerUserAccountUpload.do"><button type="button">엑셀파일 업로드</button></a>
<button type="button">응시자 삭제</button>
<br><br>
<form>
<table border="1">
   <tr>
      <th>응시자ID</th>
      <th>이름</th>
      <th>E-Mail</th>
   </tr>
   		<c:forEach items="${result }" var="CandidateVO">
		<tr>
			<td>${CandidateVO.takerId }</td>
			<td><a href="managerUserAccountEdit.do/${CandidateVO.takerId }">${CandidateVO.takerName }</a></td>
			<td>${CandidateVO.takerEmail }</td>
		</tr>
		</c:forEach>
</table>
</form>
</body>
</html>