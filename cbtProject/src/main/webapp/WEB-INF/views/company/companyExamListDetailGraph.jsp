<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<title>시험 통계</title>
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
					url : "${pageContext.request.contextPath }/getTakeExamHistoryForTakerIdAndExamIdList.do/1",
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

</body>
</html>