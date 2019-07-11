<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<script>

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
	
/* 	$.each(data,function(idx,item){
		$('<tr onClick="getExamInfoDetail('+item.examName+')" id="hover">')
		.append($('<td>').html(item.examName))
		.append($('<td>').html(item.questionQuantity))
		.append($('<td>').html(item.examStartTime))
		.append($('<td>').html(item.examEndTime))
		.append($('<td>').html(item.passingScore))
		.append($('<td>').html(item.examDescriptionSimple))
		.append($('<td>').html(item.examDescriptionDetail))
		.appendTo('tbody');
	}); */
}
/* function getExamInfoDetail(examName){
	console.log(examName);
	var wintype = "toolbar=no,width=500,height=1000,top=150,left=150,directories=no,menubar=no,scrollbars=yes";
	var winopen = window.open("candidateExaminationListDetail.do/"+ examName,"windowopen",wintype);
} */

</script>
<title>CBT 시험 일정 확인</title>
</head>
<body>
	<h1>응시가능한 시험</h1>
	<br>
	
	<div class="container">
		<table class="table text-center" border="1">
			<thead>
				<tr>
					<th>시험명</th>
					<th>문항수</th>
					<th>시험시작</th>
					<th>시험종료</th>
					<th>합격기준</th>
<!-- 					<th>시험소개</th>
					<th>시험설명</th> -->
				</tr>
			</thead>
			<tbody>
 
		   	<c:forEach var="examInfo" items="${result}">
				<tr onclick="getExamInfo('${examInfo.examId}')">
					<td>${examInfo.examName}</td>
					<td>${examInfo.questionQuantity}</td>
					<td>${examInfo.examStartTime}</td>
					<td>${examInfo.examEndTime}</td>
					<td>${examInfo.passingScore}</td>
<%-- 					<td>${examInfo.examDescriptionSimple}</td>
					<td>${examInfo.examDescriptionDetail}</td> --%>
				</tr>
			</c:forEach>  
		
			</tbody>
		</table><br>
	</div><br><br><br>
	
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
	
	<div align="right"><a href="candidateMain.do"><button>돌아가기</button></a></div>&nbsp;&nbsp;&nbsp;
</body>
</html>