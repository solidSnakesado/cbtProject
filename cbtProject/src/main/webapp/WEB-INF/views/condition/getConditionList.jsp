<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getConditionList.jsp</title>
</head>
<body>
	<h3>상태 목록</h3>
	
	
	<form action="deleteCondition.do">
	<table>
		<tr>
			<th>선택</th>
			<th>번호</th>
			<th>마스터코드</th>
			<th>마스터이름</th>
			<th>상세코드</th>
			<th>상세이름</th>
			<th>사용여부</th>
		</tr>
		<c:forEach items="${result}" var="condition">
		<tr>
			<td><input type="checkbox" name="CdTionList" value="${condition.conditionSeq }"></td>
			<td>${condition.conditionSeq }</td>
			<td><a href="updateCondition/${condition.conditionSeq }">${condition.masterCd }</a></td>
			<td>${condition.masterNm }</td>
			<td>${condition.detailCd }</td>
			<td>${condition.detailNm }</td>
			<td>${condition.useYn }</td>
		</tr>
		</c:forEach>
	</table>
	
	<button>삭제</button>
	</form>
	<a href="insertCondition.do">상태 등록</a>
</body>
</html>