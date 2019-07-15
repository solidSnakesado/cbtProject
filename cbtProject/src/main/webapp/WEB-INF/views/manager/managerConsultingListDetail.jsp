<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

	<h3>개별 시험 상담 목록 (관리자화면)</h3>
	<form action="${pageContext.request.contextPath }/managerConsultingListDetail.do" method="post">
	<input type="hidden" name="consultingId" value="${result.consultingId }">
	<table border = "1">
		<tr>
			<th>상담 ID </th><td>${result.consultingId }</td>
		</tr>
		<tr>
			<th>상담 기업</th><td>${result.companyId }</td>
		</tr>
		<tr>
			<th>제목</th><td><input type="text" name="consultingTitle" size="80" value="${result.consultingTitle }"></td>
		<tr>
			<th>상담내용</th><td><textarea name="consultingContents" id="consultingContents" cols="80" rows="8">${result.consultingContents}</textarea></td>
		</tr>
		<tr>
			<th>상담희망일</th>
			<td><input type="datetime-local" name="consultingDesiredDate" id="consultingDesiredDate" value="${result.consultingDesiredDate}"></td>
		</tr>
		<tr>
			<th>상담일</th><c:if test="${not empty consulting.consultingDate }">
			<td><input type="datetime-local" name="consultingDate" id="consultingDate" readonly="readonly" value="${result.consultingDate}"></td>
			</c:if>
			<c:if test="${empty consulting.consultingDate }">
				<td>상담일이 지정되지 않았습니다.</td>
			</c:if>
		</tr>
		<tr>
		<tr>
			<th>비고</th><td><textarea name="consultingRemarks" id="consultingRemarks" cols="80" rows="4">${result.consultingRemarks }</textarea></td>
		</tr>
		<tr>
			<th>상담상태</th><td><my:select items="${C}" name="consultingState" value="${result.consultingState }"></my:select></td>
		</tr>
	</table>
	
		<input type="submit" value="수정하기">
		<input type="button" onclick="location.href='${pageContext.request.contextPath }/managerConsultingList.do'" value="돌아가기">
</form>
</body>
</html>