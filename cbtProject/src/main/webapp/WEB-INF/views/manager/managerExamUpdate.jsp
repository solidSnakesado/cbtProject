<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#I1SetExam").click(function() {
			console.log("send");
			location.href="${pageContext.request.contextPath }/getQuestionList.do/${selectedExam.examId}"
		});
		
		$("#I2SetExam").click(function() {
			console.log("send");
			location.href="${pageContext.request.contextPath }/getQuestionList.do/${selectedExam.examId}"
		});
	});
	
	jQuery.datetimepicker.setLocale('kr'); // 한국어
	   
	   
	   jQuery(function(){
	      
	      /* jQuery('#startTime').datetimepicker({
	          format:'Y.m.d H:i',
	          allowTimes:[
	           '9:00', '9:30', '10:00', '10:30', '11:00', '11:30', '12:00',
	            '12:30', '13:00', '13:30', '14:00', '14:30', '15:00', '15:30', '16:00',
	           '16:30', '17:00', '17:30', '18:00', '18:30', '19:00', '19:30', '19:30',
	           '20:00', '20:30', '21:00'
	          ]
	          ,
	       timepicker:false
	      }); */
	      
	      
	      jQuery(function(){
	          jQuery('#date_timepicker_start').datetimepicker({
	           format:'Y/m/d H:i',
	           allowTimes:[
	              '9:00', '9:30', '10:00', '10:30', '11:00', '11:30', '12:00',
	               '12:30', '13:00', '13:30', '14:00', '14:30', '15:00', '15:30', '16:00',
	              '16:30', '17:00', '17:30', '18:00', '18:30', '19:00', '19:30', '19:30',
	              '20:00', '20:30', '21:00'
	             ],
	           onShow:function( ct ){
	            this.setOptions({
	             maxDate:jQuery('#date_timepicker_end').val()?jQuery('#date_timepicker_end').val():false
	            })
	           },
	           timepicker:true
	          });
	          jQuery('#date_timepicker_end').datetimepicker({
	           format:'Y/m/d H:i',
	           allowTimes:[
	              '9:00', '9:30', '10:00', '10:30', '11:00', '11:30', '12:00',
	               '12:30', '13:00', '13:30', '14:00', '14:30', '15:00', '15:30', '16:00',
	              '16:30', '17:00', '17:30', '18:00', '18:30', '19:00', '19:30', '19:30',
	              '20:00', '20:30', '21:00'
	             ],
	           onShow:function( ct ){
	            this.setOptions({
	             minDate:jQuery('#date_timepicker_start').val()?jQuery('#date_timepicker_start').val():false
	            })
	           },
	           timepicker:true
	          });
	         });
	      
	      
	      });
	   
</script>
</head>
<body>

	<!-- 2019.07.11 성재민 -->
	<!-- 시험 정보 상세 보기 수정 -->
	<header id="header"></header>
	<h3>개별 시험 의뢰 목록 (기업화면)</h3>
	<form action="${pageContext.request.contextPath }/managerExamUpdate.do" method="post">
	<input type = "hidden" name = "examId" value = "${selectedExam.examId}">
	<table border = "1" align="center">
		<tr>
			<th width="150px">의뢰ID</th>
			<td><input type="text" name="companyId" value="${selectedExam.companyId}" id = "companyId" ></td>
		</tr>
		<tr>
			<th width="150px">시험이름</th>
			<td><input type="text" name="estimateName" value="${selectedExam.examName}" id="estimateName"></td>
		</tr>
		<tr>
			<th>시험시작시간</th>
			<td><input type="text" name="examStartTime" value="${selectedExam.examStartTime}" id="examStartTime"></td>
		</tr>
		<tr>
			<th>시험종료시간</th>
			<td><input type="text" name="examEndTime" value="${selectedExam.examEndTime}" id="examEndTime"></td>
		</tr>
		<tr>
			<th>문항수</th>
			<td><input type="text" name="questionQuantity" value="${selectedExam.questionQuantity}" id="questionQuantity"></td>
		</tr>
		<tr>
			<th>응시가능 횟수</th>
			<td><input type="text" name="numberOfTimes" value="${selectedExam.numberOfTimes}" id="numberOfTimes"></td>
		</tr>
		<tr>
			<th>합격 점수</th>
			<td><input type="text" name="passingScore" value="${selectedExam.passingScore}" id="passingScore"></td>
		</tr>
		<tr>
			<th>응시가능 인원</th>
			<td><input type="text" name="possibleApplicants" value="${selectedExam.possibleApplicants}" id="possibleApplicants"></td>
		</tr>
		<tr>
			<th>공개여부</th>
			<td><my:select items="${O}" name="disclosureStatus" value="${selectedExam.disclosureStatus }"></my:select></td>
		</tr>
		<tr>
			<th>시험상태</th>
			<td><my:select items="${D}" name="examStatus" value="${selectedExam.examStatus }"></my:select></td>
		</tr>
		<tr>
			<th>출제상태</th>
			<td><my:select items="${I}" name="setExamStatus" value="${selectedExam.setExamStatus }"></my:select></td>
		</tr>
		<tr>
			<th>시험설명(간략)</th>
			<td><input type="text" name="examDescriptionSimple" value="${selectedExam.examDescriptionSimple}" id="examDescriptionSimple"></td>
		</tr>
		<tr>
			<th>시험설명(상세)</th>
			<td><input type="text" name="examDescriptionDetail" value="${selectedExam.examDescriptionDetail}" id="examDescriptionDetail"></td>
		</tr>
	</table>
	<br>
	<input type= "submit" value="수정하기">
	<input type = "button" onclick = "location.href = '${pageContext.request.contextPath }/managerExamList.do'" value = "돌아가기">
	</form>
</body>
</html>






