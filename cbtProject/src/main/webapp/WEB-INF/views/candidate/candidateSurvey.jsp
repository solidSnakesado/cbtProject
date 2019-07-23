<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<title>설문조사</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
/* 
$(document).ready(function() {
	
}); 
*/
</script>
<script type="text/javascript">
	function checkForm() {
	    var q1 		= document.fmField.q1;
	    var q2 		= document.fmField.q2;
	    var q3 		= document.fmField.q3;
	    var q4 		= document.fmField.q4;
	    var q5 		= document.fmField.q5;
	    var q6 		= document.fmField.q6;
	    var q7 		= document.fmField.q7;
	    var q8 		= document.fmField.q8;
	    var q9 		= document.fmField.q9;
	     
	    // 입력 유무 체크
	    if(q1.value == '') {
	        window.alert("응답이 완료되지 않았습니다");
	        e.preventDefault();
	        return false;
	    }
	    if(q2.value == '') {
	        window.alert("응답이 완료되지 않았습니다");
	        e.preventDefault();
	        return false;
	    }
	    if(q3.value == '') {
	        window.alert("응답이 완료되지 않았습니다");
	        e.preventDefault();
	        return false;
	    }
	    if(q4.value == '') {
	        window.alert("응답이 완료되지 않았습니다");
	        e.preventDefault();
	        return false;
	    }
	    if(q5.value == '') {
	        window.alert("응답이 완료되지 않았습니다");
	        e.preventDefault();
	        return false;
	    }
	    if(q6.value == '') {
	        window.alert("응답이 완료되지 않았습니다");
	        e.preventDefault();
	        return false;
	    }
	    if(q7.value == '') {
	        window.alert("응답이 완료되지 않았습니다");
	        e.preventDefault();
	        return false;
	    }
	    if(q8.value == '') {
	        window.alert("응답이 완료되지 않았습니다");
	        e.preventDefault();
	        return false;
	    }
	    if(q9.value == '') {
	        window.alert("응답이 완료되지 않았습니다");
	        e.preventDefault();
	        return false;
	    }
	    document.fmField.submit();
	}
	</script>
</head>
<body>
<!--
 	<script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#header").load("candidateInHeader.do")
		});
	</script> 
