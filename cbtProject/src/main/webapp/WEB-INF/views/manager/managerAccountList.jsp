<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
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
	<h2>기업회원 관리</h2>
	<script>
		function goList(p) {
			searchFrm.page.value = p;
			searchFrm.submit();
		}
	</script>
	<hr />
	<form name="searchFrm">
		정렬기준 <input type="hidden" name="page" value="1"> <select
			name="sort">
			<option value="COMPANY_ID">기업ID
			<option value="COMPANY_NAME">기업이름
			<option value="COMPANY_MANAGER">담당자
		</select> 
		<br> 
		검색조건 <my:companyListSelect items="${companyMap }" /><br>
		 <input type="text" name="searchKeyword" value="${CompanyVO.searchKeyword }">
		<button>검색</button>
	</form>
	<script>
		searchFrm.sort.value = "${CompanyVO.sort}" == "" ? searchFrm.sort.options[0].value
				: "${CompanyVO.sort}";
		searchFrm.searchCompany.value = "${CompanyVO.searchConsulting}" == "" ? searchFrm.searchCompany.options[0].value
				: "${CompanyVO.searchCompany}";
	</script>
	<div class="container">
		<br>
		<button type="button"
			onclick="location.href='managerAccountInsert.do'">기업 추가</button>
		<br>
		<br>
		<form action="managerAccountDelete.do">
			<button id="">삭제</button>
			<table border="1" align="center">
				<tr>
					<th>선택</th>
					<th>기업ID</th>
					<th>기업명</th>
					<th>기업 담당자</th>
				</tr>
				<c:forEach items="${result.companyList }" var="CompanyVO">
					<tr>
						<td><input type="checkbox" name="companyList"
							value="${CompanyVO.companyId }"></td>
						<td>${CompanyVO.companyId }</td>
						<td><a href="managerAccountManage.do/${CompanyVO.companyId }">${CompanyVO.companyName }</a></td>
						<td>${CompanyVO.companyManager }</td>
					</tr>
				</c:forEach>
			</table>
		</form>
		<br>
		<hr />
		<my:paging jsFunc="goList" paging="${result.paging }" />
	</div>
</body>
</html>