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
   <script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#header").load("companyCoHeader.jsp")
		});
	</script>
	<header id="header"></header>
<section>
   <article>
      <ul>
         <li><button type="button" onclick="location.href='managerAccountControl.jsp'">계정관리</button></li>
         <li><button type="button" onclick="location.href='companyRequestList.jsp'">의뢰목록</button></li>
         <li><button type="button" onclick="location.href='companyConSultingList.jsp'">상담목록</button></li>
         <li><button type="button" onclick="location.href='companyTestList.jsp'">시험목록</button></li>
         <li><button type="button" onclick="location.href='companyChart.jsp'">통계</button></li>
      </ul>
   </article>
</section>
<h1>계정관리</h1>
<table width="940" style="padding:5px 0 5px 0;">
      <tr>
        <th>기업명</th>
        <td>URACLE</td>
      </tr>
      <tr>
         <th>패스워드</th>
         <td>***********</td>
      </tr>
      <tr>
         <th>업종</th>
         <td>IT</td>
      </tr>
 
      <tr>
         <th>담당자</th>
         <td>에릭 슈미트</td>
      </tr>
 
      <tr>
         <th>연락처</th>
         <td>010-2222-3333</td>
      </tr>
      <tr>
         <th>이메일</th>
         <td>ceo@gmail.com</td>
         </tr>
   </table>
   <!--테이블 끝-->
   
      <button type="button" value="submit" onclick="alert('수정되었습니다.')">수정하기</button>
      <button type="button" value="reset" onclick="location.href='companyMain.jsp'">돌아가기</button>
   
   
   

</body>
</html>