<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#chartBtn").click(function() {
			google.load("visualization", "1", {packages : ["corechart"]});
			google.setOnLoadCallback(loadPageData);

			function loadPageData() {
				$.ajax({
					type: "POST",
					url : "${pageContext.request.contextPath }/getTakeExamHistoryForTakerIdAndExamIdList.do/1",
					success: function(data) {

					}
				});
			}
		})
	});
</script>
</head>
<body>
	<label>시험 선택</label>
	<select name="" id="" class="form-control">
		<option value="-1">-시험을 선택하세요-</option>
		<%-- <c:forEach items="${}" var="">
			<option value="${}">${}</option>
		</c:forEach> --%>
	</select>
</body>
</html>