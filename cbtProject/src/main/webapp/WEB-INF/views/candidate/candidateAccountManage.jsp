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
			$("#header").load("candidateInHeader.do")
		});
	</script>
	<header id="header"></header>
<section>
   <article>
      <ul>
         <li><a href="candidateAccountManageModify.do"><button>계정관리</button></a></li>
         <li><a href="commonDetailRequestList.do"><button>응시목록</button></a></li>
         <li><a href="candidatePersonalChart.do"><button>통계</button></a></li>
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
         <td>***********</td>
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
         <td>010-2222-3333</td>
      </tr>
      <tr>
         <th>이메일</th>
         <td>peter123@gmail.com</td>
         </tr>
   </table>
   <!--테이블 끝-->
   
      <button type="button" value="submit" onclick="candidateAccountManageModify.do">수정</button>
      <button type="button" value="reset" onclick="candidateMain.do">돌아가기</button>   

</body>
</html>