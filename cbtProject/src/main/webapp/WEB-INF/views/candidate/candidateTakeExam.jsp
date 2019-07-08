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
		$("#header").load("candidateInHeader.do")
		$("#examId").html("시험 응시")
		$("#question").html("문제")
		
		$('#btn').on("click", function() {
			$.ajax({
				url : "./getTestStart.do",
				method : "post",
				type : "json",
				success : function(datas) {
					
					data = datas;
					count = datas.length;
					console.log(data[0].examId);
					$("#examId").html(data[i].examId+" 시험 응시");
					$("#question").html(a+" .   "+data[i].questionContent);
					$("#point").html("배점 : " + data[i].point);
					$("#exam1").html("1 . " + data[i].example1);
					$("#exam2").html("2 . " + data[i].example2);
					$("#exam3").html("3 . " + data[i].example3);
					$("#exam4").html("4 . " + data[i].example4);
					$("#pExam1").html("1 . " + data[i].example1);
					$("#pExam2").html("2 . " + data[i].example2);
					$("#pExam3").html("3 . " + data[i].example3);
					$("#pExam4").html("4 . " + data[i].example4);
					
					$("#td1").html("1 . ").append($("<input>").attr("value","1").attr("type","radio").attr("name","rExam'"+a+"'").attr("onclick","radioSelFunc(value)"));
					$("#td2").html("2 . ").append($("<input>").attr("value","2").attr("type","radio").attr("name","rExam'"+a+"'").attr("onclick","radioSelFunc(value)"));
					$("#td3").html("3 . ").append($("<input>").attr("value","3").attr("type","radio").attr("name","rExam'"+a+"'").attr("onclick","radioSelFunc(value)"));
					$("#td4").html("4 . ").append($("<input>").attr("value","4").attr("type","radio").attr("name","rExam'"+a+"'").attr("onclick","radioSelFunc(value)"));
					
					for(var c=1; c <= count; c++) {
						
						$("#answer1").append($("<tr>")
							.append($("<td>").attr("id","answer"+c).html(c+" ."))
							.append($("<td>").append($("<input>").attr("type","radio").attr("name","exam"+c).attr("value","1")))
							.append($("<td>").append($("<input>").attr("type","radio").attr("name","exam"+c).attr("value","2")))
							.append($("<td>").append($("<input>").attr("type","radio").attr("name","exam"+c).attr("value","3")))
							.append($("<td>").append($("<input>").attr("type","radio").attr("name","exam"+c).attr("value","4"))))
					}
					
					$('#nBtn').on("click", function() {
						
						if(a == count){
							console.log('마지막이야');
						
						} else {
							i = i+1;	
							a = a+1;
								
							$("#examId").html(data[i].examId+" 시험 응시");
							$("#question").html(a+" .   "+data[i].questionContent);
							$("#point").html("배점 : " + data[i].point);
							$("#exam1").html("1 . " + data[i].example1);
							$("#exam2").html("2 . " + data[i].example2);
							$("#exam3").html("3 . " + data[i].example3);
							$("#exam4").html("4 . " + data[i].example4);
							$("#pExam1").html("1 . " + data[i].example1);
							$("#pExam2").html("2 . " + data[i].example2);
							$("#pExam3").html("3 . " + data[i].example3);
							$("#pExam4").html("4 . " + data[i].example4);
							
							$("#td1").html("1 . ").append($("<input>").attr("value","1").attr("type","radio").attr("name","rExam'"+a+"'").attr("onclick","radioSelFunc(value)"));
							$("#td2").html("2 . ").append($("<input>").attr("value","2").attr("type","radio").attr("name","rExam'"+a+"'").attr("onclick","radioSelFunc(value)"));
							$("#td3").html("3 . ").append($("<input>").attr("value","3").attr("type","radio").attr("name","rExam'"+a+"'").attr("onclick","radioSelFunc(value)"));
							$("#td4").html("4 . ").append($("<input>").attr("value","4").attr("type","radio").attr("name","rExam'"+a+"'").attr("onclick","radioSelFunc(value)"));
							
						}
					})
					
					
					
					$('#pBtn').on("click", function() {
						
						if(i == 0){
							console.log('처음이야');
						
						} else {
							i = i-1;	
							a = a-1;
								
							$("#examId").html(data[i].examId+" 시험 응시");
							$("#question").html(a+" .   "+data[i].questionContent);
							$("#point").html("배점 : " + data[i].point);
							$("#exam1").html("1 . " + data[i].example1);
							$("#exam2").html("2 . " + data[i].example2);
							$("#exam3").html("3 . " + data[i].example3);
							$("#exam4").html("4 . " + data[i].example4);
							$("#pExam1").html("1 . " + data[i].example1);
							$("#pExam2").html("2 . " + data[i].example2);
							$("#pExam3").html("3 . " + data[i].example3);
							$("#pExam4").html("4 . " + data[i].example4);
							
							$("#td1").html("1 . ").append($("<input>").attr("value","1").attr("type","radio").attr("name","rExam'"+a+"'").attr("onclick","radioSelFunc(value)"));
							$("#td2").html("2 . ").append($("<input>").attr("value","2").attr("type","radio").attr("name","rExam'"+a+"'").attr("onclick","radioSelFunc(value)"));
							$("#td3").html("3 . ").append($("<input>").attr("value","3").attr("type","radio").attr("name","rExam'"+a+"'").attr("onclick","radioSelFunc(value)"));
							$("#td4").html("4 . ").append($("<input>").attr("value","4").attr("type","radio").attr("name","rExam'"+a+"'").attr("onclick","radioSelFunc(value)"));
							
						}
					})
					
				}
			})
		})
	});
	
	function answerReset(){
		for(var c=0; c <= count; c++){
			$("input:radio[name ='exam"+c+"']:input:radio[value ='1']").attr("checked",false);
			$("input:radio[name ='exam"+c+"']:input:radio[value ='2']").attr("checked",false);
			$("input:radio[name ='exam"+c+"']:input:radio[value ='3']").attr("checked",false);
			$("input:radio[name ='exam"+c+"']:input:radio[value ='4']").attr("checked",false);
		}
	}
	
	function answerSubmit(){
		
	}
	
	function radioSelFunc(v) {
		console.log(i,a,v);
		switch (v) {
		case '1':
			$("input:radio[name ='exam"+a+"']:input:radio[value ='2']").attr("checked",false);
			$("input:radio[name ='exam"+a+"']:input:radio[value ='3']").attr("checked",false);
			$("input:radio[name ='exam"+a+"']:input:radio[value ='4']").attr("checked",false);
			$("input:radio[name ='exam"+a+"']:input:radio[value ='1']").attr("checked",true);
			break;
		case '2':
			$("input:radio[name ='exam"+a+"']:input:radio[value ='1']").attr("checked",false);
			$("input:radio[name ='exam"+a+"']:input:radio[value ='3']").attr("checked",false);
			$("input:radio[name ='exam"+a+"']:input:radio[value ='4']").attr("checked",false);
			$("input:radio[name ='exam"+a+"']:input:radio[value ='2']").attr("checked",true);
			break;
		case '3':
			$("input:radio[name ='exam"+a+"']:input:radio[value ='1']").attr("checked",false);
			$("input:radio[name ='exam"+a+"']:input:radio[value ='2']").attr("checked",false);
			$("input:radio[name ='exam"+a+"']:input:radio[value ='4']").attr("checked",false);
			$("input:radio[name ='exam"+a+"']:input:radio[value ='3']").attr("checked",true);
			break;
		case '4':
			$("input:radio[name ='exam"+a+"']:input:radio[value ='1']").attr("checked",false);
			$("input:radio[name ='exam"+a+"']:input:radio[value ='2']").attr("checked",false);
			$("input:radio[name ='exam"+a+"']:input:radio[value ='3']").attr("checked",false);
			$("input:radio[name ='exam"+a+"']:input:radio[value ='4']").attr("checked",true);
			break;
		}
	};
	
	
		
