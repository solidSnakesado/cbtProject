<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<style type="text/css">
   .trexam {cursor: pointer; }
    tr.trexam:hover { background-color: lightblue; } 
   thead {background-color: lightgrey}
</style>
<script>
	$(document).ready(function(){
		
		function goList(p){
			searchFrm.page.value = p;
			searchFrm.submit();
		}
		
		$(function (){
			
			$(".result").mouseenter(function(){
				var count = $(this).children().attr("value");
				$("#result"+count+"").css('background-color','#E7F5FA');
			})
			
			$(".result").mouseleave(function(){
				var count = $(this).children().attr("value");
				$("#result"+count+"").css('background-color','white');
			})
			
		})
		
		
		$("td").click(function(){
			var count = $(this).parent().attr("value");
			var examId = $("[id ='examId"+count+"']").attr("value");
			var takeExamId = $("[id ='takeExamId"+count+"']").attr("value");
			var examName = $("[id ='examName"+count+"']").attr("value");
			var passingScore = $("[id ='passingScore"+count+"']").attr("value");
			var examStartTime = $("[id ='examStartTime"+count+"']").attr("value");
			var score = $("[id ='score"+count+"']").attr("value");
			
			$("#eId2").attr("value",examId);
			$("#tId2").attr("value",takeExamId);
			$("#eName2").attr("value",examName);
			$("#passScore2").attr("value",passingScore);
			$("#examTime2").attr("value",examStartTime);
			
			if(score != 9999){
				detailForm.submit();
			} else {
				$("[id ='detailForm']").attr('action','${pageContext.request.contextPath }/candidateTakeExam.do')
				if(confirm("응시 대기 중입니다. \n 시험에 응시 하시겠습니까?") == true) {
					detailForm.submit();
				}
			}
			
		});
		
	})
	
</script>

	<h4 class="mx-auto pb-2">마이페이지(개인) 응시목록</h4>
	<br>
	<form id="detailForm" name="detailForm" action="candidateExaminationListDetail.do" method="post">
		<input type="text" id="eId2" name="examId" class="form-control" value="${QuestionVO.examId }" hidden="ture">
		<input type="text" id="tId2" name="takeExamId" class="form-control" value="${QuestionVO.takeExamId }" hidden="ture">
		<input type="text" id="eName2" name="examName" class="form-control" value="${QuestionVO.examName }" hidden="ture">
		<input type="text" id="passScore2" name="passingScore" class="form-control" value="${QuestionVO.passingScore }" hidden="ture">
		<input type="text" id="examTime2" name="examStartTime" class="form-control" value="${QuestionVO.examStartTime }" hidden="ture">
	</form>
	<table id="table" border="1" class="table text-center">
		<tr>
			<th>시험코드</th>
			<th>수험번호</th>
			<th>시험명</th>
			<th>커트라인</th>
			<th>시험일시</th>
			<th>응시 상태</th>
		</tr>
	<c:forEach items="${candidateExaminationList}" var="list" varStatus="status">
		<tr id="result${status.count}" class="result" value="${status.count}">
			<td id="examId${status.count}" value="${list.examId}" >${list.examId}</td>
			<td id="takeExamId${status.count}" value="${list.takeExamId }">${list.takeExamId}</td>
			<td id="examName${status.count}" value="${list.examName}">${list.examName}</td>
			<td id="passingScore${status.count}" value="${list.passingScore}">${list.passingScore}</td>
			<td id="examStartTime${status.count}" value="${list.examStartTime}">${list.examStartTime}</td>
		<c:if test="${list.score == 9999 }">
			<td id="score${status.count}" value="${list.score}">응시 대기
		</c:if>
		<c:if test="${list.score != 9999 }">
			<td id="score${status.count}" value="${list.score}">응시 완료 &nbsp;&nbsp;
			</td>
		</c:if>
		</tr>
	</c:forEach>
	</table>
	
	<div align="center"><my:paging jsFunc="goList" paging="${result.paging}"/></div><br>
	
	<div align="right"><a href="candidateMain.do"><button class="btn btn-warning">돌아가기</button></a></div>&nbsp;&nbsp;&nbsp;

