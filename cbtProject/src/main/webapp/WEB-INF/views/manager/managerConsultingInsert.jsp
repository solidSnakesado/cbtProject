<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>
	<header id="header"></header>
	<form name="managerConsultingInsert.do" method="post">
		<c:if test="${not empty sessionScope.company }">
			<input type="hidden" name="companyId" value="${company.companyId}">
		</c:if>
		<h2>관리자 상담 등록 페이지</h2>
		<table style="padding: 5px 0 5px 0;" align = "center">
			<tr>
				<th>기업ID</th><td><input type="text" name="companyId"></td>
			</tr>
			<tr>
				<th>제목</th><td><input type="text" name="consultingTitle" size="41"></td>
			</tr>
			<tr>
				<th>내용</th><td><textarea name="consultingContents" rows="8" cols="40"></textarea></td>
			</tr>
			<tr>
				<th>상담희망일</th><td><input type="datetime-local" name="consultingDesiredDate" size="80"></td>
			</tr>
			<tr>
				<th>상담일</th><td><input type="datetime-local" name="consultingDate" size="80"></td>
			</tr>
			<tr>
				<th>비고</th><td><textarea name="consultingRemarks" rows="4" cols="40"></textarea></td>
			</tr>
			<tr>
				<th>상담상태</th><td>
				<my:select items="${C}" name="consultingState" value="${result.consultingState }"></my:select></td>
			</tr>
			
		</table>
		<br><br>
		<input type="submit" value="상담신청">
		<input type="button" onclick="location.href='${pageContext.request.contextPath }/managerConsultingList.do'" value="돌아가기">	
	</form>
</body>
</html>


