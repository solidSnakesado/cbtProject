<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 190705 의뢰 테스트 재홍 -->
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>
   
  	<header id="header"></header>
	<div align="center">
		<h1 >시험의뢰(견적서) 수정</h1>
	<hr>
	</div>
	
	<form action="companyEstimateInsert.do" method="post">
	<div>
		의뢰ID: <input type="text" name="estimateId"><br>
		카테고리ID: <input type="text" name="categoryId"><br>
		기업ID: <input type="text" name="companyId"><br>
		의뢰일: <input type="text"> <br> 
		금액: <input type="text" name ="estimatePrice"><br>
		진행상태: 
			<select name="tradeProgress">
			    <option value="3">완료</option>
			    <option value="2">진행대기</option>
			    <option value="1">진행거절</option>
			    
			</select>
		<br>
		
		응시대상자: <select name="candidate" >
			    <option value="재직자">재직자</option>
			    <option value="신입사원">신입사원</option>
			    <option value="학생">학생</option>
			</select>
			
			<br>
		응시목적: <select name="applyPurpose">
			    <option value="자격증">자격증</option>
			    <option value="직무시험">직무시험</option>
			    <option value="승진시험">승진시험</option>
			</select>
		<br>
		응시자 수: <input type="text" name="applicants"><br>
		시험분류 : 
				<select name="examClassfication">
			    <option value="3">자격증</option>
			    <option value="2">직무시험</option>
			    <option value="1">승진시험</option>
			</select><br>
		난이도:	 <select name="levelOfDifficulty">
				    <option value="3">상</option>
				    <option value="2">중</option>
				    <option value="1">하</option>
				</select>
				<br>
		 시험일시: <input type="text" id="datepicker" name="examDate">
    
   			 <script>
   			     $("#datepicker").datepicker({dateFormat : "yy-mm-dd"});
   			  	
   			 </script>
   			 
   			 <br>
		비고 : 	<input type="text" name="remarks"><br>
		시험횟수: <input type="number" style="ime-mode:disabled;" name="examCount">
				<br>
		시험간격 (ex 연 2회): 
			<input type="number" style="ime-mode:disabled;" name="examInterval">


		<br>
		
		<button> 확인 </button> <button type="button" onclick="location.href='companyEstimateList.do'">취소</button>

	</div>
	</form>
   
</body>
</html>
