<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/datetimepicker-master/jquery.datetimepicker.css">
<script src="${pageContext.request.contextPath}/js/datetimepicker-master/build/jquery.datetimepicker.full.min.js"></script>

<title>managerExamInsert.jsp</title>
</head>
<body>
<script>
$(document).ready(function() {
	var examName = "${estimate.estimateName }";
	
	$("#examName").attr("value",examName);
	
})

   jQuery.datetimepicker.setLocale('kr'); // 한국어
   
   
   jQuery(function(){
      
      /* jQuery('#startTime').datetimepicker({
          format:'Y.m.d H:i',
          allowTimes:[
           '9:00', '9:30', '10:00', '10:30', '11:00', '11:30', '12:00',
            '12:30', '13:00', '13:30', '14:00', '14:30', '15:00', '15:30', '16:00',
           '16:30', '17:00', '17:30', '18:00', '18:30', '19:00', '19:30', '19:30',
           '20:00', '20:30', '21:00'
          ]
          ,
       timepicker:false
      }); */
      
      
      jQuery(function(){
          jQuery('#date_timepicker_start').datetimepicker({
           format:'Y/m/d H:i',
           allowTimes:[
              '9:00', '9:30', '10:00', '10:30', '11:00', '11:30', '12:00',
               '12:30', '13:00', '13:30', '14:00', '14:30', '15:00', '15:30', '16:00',
              '16:30', '17:00', '17:30', '18:00', '18:30', '19:00', '19:30', '19:30',
              '20:00', '20:30', '21:00'
             ],
           onShow:function( ct ){
            this.setOptions({
             maxDate:jQuery('#date_timepicker_end').val()?jQuery('#date_timepicker_end').val():false
            })
           },
           timepicker:true
          });
          jQuery('#date_timepicker_end').datetimepicker({
           format:'Y/m/d H:i',
           allowTimes:[
              '9:00', '9:30', '10:00', '10:30', '11:00', '11:30', '12:00',
               '12:30', '13:00', '13:30', '14:00', '14:30', '15:00', '15:30', '16:00',
              '16:30', '17:00', '17:30', '18:00', '18:30', '19:00', '19:30', '19:30',
              '20:00', '20:30', '21:00'
             ],
           onShow:function( ct ){
            this.setOptions({
             minDate:jQuery('#date_timepicker_start').val()?jQuery('#date_timepicker_start').val():false
            })
           },
           timepicker:true
          });
         });
      
      
      });
   	   var estimateId = "${estimate.estimateId }";
	   $("#submit").click(function(){ 
			$.ajax({
				url:"${pageContext.request.contextPath}/updatesTradeProgressExchange2.do", //시험을등록하면   출제전-> 출제중으로 상태변경
				data: { estimateId:  estimateId},
				success : function() {
					alert('등록했습니다.');
					//location.reload();
				}, error : function() {
					alert('에러발생');
				}
			});
			document.form.submit();
		});
</script>

	<div align="center">
		<h2>관리자 시험 등록 페이지</h2>
		<hr />
	</div>

	<div class="container">
  <div class="row">
    <div class="col-sm">
    	<h1>의뢰 내용</h1>
      	<table style="padding: 5px 0 5px 0;" align = "center">
			<tr>
				<th>기업Id</th>
				<td><input  value="${estimate.companyId }" readonly></td>
			</tr>
			<tr>
				<th>시험이름</th>
				<td><input value="${estimate.estimateName }" readonly></td>
			</tr>
			<tr>
				<th>시험일시</th>
				<td><input value="${estimate.examDate }" readonly></td>
			</tr>
			<tr>
				<th>카테고리 이름</th>
				<td><input value="${estimate.categoryName }" readonly></td>
			</tr>
			<tr>
				<th>응시자 수</th>
				<td><input type="text" value="${estimate.applicants }" readonly></td>
			</tr>
			<tr>
				<th>응시 대상자</th>
				<td><input type="text" value="${estimate.candidateName }" readonly></td>
			</tr>
			<tr>
				<th>응시 목적</th>
				<td><input type="text" value="${estimate.applyPurposeName }" readonly></td>
			</tr>
			
		</table>
    </div>
    <div class="col-sm">
    	<h1>시험 등록</h1>
      	<form action="${pageContext.request.contextPath }/managerExamInsert.do/${estimate.estimateId}" method="post" >
		<table style="padding: 5px 0 5px 0;" align = "center">
			
			<tr>
				<td hidden="true"><input  id="examName" name="examName" hidden="true"></td>
			</tr>
			<tr>
				<th>기업Id</th>
				<td><input id="companyId" name="companyId" value="${estimate.companyId }" readonly></td>
			</tr>
			<tr>
				<th>시험이름</th>
				<td><input id="estimateName" name="estimateName" value="${estimate.estimateName }" readonly></td>
			</tr>
			<tr>
				<th width="150px">시작일</th>
				<td><input type="text" id="date_timepicker_start" name="examStartTime"></td>
			</tr>
			<tr>
				<th>종료일</th>
				<td><input type="text" id="date_timepicker_end" name="examEndTime"></td>
			</tr>
			<tr>
				<!-- 의뢰ID -->
				<td><input type="hidden" id="estimateId" name="estimateId" value="${estimate.estimateId }" readonly></td>
			</tr>
			
			<tr>
				<th>응시자 수</th>
				<td><input type="text" name="applicants" id="applicants" value="${estimate.applicants }"></td>
			</tr>
			
			
			<%-- <tr>
				<th>시험상태</th><td>
				<my:select items="${D}" name="examStatus" value="${result.examStatus }"></my:select></td>
			</tr>
			<tr>
				<th>출제상태</th><td>
				<my:select items="${I}" name="setExamStatus" value="${result.setExamStatus }"></my:select></td>
			</tr> --%>
			<tr>
				<th width="150px">문항수</th>
				<td><input type="text" name="questionQuantity"></td>
			</tr>
			<tr>
				<th>합격 점수</th>
				<td><input type="text" name="passingScore"></td>
			</tr>
			<tr>
				<th>공개여부</th><td>
				<my:select items="${O}" name="disclosureStatus" value="${result.disclosureStatus }"></my:select></td>
			</tr>
			<tr>
				<th>시험설명(간략)</th>
				<td><textarea name="examDescriptionSimple" cols="50" rows="5"></textarea></td>
			</tr>
			<tr>
				<th>시험설명(상세)</th>
				<td><textarea name="examDescriptionDetail" cols="50" rows="5"></textarea></td>
			</tr>
		</table>
		<hr />
		<br><br>
		<input type="submit" value="시험등록">
		<input type="reset" id="reset" onclick="location.href='${pageContext.request.contextPath }/managerEstimateList.do'" value="돌아가기">	
	</form>
    </div>
  </div>
</div>
		
</body>
</html>


