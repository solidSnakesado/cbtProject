<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<style>

</style>
</head>
<body>

<h2>응시자 계정관리</h2>
<form action="${pageContext.request.contextPath}/managerUserAccountEdit.do" method="post">
<input type="hidden" name="takerId" value="${result.takerId }">
<table border="1" align="center">
   <tr>
      <th>응시자ID</th>
      <td>${result.takerId}</td> 
   </tr>
   <tr>
      <th>비밀번호</th>
      <td><input type="password" name="takerPassword" value="${result.takerPassword }"></td> 
   </tr>
   <tr>
      <th>이름</th>
      <td><input type="text" name="takerName" value="${result.takerName }"></td> 
   </tr>
   <tr>
      <th>생년월일</th>
      <td><input type="text" name="takerInfo" value="${result.takerInfo }"></td> 
   </tr>
      <tr>
      <th>최종학력</th>
      <td><my:select items="${J}" name="takerEducation" value="${result.takerEducation }"></my:select>
      </td> 
   </tr>
    <tr>
      <th>이메일</th>
      <td><input type="text" name="takerEmail" value="${result.takerEmail }"></td> 
   </tr>
   <tr>
   	  <th>연락처</th>
   	  <td><input type="text" name="takerPhoneNum" value="${result.takerPhoneNum }"></td>
   </tr>
</table>
		<br><br>
	<input type="submit" value="수정" >
	<input type="button" value="돌아가기" onclick="location.href='../managerUserAccountList.do'">
</form>

</body>
</html>