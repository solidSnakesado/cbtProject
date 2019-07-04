<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- 190715 의뢰 테스트 재홍 -->
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="companyEstimateDelete.do">
<button>삭제</button>
<table>
		<tr>
			<th>선택</th>
			
			<th>의뢰ID</th>
			<th>의뢰가격</th>
			<th>의뢰일</th>
			<th>진행상태</th>
			<th>비고</th>
			<th>응시자 수</th>
			<th>난이도</th>
			<th>응시대상자</th>
			<th>응시목적</th>
			<th>시험대상자</th>
			<th>카테고리ID</th>
			<th>시험분류</th>
			<th>기업ID</th>
			<th>시험횟수</th>
			<th>시험간격</th>
		</tr>
		<c:forEach items="${result}" var="EstimateVO">
			<tr>
				<td><input type="checkbox" name="seqList" value=""></td>
				<td>${EstimateVO.estimateId}</td>
				<td>${EstimateVO.estimatePrice}</td>
				<td>${EstimateVO.requestDay}</td>
				<td>${EstimateVO.tradeProgress}</td>
				<td>${EstimateVO.remarks}</td>
				<td>${EstimateVO.applicants}</td>
				<td>${EstimateVO.levelOfDifficulty}</td>
				<td>${EstimateVO.candidate}</td>
				<td>${EstimateVO.applyPurpose}</td>
				<td>${EstimateVO.examDate}</td>
				<td>${EstimateVO.category_id}</td>
				<td>${EstimateVO.examClassfication}</td>
				<td>${EstimateVO.companyId}</td>
				<td>${EstimateVO.examCount}</td>
				<td>${EstimateVO.examInterval}</td>
				
			</tr>
		</c:forEach>
	</table>
</form>
</body>
</html>