<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my"  tagdir="/WEB-INF/tags"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	function btn_js_confirm_click() {
		var check = confirm("정말로 탈퇴하시겠습니까?");
		if (check){
			alert("탈퇴처리");
			document.fmField.submit();
		}
			
		else
			alert("취소");
	}
</script>

</head>
<body>

<h4 class="mx-auto pb-2">나의 정보</h4>
-- ${user_id}
<form id="fmField" name="fmField" action="deleteCandidate.do" method="POST">
<input type="hidden" name="takerId" value="${candidate.takerId}"/>
	<table class="table table-striped">
	      <tr>
	        <th>ID</th>
	        <td>${candidate.takerId}</td>
	      </tr>
	      <tr>
	         <th>이름</th>
	         <td>${candidate.takerName}</td>
	      </tr>
	      <tr>
	         <th>연락처</th>
	         <td>${candidate.takerInfo}</td>
	      </tr>
	      <tr>
	         <th>이메일</th>
	         <td>${candidate.takerEmail}</td>
	         </tr>
	</table>
<!--테이블 끝-->
<!-- <button class="btn btn-warning m-3 p-3">삭제</button> -->
<input type="button" name="btn_js_confirm" id="btn_js_confirm" onclick="btn_js_confirm_click();" value="탈퇴하기" />

</form>
   
 <!--      <button type="button" value="submit" onclick="alert('수정되었습니다.')">수정확인</button> -->
      <button type="button" class="btn btn-primary m-3 p-3" value="reset" onclick="location.href='candidateMain.do'">취소</button>
