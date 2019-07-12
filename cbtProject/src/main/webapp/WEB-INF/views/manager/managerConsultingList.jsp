<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />

</head>
<body>
<h2>기업상담목록(관리자)</h2>

<h2>관리자 상담목록</h2>
<form>
<table border="1" align="center">
   <tr>
   	  <th>선택</th>
      <th>제목</th>
      <th>상담희망일</th>
   </tr>
   <c:forEach items="${result}" var="ConsultingVO">
   <tr>
      <td><input type="checkbox" name="consultingList" value="${ConsultingVO.consultingId }"></td>
      <td>${ConsultingVO.consultingTitle}</td>
      <td id="consultingDesiredDate_${ConsultingVO.consultingId}">${ConsultingVO.consultingDesiredDate}</td>
   </tr>
   </c:forEach>
</table>
</form>
</body>
</html>