<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!-- 의뢰 html -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


</head>
<body>
	
<!-- 	<script type="text/javascript">
		$(document).ready(function() {
			$("#header").load("co_header.html")
		});
	</script> -->
	<header id="header"></header>
	<div align="center">
		<h1>시험의뢰(견적서)</h1>
		<hr>
	</div>

	
	<form action="companyEstimateInsert.do" method="POST">
	
		<table>
			<!-- <tr>	<td>의뢰ID	</td> 	<td><input type="text" name="estimateId">	</td>	</tr> -->
			<tr>	<td>의뢰이름	</td> 	<td><input type="text" name="estimateName">	</td>	</tr>
			<tr>	<td>카테고리ID</td>	<td><input type="text" name="categoryId">	</td>	</tr>
			<tr>	<td>기업ID	</td>	<td><input type="text" name="companyId">	</td>	</tr>
			<tr>	<td>금액		</td>	<td><input type="text" name="estimatePrice"></td>	</tr>
			<tr>	<td>응시대상자</td>	<td>
				<my:select items="${K}" name="candidate" value="${myEstimateList.candidate}"></my:select>
								</td></tr>
			
			<tr>	<td>응시목적</td>		<td><my:select items="${L}" name="applyPurpose" value="${myEstimateList.applyPurpose}"></my:select></td></tr>
			
			<tr>	<td>응시자 수</td>		<td><input type="text" name="applicants"></td>	</tr>

			<tr>
					<td>시험분류</td>		
					<td>
						<my:select items="${M}" name="examClassfication" value="${myEstimateList.examClassfication}"></my:select>
					</td></tr>
			
			<tr>
					<td>시험난이도</td>		<td>
					<my:select items="${G}" name="levelOfDifficulty" value="${myEstimateList.levelOfDifficulty}"></my:select>
						 				
						 				</td></tr>
			
			<tr>	<td>시험일시	</td>		<td><input type="text" id="datepicker" name="examDate"></td>	</tr>
			<tr>	<td>비고		</td>		<td><input type="text" name="remarks"></td>						</tr>
			<tr>	<td>시험횟수	</td>		<td><input type="number" style="ime-mode: disabled;" name="examCount"></td>	</tr>
			<tr>	<td>시험간격(ex 연 2회)</td><td><input type="number" style="ime-mode:disabled;" name="examInterval"></td></tr>
		</table>
		
		<div>
			<button>확인</button>
			<button type="button"
				onclick="location.href='companyEstimateList.do'">취소</button>

		</div>
		
		</form>
		
		<script>
			$("#datepicker").datepicker({dateFormat : "yy-mm-dd"});	  	
		</script>
		
	

</body>
</html>