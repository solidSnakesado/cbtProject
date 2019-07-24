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
//		$("#chartBtn").click(function() {
			google.load("visualization", "1", {packages : ["corechart"]});
			google.setOnLoadCallback(loadPageData);

			function loadPageData() {
				$.ajax({
					type: "POST",
					url : "${pageContext.request.contextPath }/getTakeExamHistoryForExamIdList.do/${examId}",
					success: function(data) {
						console.log(data);
						
						if(data.length <= 0){
							return;
						}
						
						var examApplicants 			= 0;			// 2019.07.17 성재민 // 응시가능 인원
						var examQuestionQuantity	= 0;			// 2019,07,17 성재민 // 출제 문항 수
						var examPassingScore		= 0
						var examName = "";
						var passTakerCount 			= 0;
						
						examApplicants 			= data[0].applicants;
						examQuestionQuantity 	= data[0].questionQuantity;
						examPassingScore		= data[0].passingScore;
						examName 				= data[0].examName;
						
						$("#pageTitle").text(examName + " 통계");
						
						var takerIdArr 				= new Array();	// 2019.07.17 성재민 // 응시자 id 저장 변수
						var takerTotalscoreArr 		= new Array();	// 2019.07.17 성재민 // 응시자 별 총점 저장 변수 // 응시자 id 와 인덱스가 같음(응시자 id 의 1번 인덱스 응시자의 점수는 1번 인뎃스 점수)
						var takerScoreQuestionArr 	= new Array(examQuestionQuantity);	// 문제별 점수 누적 배열 // 출제 문항 수 만큼 길이 지정 
						var totalScroeQuestionArr	= new Array(examQuestionQuantity);

						// 2019.07.17 성재민
						// 배열 초기화
						for(var idx = 0; idx < examQuestionQuantity; ++idx){
							takerScoreQuestionArr[idx] 	= 0;
							totalScroeQuestionArr[idx] 	= 0;
						}
						
						var newId = true;	// 2019.07.17 성재민 // 응시자 이름 체크 변수(배열에 push 할때.)

						data.forEach(function (row) {
							if(row.takerScore > 0){
								takerScoreQuestionArr[row.setExamQuestionId - 1] += row.takerScore;
							}
							
							totalScroeQuestionArr[row.setExamQuestionId - 1] += row.point;
							
							for(var i = 0; i < takerIdArr.length; ++i) {
								if(takerIdArr[i] == row.takerId){
									newId = false;
									break;
								} else {
									newId = true;
								}
							}
							if(newId == true){
								takerIdArr.push(row.takerId);
								takerTotalscoreArr.push(0);
							}
						});
						
						data.forEach(function (row) {
							// console.log(row.takerId);
							for(var i = 0; i < takerIdArr.length; ++i) {
								if(takerIdArr[i] == row.takerId){
									takerTotalscoreArr[i] += row.takerScore;
								}
								
								// 커트라인보다 점수가 높은
								// 합격 인원 수 체크
								if(takerTotalscoreArr[i] >= examPassingScore){
									++passTakerCount;
								}
							}
						});
					
/* 						console.log("응시자 id 목록" + takerIdArr);
						console.log("응시자 점수 목록" + takerTotalscoreArr);
						console.log("응시 가능 인원 수" + examPossibleApplicants);
						console.log("응시 인원 수" + takerIdArr.length);
						console.log("문항별 획득 점수" + takerScoreQuestionArr);
						console.log("문항별 총점 점수" + totalScroeQuestionArr);
						console.log("합격 커트라인 점수 " + examPassingScore); */
						
						var chartAttendanceRateData = new google.visualization.DataTable();
						
						chartAttendanceRateData.addColumn('string', '인원');
						chartAttendanceRateData.addColumn('number', '점수');	
						
						chartAttendanceRateData.addRow([
							'미응시',
							examApplicants - takerIdArr.length
					    ]);
						
						chartAttendanceRateData.addRow([
							'응시',
							takerIdArr.length
					    ]);
						
						var AttendanceRateChartOptions = {
					            title : examName + " 응시율",
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
						
						var chart1 = new google.visualization.PieChart(document.getElementById('chartDiv'));
						chart1.draw(chartAttendanceRateData, AttendanceRateChartOptions);
					    window.addEventListener('resize', function() { chart1.draw(chartAttendanceRateData, AttendanceRateChartOptions); }, false);
					
					    var chartPassExamRateData = new google.visualization.DataTable();
					    chartPassExamRateData.addColumn('string', '인원');
					    chartPassExamRateData.addColumn('number', '점수');	
						
					    chartPassExamRateData.addRow([
							'불합격인원',
							examApplicants - passTakerCount
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
					    
					    var chart3 = new google.visualization.LineChart(document.getElementById('chartDiv3'));
						chart3.draw(chartCorrectAnswerRateData, CorrectAnswerRateChartOptions);
					    window.addEventListener('resize', function() { chart3.draw(chartCorrectAnswerRateData, CorrectAnswerRateChartOptions); }, false);
					}	
				});
			}
//		})
	});
</script>
</head>
<body>
	<h1 id="pageTitle">시험 통계</h1>
	<br>
	<!-- chart가 생성될 공간 -->
	<div id="chartDiv" style="float:left; width: 50%; height: 450px;"></div>
	<div id="chartDiv2" style="float:left; width: 50%; height: 450px;"></div>
	<div id="chartDiv3" style="float:left; width: 90%; height: 450px;"></div>
</body>
</html>