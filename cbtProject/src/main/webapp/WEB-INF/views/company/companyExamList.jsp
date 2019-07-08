<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<title>CBT 시험 일정 확인</title>


<script>
	// 2019.07.09 성재민 
	// showPopup() 메소드 변수 하나 받게 수정
	// 팝업창이 아니라 다음 화면으로 이동하게 수정
	function showDetail(examId){
		location.href = "companyExamListDetail.do/" + examId;
	}
</script>
</head>
<body>
시험목록확인(기업)
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>
	<header id="header"></header>
   <section>
   <article>
      <ul>
         <li><button type="button" onclick="location.href='accountManage.html'">계정관리</button></li>
         <li><button type="button" onclick="location.href='requestList.html'">의뢰목록</button></li>
         <li><button type="button" onclick="location.href='conSulting_List.html'">상담목록</button></li>
         <li><button type="button" onclick="location.href='test_List.html'">시험목록</button></li>
      </ul>
   </article>
</section>
	<table border="1" align="center">
		<tr >
			<th>시험이름</th>
			<th>시험일시</th>
		</tr>
		<!-- 2019.07.09 성재민 -->
		<!-- c:forEach 로 값 설정 -->
		<c:forEach items="${companyExamList}" var="exam">
			<tr onclick="showDetail(${exam.examId});">
				<td>${exam.examName}</td>
				<td>${exam.examStartTime}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>