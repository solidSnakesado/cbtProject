<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>
	<header id="header"></header>
	<form name="companyConsultingInsert.do" method="post">
		<h2>기업상담신청</h2>
		<table style="padding: 5px 0 5px 0;">
			<tr>
				<th>상담희망일</th>
				<td><input type="datetime-local" name="consultingDesiredDate" size="80"
					placeholder="상담을 원하시는 시간을 입력하여 주시면 최대한 반영하도록 하겠습니다."></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="consultingTitle" placeholder="제목을 입력해 주세요."><td>
			</tr>
			<tr>
				<th>상담내용</th>
				<td><textarea name="consultingContents" cols="80" rows="8"
						placeholder="상담하고자 하시는 시허므이 종류와 예상인원을 작성하여 주세요. 세부적으로 작성하실수록 상담이 쉬워집니다."></textarea>
				<td>
			</tr>
		</table>
		<input type="submit" value="상담신청">
		<button onclick="location.href='companyMain.do'">돌아가기</button>	
	</form>
</body>
</html>


