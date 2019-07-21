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

	var estimate="${result.estimateList}";
	
	//페이징처리
	function goList(p) {
		searchFrm.page.value = p;
		searchFrm.submit();
	}
	
	// 윈도우 function 처리 함수
	function estimateDetail(estimateId){
		var wintype = "toolbar=no,width=1100px,height=900px,top=50,left=420,directories=no,menubar=no,scrollbars=yes";// 윈도우창 띄움
		var winopen = window.open("companyEstimateDetail.do/"+estimateId,"windowopen",wintype);
	}
	
	function deleteEstimateId(e,estimateId){ //해당 estimateId 가진 튜플 삭제함수
		
			e.preventDefault(); //<form action="companyEstimateList.do">이 실행되지않도록 막음
			
			//예외처리
			if(confirm("삭제하시겠습니까??")){		
					//해당 estimateId 가진 튜플 삭제
					 $.ajax({
						url:"${pageContext.request.contextPath}/companyEstimateDelete.do",
						data: { estimateId:  estimateId},
						success : function() {
							alert('삭제되었습니다');
							location.reload();
						}, error : function() {
							alert('에러발생');
						}
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
					<th class="text-center">카테고리</th>
					<th class="text-center">의뢰이름</th>
					<th class="text-center">의뢰일</th>
					<th class="text-center">진행상태</th>
					<th class="text-center">시험일시</th>
					<th class="text-center">삭제</th>
				</tr>
					<c:forEach items="${result.estimateList}" var="estimate">
					<tr>
						<td onClick="estimateDetail(${estimate.estimateId})">${estimate.estimateId}</td>
						<td onClick="estimateDetail(${estimate.estimateId})">${estimate.categoryName}</td>
						<td onClick="estimateDetail(${estimate.estimateId})">${estimate.estimateName}</td>
						<td onClick="estimateDetail(${estimate.estimateId})">${estimate.requestDay}</td>
						<td onClick="estimateDetail(${estimate.estimateId})">${estimate.tradeProgressName}</td>
						<td onClick="estimateDetail(${estimate.estimateId})">${estimate.examDate}</td>
						<td><button type="button" onClick="deleteEstimateId(event,${estimate.estimateId})">삭제</button></td>
					</tr>
				</c:forEach>
			</table>
		</form>
		
		<my:paging jsFunc="goList" paging="${result.paging}"/>
		
	</div>	
</body>

</html>