</script>
</head>
<body>

<button id="btn">Click</button>

	<header id="header"></header>
	<table border="1">
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
					<form action=""> 
					<%-- <c:forEach var="takeExamList" items="${takeExamList}" varStatus="status">
					<tr>
						<td id="answerTd">${status.count}</td>
						<td id="answerTd1"><input type="radio" name="exam${status.count}" value="1"></td>
						<td id="answerTd2"><input type="radio" name="exam${status.count}" value="2"></td>
						<td id="answerTd3"><input type="radio" name="exam${status.count}" value="3"></td>
						<td id="answerTd4"><input type="radio" name="exam${status.count}" value="4"></td>
					</tr>
					</c:forEach> --%>
					<tr>
						<td colspan="5" align="center" valign="top">
						</td>
					</tr>
					</form>
				</table>
			</td>
		</tr>
		<tr>
			<td><div><h2 align="center" id="question">문제</h2><p align="right" id="timer">TIMER : </p></div></td>
		</tr>
		<tr>
			<td align="left" valign="top" style="">
				<table width="800">
					<tr>
						<td>
							<table width="820">
								<tr>
									<th id="point" align="left">배점 : </th>
									<th>OMR Check</th>
								</tr>
								<tr>
									<td id="exam1">1.</td>
									<td align="center" id="td1">1 .<input type="radio" name="" value="1" class="radio" onclick="radioSelFunc(value)"></td>
								</tr>
								<tr>
									<td id="exam2">2.</td>
									<td align="center" id="td2">2 .<input type="radio" name="" value="2" class="radio" onclick="radioSelFunc(value)"></td>
								</tr>
								<tr>
									<td id="exam3">3.</td>
									<td align="center" id="td3">3 .<input type="radio" name="" value="3" class="radio" onclick="radioSelFunc(value)"></td>
								</tr>
								<tr>
									<td id="exam4">4.</td>
									<td align="center" id="td4">4 .<input type="radio" name="" value="4" class="radio" onclick="radioSelFunc(value)"></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		<tr>
			<td align="center">
				<button class="previous" id="pBtn" >Previous</button>
				<button class="next"  id="nBtn" >Next</button>
			</td>
			<td>
				<button type="button" onclick="answerSubmit()">제출</button>
				<button type="button" onclick="answerReset()">초기화</button>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center" valign="top">
				<input type='submit'>
				<input type='reset'>
			</td>
		</tr>
	</table>
</body>
</html>