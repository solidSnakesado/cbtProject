<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 의뢰 html -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	<style>
.dropbtn {
  background-color: #4CAF50;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  
}
	
	.dropdown-content a:hover {background-color: #ddd;}

.dropdown:hover .dropdown-content {display: block;}

.dropdown:hover .dropbtn {background-color: #3e8e41;}
</style>
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#header").load("co_header.html")
		});
	</script>
	<header id="header"></header>
	<div align="center">
		<h1 >시험의뢰(견적서)</h1>
	<hr>	
	</div>
	
	<div>
		의뢰일: <input type="text"><br>
		금액: <input type="text"><br>
		진행상태: 
			<select >
			    <option value="진행대기">진행대기</option>
			    <option value="진행완료">진행완료</option>
			    <option value="진행거절">진행거절</option>
			    
			</select>
		<br>
		응시자수: <input type="text" placeholder="ex)50명"><br>
		난이도: <select >
			    <option value="상">상</option>
			    <option value="중">중</option>
			    <option value="하">하</option>
			</select>
				<br>
		비고: <input type="text"> <br>
		응시대상자: <select >
			    <option value="재직자">재직자</option>
			    <option value="신입사원">신입사원</option>
			    <option value="학생">학생</option>
			</select>
		<br>
		응시목적: <select >
			    <option value="자격증">자격증</option>
			    <option value="직무시험">직무시험</option>
			    <option value="승진시험">승진시험</option>
			</select>
		<br>
		시험일시: <input type="text"><br>
		시험분류: <select >
			    <option value="응시목적별분류1">응시목적별분류1</option>
			    <option value=""></option>
			    <option value=""></option>
			    <option value=""></option>
			</select>
				<br>
		합격점수: <input type="text" placeholder="ex)60점"> <br>
		시험명: <input type="text" placeholder="ex)정보처리기사"> <br>
		시험 시간: <select >
			    <option value="30">0:30:00</option>
			    <option value="60">1:00:00</option>
			    <option value="90">1:30:00</option>
			    <option value="120">2:00:00</option>
			</select>
				<br>
		문항수: <input type="text" placeholder="ex)50문제"> <br>
		응시 가능 횟수: <select >
			    <option value="">1회</option>
			    <option value="학생">2회</option>
			    <option value="회사원">3회</option>
			    <option value="기타">4회</option>
			</select>
		<br>
		
		<button onclick="location.href='companyMain.html'"> 확인 </button> <button onclick="location.href='companyMain.html'">취소</button>
		
	</div>
	
	
</body>
</html>