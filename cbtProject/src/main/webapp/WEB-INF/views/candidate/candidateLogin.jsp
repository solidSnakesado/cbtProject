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
	ID : <input type="text" id="id"><br>
	PW : <input type="password" id="pw"><br>
	<br>
	<input type="radio" name="user" value="기업">기업
	<input type="radio" name="user" value="응시자">응시자
	<br><br>
	<a href="managerAccount.do"><button>관리자 계정으로 로그인하기</button></a>
	<a href="companyMain.do"><img src="${pageContext.request.contextPath}/image/login_company.png"></a>
	<a href="candidateMain.do"><img src="${pageContext.request.contextPath}/image/login_individual.png"></a>
	<a href="candidateMain.do"><button>로그인</button></a><a href="candidateInSignUp.do"><button>회원가입</button></a><a href="candidateMain.do"><button>돌아가기</button></a>
	
</body>
</html>