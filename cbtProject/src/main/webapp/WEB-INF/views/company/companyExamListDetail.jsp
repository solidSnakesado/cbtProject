<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/main.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#I1SetExam").click(function() {
			location.href="${pageContext.request.contextPath }/getQuestionList.do/${selectedExam.examId}"
		});
	});
</script>
</head>
<body>
	<!-- 2019.07.11 성재민 -->
	<!-- 시험 정보 상세 보기 수정 -->
	<header id="header"></header>
	<h3>개별 시험 의뢰 목록 (기업화면)</h3>
	<input type = "hidden" name = "no" value = "${ dto.no }">
	<table border = "1" align="center">
		<tr>
			<th width="150px">시험이름</th>
			<td>${selectedExam.examName}</td>
		</tr>
		<tr>
			<th>시험시간</th>
			<td>${selectedExam.examStartTime} ~ ${selectedExam.examEndTime}</td>
		</tr>
		<tr>
			<th>문항수</th>
			<td>${selectedExam.questionQuantity}</td>
		</tr>
		<tr>
			<th>응시가능 횟수</th>
			<td>${selectedExam.numberOfTimes}</td>
		</tr>
		<tr>
			<th>합격 점수</th>
			<td>${selectedExam.passingScore}</td>
		</tr>
		<tr>
			<th>응시가능 인원</th>
			<td>${selectedExam.possibleApplicants}</td>
		</tr>
		<tr>
			<th>공개여부</th>
			<c:if test="${selectedExam.disclosureStatus == '1'}">
				<td>공개</td>
			</c:if>
			<c:if test="${selectedExam.disclosureStatus == '2'}">
				<td>비공개</td>
			</c:if>
		</tr>
		<tr>
			<th>시험상태</th>
			<c:if test="${selectedExam.examStatus == 'D1'}">
				<td>시험전</td>
			</c:if>
			<c:if test="${selectedExam.examStatus == 'D2'}">
				<td>시험중</td>
			</c:if>
			<c:if test="${selectedExam.examStatus == 'D3'}">
				<td>시험완료</td>
			</c:if>
		</tr>
		<tr>
			<th>출제상태</th>
			<c:if test="${selectedExam.setExamStatus == 'I1'}">
				<td>출제전 <input type="button" id="I1SetExam" value="출제하기"></td>
			</c:if>
			<c:if test="${selectedExam.setExamStatus == 'I2'}">
				<td>출제중 <input type="button" id="I2SetExam" value="출제하기"></td>
			</c:if>
			<c:if test="${selectedExam.setExamStatus == 'I3'}">
				<td>출제완료</td>
			</c:if>
		</tr>
		<tr>
			<th>시험설명(간략)</th>
			<td>${selectedExam.examDescriptionSimple}</td>
		</tr>
		<tr>
			<th>시험설명(상세)</th>
			<td>${selectedExam.examDescriptionDetail}</td>
		</tr>
	</table>
	<br>
	<button onclick = "location.href = '${pageContext.request.contextPath }/companyExamListDetailGraph.do'" >통계보기</button>
	<input type = "button" onclick = "location.href = '${pageContext.request.contextPath }/companyExamList.do'" value = "돌아가기">
</body>
</html>