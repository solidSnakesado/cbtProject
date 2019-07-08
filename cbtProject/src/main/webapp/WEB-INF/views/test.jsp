<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- 190705 의뢰 테스트 재홍 -->
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="companyEstimateDelete.do">
<button>삭제</button>
<table border="1">
		<tr>
			<th>선택</th>
			
			<th>의뢰ID</th>
			<th>카테고리ID</th>
			<th>기업ID</th>
			<th>의뢰일</th>
			<th>금액</th>
			<th>진행상태</th>
			<th>응시 대상자</th>
			<th>응시목적</th>
			<th>응시자 수</th>
			<th>시험분류</th>
			<th>난이도</th>
			<th>시험일시</th>
			<th>비고</th>
			<th>시험횟수</th>
			<th>시험간격</th>
			<th>수정</th>
		</tr>
		<c:forEach items="${result}" var="EstimateVO">
			<tr>
				<td><input type="checkbox" name="seqList" value=""></td>
				<td>${EstimateVO.estimateId}</td>
				<td>${EstimateVO.categoryId}</td>
				<td>${EstimateVO.companyId}</td>
				<td>${EstimateVO.requestDay}</td>
				<td>${EstimateVO.estimatePrice}</td>
				<td>${EstimateVO.tradeProgress}</td>
				<td>${EstimateVO.candidate}</td>
				<td>${EstimateVO.applyPurpose}</td>
				<td>${EstimateVO.applicants}</td>
				<td>${EstimateVO.examClassfication}</td>
				<td>${EstimateVO.levelOfDifficulty}</td>
				<td>${EstimateVO.examDate}</td>
				<td>${EstimateVO.remarks}</td>
				<td>${EstimateVO.examCount}</td>
				<td>${EstimateVO.examInterval}</td>
				<td><button type="button" onclick="window.open('companyEstimateUpdate.do',width=400,height=400)">수정</button></td>
			</tr>
		</c:forEach>
	</table>
	<a href="companyEstimateInsert.do">글 등록</a>
</form>
</body>
</html>