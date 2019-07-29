<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<script>
function checkForm() {
	var takerPassword = document.fmField.takerPassword;
	var takerPasswordRe = document.fmField.takerPasswordRe;
	var pattern1 = /[0-9]/;	// 숫자 
	var pattern2 = /[a-zA-Z]/;	// 문자 
	var pattern3 = /[~!@#$%^&*()_+|<>?:{}]/;	// 특수문자
	var takerName = document.fmField.takerName;
	var takerInfo = document.fmField.takerInfo;
	var takerEmail = document.fmField.takerEmail;
	
	var regEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i; 
	var email = document.fmField.takerEmail.value;
	
	
	if (document.fmField.takerPassword.value != document.fmField.takerPasswordRe.value) {
		window.alert('password가 일치하지 않습니다');
		e.preventDefault();
		document.fmField.takerPassword.focus()
		return false;
	}
	//암호 보안 강화
    if(!pattern1.test(document.fmField.takerPassword.value) || !pattern2.test(document.fmField.takerPassword.value) || !pattern3.test(document.fmField.takerPassword.value) || document.fmField.takerPassword.value.length < 8) { 
    	window.alert("비밀번호는 8자리 이상 문자, 숫자, 특수문자로 구성하여야 합니다."); 
    	e.preventDefault();
    	return false; 
    } 
	if (takerInfo.value.length != 6) {
		window.alert('생년월일을 확인하세요.');
		e.preventDefault();
		document.fmField.takerInfo.focus()
		return false;
	}
	if (document.fmField.takerEmail.value == '') {
		window.alert('이메일 주소를 입력하세요.');
		e.preventDefault();
		document.fmField.takerEmail.focus()
		return false;
	}
	if( regEmail.test(email) == false) {
		window.alert('올바른 이메일형태가 아닙니다');
		e.preventDefault();
		document.fmField.takerEmail.focus()
		return false;
	}
	if (document.fmField.takerPhoneNum.value == '') {
		window.alert('연락처를 입력하세요.');
		e.preventDefault();
		document.fmField.takerPhoneNum.focus()
		return false;
	}
	if (takerPhoneNum.value.length < 11 || takerPhoneNum.value.length > 13) {
		window.alert("연락처를 입력하시오");
		e.preventDefault();
		document.fmField.takerPhoneNum.focus();
		return false; // 아이디 입력이 안되어 있다면 submint 이벤트를 중지
}
	document.fmField.submit();
}
</script>
</head>
<body>
	<!-- 마이페이지<개인> 계정관리-->
	<h4 class="mx-auto pb-2">계정관리</h4>${username} 님의 정보입니다.
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
				<td><input type="text" name="takerInfo" class="form-control" value="${candidate.takerInfo}"/></td>
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
