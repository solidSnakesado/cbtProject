<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
<script type="text/javascript">
function checkForm() {
    var managerId 		= document.fmField.managerId;
    var managerPassword 	= document.fmField.managerPassword;
    // 아이디 입력 유무 체크
    if(managerId.value == '') {
        window.alert("아이디를 입력하세요");
    }
    if(document.fmField.managerPassword.value == ''){
    	window.alert('암호를 입력하세요.');
    	e.preventDefault();
        return false;
    }
    document.fmField.submit();
}
</script>
	
	
	<header id="header"></header>
	<form id="fmField" name="fmField" action="managerLogin.do" method="POST">
		<table border="1" align="center">
			<tr>
				<td>ID :</td>
				<td><input type="text" name="managerId" value="${VO.managerId}"></td>
			</tr>
			<tr>
				<td>PW :</td>
				<td><input type="text" name="managerPassword"></td>
			</tr>
			<tr>
				<td align="center" colspan="2"><input type="button" value="관리자로 로그인" onclick="checkForm()"/>&nbsp; <input type="reset" value="취소" /></td>
			</tr>
		</table>
	</form>
	<div align="center">
		<br>
		<a href="candidateMain.do"><button>돌아가기</button></a><br> <br>
	</div>
</body>
</html>