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
		
		window.open("conSulting_Detail.html","a","height=innerHeight ,width=innerWidth,left=0,top=0");
	}
</script>
</head>

	
<body>
상담목록확인(기업)
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
		<th>상담번호</th>
		<th>생각</th>
		<th>담당자</th>
		<th>상담일시</th>
		<th>상담유무</th>
	</tr>
	<tr onclick="showPopup();">
		<td>1</td>
		<td></td>
		<td>제프 베조스</td>
		<td>2019.03.04 13:30 ~<br>&nbsp;&nbsp;&nbsp;2019.03.04 15:30</td>
		<td>상담완료</td>
		
	</tr>
	<tr onclick="showPopup();">
		<td>2</td>
		<td></td>
		<td>제레</td>
		<td>2019.03.04 13:30 ~<br>&nbsp;&nbsp;&nbsp;2019.03.04 15:30</td>
		<td>상담예정</td>
		
	</tr>
	<tr onclick="showPopup();">
		<td>3</td>
		<td></td>
		<td>승환이형</td>
		<td>2019.03.04 13:30 ~<br>&nbsp;&nbsp;&nbsp;2019.03.04 15:30</td>
		<td>상담완료</td>
		
	</tr>
	
	</table>
	<br>
	<button onclick="location.href='companyMain.html'">돌아가기</button>
</body>
</html>