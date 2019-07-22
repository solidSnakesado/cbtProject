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
<div  align="right"><a href="candidateLogin.do"><button>개 인 계 정</button></a> &nbsp; <a href="managerLogin.do"><button>관리자계정 </button></a></div>
<br>
	<form id="fmField" name="fmField"  action="companyLogin.do" method="post">
		<table border="1" align="center" class="table text-center">
			<tr>
				<td>ID :</td>
				<td><input type="text" name="companyId" value="${companyVO.companyId}"></td>
			</tr>
			<tr>
				<td>PW :</td>
				<td><input type="password" name="companyPassword"></td>
			</tr>
			<tr>
				<td align="center" colspan="2"><input type="button" value="기업로그인"/>&nbsp; <input type="reset" value="취소" /></td>
			</tr>
		</table>
	</form>
	<div align="right">
		<a href="${pageContext.request.contextPath }/companySignUp.do"><button>회원가입</button></a>
		<a href="${pageContext.request.contextPath }/candidateMain.do"><button>돌아가기</button></a>
	</div>
</body>
</html>