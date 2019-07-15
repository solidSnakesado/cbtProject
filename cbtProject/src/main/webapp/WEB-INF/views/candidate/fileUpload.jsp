<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Home</title>
<script type="text/javascript">
$("#excelUpForm").change(function(){
    var form = $("#excelUpForm")[0];

    var data = new FormData(form);
    $.ajax({
       enctype:"multipart/form-data",
       method:"POST",
       url: './excelUp.do',
       processData: false,   
       contentType: false,
       cache: false,
       data: data,
       success: function(result){  
           alert("업로드 성공!!");
       }
    });
});
</script>
</head>
<body>
	엑셀업로드 : <br/>
<form name="excelUpForm" id="excelUpForm" enctype="multipart/form-data" method="POST" action="./excelDown.do">
    <input type="file" id="excelFile" name="excleFile" value="엑셀 업로드" />
    <button> G o !</button>
</form>

</body>
</html>
