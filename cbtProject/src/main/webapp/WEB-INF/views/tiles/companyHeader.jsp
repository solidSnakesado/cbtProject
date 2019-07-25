<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div class="w3-top">
	<div class="w3-bar w3-black w3-card">
	<sec:authorize access="hasRole('ROLE_COMPANY')">
    	<a class="w3-bar-item w3-button w3-padding-large w3-hide-medium w3-hide-large w3-right" href="javascript:void(0)" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
    	<a href="${pageContext.request.contextPath }/companyMain.do" class="w3-bar-item w3-button w3-padding-large">CBT</a>
    	<a href="${pageContext.request.contextPath }/companyIntroduce.do" class="w3-bar-item w3-button w3-padding-large w3-hide-small">회사소개</a>
    	<a href="${pageContext.request.contextPath }/companySystemintro.do" class="w3-bar-item w3-button w3-padding-large w3-hide-small">시스템소개</a>
    	<a href="${pageContext.request.contextPath }/companyConsultingInsert.do" class="w3-bar-item w3-button w3-padding-large w3-hide-small">상담하기</a>
<%-- 		<c:if test="${not empty sessionScope.candidate }">  
   	 		<a href="companyAccount.do" class="w3-bar-item w3-button w3-padding-large w3-hide-small">마이페이지</a>
		</c:if> --%>
		<%-- <c:if test="${not empty sessionScope.company }"> --%>
			<!-- 2019.07.09 성재민-->
			<!-- <div class="w3-dropdown-hover w3-hide-small"> 를  -->
			<!-- <div class="w3-dropdown-hover"> 로 수정하여-->
			<!-- 모바일화면에서도 작아져도 마이페이지는 보이게 설정 -->
	    	<div class="w3-dropdown-hover">
	      		<button class="w3-padding-large w3-button" title="More">마이페이지<i class="fa fa-caret-down"></i></button>     
	     		 <div class="w3-dropdown-content w3-bar-block w3-card-4">
	        		<a href="${pageContext.request.contextPath }/companyAccount.do" class="w3-bar-item w3-button">계정관리</a>
	       	 		<a href="${pageContext.request.contextPath }/companyEstimateList.do" class="w3-bar-item w3-button">의뢰목록</a>
	        		<a href="${pageContext.request.contextPath }/companyConSultingList.do" class="w3-bar-item w3-button">상담목록</a>
	        		<a href="${pageContext.request.contextPath }/companyExamList.do" class="w3-bar-item w3-button">시험목록</a>
	        		<a href="${pageContext.request.contextPath }/companyChart.do" class="w3-bar-item w3-button">통계</a>
	      		</div>
	    	</div>
    	<%-- </c:if> --%>
    	</sec:authorize>
    	<!-- 2019.07.09 성재민 -->
    	<!-- 로그인 여부에 따라 로그인/로그아웃이 표시 -->
    	<sec:authorize access="isAnonymous()"> 
    	<%-- <c:if test="${empty sessionScope.company }">   --%>  
    		<a href="${pageContext.request.contextPath }/companyLogin.do" class="w3-bar-item w3-button w3-padding-large w3-hide-small w3-right">로그인</a>
    		<a href="${pageContext.request.contextPath }/companySignUp.do" class="w3-bar-item w3-button w3-padding-large w3-hide-small w3-right">회원가입</a>
		<%-- </c:if>  --%> 
		</sec:authorize>
		<sec:authorize access="isAuthenticated()">
		<%-- <c:if test="${not empty sessionScope.company }"> --%>    
    		<a href="${pageContext.request.contextPath }/logout" class="w3-padding-large w3-hover-red w3-hide-small w3-right">${company.companyId }로그아웃</a>
		<%-- </c:if> --%>
		</sec:authorize>
    	<a href="javascript:void(0)" class="w3-padding-large w3-hover-red w3-hide-small w3-right"><i class="fa fa-search"></i></a>
  	</div>
</div>

<!-- Navbar on small screens (remove the onclick attribute if you want the navbar to always show on top of the content when clicking on the links) -->
<div id="navDemo" class="w3-bar-block w3-black w3-hide w3-hide-large w3-hide-medium w3-top" style="margin-top:46px">
  <c:if test="${empty sessionScope.company }">
  	<a href="${pageContext.request.contextPath }/companyLogin.do" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">로그인</a>
  	<a href="${pageContext.request.contextPath }/companySignUp.do" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">회원가입</a>
  </c:if>
  <c:if test="${not empty sessionScope.company }">
  	<a href="${pageContext.request.contextPath }/logout" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">로그아웃</a>
  </c:if>
</div>