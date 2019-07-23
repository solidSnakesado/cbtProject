<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
google.load("visualization", "1", {packages : ["corechart"]});
//옵션설정
var chartDifficultyOptions = {
  height :500,
  width :'100%',
  legend: { position: "top" },
  isStacked: false,
  tooltip:{textStyle : {fontSize:12}, showColorCode : true},
  animation: { //차트가 뿌려질때 실행될 애니메이션 효과
    startup: true,
    duration: 1000,
    easing: 'linear' },
  annotations: {
      textStyle: {
        fontSize: 15,
        bold: true,
        italic: true,
        color: '#871b47',
        auraColor: '#d799ae',
        opacity: 0.8
      }
 }
};


$(document).ready(function() {
		$("#chartBtn").click(function() {
//			google.setOnLoadCallback(loadPageData);
			
				$.ajax({
					type: "GET",
					url : "${pageContext.request.contextPath }/surveyStatistics.do",
					success: function(data) {
						console.log(data);
						var chartDifficultyData = new google.visualization.DataTable();
												
						chartDifficultyData.addColumn('string', '분류');
						chartDifficultyData.addColumn('number', '어려움');
						chartDifficultyData.addColumn('number', '조금어려움');
						chartDifficultyData.addColumn('number', '적당');
						chartDifficultyData.addColumn('number', '조금쉬움');
						chartDifficultyData.addColumn('number', '쉬움');
						
						
					data.forEach(function (item, row) {
							chartDifficultyData.addRow([
								item.q0, item.q1, item.q2, item.q3, item.q4, item.q5
						    ]);
							console.log(row);
						}); 					

					console.log(chartDifficultyData);
						//그래프 생성
						var chart1 = new google.visualization.ColumnChart(document.getElementById('chartDiv'));
						chart1.draw(chartDifficultyData, chartDifficultyOptions);
					    window.addEventListener('resize', function() { chart1.draw(chartDifficultyData, chartDifficultyOptions); }, false);
					}
				});
			});
	});								
</script>
</head>
<body>
	
	<section>
		<article>
			<ul>
				<li><button type="button" onclick="location.href='####.do'">시험결과 보기</button></li>
				<li><button type="button" onclick="location.href='simpleExamList.do'">설문결과 보기</button></li>
			</ul>
		</article>
	</section> 
	
	
	<table border="1" class="table text-center">
		<tr>
			<th>분류</th>
			<th>항목1</th>
			<th>항목2</th>
			<th>항목3</th>
			<th>항목4</th>
			<th>항목5</th>
		</tr>
		<c:forEach items="${simpleExamList}" var="list">
		<tr>
			<td>${list.q0}</td>
			<td>${list.q1}</td>
			<td>${list.q2}</td>
			<td>${list.q3}</td>
			<td>${list.q4}</td>
			<td>${list.q5}</td>
		</tr>
		</c:forEach>
	</table>
	
	<form action="">
		
	</form>
	<button id="chartBtn">통계보기</button>
	
	<div id="chartDiv">
	</div>
</body>
</html>