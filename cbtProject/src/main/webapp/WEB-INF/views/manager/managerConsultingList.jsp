<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />

</head>
<body>
<h2>기업상담목록(관리자)</h2>

<br>
<button type="button" onclick="location.href='managerConsultingInsert.do'">상담내역 추가</button>

<br><br>
<form action="managerConsultingDelete.do">
<button id="">삭제</button>
<table border="1" align="center">
   <tr>
   	  <th>선택</th>
      <th>제목</th>
      <th>상담희망일</th>
      <th>상담진행상태</th>
   </tr>
   <c:forEach items="${result}" var="ConsultingVO">
   <tr>
      <td><input type="checkbox" name="consultingList" value="${ConsultingVO.consultingId }"></td>
      <td><a href="managerConsultingListDetail.do/${ConsultingVO.consultingId }">${ConsultingVO.consultingTitle}</a></td>
      <td>${ConsultingVO.consultingDesiredDate}</td>
      <td>${ConsultingVO.consultingStateNm }</td>
   </tr>
   </c:forEach>
</table>
</form>
</body>
</html>