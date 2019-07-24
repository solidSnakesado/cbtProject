<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>
	<h3>상담 세부 항목</h3>
	<table align="center">
		<tr>
			<th>상담희망일</th>
			<td style="text-align: left;"><input type="datetime-local" name="consultingDesiredDate" id="consultingDesiredDate" value="${consulting.consultingDesiredDate}" readonly></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="consultingTitle" id="consultingTitle" 
					value="${consulting.consultingTitle}" style="width: 100%;" readonly="readonly"></td>
		</tr>
		<tr>
			<th>상담내용</th>
			<td><textarea name="consultingContents" id="consultingContents" cols="80" rows="8" readonly>${consulting.consultingContents}</textarea><td>
		</tr>
		<tr>
			<!-- 2019.07.10 성재민 -->
			<!-- 상담일 값이 있으면 해당 값을 없으면 미정이라고 표시 -->
			<th>상담일</th>
			<c:if test="${not empty consulting.consultingDate }">
				<td><input type="datetime-local" name="consultingDate" id="consultingDate" readonly="readonly" value="${consulting.consultingDate}"></td>
			</c:if>
			<c:if test="${empty consulting.consultingDate }">
				<td>상담일이 지정되지 않았습니다.</td>
			</c:if>
		</tr>
	</table>
	<br>

	<c:if test="${consulting.consultingState == 0}">
		<input type="button" onclick="location.href='${pageContext.request.contextPath }/companyConSultingUpdate.do/${consulting.consultingId}'" value="수정하기">
	</c:if>
	<input type="button" onclick="location.href='${pageContext.request.contextPath }/companyConSultingDelete.do/${consulting.consultingId}'" value="삭제하기">
	<input type="button" onclick="location.href='${pageContext.request.contextPath }/companyConSultingList.do'" value="목록으로">
</body>
</html>