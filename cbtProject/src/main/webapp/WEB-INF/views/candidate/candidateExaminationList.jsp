<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<title>CBT 시험 일정 확인</title>

<script>
	function showPopup(){
		var innerWidth = window.innerWidth/2;
		var innerHeight= window.innerHeight/2;
		
		window.open("candidateExaminationListDetail.do","a","height=innerHeight ,width=innerWidth,left=0,top=0");
	}
	$(document).ready(function(){
		
		$("td").click(function(){
			$("#id").attr("value",$(this).attr('value'));
			console.log($("#id").val());
			var takeExamId = $("#id").val();
			alert(takeExamId);
			detailForm.submit();
		});
		
		$("#btn").click(function(){
			$("#tekeExam").attr("value",$(this).attr('value'));
			$("#examId").attr("value",$(this).attr('value'));
			console.log($("#tekeExam").val());
			var takeExamId = $("#tekeExam").val();
			var examId = $('#examId').val();
			alert(takeExamId);
			takeExamForm.submit();
		});
	})
	
</script>
</head>
<body>
마이페이지(개인) 응시목록
	<form id="detailForm" name="detailForm" action="candidateExaminationListDetail.do" method="post">
		<input type="text" id="id" name="takeExamId" value="${QuestionVO.takeExamId }" hidden="ture">
	</form>
	<form id="takeExamForm" name="takeExamForm" action="candidateTakeExam.do" method="post">
		<input type="text" id="tekeExam" name="takeExamId" value="${QuestionVO.takeExamId }" hidden="ture">
		<input type="text" id="examId" name="examId" value="${QuestionVO.examId }" hidden="ture">
	</form>
	<table id="table" border="1" align="center">
		<tr >
			<th>수험번호</th>
			<th>시험명</th>
			<th>커트라인</th>
			<th>시험일시</th>
			<th></th>
		</tr>
	<c:forEach items="${candidateExaminationList }" var="list" varStatus="status">
		<tr class="result" >
			<td id="takeExamId${status.count }" value="${list.takeExamId }">${list.takeExamId }</td>
			<td id="examName${status.count }" value="${list.takeExamId }">${list.examName }</td>
			<td id="passScore${status.count }" value="${list.takeExamId }">${list.passingScore }</td>
			<td id="examDate${status.count }" value="${list.takeExamId }">${list.examStartTime }</td>
			<th><button type="button" id="btn" value="${list.examId }">응시하기</button></th>
		</tr>
	</c:forEach>
	</table>
</body>
</html>