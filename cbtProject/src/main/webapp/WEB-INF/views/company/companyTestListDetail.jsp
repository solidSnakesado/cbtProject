<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/main.css" />
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
	<h3>개별 시험 의뢰 목록 (기업화면)</h3>
	<input type = "hidden" name = "no" value = "${ dto.no }">
	<table border = "1">
		<tr>
			<th>시험 분류</th>
			<td><input type = "text" name = "id" id = "id" value = 1 readonly></td>
		</tr>
		<tr>
			<th>업종</th>
			<td><input type = "text" name = "date" value = .. readonly></td>
		</tr>
		<tr>
			<th>담당자</th>
			<td><input type = "text" name = "title" value = "2019.03.04 13:30 ~
   				2019.03.04 15:30" readonly></td>
		</tr>
		
		<tr>
			<th>이메일</th>
			<td>gkgkgk@gmail.com</td>
		</tr>
		<tr>
			<th>연락처</th>
			<td>010-2222-2222</td>
		</tr>
		<tr>
			<th>시험내용</th>
			<td><textarea name = "content" rows = "10" cols = "100" readonly>이시험은 00기업 재직자를 위한 테스트입니다.</textarea></td>
		</tr>
		<tr>
			<th>시험일</th>
			<td>2019.06.19 15:00~18:00</td>
		</tr>
	</table>
	
	<button onclick = "location.href = 'test_List_Detail_Graph.html '" >통계보기</button>
	<input type = "button" onclick =  'window.close()' value = "확인">


</body>
</html>