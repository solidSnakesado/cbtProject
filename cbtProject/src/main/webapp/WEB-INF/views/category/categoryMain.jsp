<!-- 2019.07.06 성재민 -->
<!-- 카테고리 목록을 전시하기 위해 생성 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>카테고리 목록</title>
<script type="text/javascript">
	function categoryDelete(categoryId) {
		/* $.ajax({
			type: "POST",
			url: "${pageContext.request.contextPath }/deleteCategory.do/" + categoryId,
			success : function() {
				location.reload();
			}
		}); */
		
		/* var deleteform = $("<form></form>");
		deleteform.attr("action", "${pageContext.request.contextPath }/deleteCategory.do/" + categoryId);
	    deleteform.attr("method", "POST");
	    deleteform.appendTo("body")
		deleteform.submit();  */
		
		location.href = "${pageContext.request.contextPath }/deleteCategory.do/" + categoryId;
	}
	
	function categoryInsert() {
		location.href = "${pageContext.request.contextPath }/insertCategory.do/";
	}
	
	function categoryUpdate(categoryId) {
		location.href = "${pageContext.request.contextPath }/updateCategory.do/" + categoryId;
	}
</script>
</head>
<body>
	<h3>카테고리 목록</h3>
	<button id="insertCategoryBtn" name="insertCategoryBtn" onclick="categoryInsert()">카테고리 생성</button><br><br>
	<table border="1">
		<tr>
			<th>카테고리 ID</th>
			<th>카테고리 이름</th>
			<!-- <th>대분류 ID</th>
			<th>중분류 ID</th>
			<th>소분류 ID</th> -->
			<th></th>
			<th></th>
		</tr>
		<c:forEach items="${categoryList}" var="category">
			<tr>
				<td>${category.categoryId}</td>
				<td>${category.categoryName}</td>
				<%-- <td>${category.categoryMainId}</td>
				<td>${category.categoryMiddleId}</td>
				<td>${category.categorySamllId}</td> --%>
				<td><button id="updateBtn" onclick="categoryUpdate(${category.categoryId})">수정하기</button></td>
				<td><button id="deleteBtn" onclick="categoryDelete(${category.categoryId})">삭제하기</button></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>