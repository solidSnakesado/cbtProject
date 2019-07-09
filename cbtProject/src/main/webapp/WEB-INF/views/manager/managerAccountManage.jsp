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
<h1>회사 계정 관리</h1>
<form action="${pageContext.request.contextPath }/managerAccountManage.do" method="post">
<input type="hidden" name="companyId" value="${result.companyId }">
<table width="940" style="padding:5px 0 5px 0;">
	  <tr>
	  	<th>아이디</th><td>${result.companyId }</td>
	  </tr>
      <tr>
         <th>패스워드</th><td><input type="text" name="companyPassword" value="${result.companyPassword }"></td>
      </tr>
      <tr>
        <th>기업명</th><td><input type="text" name="companyName" value="${result.companyName }"><br></td>
      </tr>
       <tr>
        <th>사업자번호</th><td><input type="text" name="businessNumber" value="${result.businessNumber }"><br></td>
      </tr>
      <tr>
         <th>회사분류</th><td><input type="text" name="companyClassification" value="${result.companyClassification }"></td>
      </tr>
      <tr>
         <th>세부업종</th><td><input type="text" name="companySectors" value="${result.companySectors }"></td>
      </tr>
      <tr>
         <th>결제정보</th><td><input type="text" name="companyCredit" value="${result.companyCredit }"></td>
      </tr>
      <tr>
         <th>담당자</th><td><input type="text" name="companyManager" value="${result.companyManager }"></td>
      </tr>
      <tr>
         <th>담당자연락처</th><td><input type="text" name="companyManagerTelNum" value="${result.companyManagerTelNum }"></td>
      </tr>
   </table>
   <!--테이블 끝-->
   
      <input type="submit" value="수정" >
      <input type="button" value="돌아가기" onclick="location.href='../managerAccountList.do'">
      </form>
</body>
</html>