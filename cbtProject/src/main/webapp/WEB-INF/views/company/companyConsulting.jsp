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
	<script type="text/javascript">
		$(document).ready(function() {
			$("#header").load("co_header.html")
		});
	</script>
	<header id="header"></header>
<table>
 <form name="write_form_member" method="post">
   <tr>
      <td><h2>기업상담신청</h2></td>
   </tr>
	<tr>
      <table width="940" style="padding:5px 0 5px 0;">
      <tr>
        <th>의뢰기업명</th>
        <td><input type="text" name="company_name" size="80"></td>
      </tr>
 
      <tr>
         <th>업종</th>
         <td>
         <input style="hidden" name="company_classification" size="60" placeholder="주요사업분야를 키워드 기준으로 작성해주세요">
               <select name="job" size="1">
               <option value=''>선택하세요 </option>
               <option value='11'>경영/사무</option>
               <option value='12'>마케팅/광보/홍보</option>
               <option value='13'>IT/인터넷</option>
               <option value='14'>디자인</option>
               <option value='15'>무역/유통</option>
               <option value='16'>영업/고객상담</option>
               <option value='17'>서비스</option>
               <option value='18'>연구개발/설계</option>
               <option value='19'>생산/제조</option>
               <option value='20'>교육</option>
               <option value='21'>건설</option>
               <option value='22'>의료</option>
               <option value='23'>미디어</option>
               <option value='24'>전문/특수직</option>
            </select>
         </td>
      </tr>
 
      <tr>
         <th>담당자</th>
         <td><input type="text" name="company_charge" size="80"></td>
      </tr>
 
      <tr>
         <th>연락처</th>
         <td><input type="text" name="compnay_tel" size="80"></td>
      </tr>
      <tr>
         <th>이메일</th>
         <td>
            <input type="text" name="email" size="30"> @
            <input type="text" name="email_dns">
               <select name="emailaddr">
                  <option value="">직접입력</option>
                  <option value="daum.net">daum.net</option>
                  <option value="empal.com">empal.com</option>
                  <option value="gmail.com">gmail.com</option>
                  <option value="hanmail.net">hanmail.net</option>
                  <option value="msn.com">msn.com</option>
                  <option value="naver.com">naver.com</option>
                  <option value="nate.com">nate.com</option>
               </select>
            </td>
         </tr>
         
         <tr>
         	<th>상담내용</th>
         	<td><textarea name="content" cols="80" rows="8" placeholder="상담하고자 하시는 시허므이 종류와 예상인원을 작성하여 주세요. 세부적으로 작성하실수록 상담이 쉬워집니다."></textarea><td>
     	 </tr>
     	 
     	 <tr>
         	<th>희망상담일</th>
         	<td><input type="text" name="meeting_date" size="80" placeholder="상담을 원하시는 시간을 입력하여 주시면 최대한 반영하도록 하겠습니다. (예) 2019-6-18 15:00 "></td>
     	 </tr>
     	 
   </table>
   </tr>
   </form>
   <tr> <td><button onclick="location.href='conSulting_List.html'">제출</button> <button onclick="location.href='companyMain.html'">돌아가기</button><td></tr>
   </table>

</body>
</html>


    