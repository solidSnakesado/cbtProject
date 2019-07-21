<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<div class="w3-top">
<script type="text/javascript">
	// 2019.07.22 성재민
	// 3초마다  poll() 실행
	// 답변이 되지 않은 문의의 갯수를 받아온다.
	(function poll() {
	    $.ajax({
	        url: 'getBeforeReplyCount.do',
	        type: 'post',
	        success: function(data) {
	            console.log('success' + data);
	            $("#inquiry").text(data);
	        },
	        timeout: 3000,	
	        complete: setTimeout(function() { poll(); }, 3000)	// 3초 대기 후 poll()함수 실행
	    })
	})();
</script>


	<div class="w3-bar w3-black w3-card">
    	<%-- <a class="w3-bar-item w3-button w3-padding-large w3-hide-medium w3-hide-large w3-right" href="javascript:void(0)" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
    	<a href="#" class="w3-bar-item w3-button w3-padding-large">CBT</a>
    	<a href="#band" class="w3-bar-item w3-button w3-padding-large w3-hide-small">회사소개</a>
    	<a href="#tour" class="w3-bar-item w3-button w3-padding-large w3-hide-small">시험일정</a>
    	<a href="#contact" class="w3-bar-item w3-button w3-padding-large w3-hide-small">문의하기</a>
		<c:if test="${not empty sessionScope.candidate }">  
		    <a href="candidateAccount.do" class="w3-bar-item w3-button w3-padding-large w3-hide-small">마이페이지</a>
		</c:if> --%>
		<c:if test="${not empty sessionScope.manager }">
		<!-- <div class="w3-dropdown-hover">
		      	<button class="w3-padding-large w3-button" title="More">마이페이지 <i class="fa fa-caret-down"></i></button>     
		      	<div class="w3-dropdown-content w3-bar-block w3-card-4"> -->
		      		<a href="${pageContext.request.contextPath }/managerMain.do" class="w3-bar-item w3-button">메인</a>
		        	<a href="${pageContext.request.contextPath }/managerAccountControl.do" class="w3-bar-item w3-button">회원관리</a>
		        	<a href="${pageContext.request.contextPath }/managerConsultingList.do" class="w3-bar-item w3-button">상담목록</a>
		        	<!-- 2019.07.19 성재민 -->
		        	<!-- 응시자의 문의를 확인 할수 있는 메뉴 추가 -->
		        	<!-- 응시자가 문의를 요청하면 해당 문의가 db 에 저장이 되고  -->
		        	<!-- 저장된 문의의 상태가 처리전 이라면 해당 상태의 문의 갯수를 읽어봐서  -->
		        	<!-- 문의목록 글자 옆에 표시 하는 기능이 추가 되어야 함 -->
		        	<!-- 2019.07.20 성재민 -->
		        	<!-- 문의하기 버튼 클릭 시 기능 추가 -->
		        	<c:if test="${not empty sessionScope.beforeReplyCount }">
		        		<a href="${pageContext.request.contextPath }/managerInquiryList.do" class="w3-bar-item w3-button">문의목록<span class="badge badge-danger" id="inquiry">${beforeReplyCount}</span></a>
		        	</c:if>
		        	<c:if test="${empty sessionScope.beforeReplyCount }">
		        		<a href="${pageContext.request.contextPath }/managerInquiryList.do" class="w3-bar-item w3-button">문의목록<span class="badge badge-danger" id="inquiry"></span></a>
		        	</c:if>
		        	<a href="${pageContext.request.contextPath }/managerEstimateList.do" class="w3-bar-item w3-button">의뢰목록</a>
		        	<a href="${pageContext.request.contextPath }/managerExamList.do" class="w3-bar-item w3-button">시험목록</a>
		        	<a href="${pageContext.request.contextPath }/managerChart.do" class="w3-bar-item w3-button">통계</a>
		      	<!-- </div>
		    </div> -->
	    </c:if>  
		<c:if test="${empty sessionScope.manager }">    
		    <a href="${pageContext.request.contextPath }/managerLogin.do" class="w3-bar-item w3-button w3-padding-large w3-hide-small w3-right">로그인</a>
		</c:if>  
		<c:if test="${not empty sessionScope.manager }">    
		    <a href="${pageContext.request.contextPath }/managerLogout.do" class="w3-padding-large w3-hover-red w3-hide-small w3-right">${manager.managerId} 로그아웃</a>
		    <a href="${pageContext.request.contextPath }/insertManager.do" class="w3-bar-item w3-button w3-padding-large w3-hide-small w3-right">매니저등록</a>
		</c:if>
    	<a href="javascript:void(0)" class="w3-padding-large w3-hover-red w3-hide-small w3-right"><i class="fa fa-search"></i></a>
  	</div>
</div>

<!-- Navbar on small screens (remove the onclick attribute if you want the navbar to always show on top of the content when clicking on the links) -->
<div id="navDemo" class="w3-bar-block w3-black w3-hide w3-hide-large w3-hide-medium w3-top" style="margin-top:46px">
	<c:if test="${empty sessionScope.manager }">   
		<a href="managerLogin.do" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">로그인</a>
	</c:if>
	<c:if test="${not empty sessionScope.manager }"> 
  		<a href="managerLogout.do" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">로그아웃</a>
  		<a href="insertManager.do" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">매니저등록</a>
  	</c:if>
</div>