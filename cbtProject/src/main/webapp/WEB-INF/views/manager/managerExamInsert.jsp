<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<title>managerExamInsert.jsp</title>
</head>
<body>
	<div align="center">
		<h2>관리자 시험 등록 페이지</h2>
	<hr />
		</div>
		<form action="${pageContext.request.contextPath }/managerExamInsert.do" method="post" enctype="application/x-www-form-urlencoded">
		<table style="padding: 5px 0 5px 0;" align = "center">
			<tr>
				<th width="150px">시험ID</th>
				<td><input type="hidden" name="examId" readonly></td>
			</tr>
			<tr>
				<th width="150px">시작일</th>
				<td><input type="datetime-local" name="examStartTime"></td>
			</tr>
			<tr>
				<th>종료일</th>
				<td><input type="datetime-local" name="examEndTime"></td>
			</tr>
			<tr>
				<th>의뢰기업</th>
				<td><input type="hidden" name="companyId"></td>
			</tr>
			<tr>
				<th width="150px">시험이름</th>
				<td><input type="text" name="examName"></td>
			</tr>
			<tr>
				<th>시험시간</th>
				<td><input type="datetime-local" name="examStartTime" size="80"></td>
			</tr>
			<tr>
				<th>문항수</th>
				<td><input type="text" name="questionQuantity"></td>
			</tr>
			<tr>
				<th>응시가능 횟수</th>
				<td><input type="text" name="numberOfTimes"></td>
			</tr>
			<tr>
				<th>합격 점수</th>
				<td><input type="text" name="passingScore"></td>
			</tr>
			<tr>
				<th>응시가능 인원</th>
				<td><input type="text" name="possibleApplicants"></td>
			</tr>
			<tr>
				<th>공개여부</th><td>
				<my:select items="${O}" name="disclosureStatus" value="${result.disclosureStatus }"></my:select></td>
			</tr>
			<tr>
				<th>시험상태</th><td>
				<my:select items="${D}" name="examStatus" value="${result.examStatus }"></my:select></td>
			</tr>
			<tr>
				<th>출제상태</th><td>
				<my:select items="${I}" name="setExamStatus" value="${result.setExamStatus }"></my:select></td>
			</tr>
			<tr>
				<th>시험설명(간략)</th>
				<td><input type="text" name="possibleApplicants"></td>
			</tr>
			<tr>
				<th>시험설명(상세)</th>
				<td><input type="text" name="examDescriptionDetail"></td>
			</tr>
		</table>
		<br><br>
		<input type="submit" id="submit" value="시험등록">
		<input type="reset" id="rest" onclick="location.href='${pageContext.request.contextPath }/managerExamList.do'" value="돌아가기">	
	</form>
</body>
</html>


