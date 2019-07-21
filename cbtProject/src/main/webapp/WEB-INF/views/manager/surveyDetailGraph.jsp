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
						var examId	= 0;
						
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
						
						var surveyIdArr 			= new Array();
						var examIdArr 				= new Array();	

						// 배열 초기화
						for(var idx = 0; idx < examQuestionQuantity; ++idx){
							takerScoreQuestionArr[idx] 	= 0;
							totalScroeQuestionArr[idx] 	= 0;
						}
						
						var newId = true;	

						data.forEach(function (row) {
							for(var i = 0; i < surveyIdArr.length; ++i) {
								if(surveyIdArr[i] == row.surveyId){
									newId = false;
									break;
								} else {
									newId = true;
								}
							}
						
							
							
						//q1 항목(난이도)
						var DifficultyData = new google.visualization.DataTable();
						
						DifficultyData.addColumn('string', '난이도');
						DifficultyData.addColumn('number', '점수');	
						
						DifficultyData.addRow([
							'매우 어려움',
							q1.length
					    ]);
						
						DifficultyData.addRow([
							'어려움',
							q1.length
					    ]);
						DifficultyData.addRow([
							'적절함',
							q1.length
					    ]);
						DifficultyData.addRow([
							'쉬움',
							q1.length
					    ]);
						DifficultyData.addRow([
							'매우 쉬움',
							q1.length
					    ]);
						
						//q2 항목(출제방향)
						var directionData = new google.visualization.DataTable();
						
						directionData.addColumn('string', '방향성');
						directionData.addColumn('number', '점수');	
						
						directionData.addRow([
							'적절함',
							q2.length
					    ]);
						
						directionData.addRow([
							'대체로 적절함',
							q2.length
					    ]);
						directionData.addRow([
							'일부 부적절함',
							q2.length
					    ]);
						directionData.addRow([
							'적절하지 않음',
							q2.length
					    ]);

						
						//q3 시간
						var timeData = new google.visualization.DataTable();
						
						timeData.addColumn('string', '시간');
						timeData.addColumn('number', '점수');	
						
						timeData.addRow([
							'적절함',
							q3.length
					    ]);
						
						timeData.addRow([
							'대체로 적절함',
							q3.length
					    ]);
						timeData.addRow([
							'일부 부적절함',
							q3.length
					    ]);
						timeData.addRow([
							'적절하지 않음',
							q3.length
					    ]);

						//q4  서버 안정성
						var stablitiyData = new google.visualization.DataTable();
						
						stablitiyData.addColumn('string', '서버 안정성');
						stablitiyData.addColumn('number', '점수');	
						
						stablitiyData.addRow([
							'적절함',
							q4.length
					    ]);
						
						stablitiyData.addRow([
							'대체로 적절함',
							q4.length
					    ]);
						stablitiyData.addRow([
							'일부 불안정함',
							q4.length
					    ]);
						stablitiyData.addRow([
							'불안정함',
							q4.length
					    ]);
						
						//q5  재방문 의사
						var repeatData = new google.visualization.DataTable();
						
						repeatData.addColumn('string', '재방문 의사');
						repeatData.addColumn('number', '점수');	
						
						repeatData.addRow([
							'사용하겠다',
							q5.length
					    ]);
						
						repeatData.addRow([
							'생각해보겠다',
							q5.length
					    ]);
						repeatData.addRow([
							'사용하지 않겠다',
							q5.length
					    ]);
						
						//q6  홍보 의사
						var PRData = new google.visualization.DataTable();
						
						PRData.addColumn('string', '홍보 의사');
						PRData.addColumn('number', '점수');	
						
						PRData.addRow([
							'있다',
							q6.length
					    ]);
						
						PRData.addRow([
							'생각해보겠다',
							q6.length
					    ]);
						PRData.addRow([
							'하지 않겠다',
							q6.length
					    ]);
						
						
						//q7  응시목적
						var purposeData = new google.visualization.DataTable();
						
						purposeData.addColumn('string', '응시목적');
						purposeData.addColumn('number', '점수');	
						
						purposeData.addRow([
							'진급',
							q7.length
					    ]);
						
						purposeData.addRow([
							'자격증 취득',
							q7.length
					    ]);
						purposeData.addRow([
							'입사',
							q7.length
					    ]);
						purposeData.addRow([
							'직무평가',
							q7.length
					    ]);
						
						//q8  준비기간
						var periodData = new google.visualization.DataTable();
						
						periodData.addColumn('string', '준비기간');
						periodData.addColumn('number', '점수');	
						
						periodData.addRow([
							'1주일',
							q8.length
					    ]);
						
						periodData.addRow([
							'1개월 이내',
							q8.length
					    ]);
						periodData.addRow([
							'3개월 이내',
							q8.length
					    ]);
						periodData.addRow([
							'3개월 이상',
							q8.length
					    ]);
						periodData.addRow([
							'준비안함',
							q8.length
					    ]);
						
						//q9  경로
						var pathData = new google.visualization.DataTable();
						
						pathData.addColumn('string', '경로');
						pathData.addColumn('number', '점수');	
						
						pathData.addRow([
							'인터넷 광고',
							q9.length
					    ]);
						
						pathData.addRow([
							'지인의 소개',
							q9.length
					    ]);
						pathData.addRow([
							'기업의 안내',
							q9.length
					    ]);
						pathData.addRow([
							'잡지나 신문 등 일간지',
							q9.length
					    ]);
						pathData.addRow([
							'기타',
							q9.length
					    ]);
						
						var chart1 = new google.visualization.PieChart(document.getElementById('chartDiv'));
						chart1.draw(chartAttendanceRateData, AttendanceRateChartOptions);
					    window.addEventListener('resize', function() { chart1.draw(chartAttendanceRateData, AttendanceRateChartOptions); }, false);
					
					    var chartPassExamRateData = new google.visualization.DataTable();
					    chartPassExamRateData.addColumn('string', '인원');
					    chartPassExamRateData.addColumn('number', '점수');	
						
					    chartPassExamRateData.addRow([
							'불합격인원',
							examPossibleApplicants - passTakerCount
					    ]);
						
					    chartPassExamRateData.addRow([
							'합격인원',
							passTakerCount
					    ]);
					    
					    var PassExamRateChartOptions = {
					            title : examName + " 합격율",
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
					    
					    var chart2 = new google.visualization.PieChart(document.getElementById('chartDiv2'));
						chart2.draw(chartPassExamRateData, PassExamRateChartOptions);
					    window.addEventListener('resize', function() { chart2.draw(chartPassExamRateData, PassExamRateChartOptions); }, false);
					    
					    var chartCorrectAnswerRateData = new google.visualization.DataTable();
					    
					    chartCorrectAnswerRateData.addColumn('string', '문제');
					    chartCorrectAnswerRateData.addColumn('number', '');		    
					    
					    for(var qIdx = 0; qIdx < totalScroeQuestionArr.length; ++qIdx){
					    	var correctAnswerRate = (takerScoreQuestionArr[qIdx] / totalScroeQuestionArr[qIdx]) * 100;
					    	console.log("정답율" + correctAnswerRate);
					    	chartCorrectAnswerRateData.addRows([
					    		["문제 " + (qIdx + 1),correctAnswerRate]
					    	]);
					    }
					    
					    var CorrectAnswerRateChartOptions = {
					    		title : examName + " 문제별 정답율",
					            chartArea : {
					                width : '80%'
					            },
					            hAxis : {
					                title : '문제',
					                minValue : 1
					            },
					            vAxis : {
					            	title: '정답율', minValue: 0, maxValue: 100
					            },
					            animation: { //차트가 뿌려질때 실행될 애니메이션 효과
					                 startup: true,
					                 duration: 1000,
					                 easing: 'linear' }
					        };
					}	
				});
			}
//		})
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