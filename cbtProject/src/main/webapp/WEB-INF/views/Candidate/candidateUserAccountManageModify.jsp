<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<style>

</style>
</head>
<body>
<!-- 마이페이지<개인> 계정관리--> 
   <script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#header").load("candidateInHeader.html")
		});
	</script>
	<header id="header"></header>
<section>
   <article>
      <ul>
         <li><button type="button">계정관리</button></li>
         <li><button type="button">응시목록</button></li>
      </ul>
   </article>
</section>
<h1>계정관리</h1>
<table width="940" style="padding:5px 0 5px 0;">
      <tr>
        <th>ID</th>
        <td>peter123</td>
      </tr>
      <tr>
         <th>패스워드</th>
         <td><input type="text"></td>
      </tr>
      <tr>
         <th>패스워드 확인</th>
         <td><input type="text"></td>
      </tr>
      <tr>
         <th>이름</th>
         <td>이승환</td>
      </tr>
      <tr>
         <th>주민등록번호</th>
         <td>920529-1******</td>
      </tr>
 
      <tr>
         <th>연락처</th>
         <td><input type="text"></td>
      </tr>
      <tr>
         <th>이메일</th>
         <td><input type="text"></td>
         </tr>
   </table>
   <!--테이블 끝-->
   
      <button type="button" value="submit" onclick="alert('수정되었습니다.')">수정확인</button>
      <button type="button" value="reset" onclick="location.href='candidateUserMain.html'">취소</button>
   
   
   

</body>
</html>