-->


	<header id="header"></header>
	<h1>설문조사</h1>
	<br><br><br><br>
	
	<!-- 7/19 june 설문지는 고정형식이라 문제은행식으로 할 필요가 없음 -> 추후 응시ID 불러오기 확인 필요 -->
	<form id="fmField" name="fmField" action="${pageContext.request.contextPath }/candidateSurvey.do" method="POST">
	<input type="hidden" name="surveyType" value="1"/>
	<input type="text" name="takeExamId" value="${takeExamId}" hidden="true"/>
	<input type="text" name="examId" value="${examId}" hidden="true"/>
		<table border="1" align="center" class="table text-center">
			<tr>
				<td>
					<h4 align="Left">1. 본 시험의 난이도는 적당했습니까?</h4><br>
					<p align="Left">
						<input type="radio" name="q1" value="1">상당히 어려웠다&nbsp;&nbsp; 
						<input type="radio" name="q1" value="2">어려운 편이다&nbsp;&nbsp; 
						<input type="radio" name="q1" value="3">적절한 편이다&nbsp;&nbsp; 
						<input type="radio" name="q1" value="4">쉬운 편이다&nbsp;&nbsp;
						<input type="radio" name="q1" value="5">상당히 쉬웠다
					</p>
					<br>
				</td>
			</tr>
			<tr>
				<td>
					<h4 align="Left">2. 본 시험의 출제 방향은 적절했습니까?</h4><br>
					<p align="Left">
						<input type="radio" name="q2" value="1">매우 적절하다&nbsp;&nbsp; 
						<input type="radio" name="q2" value="2">대체로 적절한 편이다&nbsp;&nbsp; 
						<input type="radio" name="q2" value="3">일부는 적절하지 않았다&nbsp;&nbsp;
						<input type="radio" name="q2" value="4">대체로 적절하지 않았다
					</p>
					<br>
				</td>
			</tr>
						<tr>
				<td>
					<h4 align="Left">3. 본 시험의 시험시간은 적당했습니까?</h4><br>
					<p align="Left">
						<input type="radio" name="q3" value="1">매우 적절하다&nbsp;&nbsp; 
						<input type="radio" name="q4" value="2">대체로 적절한 편이다&nbsp;&nbsp; 
						<input type="radio" name="q5" value="3">일부는 적절하지 않았다&nbsp;&nbsp;
						<input type="radio" name="q6" value="4">대체로 적절하지 않았다
					</p>
					<br>
				</td>
			</tr>
						<tr>
				<td>
					<h4 align="Left">4. 서버는 안정적이었습니까?</h4><br>
					<p align="Left">
						<input type="radio" name="q4" value="1">매우 안정적이었다&nbsp;&nbsp; 
						<input type="radio" name="q4" value="2">안정적인 편이다&nbsp;&nbsp; 
						<input type="radio" name="q4" value="3">잠깐불안정하지만 시험에는 지장이 없는 수준이었다&nbsp;&nbsp;
						<input type="radio" name="q4" value="4">불안정하여 시험에 영향을 받은 적이 있다
					</p>
					<br>
				</td>
			</tr>
						<tr>
				<td>
					<h4 align="Left">5. 본 서비스를 다시 사용하실 의향은 있습니까?</h4><br>
					<p align="Left">
						<input type="radio" name="q5" value="1">그렇다&nbsp;&nbsp; 
						<input type="radio" name="q5" value="2">생각해보겠다&nbsp;&nbsp; 
						<input type="radio" name="q5" value="3">사용하지 않겠다&nbsp;&nbsp;
					</p>
					<br>
				</td>
			</tr>
						<tr>
				<td>
					<h4 align="Left">6. 본 서비스를 주변에 알리실 의향은 있습니까?</h4><br>
					<p align="Left">
						<input type="radio" name="q6" value="1">그렇다&nbsp;&nbsp; 
						<input type="radio" name="q6" value="2">생각해보겠다&nbsp;&nbsp; 
						<input type="radio" name="q6" value="3">사용하지 않겠다&nbsp;&nbsp;
					</p>
					<br>
				</td>
			</tr>
						<tr>
				<td>
					<h4 align="Left">7. 이 시험으로 인해 얻고자하는 효과는 무엇입니까?</h4><br>
					<p align="Left">
						<input type="radio" name="q7" value="1">진급&nbsp;&nbsp; 
						<input type="radio" name="q7" value="2">자격증 취득&nbsp;&nbsp; 
						<input type="radio" name="q7" value="3">기업 입사&nbsp;&nbsp;
						<input type="radio" name="q7" value="4">직무 평가
					</p>
					<br>
				</td>
			</tr>
			<tr>
				<td>
					<h4 align="Left">8. 이 시험을 준비하신 시간은 어느 정도입니까?</h4><br>
					<p align="Left">
						<input type="radio" name="q8" value="1">1주일&nbsp;&nbsp; 
						<input type="radio" name="q8" value="2">1개월 이내 &nbsp;&nbsp; 
						<input type="radio" name="q8" value="3">3개월 이내 &nbsp;&nbsp;
						<input type="radio" name="q8" value="4">3개월 이상 &nbsp;&nbsp;
						<input type="radio" name="q8" value="5">전혀 준비하지 않았다
					</p>
					<br>
				</td>
			</tr>
			<tr>
				<td>
					<h4 align="Left">9. 이 시험을 알게 된 경로는 어디입니까?</h4><br>
					<p align="Left">
						<input type="radio" name="q9" value="1">인터넷 광고 &nbsp;&nbsp; 
						<input type="radio" name="q9" value="2">지인의 소개 &nbsp;&nbsp; 
						<input type="radio" name="q9" value="3">기업의 안내 &nbsp;&nbsp;
						<input type="radio" name="q9" value="4">잡지나 신문 등 일간지 &nbsp;&nbsp;
						<input type="radio" name="q9" value="5">기타
					</p>
					<br>
				</td>
			</tr>
<!--
 			<button type="button">preview</button>
			<button type="button">next</button> 
-->
			</table>
			<div align="center">
				<input type="BUTTON" value="제출" onclick="checkForm()"/>&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="reset" value="초기화">
			</div>
		</form>
</body>
</html>