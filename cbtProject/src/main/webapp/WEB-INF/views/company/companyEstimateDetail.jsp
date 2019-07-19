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
	 <!-- @@@@@@@@@@@@@@@@@@@@@@@ 결제 start@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

	
	<script>
	//의뢰서
	$(document).ready(function() {
		
		var isInit = false;
		$("#mainCategory option").remove();
		$("#middleCategory option").remove();
		$("#smallCategory option").remove();
		
		var optionBasicMiddle = $("<option value=-1>" + "대분류" + "</option>");
		$("#mainCategory").append(optionBasicMiddle);
		
		// 중/소 분류의 분류명 설정
		var optionBasicMiddle = $("<option value=-1>" + "중분류" + "</option>");
		$("#middleCategory").append(optionBasicMiddle);
		
		var optionBasicSmall = $("<option value=-1>" + "소분류" + "</option>");
		$("#smallCategory").append(optionBasicSmall);
		
		
		// 대분류의 값을 채운다.
		$.ajax({
			type:"POST",
			dataType: "json",
			url:"${pageContext.request.contextPath }/getAllCategoryMainList.do",
			success : function(data) {
				// db에서 읽어온 값으로 대분류 설정
				
				for(var i = 0; i < data.length; ++i){
					var optionMain = $("<option value=" + data[i].categoryMainId + ">" + data[i].categoryMainName + "</option>");
					$("#mainCategory").append(optionMain);
					// 메인 카테고리 값을 전달받은 값으로 지정하고 체인지 트리거를 발동하여 
					// 중분류 의 셀렉트 옵션 값을 채운다.
					
				}
				var mainId = "${myEstimateList.mainCategoryId}";
				$("#mainCategory").val(mainId).trigger("change");
			}, error : function() {
				alert('에러발생');
			}
		});
		
		
		
		// 대분류가 변경이 되면 중, 소분류는 일단 값을 다 지우로 기본값을 채움
		$("#mainCategory").change(function() {
			console.log("33333");
			$("#middleCategory option").remove();
			var optionBasicMiddle = $("<option value=-1>" + "중분류" + "</option>");
			$("#middleCategory").append(optionBasicMiddle);
			
			$("#smallCategory option").remove();
			var optionBasicSmall = $("<option value=-1>" + "소분류" + "</option>");
			$("#smallCategory").append(optionBasicSmall);
			
			// 대분류에서 선택된 값을 가져와서 selectedIdx 에 넣음
			var selectedIdx = $("#mainCategory option:selected").val();
			if(selectedIdx == null){
				selectedIdx = "${myEstimateList.mainCategoryId}"
			}
				
		
			console.log("mainCategory =" + selectedIdx);
			$.ajax({
				type: "POST",
				dataType: "json",
				url:"${pageContext.request.contextPath }/getAllCategoryMiddleList.do/" + selectedIdx,
				success : function(data) {
					// db에서 읽어온 값으로 중분류 설정
					for(var i = 0; i < data.length; ++i){
						var optionMain = $("<option value=" + data[i].categoryMiddleId + ">" + data[i].categoryMiddleName + "</option>");
						$("#middleCategory").append(optionMain);
						
						// 중분류 값을 전달받은 값으로 지정하고 체인지 트리거를 발동하여 
						// 소분류 의 셀렉트 옵션 값을 채운다.
						// 처음에 한번만 시행하도록 isInit 변수값 지정
						
					}
					
					if(isInit == false){
						var middleId = "${myEstimateList.middleCategoryId}";		
						$("#middleCategory").val(middleId).trigger("change");
					} else{
						$("#middleCategory").val(-1).trigger("change");
					}
				}, error : function() {
					alert('에러발생2');
				}
			});
		});
		
		// 중분류가 변경이 되면 소분류 값을 다 지우고 기본값을 채운 후 중분류에 해당하는 소분류의 값을 채움
		$("#middleCategory").change(function() {
			$("#smallCategory option").remove();
			var optionBasicSmall = $("<option value=-1>" + "소분류" + "</option>");
			$("#smallCategory").append(optionBasicSmall);
			// 중분류에서 선택된 값을 가져와서 selectedIdx 에 넣음
			var selectedIdx = $("#middleCategory option:selected").val();
			console.log("middleCategory :" + selectedIdx);
			
			$.ajax({
				type: "POST",
				dataType: "json",
				url:"${pageContext.request.contextPath }/getAllCategorySmallList.do/" + selectedIdx,
				success : function(data) {
					// db에서 읽어온 값으로 소분류 설정
					for(var i = 0; i < data.length; ++i){
						var optionMain = $("<option value=" + data[i].categorySmallId + ">" + data[i].categorySmallName + "</option>");
						$("#smallCategory").append(optionMain);
					}
					// 소분류 값을 전달받은 값으로 지정한다.
					if(isInit == false){
						var samllId = "${myEstimateList.smallCategoryId}";	
						$("#smallCategory").val(samllId).trigger("change");
						
						isInit = true;
					} else{
						$("#smallCategory").val(-1).trigger("change");
					}
				}, error : function() {
					alert('에러발생3');
				}
			});
			
			
			
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
			
			var mainCategoryId = $("#mainCategory option:selected").val(); //대분류 값
			console.log("mainCategoryId체크 :"+mainCategoryId);
			 if(mainCategoryId == -1){
			 	alert("대분류를 입력해 주세요.");
				return false;
			}
			
			 var middleCategoryId = $("#middleCategory option:selected").val();	//중분류 값
			 console.log("middleCategory체크 :"+middleCategoryId);
			 if(middleCategoryId == -1){
					alert("중분류를 입력해 주세요.");
					return false;
				}
			 var smallCategoryId = $("#smallCategory option:selected").val(); //소분류 값
			 console.log("smallCategoryId체크 :"+smallCategoryId);
			
			 if(smallCategoryId == -1){
					alert("소분류를 입력해 주세요.");
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
			 

			
			 //입력한 3개의 id(main, middle, small)들을 가지고 CategoryId 값 가지고 온후 submit
			 $.ajax({
					type: "GET",
					dataType:"json",
					data :{mainCategoryId: mainCategoryId, middleCategoryId : middleCategoryId, smallCategoryId :smallCategoryId},
					url:"${pageContext.request.contextPath}/getCateoryId.do",
					success : function(data) { //data에는 입력한 3개의 id(main, middle, small) => CategoryId 값
						 console.log("data :"+data);
						 $('input[name=categoryId]').val(data); // input태그에 name이 categoryId에 다가 data값을 넣어줌
						 document.form.submit();				// 모든 속성값이 입력이되면 form name을 이용해 companyEstimateUpdate.do 이동 
					}, error : function() {
						alert('에러발생');
					}
				});
		});
		
		
	});
	
	// @@@@@@@@@@@@@@@@@@@@@@@ 결제@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
	function payment() {
		var IMP = window.IMP; // 생략가능
		IMP.init('imp01620829'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		IMP.request_pay({
			pg : 'inicis', // version 1.1.0부터 지원.
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : '${myEstimateList.estimateName}',	//상품명
			amount : '${myEstimateList.estimatePrice}',	//가격
			buyer_email : 'iamport@siot.do',
			buyer_name : '${myEstimateList.companyId}', //구매자이름
			buyer_tel : '010-1234-5678',
			buyer_addr : '서울특별시 강남구 삼성동',
			buyer_postcode : '123-456',
			m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}, function(rsp) {
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num;
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}
			alert(msg);
		});
	}
</script>




</head>  
<body>
<div align="center">
	<h2 align="center">세부 의뢰목록</h2>
	<form action="${pageContext.request.contextPath}/companyEstimateUpdate.do" name ="form" method="POST"> <!-- form name으로 submit처리 -->
		<table>
			<tr>	<td>의뢰ID</td>		<td>	<input type="text" name="estimateId" value="${myEstimateList.estimateId}"
			 id="estimateId"  onKeyup="this.value=this.value.replace(/[^0-9]/g,'')" readonly></td></tr>
 			<tr>	<td>카테고리ID</td>	<td>
 							<input type="hidden" name ="categoryId"> <!-- DB에 값을 넣기위해 categoryId  -->
 							대분류
								<select name="categoryMainId" id="mainCategory"></select>
							중분류
								<select name="categoryMiddleId" id="middleCategory"></select>
							소분류
								<select name="categorySamllId" id="smallCategory"> </select></td></tr>
 			
	 		<tr>	<td>기업ID</td>		<td>	<input type="text" name="companyId" value="${myEstimateList.companyId}" id = "companyId" ></td></tr>
	 		<tr>	<td>의뢰이름</td>		<td>	<input type="text" name="estimateName" value="${myEstimateList.estimateName}" id="estimateName"></td></tr>
			<tr>	<td>의뢰일</td>		<td>	<input type="text" name="requestDay" value="${myEstimateList.requestDay}" id ="requestDay" readonly></td></tr>
			<tr>	<td>금액</td>		<td>	<input type="text" name="estimatePrice" value="${myEstimateList.estimatePrice}" id ="estimatePrice" readonly></td></tr>
			<tr>	<td>의뢰진행상태</td>	<td>	<my:select items="${B}" name="tradeProgress" value="${myEstimateList.tradeProgress}"  ></my:select><!-- <input type="text" name="tradeProgress" value="" id ="estimatePrice" readonly> --></td></tr>
 			<tr>	<td>응시대상자</td>	<td>	<my:select items="${K}" name="candidate" value="${myEstimateList.candidate}"  ></my:select></td></tr>
			<tr>	<td>응시목적</td>		<td>	<my:select items="${L}" name="applyPurpose" value="${myEstimateList.applyPurpose}"></my:select></td></tr>
			<tr>	<td>응시자 수</td>		<td>	<input type="text" name="applicants" value="${myEstimateList.applicants}" id="applicants">명</td></tr>
			<tr>	<td>시험분류</td>		<td>	<my:select items="${M}" name="examClassfication" value="${myEstimateList.examClassfication}"></my:select></td></tr>
			<tr>	<td>난이도</td>		<td>	<my:select items="${G}" name="levelOfDifficulty" value="${myEstimateList.levelOfDifficulty}"></my:select></td></tr>
			<tr>	<td>시험일시</td>		<td>	<input type="text" id="datepicker" name="examDate" value="${myEstimateList.examDate}" ></td></tr>
	 		<tr>	<td>비고</td>		<td>	<input type="text" name="remarks" value="${myEstimateList.remarks}" id="remakrs"></td></tr>
			<tr>	<td>시험횟수</td>		<td>	<my:select items="${H}" name="examCount" value="${myEstimateList.examCount}"></my:select></td></tr>  
			<tr>	<td>시험간격</td>		<td>	<my:select items="${N}" name="examInterval" value="${myEstimateList.examInterval}"></my:select></td></tr>
			

		</table>
		<button type="button"  id="submitBtn">수정하기</button> <button type="button" onclick="windowClose()"> 취소 </button> <button type="button" onclick="payment()">결제</button>
	</form>
	
</div>


	<!-- 시험일시 날짜 api -->
	<script>
	$("#datepicker").datepicker({dateFormat : "yy-mm-dd"});	  	

	
	function windowClose(){
		window.opener.top.location.reload();
		window.close();
	}
	
	</script>
</body>
</html>