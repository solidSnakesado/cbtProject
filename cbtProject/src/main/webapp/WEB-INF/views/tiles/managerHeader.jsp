<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="w3-top">
  <div class="w3-bar w3-black w3-card">
    <a class="w3-bar-item w3-button w3-padding-large w3-hide-medium w3-hide-large w3-right" href="javascript:void(0)" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
    <a href="#" class="w3-bar-item w3-button w3-padding-large">CBT</a>
    <a href="#band" class="w3-bar-item w3-button w3-padding-large w3-hide-small">회사소개</a>
    <a href="#tour" class="w3-bar-item w3-button w3-padding-large w3-hide-small">시험일정</a>
    <a href="#contact" class="w3-bar-item w3-button w3-padding-large w3-hide-small">문의하기</a>
<c:if test="${not empty sessionScope.candidate }">  
    <a href="candidateAccount.do" class="w3-bar-item w3-button w3-padding-large w3-hide-small">마이페이지</a>
</c:if>
    <div class="w3-dropdown-hover w3-hide-small">
      <button class="w3-padding-large w3-button" title="More">MORE <i class="fa fa-caret-down"></i></button>     
      <div class="w3-dropdown-content w3-bar-block w3-card-4">
        <a href="#" class="w3-bar-item w3-button">Merchandise</a>
        <a href="#" class="w3-bar-item w3-button">Extras</a>
        <a href="#" class="w3-bar-item w3-button">Media</a>
      </div>
    </div>
<c:if test="${empty sessionScope.manager }">    
    <a href="managerLogin.do" class="w3-bar-item w3-button w3-padding-large w3-hide-small w3-right">로그인</a>
    <a href="insertManager.do" class="w3-bar-item w3-button w3-padding-large w3-hide-small w3-right">회원가입</a>
</c:if>  
<c:if test="${not empty sessionScope.manager }">    
    <a href="managerLogout.do" class="w3-padding-large w3-hover-red w3-hide-small w3-right">${candidate.takerName } 로그아웃</a>
</c:if>
    <a href="javascript:void(0)" class="w3-padding-large w3-hover-red w3-hide-small w3-right"><i class="fa fa-search"></i></a>
  </div>
</div>

<!-- Navbar on small screens (remove the onclick attribute if you want the navbar to always show on top of the content when clicking on the links) -->
<div id="navDemo" class="w3-bar-block w3-black w3-hide w3-hide-large w3-hide-medium w3-top" style="margin-top:46px">
  <a href="#band" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">BAND</a>
  <a href="#tour" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">TOUR</a>
  <a href="#contact" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">CONTACT</a>
  <a href="#" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">MERCH</a>
</div>