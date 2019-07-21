<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<title>Insert title here</title>
<style>
	table {
		width: 100%;
		border-top: 1px solid #444444;
		border-collapse: collapse;
	}
	th {
		border-bottom: 1px solid #444444;
		padding: 10px;
	}
	td {
		padding: 10px;
	}
	
	#floatMenu {
		position: absolute;
		width: 100px;
		height: 200px;
		right: 20px;
		top: 200px;
		background-color: white;
	}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
<script type="text/javascript">

	$(document).ready(function(){
		
		
		// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
		var floatPosition = parseInt($("#floatMenu").css('top'));
		// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );
		
		$(window).scroll(function() {
		// 현재 스크롤 위치를 가져온다.
			var scrollTop = $(window).scrollTop();
			var newPosition = scrollTop + floatPosition + "px";
			
			$("#floatMenu").stop().animate({"top" : newPosition}, 500);
		
		}).scroll();
	
		
		$(function (){
			
			$(".floatMenu").mouseenter(function(){
				var count = $(this).children().attr("value");
				$("#floatMenu"+count+"").css('background-color','#E7F5FA');
			})
			
			$(".floatMenu").mouseleave(function(){
				var count = $(this).children().attr("value");
				$("#floatMenu"+count+"").css('background-color','white');
			})
			
		})
		
		
		$(".rightAnswer").click(function(){
			console.log("1");
			var count = $(this).attr("value");
			
			
			$("#rightAnswerView"+count).hide();
			$("#rightAnswerHide"+count).show();
			
			
			$("#CommentaryView"+count).hide();
			$("#CommentaryHide"+count).show();
			
			var rightAnswer = $("#rightAnswerHide"+count).attr('value');
			var takerAnswer = $("#takerAnswer"+count).attr('value');
			console.log("1 "+rightAnswer);
			console.log("2 "+takerAnswer);
			console.log("3 "+takerAnswer+":"+rightAnswer);
			
			if(rightAnswer != takerAnswer){
				$("#floatMenu"+count).css('background-color','#F8A5A6');
				$("#point"+count).attr('hidden', false).html("오답 입니다.");
				for(var i=1; i<=4; i++){
					
					var exam = $("#exam"+count+i).attr('value');
					console.log(exam);
					if(exam == takerAnswer){
						$("#exam"+count+i).css('background-color','#F8A5A6');
						break;
					}
					
				}
			} else if(rightAnswer == takerAnswer){
				$("#point"+count).attr('hidden', false);
				$("#floatMenu"+count).css('background-color','#E7F5FA');
			}
			
			for(var i=1; i<=4; i++){
				
				var exam = $("#exam"+count+i).attr('value');
				
				if(exam == rightAnswer){
					$("#exam"+count+i).css('background-color','#E7F5FA');
					break;
				}
				
			}
				
		})
		
		
		$(".scroll tr th").click(function(){
			
			var count = $(this).attr("value");
			
			if(count == 1){
				scrollPosition = $("body").offset().top;
				$("html, body").animate({scrollTop: scrollPosition}, 500);
				return;
			}
			
			count = count-1;
			
			var scrollPosition = $("[id ='questuin"+count+"']").offset().top;
			
			$("html, body").animate({scrollTop: scrollPosition}, 500);
			
		})
		
	})
	
	function allView(){
		
		var v = $("[id^='floatMenu']").length;
		console.log(v);
		var max = v-1;
		
		console.log(max);
		for(var count=1; count<=max; count++){
		console.log("1 : "+count);
			$("#rightAnswerView"+count).hide();
			$("#rightAnswerHide"+count).show();
			
			
			$("#CommentaryView"+count).hide();
			$("#CommentaryHide"+count).show();
			
			var rightAnswer = $("#rightAnswerHide"+count).attr('value');
			var takerAnswer = $("#takerAnswer"+count).attr('value');
			console.log("1 "+rightAnswer);
			console.log("2 "+takerAnswer);
			console.log("3 "+takerAnswer+":"+rightAnswer);
			
			if(rightAnswer != takerAnswer){
				$("#floatMenu"+count).css('background-color','#F8A5A6');
				$("#point"+count).attr('hidden', false).html("오답 입니다.");
				for(var i=1; i<=4; i++){
					
					var exam = $("#exam"+count+i).attr('value');
					console.log(exam);
					if(exam == takerAnswer){
						
						$("#exam"+count+i).css('background-color','#F8A5A6');
						break;
					}
					
				}
				
			} else if(rightAnswer == takerAnswer){
				$("#point"+count).attr('hidden', false);
				$("#floatMenu"+count).css('background-color','#E7F5FA');
			}
			
			for(var i=1; i<=4; i++){
				
				var exam = $("#exam"+count+i).attr('value');
				
				if(exam == rightAnswer){
					$("#exam"+count+i).css('background-color','#E7F5FA');
					break;
				}
				
			}
		}
	}
	
