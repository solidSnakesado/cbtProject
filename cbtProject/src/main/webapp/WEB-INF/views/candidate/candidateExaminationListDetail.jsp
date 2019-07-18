<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<title>응시 세부 목록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#chartBtn").click(function() {
			google.load("visualization", "1", {packages : ["corechart"]});
			google.setOnLoadCallback(loadPageData);

			function loadPageData() {
				$.ajax({
					type: "POST",
					url : "${pageContext.request.contextPath }/getTakeExamHistoryForTakerIdAndExamIdList.do/${candidateExaminationListDetail.takeExamId}",
					success: function(data) {
						var chartData 	= new google.visualization.DataTable();
						var takeScore 	= 0;
						var testName 	= data[0].examName;
						var passScore	= data[0].passingScore;		
						
						chartData.addColumn('string', '점수');
						chartData.addColumn('number', '점수');		
						
						data.forEach(function (row) {
							takeScore += row.takerScore;
						});
						
						chartData.addRow([
							'총점',
							100
					    ]);
						
						chartData.addRow([
							'합격점수',
							passScore
					    ]);
						
						chartData.addRow([
							'획득점수',
							takeScore
					    ]);
						
						var options = {
					            title : testName,
					            chartArea : {
					                width : '80%'
					            },
					            hAxis : {
					                title : '점수',
					                minValue : 0
					            },
					            animation: { //차트가 뿌려질때 실행될 애니메이션 효과
					                 startup: true,
					                 duration: 1000,
					                 easing: 'linear' }
					        };
						
						var chart = new google.visualization.BarChart(document.getElementById('chartDiv'));
						chart.draw(chartData, options);
					    window.addEventListener('resize', function() { chart.draw(chartData, options); }, false);
					}
				});
			}
		})
	});
</script>
</head>
<body>

	<h1>마이페이지(개인) 응시목록 세부목록</h1>
	<br>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
	</script>
	<c:set var="examName" value="${candidateExaminationListDetail.examName }" />
	<c:set var="examId" value="${candidateExaminationListDetail.examId }" />
	<c:set var="examStartTime" value="${candidateExaminationListDetail.examStartTime }" />
	<c:set var="takerName" value="${candidateExaminationListDetail.takerName }" />
	<c:set var="takeExamId" value="${candidateExaminationListDetail.takeExamId }" />
	<c:set var="takerInfo" value="${candidateExaminationListDetail.takerInfo }" />
	<c:set var="score" value="${candidateExaminationListDetail.score }" />
	<c:set var="passingScore" value="${candidateExaminationListDetail.passingScore }" />
	<table border = "1" class="table text-center">
	<%-- <c:forEach items="candidateExaminationListDetail" var="list"> --%>
		<tr>
			<th>시험명</th>
			<td>${examName }</td>
		</tr>
		<tr>
			<th>시험 일시</th>
			<td>${examStartTime }</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${takerName }</td>
		</tr>
		
		<tr>
			<th>주민번호</th>
			<td>${takerInfo }</td>
		</tr>
		<tr>
			<th>점수</th>
			<td>${score } / ${passingScore }</td>
		</tr>
		
		<tr>
			<th>합격여부</th>
			<td>
				<c:if test="${passingScore lt score }">합격</c:if>
				<c:if test="${passingScore ge score }">불합격</c:if>
			</td>
		</tr>
	<%-- </c:forEach> --%>
	</table>
	<!-- 2019.07.16 성재민 -->
	<!-- 통계보기 버튼 추가 -->
	<br>
	<div>
		<button id="chartBtn">통계보기</button>
		<a href="${pageContext.request.contextPath }/candidateRightAnswer.do/${examId}"><button>풀이보기</button></a>
	</div>
	<!-- chart가 생성될 공간 -->
	<div id="chartDiv"></div>
</body>
</html>