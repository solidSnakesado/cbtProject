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
<script>
	$(document).ready(function() {
		function checkFileType(filePath) {
			var fileFormat = filePath.split(".");
			if (fileFormat.indexOf("xlsx") > -1) {
				return true;
			} else {
				return false;
			}
		}
	
		function fileCheck() {
			var file = $("#fileInput").val();
			if (file == "" || file == null) {
				alert("파일을 선택해주세요.");
				return false;
			} else if (!checkFileType(file)) {
				alert("엑셀 파일만 업로드 가능합니다.");
				return false;
			}
	
			if (confirm("업로드 하시겠습니까?")) {
				$("#formUpload").submit();
			}
		}
		
		// 2019.07.23 성재민
		// 해당 유저의 이메일로 이메일 전송
		// 이후 해당 유저가 로그인시(비회원일 경우 회원가입후)
		// 이메일에 첨부된 링크를 눌러 홈페이지 접근시 해당 유저를 알아 볼수 있게 처리
		$("#privateExamAddBtn").click(function() {
			var selectedIdx = $("#privateExam option:selected").val();
			if(selectedIdx != -1){
				let list = [];
				$("[name='takerListCheckBox']:checked").each(function(i, checkbox){
					var tr = $(checkbox).parent().parent();
					var td = $(tr).children();

					let obj = {};
					obj["examId"] 		= selectedIdx;
					obj["takerEmail"] 	= td.eq(3).text();
					console.log(obj);
					
					list.push(obj);
				});
				
				$.ajax({
					contentType: 'application/json',
					type: "POST",
					url:"${pageContext.request.contextPath}/sendEmailPrivateExamTaker.do",
					dataType: "json",
					data: JSON.stringify(list),
					success : function(data) {
						alert('성공');
						location.reload();
					}, error : function() {
						alert('에러발생');
					}
				});	
			}
		});
		
		$("#privateExam").change(function() {
			console.log("선택값");
			var selectedIdx = $("#privateExam option:selected").val();
			console.log("선택값" + selectedIdx);
			
			if(selectedIdx != -1){
				$("#privateExamAddBtn").prop("disabled", false);
			} else{
				$("#privateExamAddBtn").prop("disabled", true);
			}
		});
	});
	
	// 2019.07.23 성재민
	// 체크박스가 체크가 되면 드랍 다운 박스 활성화.
	function takerListCheckBoxOnclick() {
		var check = false;
		$("[name='takerListCheckBox']:checked").each(function(i, checkbox){
			check = true;
			$("#privateExam").prop("disabled", false);
			
			var selectedIdx = $("#privateExam option:selected").val();
			if(selectedIdx != -1){
				$("#privateExamAddBtn").prop("disabled", false);
			}
		});
		
		if(check == false){
			$("#privateExam").prop("disabled", true);
			$("#privateExamAddBtn").prop("disabled", true);
		}
	}
</script>

</head>
<body>
	<h2>응시자 계정관리</h2>
	<script>
		function goList(p) {
			searchFrm.page.value = p;
			searchFrm.submit();
		}
	</script>
	<hr />
	<form name="searchFrm">
		정렬기준 <input type="hidden" name="page" value="1"> 
		<select name="sort">
			<option value="TAKER_ID">응시자ID
			<option value="TAKER_NAME">이름
		</select> 
	<br> 
	검색조건 <my:takerListSelect items="${takerMap }" /> <br> 
	<input type="text" name="searchKeyword" value="${CandidateVO.searchKeyword }">
	<button>검색</button>
	</form>
	<script>
		searchFrm.sort.value = "${CandidateVO.sort}" == "" ? searchFrm.sort.options[0].value
				: "${CandidateVO.sort}";
		searchFrm.searchTaker.value = "${CandidateVO.searchTaker}" == "" ? searchFrm.searchTaker.options[0].value
				: "${CandidateVO.searchTaker}";
	</script>
	<div class="container">
		<br>
	<button type="button" onclick="location.href='managerUserInsert.do'">응시자추가</button>
				<form action="${pageContext.request.contextPath}/excelUpload.do"
					id="formUpload" name="formUpload" method="post"
					enctype="multipart/form-data">
		<input type="file" id="fileInput" name="fileInput" value="파일검색"
						accept=".xlsx"> <br> <br> <input type="button"
						onclick="fileCheck()" value="파일업로드">
	</form>

	<br>
	<br>
	<form action="managerUserDelete.do">
		<button id="">응시자 삭제</button>
		<br>
		<br>
		<table border="1" align="center">
			<tr>
				<th>선택</th>
				<th>응시자ID</th>
				<th>이름</th>
				<th>E-Mail</th>
			</tr>
			<c:forEach items="${result.takerList }" var="CandidateVO">
				<tr>
					<!-- 2019.07.23 성재민 -->
					<!-- 체크박스 이름 변경 -->
					<td><input type="checkbox" name="takerListCheckBox" value="${CandidateVO.takerId }" onclick="takerListCheckBoxOnclick()"></td>
					<td>${CandidateVO.takerId }</td>
					<td><a href="managerUserAccountEdit.do/${CandidateVO.takerId }">${CandidateVO.takerName }</a></td>
					<td>${CandidateVO.takerEmail }</td>
				</tr>
			</c:forEach>
		</table>
	</form>
	<br>
	<select id="privateExam" disabled="disabled">
		<c:forEach items="${privateExamList}" var="privateExam">
			<option value="-1" selected="selected">선택하세요.</option>
			<option value="${privateExam.examId}">${privateExam.companyName} - ${privateExam.examName}</option>
		</c:forEach>
	</select>
	<br><button id="privateExamAddBtn" disabled="disabled">체크한 응시자 선택된 비공개 시험<br> 응시자로 추가하기</button>
	<br>
	<hr />
	<my:paging jsFunc="goList" paging="${result.paging }" />
	</div>
</body>
</html>