</script>
</head>
<body>
	<div id="floatMenu">
		<p style="font-size: 10px; padding-bottom: 0;" onclick="allView()" >모든 정답 보기</p>
		<table class="scroll">
			<tr>
				<th style="padding: 0px;">바로가기</th>
			</tr>
			<c:forEach items="${rightAnswer}" var="list" varStatus="status">
				<tr class="floatMenu">
					<th id="floatMenu${status.count}" value="${status.count}" style="font-size: 10px; padding: 1px;">${status.count} . </th>
				</tr>
			</c:forEach>
		</table>
	</div>
<h2 align="center">풀이 및 해설</h2>
<br><br>
	
	<table class="mainTab">
	
		<c:forEach items="${rightAnswer}" var="list" varStatus="status">
		
		<tr>
			<th><input id="takerAnswer${status.count}" value="${list.takerAnswer}" hidden="true"></th>
			<th align="left" valign="top" ></th>
		</tr>
		<!---------------------내용시작------------------>
		
		
		<!--테이블 시작 -->
		
		<tr>
			<th valign="top" id="questuin${status.count}">${status.count} . ${list.questionContent}</th>
			<th style="width: 20%;"><p id="point${status.count}" value="" hidden="true">배점 : ${list.point}</p></th>
		</tr>
		
		<tr>
			<td class="exam${status.count}" id="exam${status.count}1" value="${list.example1}" >1. ${list.example1}</td>
			<td rowspan="2">
				<div class="rightAnswer" id="rightAnswerView${status.count}" value="${status.count}" >정답 보기</div>
				<div class="rightAnswer" id="rightAnswerHide${status.count}" value="${list.rightAnswer}" style="display: none;">정답 : ${list.rightAnswer}</div>
			</td>
		</tr>
		
		<tr>
			<td class="exam${status.count}" id="exam${status.count}2" value="${list.example2}" >2. ${list.example2}</td>
			<td></td>
		</tr>
		
		<tr>
			<td class="exam${status.count}" id="exam${status.count}3" value="${list.example3}" >3. ${list.example3}</td>
			<td rowspan="2">
				<div id="CommentaryView${status.count}" ></div>
				<div id="CommentaryHide${status.count}" style="display: none;">해설 : ${list.rightCommentary}</div>
			</td>
		</tr>
		
		<tr>
			<td class="exam${status.count}" id="exam${status.count}4" value="${list.example4}" >4. ${list.example4}</td>
			<td></td>
		</tr>
		
		<tr>
			<th></th>
			<th></th>
		</tr>
		
		<tr>
			<td></td>
			<td></td>
		</tr>
		
		</c:forEach>
		
		<tr>
			<th colspan="2"><a href="#" class="previous">&laquo; Previous</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#" class="next">Next &raquo;</a></th>
			<th></th>
		</tr>
		<tr>
			<td colspan="2"><button>이의제기</button><a href="${pageContext.request.contextPath }/candidateMain.do"><button>메인으로</button></a></td>
			<td></td>
		</tr>
		
	
	</table>
			



</body>
</html>