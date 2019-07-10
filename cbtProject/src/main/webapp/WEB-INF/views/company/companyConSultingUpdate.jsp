<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title></title>
<script type="text/javascript">
	$(document).ready(function() {
		$("#updateBtn").click(function() {
			if($("#consultingDesiredDate").val() == ''){
				alert("상담희망일을 입력해 주세요");
				return false;
			}
			if($("#consultingTitle").val() == ''){
				alert("제목을 입력해 주세요");
				return false;
			}
			if($("#consultingContents").val() == ''){
				alert("내용을 입력해 주세요");
				return false;
			}
			
			$("#updateForm").submit();
		});
	});
</script>

</head>
<body>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>
	<h3>상담 수정</h3>
	<form action="${pageContext.request.contextPath}/companyConSultingUpdate.do" method="post" id="updateForm" name="updateForm">
		<input type="hidden" name="consultingId" value="${consulting.consultingId}">
		<table style="padding: 5px 0 5px 0;">
			<tr>
				<th>상담희망일</th>
				<td style="text-align: left;"><input type="datetime-local" name="consultingDesiredDate" id="consultingDesiredDate" value="${consulting.consultingDesiredDate}"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="consultingTitle" id="consultingTitle" value="${consulting.consultingTitle}" style="width: 100%;"></td>
			</tr>
			<tr>
				<th>상담내용</th>
				<td><textarea name="consultingContents" id="consultingContents" cols="80" rows="8">${consulting.consultingContents}</textarea><td>
			</tr>
		</table>
		<br>
		<input type="button" id="updateBtn" onclick="location.href='${pageContext.request.contextPath }/companyConSultingUpdate.do'" value="수정하기">
		<input type="button" onclick="location.href='${pageContext.request.contextPath }/companyConSultingDelete.do/${consulting.consultingId}'" value="삭제하기">
		<input type="button" onclick='window.close()' value="확인">
	</form>
</body>
</html>