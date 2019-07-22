<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 2019.07.10 성재민 -->
<!-- 로그인 실패시 알림창 출력 -->
<c:if test="${not empty loginFail}">
	<script type="text/javascript">
		alert("로그인 오류.\nID와 비밀번호를 다시 입력해 주세요.");
	</script>
</c:if>
</head>
<body>
	<form action="companyLogin.do" method="post">
		id : <input type="text" name="companyId" value="${companyVO.companyId}"><br>
		pw : <input type="password" name="companyPassword"><br>
		<button>로그인</button>
	</form>
	<a href="${pageContext.request.contextPath }/companySignUp.do">가입하기</a>
	
	<a href="${pageContext.request.contextPath }/candidateMain.do">돌아가기</a>
</body>
</html>