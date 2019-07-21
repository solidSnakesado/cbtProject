<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" /> --%>
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">

	var i = 0;
	var data;
	var a = 1;
	var count = 0;
	$(document).ready(function() {
		$('#mainTab').hide();
		
		$("#examId").html("시험 응시")
		$("#question").html("문제")
		
		$('#btn').click(function () {  
			if($("#btn").css("display") == "none"){   
				$('#btn').show();  
			} else {  
				$('#btn').hide();
				$('#mainTab').show();
			}  
		});
		
		var takerId = "${takerId}";
		var examId = "${examVO.examId}";
		var takeExamId = "${takeExamId}";
		var examName = "${examVO.examName}";
		var passingScore = "${examVO.passingScore}";
		var examStartTime = "${examVO.examStartTime}";
		
		console.log(takerId);
		console.log(examId);
		console.log(takeExamId);
		console.log(examName);
		console.log(passingScore);
		console.log(examStartTime);
		
		
		/* 문제풀기 시작 버튼 */
		$('#btn').on("click", function() {
			
			$.ajax({
				url : "${pageContext.request.contextPath}/getTestStart.do",
				method : "post",
				data : {takerId : takerId, examId : examId, takeExamId : takeExamId, examName : examName, 
					passingScore : passingScore, examStartTime : examStartTime },
				type : "json",
				success : function(datas) {
					
					data = datas;
					count = datas.length;
					
					

					/*                         문제 난수 만들기        Start          */
					var numbers = [];
			        var pickNumbers = data.length;
			         
			        for(insertCur = 0; insertCur < pickNumbers; insertCur++){
			            numbers[insertCur] = Math.floor(Math.random() * data.length);

			            for(searchCur = 0; searchCur < insertCur; searchCur++){
			                if(numbers[insertCur] == numbers[searchCur]){
			                    insertCur--; 
			                    break; 
			                }
			            }
			        }
			        console.log(data);
			        
			        
			        /*                         보기 난수 만들기           Start          	   */
			        var num = [];
			        var examNum = 4;
			        
			        for(insertCur = 0; insertCur < examNum ; insertCur++){
			        	num[insertCur] = Math.floor(Math.random() * examNum);

			            for(searchCur = 0; searchCur < insertCur; searchCur ++){
			                if(num[insertCur] == num[searchCur]){
			                    insertCur--; 
			                    break; 
			                }
			            }
			        }
			        
			        
			        /*  보기 난수값 활용해 보기 출력하는 펑션	*/
			        function mixExam(){
			        	var ex = new Array;
				        
			        	ex[num[0]] = data[numbers[i]].example1;
			        	ex[num[1]] = data[numbers[i]].example2;
			        	ex[num[2]] = data[numbers[i]].example3;
			        	ex[num[3]] = data[numbers[i]].example4;
			        	
			        	for(var v=0;v<=3;v++){
			        		var j=v+1;
			        		/* 보기 출력    */
			        		$("#exam"+j).html(j+" . " + ex[v]);
			        		/* 보기 라디오 버튼  */
			        		$("#td"+j).html(j+" . ").append($("<input>").attr("type","radio").attr("id","example"+num[v]).attr("name","rExam").attr("value",ex[v]));
			        		
			        	}
			        	
			        	if(data[numbers[i]].takerAnswer != null){
							$("[name ='rExam']").val([data[numbers[i]].takerAnswer]);
						}
			        	
			        	$("#examId").html(data[numbers[i]].examId+" 시험 응시");
			        	$("#question").html(a+" .   "+data[numbers[i]].questionContent);
						$("#point").html("배점 : " + data[numbers[i]].point);
			        	
			        }
			        
			        
			        /* 문제 수 만큼의 OMR 라디오 버튼 만들기 */
					for(var c=1; c <= count; c++) {
		        		var ex = new Array;
				        
			        	ex[num[0]] = data[numbers[c-1]].example1;
			        	ex[num[1]] = data[numbers[c-1]].example2;
			        	ex[num[2]] = data[numbers[c-1]].example3;
			        	ex[num[3]] = data[numbers[c-1]].example4;
			        	
						$("#answer1").append($("<tr>")
							.append($("<td>").attr("id","answer"+c).html(c+" ."))
							.append($("<td>").append($("<input>").attr("type","radio").attr("name","exam"+c).attr("value",ex[0])))
							.append($("<td>").append($("<input>").attr("type","radio").attr("name","exam"+c).attr("value",ex[1])))
							.append($("<td>").append($("<input>").attr("type","radio").attr("name","exam"+c).attr("value",ex[2])))
							.append($("<td>").append($("<input>").attr("type","radio").attr("name","exam"+c).attr("value",ex[3]))))
						
						if(data[numbers[c-1]].takerAnswer != null){
							$("[name ='exam"+c+"']").val([data[numbers[c-1]].takerAnswer]);
						} 
						
					}
			        
			        
			        /* 섞은 보기 출력 */
			        mixExam();
			        
					
					/* 실시간 문제 업데이트 */
					function updateAnswer(){
						
						$("input:radio[name ='rExam']").on("click", function() {
							var choice = $(this).attr('id');
				        	var takerAnswer = $(this).val();
				        	var setExamQuestionId = data[numbers[i]].setExamQuestionId;
				    		console.log(choice);
				    		console.log(takerAnswer);
				    		
				    		$.ajax({
								url : "${pageContext.request.contextPath}/updateTakeExamHistory.do",
								method : "post",
								data : {takerAnswer : takerAnswer, setExamQuestionId : setExamQuestionId,
									takeExamId:takeExamId} , 
								datatype : "json",
								success : function(data){
									
					    			$("[name ='exam"+a+"']").val([takerAnswer]);
									
								}
				    		})
						})
					}
					updateAnswer();
					
					
					/* 다음문제 or Next 버튼 클릭시 섞은 다음 문제, 예제 보기 */
					$('#nBtn').on("click", function() {
						
						if(a != count){
							
							i = i+1;	
							a = a+1;
							
							console.log(a+"번 문제");
							
							mixExam();
							
						
						} else {
							
							console.log('없어');
							alert('마지막이야');
						}
						updateAnswer();
					})
					
					
					/* 이전문제 or Previous 버튼 클릭시 섞은 이전 문제, 예제 보기 */
					$('#pBtn').on("click", function() {
						
						if(a != 1){
							
							i = i-1;	
							a = a-1;
							
							console.log(a+"번 문제");
							
							mixExam();
							
						
						} else {
							
							console.log('없어');
							alert('처음이야');
						}
						updateAnswer();
					})
				}
			})
		})
	});
	
	function candidateTestResult(){
		if(confirm("제출하시겠습니까?? \n 번복불가.") == true) {
			takeExamForm.submit();
		} else {
			return false;
		}
	}
	
