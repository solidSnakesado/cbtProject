<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div  align="right"><a href="companyLogin.do"><button>기 업 계 정</button></a> &nbsp; <a href="managerLogin.do"><button>관리자계정 </button></a></div>
<br>
	<script type="text/javascript">
	function checkForm() {
	    var takerId 		= document.fmField.takerId;
	    var takerPassword 	= document.fmField.takerPassword;
	    // 아이디 입력 유무 체크
	    if(takerId.value == '') {
	        window.alert("아이디를 입력하세요");
	    }
	    if(document.fmField.takerPassword.value == ''){
	    	window.alert('암호를 입력하세요.');
	    	e.preventDefault();
	        return false;
	    }
	    document.fmField.submit();
	}
	</script>
	
	
	<header id="header"></header>
	<form id="fmField" name="fmField" action="candidateLogin.do" method="POST">
		<table border="1" align="center" class="table text-center">
			<tr>
				<td>ID :</td>
				<td><input type="text" name="takerId" value="${candidateVO.takerId}"></td>
			</tr>
			<tr>
				<td>PW :</td>
				<td><input type="password" name="takerPassword"></td>
			</tr>
			<tr>
				<td align="center" colspan="2"><input type="button" value="로그인" onclick="checkForm()"/>&nbsp; <input type="reset" value="취소" /></td>
			</tr>
		</table>
	</form>
	<div align="right">
		<a href="candidateInSignUp.do"><button>회원가입</button></a> &nbsp; <a href="candidateMain.do"><button>돌아가기</button></a><br> <br>
	</div>
</body>
</html>