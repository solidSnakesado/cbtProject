<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my"  tagdir="/WEB-INF/tags"%> 

<h4 class="mx-auto pb-2">나의 정보</h4>
-- ${user_id}
<form action="deleteCandidate.do" method="POST">
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
<button class="btn btn-warning m-3 p-3">삭제</button>
</form>
   
 <!--      <button type="button" value="submit" onclick="alert('수정되었습니다.')">수정확인</button> -->
      <button type="button" class="btn btn-primary m-3 p-3" value="reset" onclick="location.href='candidateUserMain.jsp'">취소</button>
