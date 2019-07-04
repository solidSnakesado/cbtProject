<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {
		// 페이지가 시작 하면 값들을 초기화 한다.
		$("#mainCategory option").remove();
		$("#middleCategory option").remove();
		$("#smallCategory option").remove();
		
		// 대분류의 값을 채운다.
		$.ajax({
			type:"POST",
			dataType: "json",
			url:"${pageContext.request.contextPath }/getCategoryMain.do",
			success : function(data) {
				// 선택박스 분류 초기값 설정
				var optionBasicMiddle = $("<option value=-1>" + "대분류" + "</option>");
				$("#mainCategory").append(optionBasicMiddle);
				
				// db에서 읽어온 값으로 대분류 설정
				for(var i = 0; i < data.length; ++i){
					var optionMain = $("<option value=" + data[i].categoryMainId + ">" + data[i].categoryMainName + "</option>");
					$("#mainCategory").append(optionMain);
				}
			}, error : function() {
				alert('에러발생');
			}
		});
		
		// 2019.07.04 성재민
		// 대분류가 변경이 되면 중, 소분류는 일단 값을 다 지우로 기본값을 채움
		$("#mainCategory").change(function() {
			$("#middleCategory option").remove();
			var optionBasicMiddle = $("<option value=-1>" + "중분류" + "</option>");
			$("#middleCategory").append(optionBasicMiddle);
			
			$("#smallCategory option").remove();
			var optionBasicSmall = $("<option value=-1>" + "소분류" + "</option>");
			$("#smallCategory").append(optionBasicSmall);
			
			// 대분류에서 선택된 값을 가져와서 selectedIdx 에 넣음
			var selectedIdx = $("#mainCategory option:selected").val();
			console.log(selectedIdx);
			
			.ajax({
				type: "POST",
				dataType: "json",
				url:"${pageContext.request.contextPath }/getCategoryMiddle.do",
				success : function(data) {
					// 선택박스 분류 초기값 설정
					var optionBasicMiddle = $("<option value=-1>" + "대분류" + "</option>");
					$("#mainCategory").append(optionBasicMiddle);
					
					// db에서 읽어온 값으로 대분류 설정
					for(var i = 0; i < data.length; ++i){
						var optionMain = $("<option value=" + data[i].categoryMainId + ">" + data[i].categoryMainName + "</option>");
						$("#mainCategory").append(optionMain);
					}
				}, error : function() {
					alert('에러발생');
				}
			});
			
			/* // selectedIdx == 0(경영) 이라면 대분류에 포함되는 중분류의 값을 채워줌
			if(selectedIdx == 0){	// selectedIdx == 0 이면 경영이 선택된 상황
				var arr = ['기획', '사무', '인사'];
				for(var i = 0; i < arr.length; ++i){
					var optionMiddle = $("<option value=" + i + ">" + arr[i] + "</option>");
					$("#middleCategory").append(optionMiddle);
				}
			} */
		});
		
		// 중분류가 변경이 되면 소분류 값을 다 지우고 기본값을 채운 후 중분류에 해당하는 소분류의 값을 채움
		$("#middleCategory").change(function() {
			$("#smallCategory option").remove();
			var optionBasicSmall = $("<option value=-1>" + "소분류" + "</option>");
			$("#smallCategory").append(optionBasicSmall);
			
			// 중분류에서 선택된 값을 가져와서 selectedIdx 에 넣음
			var selectedIdx = $("#middleCategory option:selected").val();
			var arrLarge = [
					['기획조사', '경영기획', '서비스기획'],	// selectedIdx == 0
					['사무관리', '사무행정', '비품관리'],	// selectedIdx == 1
					['급여관리', '인사기획', '인재개발'],	// selectedIdx == 2
				];
			
			for(var i = 0; i < arrLarge.length; ++i){
				// 현재 선택된 값의 인덱스 값과 같은 값의 소분류 목록을 가져와서 채움
				if(i == selectedIdx){
					var arr = arrLarge[i];
					for(var j = 0; j < arr.length; ++j){
						var optionSmall = $("<option value=" + j + ">" + arr[j] + "</option>");
						$("#smallCategory").append(optionSmall);
					}
					break;
				}
			}
		});
	});
</script>
</head>
<body>
	대분류
	<select name="mainCategory" id="mainCategory">
		<option value=-1 selected="selected">대분류</option>
		<option value=0>경영</option>
		<option value=1>마케팅</option>
		<option value=2>IT</option>
	</select>
	<!-- 임시값 -->
	<!-- 대분류가 경영이면 중분류는 기획, 사무, 인사 -->
	<!-- 대분류가 마케팅이면 중분류는 광고분석, 홍보, 전시/컨벤션 -->
	<!-- 대분류가 IT이면 중분류는 웹프로그래밍, 데이터베이스, 네트워크 -->
	중분류
	<select name="middleCategory" id="middleCategory">
		<option value=-1 selected="selected">중분류</option>
	</select>
	<!-- 임시값 -->
	<!-- 중분류가 기획이면 중분류는 기획조사, 경영기획, 서비스기획 -->
	<!-- 중분류가 사무이면 중분류는 사무관리, 사무행정, 비품관리 -->
	<!-- 중분류가 인사이면 중분류는 급여관리, 인사기획, 인재개발 -->
	소분류
	<select name="smallCategory" id="smallCategory">
		<option value=-1 selected="selected">소분류</option>
	</select>
</body>
</html>