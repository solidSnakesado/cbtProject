<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

	<h3>개별 시험 상담 목록 (관리자화면)</h3>
	<form action="${pageContext.request.contextPath }/managerConsultingListDetail.do" method="post">
	<table border = "1">
		<tr>
			<th>상담희망일</th><td><input type="datetime-local" name="consultingDesiredDate" id="consultingDesiredDate" value="${consulting.consultingDesiredDate}" readonly></td>
		</tr>
		<tr>
			<th>제목</th><td><input type="text" name="consultingTitle" id="consultingTitle" 
					value="${consulting.consultingTitle}" style="width: 100%;" readonly="readonly"></td>
		</tr>
		<tr>
			<th>상담내용</th><td><textarea name="consultingContents" id="consultingContents" cols="80" rows="8" readonly>${consulting.consultingContents}</textarea></td>
		</tr>
		<tr>
			<th>상담일</th><c:if test="${not empty consulting.consultingDate }">
			<td><input type="datetime-local" name="consultingDate" id="consultingDate" readonly="readonly" value="${consulting.consultingDate}"></td>
			</c:if>
			<c:if test="${empty consulting.consultingDate }">
				<td>상담일이 지정되지 않았습니다.</td>
			</c:if>
		</tr>
	</table>
	
	<c:if test="${consulting.consultingState == 0}">
		<input type="button" onclick="location.href='${pageContext.request.contextPath }/companyConSultingUpdate.do/${consulting.consultingId}'" value="수정하기">
	</c:if>
	<input type="button" onclick="location.href='${pageContext.request.contextPath }/companyConSultingDelete.do/${consulting.consultingId}'" value="삭제하기">
	<input type="button" onclick="location.href='${pageContext.request.contextPath }/companyConSultingList.do'" value="확인">
</form>
</body>
</html>