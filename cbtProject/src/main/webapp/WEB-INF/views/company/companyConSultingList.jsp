<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
>
<script type="text/javascript">
	$(document).ready(function() {
		// 2019.07.10 성재민
		// 날짜가 2019-07-03T14:50 으로 표시되는데
		// 중간에 표시되는 T 를 공백문자 하나로 변환하여 다시 지정
		var arrTD = $("td[id^='consultingDesiredDate_']");
		for(var i = 0; i < arrTD.length; ++i){
			$(arrTD[i]).text($(arrTD[i]).text().replace("T", " "))
		}
	});
	
	function goList(p){
		searchFrm.page.value = p;
		searchFrm.submit();
	}
</script>

	<h4 class="mx-auto pb-2">상담목록확인(기업)</h4>

	<form name="searchFrm">
		<input type = "hidden" name="page" value="1">
	</form>
	<table border="1" align="center">
		<tr>
			<th>제목</th>
			<th>상담희망일</th>
		</tr>
		<c:forEach items="${result.consultingList}" var="consulting">
			<tr onclick="location.href='companyConSultingDetail.do/${consulting.consultingId}'">
				<td>${consulting.consultingTitle}</td>
				<!-- 2019.07.10 성재민 -->
				<!-- 상담 신청일이 저장되는 td 를 식별하기 위새 id 추가(식별값으로 consultingId 사용) -->
				<td id="consultingDesiredDate_${consulting.consultingId}">${consulting.consultingDesiredDate}</td>
			</tr>
		</c:forEach>
	</table>
	<div align="center"><my:paging jsFunc="goList" paging="${result.paging }"/></div>
	
	<br>
	<button onclick="location.href='companyMain.do'" class="btn btn-primary m-3 p-3" >돌아가기</button>
