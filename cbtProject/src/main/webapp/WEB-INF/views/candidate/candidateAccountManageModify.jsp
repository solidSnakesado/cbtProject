<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<style>
</style>
<script>
function checkForm() {
	var takerPassword = document.fmField.takerPassword;
	var takerPasswordRe = document.fmField.takerPasswordRe;
	
	if (document.fmField.takerPassword.value != document.fmField.takerPasswordRe.value) {
		window.alert('암호를 확인 하세요.');
		e.preventDefault();
		document.fmField.takerPassword.focus()
		return false;
	}
	document.fmField.submit();
}
</script>
</head>
<body>
	<!-- 마이페이지<개인> 계정관리-->
	<h1>계정관리</h1>${sessionScope.candidate.takerId} 님의 정보입니다.
<%-- 	<form action="${pageContext.request.contextPath }/updateCandidate.do" method="post"> --%>
		<form d="fmField" name="fmField" action="updateCandidate.do" method="post">
		<table class="table text-center">
			<tr>
				<th>ID</th>
				<td><input type="hidden" name="takerId" value="${candidate.takerId}"/>${candidate.takerId}</td>
			</tr>
 			<tr>
				<th>패스워드</th>
				<td><input type="password" name="takerPassword" value="${candidate.takerPassword}"/></td>
			</tr> 
 			<tr>
				<th>패스워드확인</th>
				<td><input type="password" name="takerPasswordRe"/></td>
			</tr> 
			<tr>
				<th>이름</th>
				<td><input type="hidden" name="takerName"/>${candidate.takerName}</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input type="hidden" name="takerInfo" value="${candidate.takerInfo}"/>${candidate.takerInfo}</td>
			</tr>
			<tr>
				<th>E-mail</th>
				<td><input type="text" name="takerEmail" value="${candidate.takerEmail}" /></td>
			</tr>
			<tr>
				<th>연락처</th>
				<td><input type="text" name="takerPhoneNum" value="${candidate.takerPhoneNum}" /></td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="수정" onclick="checkForm()"/> &nbsp; <input type="reset" value="취소" />
			</tr>

		</table>
		<!--테이블 끝-->
	</form>
	<div align="right"><a href="candidateMain.do"><button>돌아가기</button></a></div><br>
</body>
</html>