<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<title>설문 통계</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
			google.load("visualization", "1", {packages : ["corechart"]});
			google.setOnLoadCallback(loadPageData);

			function loadPageData() {
				$.ajax({
					type: "POST",
					url : "${pageContext.request.contextPath }/getSurveyResult.do/${examId}",
					success: function(data) {
						console.log(data);
						
						var q1 	= 0;			
						var q2	= 0;			
						var q3	= 0;
						var q4	= 0;
						var q5	= 0;
						var q6	= 0;
						var q7	= 0;
						var q8	= 0;
						var q9	= 0;
						
						q1 	= data[0].q1;
						q2 	= data[0].q2;
						q3 	= data[0].q3;
						q4 	= data[0].q4;
						q5 	= data[0].q5;
						q6 	= data[0].q6;
						q7 	= data[0].q7;
						q8 	= data[0].q8;
						q9 	= data[0].q9;
						
						$("#pageTitle").text(examName + " 통계");
						
						var surveyIdArr 	= new Array();
						var takeExamIdArr 	= new Array();	
						var newId 			= true;	

						data.forEach(function (row) {
							for(var i = 0; i < surveyIdArr.length; ++i) {
								if(surveyIdArr[i] == row.surveyId){
									newId = false;
									break;
								} else {
									newId = true;
								}
							}
							if(newId == true){
								takeExamIdArr.push(row.takeExamId);
							}
						});
							
							
						//q1 항목(난이도)
						//데이터 처리
						var chartDifficultyData = new google.visualization.DataTable();
						
						chartDifficultyData.addColumn('String', '난이도');
						chartDifficultyData.addColumn('number', ' ');
						
						chartDifficultyData.addRow([
							'난이도',
							q1.length
					    ]);
						
						//옵션설정
						var chartDifficultyOptions = {
					            title : "난이도",
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
						//그래프 생성
						var chart1 = new google.visualization.PieChart(document.getElementById('chartDiv'));
						chart1.draw(chartDifficultyData, chartDifficultyOptions);
					    window.addEventListener('resize', function() { chart1.draw(chartDifficultyData, chartDifficultyOptions); }, false);
						
					    
					    
						//q2 항목(출제방향)
						var chartdirectionData = new google.visualization.DataTable();
						chartdirectionData.addColumn('String', '방향성');
						chartdirectionData.addColumn('number', ' ');
						
						chartdirectionData.addRow([
							'방향성',
							q2.length
					    ]);
						//옵션설정
						var chartdirectionOptions = {
					            title : "방향성",
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
						//그래프 생성
						var chart2 = new google.visualization.PieChart(document.getElementById('chartDiv'));
						chart2.draw(chartdirectionData, chartdirectionOptions);
					    window.addEventListener('resize', function() { chart2.draw(chartdirectionData, chartdirectionOptions); }, false);
						
						
						//q3 시간
						var chartTimeData = new google.visualization.DataTable();
						
						chartTimeData.addColumn('String', '시간');
						chartTimeData.addColumn('number', ' ');
						
						chartTimeData.addRow([
							'시간',
							q3.length
					    ]);
						//옵션설정
						var cchartTimeOptions = {
					            title : "시간",
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
						//그래프 생성
						var chart3 = new google.visualization.PieChart(document.getElementById('chartDiv'));
						chart3.draw(chartTimeData, cchartTimeOptions);
					    window.addEventListener('resize', function() { chart3.draw(chartTimeData, cchartTimeOptions); }, false);
						
						
						//q4  서버 안정성
						var chartStablitiyData = new google.visualization.DataTable();
						
						chartStablitiyData.addColumn('String', '서버 안정성');
						chartStablitiyData.addColumn('number', '점수');	
						
						chartStablitiyData.addRow([
							'서버 안정성',
							q4.length
					    ]);
						//옵션설정
						var chartStablitiyOptions = {
					            title : "안정성",
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
						//그래프 생성
						var chart4 = new google.visualization.PieChart(document.getElementById('chartDiv'));
						chart4.draw(chartStablitiyData, chartStablitiyOptions);
					    window.addEventListener('resize', function() { chart4.draw(chartStablitiyData, chartDifficultyOptions); }, false);
						
						
						//q5  재방문 의사
						var chartRepeatData = new google.visualization.DataTable();
						
						chartRepeatData.addColumn('String', '재방문 의사');
						chartRepeatData.addColumn('number', '점수');	
						
						chartRepeatData.addRow([
							'재방문',
							q5.length
					    ]);
						//옵션설정
						var chartRepeatOptions = {
					            title : "재방문",
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
						//그래프 생성
						var chart5 = new google.visualization.PieChart(document.getElementById('chartDiv'));
						chart5.draw(chartRepeatData, chartRepeatOptions);
					    window.addEventListener('resize', function() { chart5.draw(chartRepeatData, chartRepeatOptions); }, false);
						
						
						//q6  홍보 의사
						var chartPRData = new google.visualization.DataTable();
						
						chartPRData.addColumn('string', '홍보 의사');
						chartPRData.addColumn('number', '점수');	
						
						chartPRData.addRow([
							'홍보의사',
							q6.length
					    ]);
						//옵션설정
						var chartPROptions = {
					            title : "홍보의사",
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
						//그래프 생성
						var chart6 = new google.visualization.PieChart(document.getElementById('chartDiv'));
						chart6.draw(chartPRData, chartPROptions);
					    window.addEventListener('resize', function() { chart6.draw(chartPRData, chartPROptions); }, false);
						
						
						//q7  응시목적
						var charPurposeData = new google.visualization.DataTable();
						
						charPurposeData.addColumn('string', '응시목적');
						charPurposeData.addColumn('number', '점수');	
						
						charPurposeData.addRow([
							'응시목적',
							q7.length
					    ]);
						//옵션설정
						var charPurposeOptions = {
					            title : "응시목적",
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
						//그래프 생성
						var chart7 = new google.visualization.PieChart(document.getElementById('chartDiv'));
						chart7.draw(charPurposeData, charPurposeOptions);
					    window.addEventListener('resize', function() { chart7.draw(charPurposeData, charPurposeOptions); }, false);
						
						
						//q8  준비기간
						var chartPeriodData = new google.visualization.DataTable();
						
						chartPeriodData.addColumn('string', '준비기간');
						chartPeriodData.addColumn('number', '점수');	
						
						chartPeriodData.addRow([
							'준비기간',
							q8.length
					    ]);
						//옵션설정
						var chartPeriodOptions = {
					            title : "준비기간",
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
						//그래프 생성
						var chart8 = new google.visualization.PieChart(document.getElementById('chartDiv'));
						chart8.draw(chartPeriodData, chartPeriodOptions);
					    window.addEventListener('resize', function() { chart8.draw(chartPeriodData, chartPeriodOptions); }, false);
						
						
						//q9  경로
						var chartPathData = new google.visualization.DataTable();
						
						chartPathData.addColumn('string', '경로');
						chartPathData.addColumn('number', '점수');	
						
						chartPathData.addRow([
							'경로',
							q9.length
					    ]);
						//옵션설정
						var chartPathOptions = {
					            title : "경로",
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
						//그래프 생성
						var chart9 = new google.visualization.PieChart(document.getElementById('chartDiv'));
						chart9.draw(chartPathData, chartPathOptions);
					    window.addEventListener('resize', function() { chart9.draw(chartPathData, chartPathOptions); }, false);
						
					    
					}	
				});
			}
	});
</script>
</head>
<body>
	<h1 id="pageTitle">s</h1>
	<br>
	<!-- chart가 생성될 공간 -->
	<div id="chartDiv" style="float:left; width: 50%; height: 450px;"></div>
	<div id="chartDiv2" style="float:left; width: 50%; height: 450px;"></div>
	<div id="chartDiv3" style="float:left; width: 90%; height: 450px;"></div>
</body>
</html>