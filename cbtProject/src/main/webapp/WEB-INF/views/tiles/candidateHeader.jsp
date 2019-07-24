<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div class="w3-top">
  <div class="w3-bar w3-black w3-card">
    <a class="w3-bar-item w3-button w3-padding-large w3-hide-medium w3-hide-large w3-right" href="javascript:void(0)" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
    <!-- 2019.07.09 성재민 -->
    <!-- cbt 클릭시 메인화면으로 -->
    <a href="${pageContext.request.contextPath }/candidateMain.do" class="w3-bar-item w3-button w3-padding-large">CBT</a>
    <a href="${pageContext.request.contextPath }/candidateInIntroduce.do" class="w3-bar-item w3-button w3-padding-large w3-hide-small">회사소개</a>
    <!-- 2019.07.09 성재민 -->
    <!-- 시험일정 메뉴 연결 -->
     <a href="${pageContext.request.contextPath }/candidateScheduleCheck.do" class="w3-bar-item w3-button w3-padding-large w3-hide-small">시험일정</a>
<%-- 
	<c:if test="${not empty sessionScope.candidate }"> 
	     <a href="${pageContext.request.contextPath }/candidateScheduleCheck.do/${candidate.takerId}" class="w3-bar-item w3-button w3-padding-large w3-hide-small">시험일정</a> 
	</c:if>
	<c:if test="${empty sessionScope.candidate }"> 
	    <a href="${pageContext.request.contextPath }/candidateLogin.do" class="w3-bar-item w3-button w3-padding-large w3-hide-small">시험일정</a>
	</c:if> 
--%>
	<!-- 2019.07.18 성재민 -->
	<!-- 문의하기 버튼 클릭시 채팅 창으로 연결 -->
	<script type="text/javascript">
		function connectChat() {
			var wintype = "toolbar=no,width=800px,height=900px,top=50,left=420,directories=no,menubar=no,scrollbars=yes";// 윈도우창 띄움
			var winopen = window.open("${pageContext.request.contextPath }/chat.do","windowopen",wintype);
		}
	</script>
    <a href="#" onclick="connectChat()" class="w3-bar-item w3-button w3-padding-large w3-hide-small">문의하기</a>
    
<!-- 2019.07.09 성재민 -->
<!-- 마이페이지 수정 -->
<%-- <c:if test="${not empty sessionScope.candidate }">  
    <a href="candidateAccount.do" class="w3-bar-item w3-button w3-padding-large w3-hide-small">마이페이지</a>
</c:if> --%>
<%-- 	<c:if test="${not empty sessionScope.candidate }"> --%>
<sec:authorize access="isAuthenticated()"> 
		<!-- 2019.07.09 성재민-->
		<!-- <div class="w3-dropdown-hover w3-hide-small"> 를  -->
		<!-- <div class="w3-dropdown-hover"> 로 수정하여-->
		<!-- 모바일화면에서도 작아져도 마이페이지는 보이게 설정 -->
	    <div class="w3-dropdown-hover">
	      <button class="w3-padding-large w3-button" title="MyPage">마이페이지<i class="fa fa-caret-down"></i></button>     
	      <div class="w3-dropdown-content w3-bar-block w3-card-4">
	        <a href="${pageContext.request.contextPath }/candidateAccount.do" class="w3-bar-item w3-button">계정관리</a>
	        <a href="${pageContext.request.contextPath }/candidateExaminationList.do" class="w3-bar-item w3-button">응시목록</a>
	      </div>
	    </div>
</sec:authorize>
<%-- <c:if test="${empty sessionScope.candidate }">    --%>
<sec:authorize access="isAnonymous()"> 
    <a href="${pageContext.request.contextPath }/candidateLogin.do" class="w3-bar-item w3-button w3-padding-large w3-hide-small w3-right">로그인</a>
    <a href="${pageContext.request.contextPath }/insertCandidate.do" class="w3-bar-item w3-button w3-padding-large w3-hide-small w3-right">회원가입</a>
</sec:authorize> 

<sec:authorize access="hasRole('ROLE_MANAGER')">
<a href="${pageContext.request.contextPath }/managerMain.do" class="w3-bar-item w3-button w3-padding-large w3-hide-small w3-right">메니저</a>
</sec:authorize>

<sec:authorize access="hasRole('ROLE_COMPANY')">
<a href="${pageContext.request.contextPath }/companyMain.do" class="w3-bar-item w3-button w3-padding-large w3-hide-small w3-right">COMPANY</a>
</sec:authorize>

<%-- <c:if test="${not empty sessionScope.candidate }">   --%>
<sec:authorize access="isAuthenticated()">  
	<sec:authentication property="principal.username" var="user_id" />${user_id}  
    <a href="${pageContext.request.contextPath }/logout" class="w3-padding-large w3-hover-red w3-hide-small w3-right">${candidate.takerName } 로그아웃</a>
</sec:authorize> 
    <a href="javascript:void(0)" class="w3-padding-large w3-hover-red w3-hide-small w3-right"><i class="fa fa-search"></i></a>
  </div>
</div>

<!-- Navbar on small screens (remove the onclick attribute if you want the navbar to always show on top of the content when clicking on the links) -->
<div id="navDemo" class="w3-bar-block w3-black w3-hide w3-hide-large w3-hide-medium w3-top" style="margin-top:46px">
	<c:if test="${empty sessionScope.candidate }">
		<a href="${pageContext.request.contextPath }/candidateLogin.do" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">로그인</a>
  		<a href="${pageContext.request.contextPath }/insertCandidate.do" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">회원가입</a>
  	</c:if>
	<c:if test="${not empty sessionScope.candidate }">
  		<a href="${pageContext.request.contextPath }/logout" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">로그아웃</a>
  	</c:if>
</div>