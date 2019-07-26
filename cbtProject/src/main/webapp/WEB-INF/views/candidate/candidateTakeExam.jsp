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
<style>

	#floatMenu {
		position: absolute;
		width: 100px;
		height: 200px;
		right: 20px;
		top: 120px;
		background-color: white;
	}
	
	#floatMenu table {
		width: 100%;
		border-collapse: collapse;
	}
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">

	var i = 0;
	var data;
	var a = 1;
	var count = 0;
	$(document).ready(function() {
		
		// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
		var floatPosition = parseInt($("#floatMenu").css('top'));
		// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );
		
		$(window).scroll(function() {
		// 현재 스크롤 위치를 가져온다.
			var scrollTop = $(window).scrollTop();
			var newPosition = scrollTop + floatPosition + "px";
			
			$("#floatMenu").stop().animate({"top" : newPosition}, 500);
		
		}).scroll();
		
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
		
		var takerId			=	"${takerId}";
		var examId			=	"${examVO.examId}";
		var takeExamId		=	"${takeExamId}";
		var examName		=	"${examVO.examName}";
		var passingScore	=	"${examVO.passingScore}";
		var examStartTime	=	"${examVO.examStartTime}";
		
		console.log(takerId);
		console.log(examId);
		console.log(takeExamId);
		console.log(examName);
		console.log(passingScore);
		console.log(examStartTime);
		
		
		$("#floatMenu").hide();
		
		/* 문제풀기 시작 버튼 */
		$('#btn').on("click", function() {
			
			$("#floatMenu").show();
			
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
			        		$("#td"+j).html('').append($("<input>").attr("type","radio").attr("id","example"+num[v]).attr("name","rExam").attr("value",ex[v]));
			        		
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
							.append($("<td>").attr("id","answer"+c).html(c+" . "))
							.append($("<td>").append($("<input>").attr("type","radio").attr("onclick","return(false);").attr("name","exam"+c).attr("value",ex[0])))
							.append($("<td>").append($("<input>").attr("type","radio").attr("onclick","return(false);").attr("name","exam"+c).attr("value",ex[1])))
							.append($("<td>").append($("<input>").attr("type","radio").attr("onclick","return(false);").attr("name","exam"+c).attr("value",ex[2])))
							.append($("<td>").append($("<input>").attr("type","radio").attr("onclick","return(false);").attr("name","exam"+c).attr("value",ex[3]))))
						
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
					
					function getTimeStamp(serverDate) {
						var d = new Date(serverDate);
						var s =
							leadingZeros(d.getHours(), 2) + ':' +
							leadingZeros(d.getMinutes(), 2) + ':' +
							leadingZeros(d.getSeconds(), 2);
					
						console.log(s);
						
						$("#countdown").html(s);
						
						
					}
					
					function leadingZeros(n, digits) {
						var zero = '';
						n = n.toString();
						
						if (n.length < digits) {
							for (i = 0; i < digits - n.length; i++)
							zero += '0';
						}
						return zero + n;
					}
						
					$(function() {
					
						timer = setInterval( function () {
						
							$.ajax ({
							
								url : "${pageContext.request.contextPath}/getTimer.do",
								cache : false,
								method : "post",
								data : { examId : examId } , 
								success : function (html) {
									
									var serverDate = new Date(html);
									console.log(serverDate);
									$("#countdown").html('타이머 시작');
									getTimeStamp(serverDate);
									
								}
							
							});
						
						}, 1000);
					
					}); 
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
	
	<div id="floatMenu">
		<div id="countdown"></div>
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
	</div>
	
<button id="btn">시험 시작 !</button>
	<table border="1" id="mainTab">
		<tr >
			<td><h2 align="center" id="examId" value=""></h2></td>
		</tr>
		<tr height="200">
			<td><div><h2 align="center" id="question"></h2><p align="right" id="timer"></p></div></td>
		</tr>
		<tr>
			<td align="left" valign="top" width="900" height="100">
				<table>
					<tr>
						<th rowspan="5"></th>
						<th width="80" ></th>
						<th id="point" align="right"></th>
						<th rowspan="5"></th>
					</tr>
					<tr>
						<td></td>
						<td align="right" id="td1"></td>
						<td align="left" id="exam1"></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td align="right" id="td2"></td>
						<td align="left" id="exam2"></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td align="right" id="td3"></td>
						<td align="left" id="exam3"></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td align="right" id="td4"></td>
						<td align="left" id="exam4"></td>
						<td></td>
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