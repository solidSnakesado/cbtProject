<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<script>
	function checkFileType(filePath) {
		var fileFormat = filePath.split(".");
		if (fileFormat.indexOf("xlsx") > -1) {
			return true;
		} else {
			return false;
		}
	}

	function fileCheck() {
		var file = $("#fileInput").val();
		if (file == "" || file == null) {
			alert("파일을 선택해주세요.");
			return false;
		} else if (!checkFileType(file)) {
			alert("엑셀 파일만 업로드 가능합니다.");
			return false;
		}

		if (confirm("업로드 하시겠습니까?")) {
			$("#formUpload").submit();
		}
	}
</script>
<style>
</style>
</head>
<body>

	<h2>응시자 계정관리</h2>
	<button type="button" onclick="location.href='managerUserInsert.do'">응시자추가</button>
	<form action="${pageContext.request.contextPath}/excelUpload.do" id="formUpload" name="formUpload" method="post" enctype="multipart/form-data">
    	<input type="file" id="fileInput" name="fileInput" value="파일검색" accept=".xlsx">
    	<br><br><input type="button" onclick="fileCheck()" value="파일업로드">
	</form>

	<br>
	<br>
	<form action="managerUserDelete.do">
		<button type="">응시자 삭제</button>
		<br>
		<br>

		<table border="1" align="center">
			<tr>
				<th>선택</th>
				<th>응시자ID</th>
				<th>이름</th>
				<th>E-Mail</th>
			</tr>
			<c:forEach items="${result }" var="CandidateVO">
				<tr>
					<td><input type="checkbox" name="takerList"
						value="${CandidateVO.takerId }"></td>
					<td>${CandidateVO.takerId }</td>
					<td><a
						href="managerUserAccountEdit.do/${CandidateVO.takerId }">${CandidateVO.takerName }</a></td>
					<td>${CandidateVO.takerEmail }</td>
				</tr>
			</c:forEach>
		</table>
	</form>
</body>
</html>