</script>
</head>
<body>
	<form id="takeExamForm" name="takeExamForm" action="${pageContext.request.contextPath }/candidateTestResult.do" method="post">
		<input type="text" id="eId" name="examId" value="${examVO.examId }" hidden="ture">
		<input type="text" id="tId" name="takeExamId" value="${takeExamId }" hidden="ture">
	</form>
<button id="btn">시험 시작 !</button>
	<table border="1" id="mainTab">
		<tr>
			<td><h2 align="center" id="examId" value=""></h2></td>
			<td rowspan="3">
				<table id="answer1">
					<tr>
						<td>No.</td>
						<td>1.</td>
						<td>2.</td>
						<td>3.</td>
						<td>4.</td>
					</tr>
					<tr>
						<td colspan="5" align="center" valign="top">
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td><div><h2 align="center" id="question"></h2><p align="right" id="timer"></p></div></td>
		</tr>
		<tr>
			<td align="left" valign="top" style="">
				<table width="800">
					<tr>
						<td>
							<table width="820">
								<tr>
									<th id="point" align="left"></th>
									<th></th>
								</tr>
								<tr>
									<td id="exam1"></td>
									<td align="center" id="td1"></td>
								</tr>
								<tr>
									<td id="exam2"></td>
									<td align="center" id="td2"></td>
								</tr>
								<tr>
									<td id="exam3"></td>
									<td align="center" id="td3"></td>
								</tr>
								<tr>
									<td id="exam4"></td>
									<td align="center" id="td4"></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		<tr>
			<td align="center" colspan="2">
				<button class="previous" id="pBtn" >Previous</button>
				<button class="next"  id="nBtn" >Next</button>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center" valign="top">
				<button type='button' onclick="candidateTestResult()" >제출 하기</button>
			</td>
		</tr>
	</table>
</body>
</html>