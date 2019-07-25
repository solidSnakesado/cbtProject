<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<script>
function checkForm() {
	var takerPassword = document.fmField.takerPassword;
	var takerPasswordRe = document.fmField.takerPasswordRe;
	
	if (document.fmField.takerPassword.value != document.fmField.takerPasswordRe.value) {
		window.alert('password가 일치하지 않습니다');
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
	<h4 class="mx-auto pb-2">계정관리</h4>${sessionScope.candidate.takerId} 님의 정보입니다.
<%-- 	<form action="${pageContext.request.contextPath }/updateCandidate.do" method="post"> --%>
		<form d="fmField" name="fmField" action="updateCandidate.do" method="post">
		<table class="table text-center">
			<tr>
				<th><label>ID</label></th>
				<td><input type="hidden" name="takerId" class="form-control" value="${candidate.takerId}"/>${candidate.takerId}</td>
			</tr>
 			<tr>
				<th><label>패스워드</label></th>
				<td><input type="password" name="takerPassword" class="form-control"/></td>
			</tr> 
 			<tr>
				<th><label>패스워드확인</label></th>
				<td><input type="password" name="takerPasswordRe" class="form-control"/></td>
			</tr> 
			<tr>
				<th><label>이름</label></th>
				<td><input type="hidden" name="takerName" class="form-control"/>${candidate.takerName}</td>
			</tr>
			<tr>
				<th><label>생년월일</label></th>
				<td><input type="hidden" name="takerInfo" class="form-control" value="${candidate.takerInfo}"/>${candidate.takerInfo}</td>
			</tr>
			<tr>
				<th><label>E-mail</label></th>
				<td><input type="text" name="takerEmail" class="form-control" value="${candidate.takerEmail}" /></td>
			</tr>
			<tr>
				<th><label>연락처</label></th>
				<td><input type="text" name="takerPhoneNum" class="form-control" value="${candidate.takerPhoneNum}" /></td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="수정" class="btn btn-primary m-3 p-3" onclick="checkForm()"/> &nbsp; <input type="reset" value="취소" />
			</tr>

		</table>
		<!--테이블 끝-->
	</form>
	<div align="right"><a href="candidateMain.do"><button class="btn btn-primary m-3 p-3">돌아가기</button></a></div><br>
</body>
