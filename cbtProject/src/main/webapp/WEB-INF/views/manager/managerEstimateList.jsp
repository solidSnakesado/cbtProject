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
		console.log("estimateId :" + estimateId);
		var wintype = "toolbar=no,width=500,height=1000,top=150,left=150,directories=no,menubar=no,scrollbars=yes";
		var winopen = window.open("companyEstimateDetail.do/"+estimateId,"windowopen",wintype);
	}
	
	function deleteEstimateId(estimateId){
		console.log(estimateId);
		if(confirm("삭제하시겠습니까??")){
			$(document).ready(function(){
				$.ajax({
					type:'GET',
					dataType : 'json',
					url:"${pageContext.request.contextPath}/companyEstimateDelete.do/" + estimateId,
					success : function(data) {
						alert('삭제되었습니다');
					}, error : function() {
						alert('에러발생');
					}
				});
			});
		}
		else{
			alert("취소되었습니다");
			return false;
		}
			
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
		
		<form action="companyEstimateList.do">
			
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
					<tr>
						<td onClick="estimateDetail(${estimate.estimateId})">${estimate.estimateId}</td>
						<td onClick="estimateDetail(${estimate.estimateId})">${estimate.categoryName}</td>
						<td onClick="estimateDetail(${estimate.estimateId})">${estimate.requestDay}</td>
						<td onClick="estimateDetail(${estimate.estimateId})">${estimate.tradeProgressName}</td>
						<td onClick="estimateDetail(${estimate.estimateId})">${estimate.examDate}</td>
						<td><button type="button" onClick="deleteEstimateId(${estimate.estimateId})">삭제</button></td>
					</tr>
				</c:forEach>
			</table>
		</form>
		<my:paging jsFunc="goList" paging="${result.paging}"/>
		<button type="button"  class="btn btn-primary" value="등록"  id="btnInsert"  onclick="location.href='managerEstimateInsert.do'">의뢰등록</button>
		
	</div>	
</body>

</html>