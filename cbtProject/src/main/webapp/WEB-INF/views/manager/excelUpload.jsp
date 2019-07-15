<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#fileInput").change(function() {
			var form = $("#formUpload")[0];
			var data = new FormData(form);
			alert("시작");
			$.ajax({
				type: "POST",
				url: "excelUpload.do",
				processData: false,   
				contentType: false,
				cache: false,
				data: data,
				success: function(result) {
					alert("성공");
				}
			});
		})
	});
</script>
</head>
<body>
	<form id="formUpload" name="formUpload" method="post" enctype="multipart/form-data">
    	<input type="file" id="fileInput" name="fileInput" value="엑셀업로드 작업" accept=".xlsx">
	</form>
</body>
</html>