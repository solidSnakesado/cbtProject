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
	 <!-- @@@@@@@@@@@@@@@@@@@@@@@ 결제 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

	
	<script>
	//의뢰서
	$(document).ready(function() {
		var tradeProgress = '${myEstimateList.tradeProgress}'; //의뢰진행상태
		$("#Payment").css('display', 'none');		//결제 버튼 숨김
		$("#editButton").css('display', 'none');	//수정 버튼 숨김
		console.log(tradeProgress);
		if(tradeProgress == 'B1' || tradeProgress == 'B2'){ // 의뢰진행상태가  출제전 (B1), 출제중(B2) 일때 수정가능
			$("#editButton").css('display', 'inline');//수정버튼 보여줌
		}
		else if(tradeProgress == 'B4'){ // 의뢰진행상태가 결제대기일때
			$("#Payment").css('display', 'inline');// 결제버튼 보임
		}
		else if(tradeProgress =='B5'){	//결제완료(B5)
			var row = "<tr>	<td>결제날짜</td>	  <td>	<input type='text'  value='${myEstimateList.paymentDate}' readonly> </td></tr>	"
			$("#table").append(row);
		}
		
		//카테고리ID 값을 채운다
		$.ajax({
			type:"GET",
			dataType: "json",
			url:"${pageContext.request.contextPath }/getCateoryNameList.do",
			success : function(data) {
				// db에서 읽어온 값으로  select 채움
				for(var i = 0; i < data.length; ++i){
					var optionMain = $("<option value=" + data[i].categoryId + ">" + data[i].categoryName + "</option>");
					$("#categoryName").append(optionMain);
					// 카테고리 값을 전달받은 값으로 지정하고 체인지 트리거를 발동하여 
					// 카테고리Id 의 셀렉트 옵션 값을 채운다.					
				}
				var categoryId = "${myEstimateList.categoryId}";
				$("#categoryName").val(categoryId).trigger("change");
			}, error : function() {
				alert('에러발생');
			}
		});
		
		
		
		//수정버튼 눌렀을때 처리 로직
		$("#editButton").click(function() {
			
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
	
	// @@@@@@@@@@@@@@@@@@@@@@@ 결제@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
	function payment(estimateId) {
		var IMP = window.IMP; // 생략가능
		IMP.init('imp01620829'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		
		
		IMP.request_pay({
			pg : 'inicis', // version 1.1.0부터 지원.
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : '${myEstimateList.estimateName}',	//상품명
			amount : '${myEstimateList.estimatePrice}',	//가격
			buyer_email : 'dtg3444@naver.com',
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
				alert("결제OK!!!!!!!!!!!!!!!!!!!!!");
				
				$.ajax({
					type:"POST",
					data: {estimateId : estimateId},
					dataType: "json",
					url:"${pageContext.request.contextPath }/companyPaymentUpdate.do",
					success : function(){
						alert('성공');
					}, error : function() {
						alert('에러발생');
					}
				});
				
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
		<table id="table" class="table text-center">
			<tr>	<td>의뢰ID</td>		<td align="center">	<input type="text" name="estimateId" value="${myEstimateList.estimateId}" id="estimateId" readonly></td></tr>
 			<tr>	<td>카테고리ID</td>	<td align="center">	<select name="categoryId" id="categoryName"></select></td></tr>
 			
	 		<tr>	<td>기업ID</td>		<td align="center">	<input type="text" name="companyId" value="${myEstimateList.companyId}" id = "companyId" readonly></td></tr>
	 		<tr>	<td>의뢰이름</td>		<td align="center">	<input type="text" name="estimateName" value="${myEstimateList.estimateName}" id="estimateName"></td></tr>
			<tr>	<td>의뢰일</td>		<td align="center">	<input type="text" name="requestDay" value="${myEstimateList.requestDay}" id ="requestDay" readonly></td></tr>
			<tr>	<td>금액</td>		<td align="center">	<input type="text" name="estimatePrice" value="${myEstimateList.estimatePrice}" id ="estimatePrice" readonly></td></tr>
			<tr>	<td>의뢰진행상태</td>	<td align="center">	<input type="text" value="${myEstimateList.tradeProgressName}" readonly> <!-- 단순히 값을 보여주기위함 -->
												<input type="hidden" name="tradeProgress" value="${myEstimateList.tradeProgress}" id ="tradeProgressName"><!-- 실질적인 tradeProgress가 저장됨--></td></tr>
 			<tr>	<td>응시대상자</td>	<td align="center">	<my:select items="${K}" name="candidate" value="${myEstimateList.candidate}"  ></my:select></td></tr>
			<tr>	<td>응시목적</td>		<td align="center">	<my:select items="${L}" name="applyPurpose" value="${myEstimateList.applyPurpose}"></my:select></td></tr>
			<tr>	<td>응시자 수</td>		<td align="center">	<input type="text" name="applicants" value="${myEstimateList.applicants}" id="applicants">명</td></tr>
			<tr>	<td>시험분류</td>		<td align="center">	<my:select items="${M}" name="examClassfication" value="${myEstimateList.examClassfication}"></my:select></td></tr>
			<tr>	<td>난이도</td>		<td align="center">	<my:select items="${G}" name="levelOfDifficulty" value="${myEstimateList.levelOfDifficulty}"></my:select></td></tr>
			<tr>	<td>시험일시</td>		<td align="center" >	<input type="text" id="datepicker" name="examDate" value="${myEstimateList.examDate}" ></td></tr>
	 		<tr>	<td>비고</td>		<td align="center">	<input type="text" name="remarks" value="${myEstimateList.remarks}" id="remakrs"></td></tr>
			<tr>	<td>시험횟수</td>		<td align="center">	<my:select items="${H}" name="examCount" value="${myEstimateList.examCount}"></my:select></td></tr>  
			<tr>	<td>시험간격</td>		<td align="center">	<my:select items="${N}" name="examInterval" value="${myEstimateList.examInterval}"></my:select></td></tr>
			

		</table>
		<div>
			<button type="button"  id="editButton">수정하기</button>  <button type="button" id="Payment" onclick="payment(${myEstimateList.estimateId})">결제</button> <button type="button" onclick="windowClose()"> 취소 </button>
		</div>
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