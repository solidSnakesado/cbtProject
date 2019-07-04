<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateManager.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<h1>상태정보 수정</h1>	
		
		<form action="${pageContext.request.contextPath }/updateCondition.do" method="post">
			<input type="hidden" name="conditionSeq" value="${condition.conditionSeq }"/>
			마스터 코드  : <input type="text" name="masterCd" value="${condition.masterCd }"><br>
			마스터 이름  : <input type="text" name="masterNm" value="${condition.masterNm }"><br>
			상세 코드 : <input type="text" name="detailCd" value="${condition.detailCd }"><br>
			상세 이름 : <input type="text" name="detailNm" value="${condition.detailNm }"><br>
			사용 여부 : <input type="text" name="useYn" value="${condition.useYn }"><br>
			<input type="submit" value="수정">
			<a href="${pageContext.request.contextPath }/deleteCondition.do?conditionSeq=${condition.conditionSeq }">삭제</a>
			
		</form>
</body>
</html>