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
<script type='text/javascript'>
      //<![CDATA[
      // 사용할 앱의 JavaScript 키를 설정해 주세요.
      Kakao.init('YOUR KEY NUMBER');
      // 카카오 로그인 버튼을 생성합니다.
      Kakao.Auth.createLoginButton({
          container: '#kakao-login-btn',
          success: function (authObj) {
              alert(JSON.stringify(authObj));
          },
          fail: function (err) {
              alert(JSON.stringify(err));
          }
      });
    //]]>
</script>


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
		<a href = "https://kauth.kakao.com/oauth/authorize?client_id=69907cd9d071e81c5215c21beccec7ee&redirect_uri=http://localhost/project/oauth&response_type=code">
			<img src="${pageContext.request.contextPath}/image/kakaoLogin.jpg"></a>
</body>
</html>