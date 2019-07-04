<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

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
	<h3>시험 목록 세부 내용(기업)</h3>
	<input type = "hidden" name = "no" value = "${ dto.no }">
	<table border = "1">
		<tr>
			<th>상담번호</th>
			<td><input type = "text" name = "id" id = "id" value = 1 readonly></td>
		</tr>
		<tr>
			<th>생각</th>
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
			<th>상담내용</th>
			<td><textarea name = "content" rows = "10" cols = "100" readonly></textarea></td>
		</tr>
		<tr>
			<th>희망상담일</th>
			<td>2019.06.19</td>
		</tr>
	</table>
	<button onclick =  'window.close()'>수정하기</button>
	<button onclick = 'window.close()' >삭제하기</button>
	<input type = "button" onclick =  'window.close()' value = "확인">


</body>
</html>