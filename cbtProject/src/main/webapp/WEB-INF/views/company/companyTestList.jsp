<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<title>CBT 시험 일정 확인</title>

<script>
	function showPopup(){
		var innerWidth = window.innerWidth/2;
		var innerHeight= window.innerHeight/2;
		
		window.open("test_List_Detail.html","a","height=innerHeight ,width=innerWidth,left=0,top=0");
	}
</script>
</head>

	
<body>
시험목록확인(기업)
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#header").load("co_header.html")
		});
	</script>
	<header id="header"></header>
   <section>
   <article>
      <ul>
         <li><button type="button" onclick="location.href='accountManage.html'">계정관리</button></li>
         <li><button type="button" onclick="location.href='requestList.html'">의뢰목록</button></li>
         <li><button type="button" onclick="location.href='conSulting_List.html'">상담목록</button></li>
         <li><button type="button" onclick="location.href='test_List.html'">시험목록</button></li>
      </ul>
   </article>
</section>
	<table border="1" align="center">
	<tr >
		<th>시험분류</th>
		<th>시험이름</th>
		<th>시험일시</th>
		<th>결제여부</th>
	
	</tr>
	<tr onclick="showPopup();">
		<td>재직자 테스트</td>
		<td>재직자 내  테스트</td>
		<td>2019.03.04 13:30 ~ 15 : 00</td>
		<td>완료</td>
	</tr>
	<tr onclick="showPopup();">
		<td>신입사원테스트</td>
		<td>신입사원 타자 경진대회</td>
		<td>2019.03.04 13:30 ~ 15 : 00</td>
		<td>미결</td>
	</tr>
	<tr onclick="showPopup();">
		<td>..</td>
		<td>..</td>
		<td>..</td>
		<td>..</td>
		
	</tr>
	
	</table>
</body>
</html>