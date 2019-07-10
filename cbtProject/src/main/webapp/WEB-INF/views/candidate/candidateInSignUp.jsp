<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
var idck = 0;
function openIdChk() {
    var takerId = $("#takerId").val();
    var pattern = /([^가-힣 \x20a-zA-Z0-9])/i; 
 /*    
	if (pattern.test(takerId)) { 
		window.alert("아이디는 한글,영어,숫자로만 입력하실수 있습니다");
		return false;
	}
	if(takerId.search(/\s/) != -1) {
		window.alert("공백은 허용되지 않습니다");
		return false;
	}
	if(takerId.value.length <= 4) {
		window.alert("아이디는 4자리 이상으로 구성하실수 있습니다");
		return false;
	} */
		$.ajax({
			async : false,
			type : "post",
			url : "idcheck.do",
			dataType : "json",
			data : JSON.stringify($("#fmField").serializeObject()),
			contentType : "application/json; charset=UTF-8",
			success : function(response) {
				console.log(response);
				if (response.result == true) {
					window.alert("사용가능한 아이디입니다.");
					$("#takerId").focus();
					idck = 1
				} else {
					window.alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
				}
			},
			error : function(error) {
				console.log(error);
			}
		});
	};
	function checkForm() {
		var takerId = document.fmField.takerId;
		var idDuplication = document.fmField.idDuplication;
		var takerPassword = document.fmField.takerPassword;
		var takerPasswordRe = document.fmField.takerPasswordRe;
		var takerName = document.fmField.takerName;
		var takerInfo = document.fmField.takerInfo;
		var takerEmail = document.fmField.takerEmail;
		// 아이디 입력 유무 체크
		if (takerId.value == ''
				|| !(takerId.value.length >= 3 && takerId.value.length <= 12)) {
			window.alert("아이디를 입력하시오");
			e.preventDefault();
			document.fmField.takerId.focus();
			return false; // 아이디 입력이 안되어 있다면 submint 이벤트를 중지
		}
		if (idck == 0) {
			window.alert("아이디 중복 체크를 해주세요.");
			e.preventDefault();
			document.fmField.takerId.focus();
			return false;
		}
		// 암호 입력 유무 체크
		if (document.fmField.takerPassword.value == '') {
			window.alert('암호를 입력하세요.');
			e.preventDefault();
			document.fmField.takerPassword.focus()
			return false;
		}
		// 암호 입력동일 여부 체크
		if (document.fmField.takerPassword.value != document.fmField.takerPasswordRe.value) {
			window.alert('암호를 확인 하세요.');
			e.preventDefault();
			document.fmField.takerPassword.focus()
			return false;
		}
		//  
		if (document.fmField.takerName.value == '') {
			window.alert('이름을 입력하세요.');
			e.preventDefault();
			document.fmField.takerName.focus()
			return false;
		}
		if (document.fmField.takerInfo.value == '') {
			window.alert('연락처를 입력하세요.');
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
		document.fmField.submit();
	}
</script>
	
	
	
</head>
<body>
	<script type="text/javascript">
/* 		$(document).ready(function() {
			$("#header").load("candidateInHeader.do")
		}); */
	</script>
	<header id="header"></header>
	
	<form id="fmField" name="fmField" action="insertCandidate.do" method="post" >
		<table border="1" align="center">
			<tr>
				<td>응시자ID</td>
				<td><input type="text" name="takerId" id="takerId"></td>
				<td><input type="button" value="중복확인" onclick="openIdChk();"/></td>
			</tr>
			<tr>
				<td>응시자PW</td>
				<td colspan="2"><input type="password" name="takerPassword" id="takerPassword"></td>
			</tr>
			<tr>
				<td>PW확인</td>
				<td colspan="2"><input type="password" name="takerPasswordRe" id="takerPasswordRe"></td>
			</tr>
			<tr>
				<td>성명</td>
				<td colspan="2"><input type="text" name="takerName" id="takerName"></td>
			</tr>
			<tr>
				<td>주민등록번호</td>
				<td colspan="2"><input type="text" name="takerInfo" id="takerInfo"></td>
			</tr>
			<tr>
				<td>E-mail</td>
				<td colspan="2"><input type="text" name="takerEmail" id="takerEmail"></td>
			</tr>
			<tr>
				<td>최종학력</td>
				<td colspan="2"><select name="takerEducation">
						<option value="1">중졸</option>
						<option value="2">고졸</option>
						<option value="3">초대졸</option>
						<option value="4">학사</option>
						<option value="5">석사</option>
						<option value="6">박사</option>
				</select></td>
			</tr>
		</table>
		<br> <br>
		<div align="center">
			<button type="button" onclick="checkForm()">가입</button> &nbsp; <input type="reset"
				value="취소" />
		</div>
	</form>

</body>
</html>