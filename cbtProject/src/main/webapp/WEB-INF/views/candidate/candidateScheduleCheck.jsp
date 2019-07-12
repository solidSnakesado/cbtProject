<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<script>
$(document).ready(function(){
	var arrTD = $("td[id^='Exam_List_']");
	for(var i = 0; i < arrTD.length; ++i){
		$(arrTD[i]).text($(arrTD[i]).text().replace("T"," "))
	}
});
function goList(p){
	searchFrm.page.value = p;
	searchFrm.submit();
}
/* 
function getExamInfo(examId){
	$.ajax({
		url:"../getExamInfomation.do/"+examId,
		type:"GET",
		dataType:'json',
		success : getExamInfoResult,
		error:function(xhr,status,msg){
			alert(status + msg);
		}
	});
}
function getExamInfoResult(item){

	$("#examName").html(item.examName);
	$("#questionQuantity").html(item.questionQuantity);
	$("#examStartTime").html(item.examStartTime);
	$("#examEndTime").html(item.examEndTime);
	$("#passingScore").html(item.passingScore);
	$("#examDescriptionSimple").html(item.examDescriptionSimple);
	$("#examDescriptionDetail").html(item.examDescriptionDetail); 
 */	
/*
	$.each(data,function(idx,item){
		$('<tr onClick="getExamInfoDetail('+item.examName+')" id="hover">')
		.append($('<td>').html(item.examName))
		.append($('<td>').html(item.questionQuantity))
		.append($('<td>').html(item.examStartTime))
		.append($('<td>').html(item.examEndTime))
		.append($('<td>').html(item.passingScore))
		.append($('<td>').html(item.examDescriptionSimple))
		.append($('<td>').html(item.examDescriptionDetail))
		.appendTo('tbody');
	}); 
*/
/* } */

</script>
<script>
/* 
	$('#itemAdd').click(function(){
	    var contents = '';
	    contents += '<tr>';
	    contents +=     '<td><input type="text" name="examName" /></td>';
	    contents +=     '<td><input type="text" name="questionQuantity" /></td>';
	    contents +=     '<td><input type="text" name="examStartTime" /></td>';
	    contents +=     '<td><input type="text" name="examEndTime" /></td>';
	    contents +=     '<td><input type="text" name="passingScore" /></td>';
	    contents +=     '<td><input type="text" name="examDescriptionSimple" /></td>';
	    contents +=     '<td><input type="text" name="examDescriptionDetail" /></td>';
	    contents +=     '<td><input type="button" value="응시하기" /></td>';
	    contents += '</tr>';
	});
*/
</script>
<title>CBT 시험 일정 확인</title>
</head>
<body>
	<h1>응시가능한 시험</h1>
	<br>
	<form name="searchFrm">
		<input type = "hidden" name="page" value="1">
	</form>

	<table class="table text-center" border="1">
		<tr>
			<th>시험코드</th>
			<th>시험명</th>
			<th>시험시작시간</th>
			<th>시험종료시간</th>
			<th>문항수</th>
			<th>합격기준</th>
<!-- 		<th>시험소개</th>
			<th>시험설명</th>  
-->
		</tr>

   	<c:forEach items="${candidateScheduleCheck}" var="examInfo" >
		<%-- <tr onclick="getExamInfo('${examInfo.EXAM_ID}')"> --%>
		<tr onclick="location.href='candidateExamDetialView.do/${examInfo.EXAM_ID}'">
			<td>${examInfo.EXAM_ID}</td>
			<td>${examInfo.EXAM_NAME}</td>
			<td>${examInfo.EXAM_START_TIME}</td>
			<td>${examInfo.EXAM_END_TIME}</td>
			<td>${examInfo.QUESTION_QUANTITY}</td>
			<td>${examInfo.PASSING_SCORE}</td>
<%-- 			
			<td>${examInfo.examDescriptionSimple}</td>
			<td>${examInfo.examDescriptionDetail}</td> 
 --%>
		</tr>
	</c:forEach>  
	</table><br>

	<div align="center"><my:paging jsFunc="goList" paging="${result.paging}"/></div><br>
	
<!-- 	
	<div class="container">
		<table class="table text-center" border="0">
			<tr>
				<th colspan="2"><h2>상세정보</h2></th>
			</tr>
			<tr>
				<th width="200">시험명</th><td id="examName"></td>
			</tr>
			
			<tr>
				<th>문항수</th><td id="questionQuantity"></td>
			</tr>
			<tr>
				<th>시험시작</th><td id="examStartTime"></td>
			</tr>
			<tr>
				<th>시험종료</th><td id="examEndTime"></td>
			</tr>
			<tr>
				<th>합격기준</th><td id="passingScore"></td>
			</tr>
			<tr>
				<th>시험안내</th><td id="examDescriptionSimple"></td>
			</tr>
			<tr>
				<th>시험설명</th><td id="examDescriptionDetail"></td>
			</tr>
			<tr>
				<td colspan="2"><button>응시하기</button></td>
			</tr>
		</table><br>
	</div> 
-->
	
	<div align="right"><a href="candidateMain.do"><button>돌아가기</button></a></div>&nbsp;&nbsp;&nbsp;
</body>
</html>