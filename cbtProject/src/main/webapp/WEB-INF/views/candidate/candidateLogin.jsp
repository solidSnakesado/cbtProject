<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#header").load("candidateInHeader.do")
		});
	</script>
	<header id="header"></header>
	<form action="candidateLogin.do" method="POST">
		<table border="1" align="center">
			<tr>
				<td>ID :</td>
				<td><input type="text" name="takerId" value="${candidateVO.takerId}"></td>
			</tr>
			<tr>
				<td>PW :</td>
				<td><input type="text" name="takerPassword"></td>
			</tr>
						<!-- 
				2019.07.02 장세준 - 그림과 라디오 버튼이 겹쳐서 그림을 shadow처리
				<input type="radio" name="user" value="기업">기업
				<input type="radio" name="user" value="응시자">응시자
				<br><br>
			
				<a href="companyMain.do"><img src="${pageContext.request.contextPath}/image/login_company.png"></a>
				<a href="candidateMain.do"><img src="${pageContext.request.contextPath}/image/login_individual.png"></a>
			-->
			<tr>
				<td align="center" colspan="2"><input type="submit" value="로그인" />&nbsp; <input type="reset" value="취소" /></td>
			</tr>
		</table>
	</form>
	<div align="center">
		<br>
		<a href="candidateInSignUp.do"><button>회원가입</button></a> &nbsp; <a href="candidateMain.do"><button>돌아가기</button></a><br> <br>
		<a href="managerAccount.do"><button>관리자 계정으로 로그인하기</button></a>
	</div>
</body>
</html>