<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</head>
<body>
	<h4 class="alert alert-primary p-1 m-1">통계관리</h4>
		<div class="align-middle m-5" >
			<button type="button" class="btn btn-primary btn-lg p-5 m-5" style="font-size:1em" onclick="location.href='####.do'">시험결과 보기</button>
			<button type="button" class="btn btn-primary btn-lg p-5 " style="font-size:1em" onclick="location.href='surveyDetailGraph.do'">설문결과 보기</button>
		</div>
</body>
</html>