<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<title>전체 시험 일정 확인</title>


<script>
	// 2019.07.09 성재민 
	// showPopup() 메소드 변수 하나 받게 수정
	// 팝업창이 아니라 다음 화면으로 이동하게 수정
	function showDetail(examId){
		location.href = "managerExamListDetail.do/" + examId;
	}
</script>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>
	<header id="header"></header>
	<h3>시험목록확인(기업)</h3>
	<table border="1" align="center">
		<tr >
			<th>의뢰기업</th>
			<th>시험이름</th>
			<th>시험일시</th>
			<th>시험상태</th>
			<th>시험출제상태</th>
		</tr>
		<!-- 2019.07.09 성재민 -->
		<!-- c:forEach 로 값 설정 -->
		<!-- 2019.07.11 성재민 -->
		<!-- 각종 상태값을 코드로 받아서 해당 코드별 문자열로 변환 -->
		<c:forEach items="${ExamList}" var="exam">
			<tr onclick="showDetail(${exam.examId});">
				<td>${exam.companyId}</td>
				<td>${exam.examName}</td>
				<td>${exam.examStartTime}~<br>${exam.examEndTime}</td>
				<c:if test="${exam.examStatus == 'D1'}">
					<td>시험전</td>
				</c:if>
				<c:if test="${exam.examStatus == 'D2'}">
					<td>시험중</td>
				</c:if>
				<c:if test="${exam.examStatus == 'D3'}">
					<td>시험완료</td>
				</c:if>
				<c:if test="${exam.setExamStatus == 'I1'}">
					<td>출제전</td>
				</c:if>
				<c:if test="${exam.setExamStatus == 'I2'}">
					<td>출제중</td>
				</c:if>
				<c:if test="${exam.setExamStatus == 'I3'}">
					<td>출제완료</td>
				</c:if>
			</tr>
		</c:forEach>
	</table>
</body>
</html>