<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:if test="${not empty loginFail}">
	<script type="text/javascript">
		alert("로그인 오류.\nID와 비밀번호를 다시 입력해 주세요.");
	</script>
</c:if>
<c:if test="${not empty joinResult}">
	<c:if test="${joinResult == 'true'}">
		<script type="text/javascript">
			alert("가입이 완료 되었습니다.");
		</script>
	</c:if>
	<c:if test="${joinResult == 'false'}">
		<script type="text/javascript">
			alert("가입 중 오류가 발생하였습니다.");
		</script>
	</c:if>
</c:if>
</head>
<body>


<!-- 통합로그인 되면서 삭제처리(7/24) -->
<!-- <div  align="right"><a href="companyLogin.do"><button>기 업 계 정</button></a> &nbsp; <a href="managerLogin.do"><button>관리자계정 </button></a></div> -->
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
	<form id="fmField" name="fmField" action="processLogin.do" method="POST">
		<table class="table text-center">
<%-- 			<tr>
				<td colspan="2" align="center"><img src="${pageContext.request.contextPath}/image/user.jpg"/></td>
			</tr> --%>
			<tr>
				<td><label>ID</label></td>
				<td><input type="text" name="takerId" value="${candidateVO.takerId}"></td>
			</tr>
			<tr>
				<td><label>PW</label></td>
				<td><input type="password" name="takerPassword"></td>
			</tr>
			<tr>
				<td align="center" colspan="2"><input type="button" class="btn btn-primary" value="로그인" onclick="checkForm()"/>&nbsp; 
				<input type="reset" class="btn btn-warning" value="취소" /></td>
			</tr>
		</table>
	</form>
	<div align="right">
		<a href="${pageContext.request.contextPath }/insertCandidate.do"><button class="btn btn-primary">회원가입</button></a> &nbsp; <a href="candidateMain.do"><button class="btn btn-warning">돌아가기</button></a> &nbsp; <a href="${pageContext.request.contextPath }/findID.do"><button class="btn btn-info">ID찾기</button></a> <br> <br>
	</div>	

 	<a href = "https://kauth.kakao.com/oauth/authorize?client_id=c26738f5694564442fa900de9d855473&redirect_uri=http://localhost/app/oauth&response_type=code">
    <img src="${pageContext.request.contextPath}/image/kakaoLogin.jpg">
    </a>
</body>
</html>