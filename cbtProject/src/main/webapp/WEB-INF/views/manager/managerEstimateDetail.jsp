<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	
	
	<script>
	//의뢰서
	$(document).ready(function() {
		
		//카테고리ID 값을 채운다
		$.ajax({
			type:"GET",
			dataType: "json",
			url:"${pageContext.request.contextPath }/getCateoryNameList.do",
			success : function(data) {
				// db에서 읽어온 값으로 대분류 설정
				for(var i = 0; i < data.length; ++i){
					console.log("33");
					var optionMain = $("<option value=" + data[i].categoryId + ">" + data[i].categoryName + "</option>");
					$("#categoryName").append(optionMain);
					// 메인 카테고리 값을 전달받은 값으로 지정하고 체인지 트리거를 발동하여 
					// 중분류 의 셀렉트 옵션 값을 채운다.					
				}
				var mainId = "${myEstimateList.categoryId}";
				$("#categoryName").val(mainId).trigger("change");
			}, error : function() {
				alert('에러발생');
			}
		});
		
		
		
		
		
		
		
		
		
		//수정버튼 눌렀을때 처리 로직
		$("#submitBtn").click(function() {
			
			///////////////////////예외처리부분////////////////////
			var form = document.form;
			
			var estimateId = $("#estimateId").val(); //estimateId의 값
			if(estimateId.length == 0){	//  estimateId 예외처리부분
				alert("Id를 입력하세요");
				form.estimateId.focus(); 
				return false;
			}
			
			var estimateName = $("#estimateName").val(); //estimateName의 값
			if(estimateName.length == 0){	//  estimateName 예외처리부분
				alert("의뢰이름을 입력하세요");
				form.estimateName.focus(); 
				return false;
			}
			
			 
			 var companyId = $("#companyId").val(); //companyId의 값
			 if(companyId.length == 0){	//  companyId 예외처리부분
					alert("기업Id를 입력하세요");
					form.companyId.focus(); 
					return false;
				}
			
			 var requestDay = $("#requestDay").val(); //requestDay의 값
			 if(requestDay.length == 0){	//  requestDay 예외처리부분
					alert("의뢰일를 입력하세요");
					form.requestDay.focus(); 
					return false;
				}
			 
			 var estimatePrice = $("#estimatePrice").val(); //estimatePrice의 값
			 if(estimatePrice.length == 0){	//  estimatePrice 예외처리부분
					alert("금액를 입력하세요");
					form.estimatePrice.focus(); 
					return false;
				}
			 
			 var applicants = $("#applicants").val(); //applicants의 값
			 if(applicants.length == 0){	//  applicants 예외처리부분
					alert("응시자수를 입력하세요");
					form.applicants.focus(); 
					return false;
				}
		
			
			
			 var remakrs = $("#remakrs").val(); //remakrs의 값
			 if(remakrs.length == 0){	//  remakrs 예외처리부분
					alert("비고를 입력하세요");
					form.remakrs.focus(); 
					return false;
				}
			 
			///////////////////////예외처리부분////////////////////
			 

			document.form.submit();				// 모든 속성값이 입력이되면 form name을 이용해 companyEstimateUpdate.do 이동 
		
		});
		
		
	});
	
	
	
	</script>
</head>  
<body>
	<h2 align="center">세부 의뢰목록</h2>
	<form action="${pageContext.request.contextPath}/companyEstimateUpdate.do" name ="form" method="POST"> <!-- form name으로 submit처리 -->
		<table>
			<tr>	<td>의뢰ID</td>		<td>	<input type="text" name="estimateId" value="${myEstimateList.estimateId}"
			 id="estimateId"  onKeyup="this.value=this.value.replace(/[^0-9]/g,'')" readonly></td></tr>
 			<tr>	<td>카테고리ID</td>	<td>	<select name="categoryId" id="categoryName"></select></td></tr>
	 		<tr>	<td>기업ID</td>		<td>	<input type="text" name="companyId" value="${myEstimateList.companyId}" id = "companyId" ></td></tr>
	 		<tr>	<td>의뢰이름</td>		<td>	<input type="text" name="estimateName" value="${myEstimateList.estimateName}" id="estimateName"></td></tr>
			<tr>	<td>의뢰일</td>		<td>	<input type="text" name="requestDay" value="${myEstimateList.requestDay}" id ="requestDay" readonly></td></tr>
			<tr>	<td>금액</td>		<td>	<input type="text" name="estimatePrice" value="${myEstimateList.estimatePrice}" id ="estimatePrice" onKeyup="this.value=this.value.replace(/[^0-9]/g,'')"></td></tr>
			<tr>	<td>의뢰진행상태</td>	<td>	<my:select items="${B}" name="tradeProgress" value="${myEstimateList.tradeProgress}" ></my:select></td></tr>
 			<tr>	<td>응시대상자</td>	<td>	<my:select items="${K}" name="candidate" value="${myEstimateList.candidate}"  ></my:select></td></tr>
			<tr>	<td>응시목적</td>		<td>	<my:select items="${L}" name="applyPurpose" value="${myEstimateList.applyPurpose}"></my:select></td></tr>
			<tr>	<td>응시자 수</td>		<td>	<input type="text" name="applicants" value="${myEstimateList.applicants}" id="applicants" onKeyup="this.value=this.value.replace(/[^0-9]/g,'')">명</td></tr>
			<tr>	<td>시험분류</td>		<td>	<my:select items="${M}" name="examClassfication" value="${myEstimateList.examClassfication}"></my:select></td></tr>
			<tr>	<td>난이도</td>		<td>	<my:select items="${G}" name="levelOfDifficulty" value="${myEstimateList.levelOfDifficulty}"></my:select></td></tr>
			<tr>	<td>시험일시</td>		<td>	<input type="text" id="datepicker" name="examDate" value="${myEstimateList.examDate}" ></td></tr>
	 		<tr>	<td>비고</td>		<td>	<input type="text" name="remarks" value="${myEstimateList.remarks}" id="remakrs"></td></tr>
			<tr>	<td>시험횟수</td>		<td>	<my:select items="${H}" name="examCount" value="${myEstimateList.examCount}"></my:select></td></tr>  
			<tr>	<td>시험간격</td>		<td>	<my:select items="${N}" name="examInterval" value="${myEstimateList.examInterval}"></my:select></td></tr>
			
			
			
			
		</table>
		<button type="button"  id="submitBtn">수정하기</button> <button type="button" onclick="windowClose()"> 취소 </button> 
	</form>
	
	<script>
			$("#datepicker").datepicker({dateFormat : "yy-mm-dd"});	  	
		
			
			function windowClose(){
				window.opener.top.location.reload();
				window.close();
			}
	</script>
</body>
</html>