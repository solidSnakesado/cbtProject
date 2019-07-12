<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	
</head>  
<body>
	<h2 align="center">세부 의뢰목록</h2>
	<form action="${pageContext.request.contextPath}/companyEstimateUpdate.do" method="POST">
		<table>
			<tr>	<td>의뢰ID</td>		<td>	<input type="text" name="estimateId" value="${myEstimateList.estimateId}" readonly></td></tr>
 			<tr>	<td>카테고리ID</td>	<td>	<input type="text" name="categoryId" value="${myEstimateList.categoryId}" ></td></tr>
	 		<tr>	<td>기업ID</td>		<td>	<input type="text" name="companyId" value="${myEstimateList.companyId}" readonly></td></tr>
			<tr>	<td>의뢰일</td>		<td>	<input type="text" name="requestDay" value="${myEstimateList.requestDay}" readonly></td></tr>
			<tr>	<td>금액</td>		<td>		<input type="text" name="estimatePrice" value="${myEstimateList.estimatePrice}" readonly></td></tr>
			<tr>	<td>의뢰진행상태</td>	<td>	<my:select items="${B}" name="tradeProgress" value="${myEstimateList.tradeProgress}" ></my:select></td></tr>
 			<tr>	<td>응시대상자</td>	<td>		<my:select items="${K}" name="candidate" value="${myEstimateList.candidate}"></my:select></td></tr>
			<tr>	<td>응시목적</td>		<td>	<my:select items="${L}" name="applyPurpose" value="${myEstimateList.applyPurpose}"></my:select></td></tr>
			<tr>	<td>응시자 수</td>		<td>	<input type="text" name="applicants" value="${myEstimateList.applicants}" ></td></tr>
			<tr>	<td>시험분류</td>		<td>	<my:select items="${M}" name="examClassfication" value="${myEstimateList.examClassfication}"></my:select></td></tr>
			<tr>	<td>난이도</td>		<td>	<my:select items="${G}" name="levelOfDifficulty" value="${myEstimateList.levelOfDifficulty}"></my:select></td></tr>
			<tr>	<td>시험일시</td>		<td>	<!-- "datetime-local" --><input type="text" id="datepicker" name="examDate" value="${myEstimateList.examDate}" ></td></tr>
	 		<tr>	<td>비고</td>		<td>	<input type="text" name="remarks" value="${myEstimateList.remarks}"></td></tr>
			<tr>	<td>시험횟수</td>		<td>	<my:radio items="${H}" name="examCount" value="${myEstimateList.examCount}"></my:radio></td></tr>  
			<tr>	<td>시험간격</td>		<td>	<my:select items="${N}" name="examInterval" value="${myEstimateList.examInterval}"></my:select></td></tr>
			
			<tr>	<td>의뢰이름</td>		<td>	<input type="text" name="estimateName" value="${myEstimateList.estimateName}"></td></tr>
			
			
		</table>
		<button>수정하기</button> <button type="button" onclick="windowClose()"> 확인 </button> 
	</form>
	
	<script>
			$("#datepicker").datepicker({dateFormat : "yy-mm-dd"});	  	
			tradeProgress.readOnly =true;
			
			function windowClose(){
				window.opener.top.location.reload();
				window.close();
			}
	</script>
</body>
</html>