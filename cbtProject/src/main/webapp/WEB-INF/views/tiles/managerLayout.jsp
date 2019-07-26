<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<title>CBT ! 최고의 선택 ! 최고의 인재를 선발해드립니다!</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="${pageContext.request.contextPath }/BootstrapAdminTheme/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="${pageContext.request.contextPath }/BootstrapAdminTheme/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
        <link href="${pageContext.request.contextPath }/BootstrapAdminTheme/vendors/easypiechart/jquery.easy-pie-chart.css" rel="stylesheet" media="screen">
        <link href="${pageContext.request.contextPath }/BootstrapAdminTheme/assets/styles.css" rel="stylesheet" media="screen">
</head>
<body>
<sec:authorize access="isAuthenticated()">  
	<sec:authentication property="principal.username" var="user_id" />
</sec:authorize> 
        <div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                    </a>
                    <a class="brand" href="${pageContext.request.contextPath }/managerMain.do">CBT Admin</a>
                    <div class="nav-collapse collapse">
                        <ul class="nav pull-right">
                        <sec:authorize access="isAuthenticated()">  
                             <li class="dropdown">
                                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-user"></i> ${user_id} <i class="caret"></i>
                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a tabindex="-1" href="insertManager.do">매니저 등록</a>
                                    </li>
                                    <li>
                                    	<a href="managerGetManagerList.do">매니저 목록</a>
                                    </li>
                                    <li>
                                    	<a href="categoryMain.do">카테고리 설정</a>
                                    </li>
                                    <li class="divider"></li>
                                    <li>
                                        <a tabindex="-1" href="logout">Logout</a>
                                    </li>
                                </ul>
                            </li>
                            </sec:authorize>
                        </ul>
                        <ul class="nav">
                            <li class="active">
                                <a href="#">Dashboard</a>
                            </li>
                            <li>
		        	<a href="${pageContext.request.contextPath }/managerAccountControl.do" class="w3-bar-item w3-button">회원관리</a>
		        	</li>
		        	<li>
		        	<a href="${pageContext.request.contextPath }/managerConsultingList.do" class="w3-bar-item w3-button">상담목록</a>
                            </li>
                            <c:if test="${not empty sessionScope.beforeReplyCount }">
		        		<li><a href="${pageContext.request.contextPath }/managerInquiryList.do" class="w3-bar-item w3-button">문의목록<span class="badge badge-danger" id="inquiry">${beforeReplyCount}</span></a></li>
		        	</c:if>
		        	<c:if test="${empty sessionScope.beforeReplyCount }">
		        		<a href="${pageContext.request.contextPath }/managerInquiryList.do" class="w3-bar-item w3-button">문의목록<span class="badge badge-danger" id="inquiry"></span></a>
		        	</c:if>
		        	<li><a href="${pageContext.request.contextPath }/managerEstimateList.do" class="w3-bar-item w3-button">의뢰목록</a></li>
		        	<li>
		        	<a href="${pageContext.request.contextPath }/managerExamList.do" class="w3-bar-item w3-button">시험목록</a>
		        	</li>
		        	<li>
		        	<a href="${pageContext.request.contextPath }/managerChart.do" class="w3-bar-item w3-button">통계</a>
		        	</li>
		        	<li>
		        	<a href="${pageContext.request.contextPath }/managerFileUpload.do" class="w3-bar-item w3-button">문제등록</a>
		        	</li>
		     


	  <sec:authorize access="isAnonymous()"> 
		<li><a href="managerLogin.do" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">로그인</a></li>
		</sec:authorize>


                        </ul>
                    </div>
                    <!--/.nav-collapse -->
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row-fluid">
               
                
                <!--/span-->
                <div class="span12" id="content">
	<tiles:insertAttribute name="body" />
                 </div>
            </div>
            <hr>
            <footer>
                <p>&copy;  YEDAM CBT PROJECT 2019</p>
            </footer>
        </div>
        <!--/.fluid-container-->
 		<script src="${pageContext.request.contextPath }/BootstrapAdminTheme/vendors/jquery-1.9.1.min.js"></script>
        <script src="${pageContext.request.contextPath }/BootstrapAdminTheme/bootstrap/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath }/BootstrapAdminTheme/vendors/easypiechart/jquery.easy-pie-chart.js"></script>
        <script src="${pageContext.request.contextPath }/BootstrapAdminTheme/assets/scripts.js"></script>
        <script>
        $(function() {
            // Easy pie charts
            $('.chart').easyPieChart({animate: 1000});
        });
        </script>
</body>
</html>

