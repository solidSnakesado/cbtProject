<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />


</head>
<body>
<nav id="nav2">
				<a href="candidateUserMain.jsp">로그아웃</a>
			</nav>
	<section>
		<article>
			<ul>
				<li><button type="button" onclick="location.href='managerAccountControl.do'">계정관리</button></li>
				<li><button type="button" onclick="location.href='managerEstimateList.do'">의뢰목록</button></li>
				<li><button type="button" onclick="location.href='managerConsultingList.do'">상담목록</button></li>
				<li><button type="button" onclick="location.href='managerChart.do'">통 계</button></li>
			</ul>
		</article>
	</section>
<h2>관리자 기업의뢰목록</h2>
<select>
	<option>전체보기</option>
	<option>기업별</option>
	<option>미결제</option>
	<option>결제완료</option>
</select>
<form>
<table border="1">
   <tr>
   		<th class="text-center">선택</th>
     	<th class="text-center">순번</th>
		<th class="text-center">카테고리ID</th>
		<th class="text-center">의뢰일</th>
		<th class="text-center">진행상태</th>
		<th class="text-center">시험일시</th>
		<th class="text-center">삭제</th>
   </tr>
   <c:forEach items="${result }" var="EstimateVO">
   <tr>
      <td><input type="checkbox" name="estiList" value="${EstimateVO.estimateId }"></td>
      <td>아마존</td>
      <td>아마존 신입 공채 시험</td>
      <td>2020.06.20 
		15:00 ~ 18:00</td>
      <td>완료</td>
   </tr>
   </c:forEach>
</table>
</form>
   
</body>
</html>