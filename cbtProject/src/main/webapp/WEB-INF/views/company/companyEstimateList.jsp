<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
 <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<script>
	//페이징처리
	function goList(p) {
		searchFrm.page.value = p;
		searchFrm.submit();
	}
	function estimateDetail(estimateId){
		console.log(estimateId);
		var wintype = "toolbar=no,width=500,height=1000,top=150,left=150,directories=no,menubar=no,scrollbars=yes";
		var winopen = window.open("companyEstimateDetail.do/"+estimateId,"windowopen",wintype);
		
	}
</script>

</head>
<body>

<h2>의뢰목록</h2>
<hr/>		
<div class="container">

		<form name="searchFrm">
			<input type="hidden" name="page" value="1">
		</form>
		
		<form action="companyEstimateDelete.do">
			
			<table border="1" class="table text-center">
				<tr>
					<th class="text-center">순번</th>
					<th class="text-center">카테고리ID</th>
					<th class="text-center">의뢰일</th>
					<th class="text-center">진행상태</th>
					<th class="text-center">시험일시</th>
					<th class="text-center">삭제</th>
				</tr>
					<c:forEach items="${result.estimateList}" var="estimate">
					<tr onClick="estimateDetail(${estimate.estimateId})">
						<td>${estimate.estimateId}</td>
						<td>${estimate.categoryNm}</td>
						<td>${estimate.requestDay}</td>
						<td>${estimate.tradeProgressNm}</td>
						<td>${estimate.examDate}</td>
						<td><button>삭제</button></td>
					</tr>
				</c:forEach>
			</table>
		</form>
		<my:paging jsFunc="goList" paging="${result.paging}"/>
		
	</div>	
</body>

</html>