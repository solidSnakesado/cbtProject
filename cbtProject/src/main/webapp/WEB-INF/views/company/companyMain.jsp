<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${not empty sessionScope.company }">    
		<section>
			<article>
				<ul>
					<li><button type="button" onclick="location.href='companyAccount.do'">계정관리</button></li>
					<li><button type="button" onclick="location.href='companyEstimateList.do'">의뢰목록</button></li>
					<li><button type="button" onclick="location.href='companyConsultingInsert.do'">상담신청</button></li>
					<li><button type="button" onclick="location.href='companyConSultingList.do'">상담목록</button></li>
					<li><button type="button" onclick="location.href='companyExamList.do'">시험목록</button></li>
					<li><button type="button" onclick="location.href='companyChart.do'">통계</button></li>
				</ul>
			</article>
		</section>
	</c:if>
	
	<c:if test="${empty sessionScope.company }">    
		<table>
			<tr>
				<td colspan="2"><p align="center">
						<a href="candidateInIntroduce.do"><img src="${pageContext.request.contextPath}/image/main.PNG"></a>
					</p></td>
			</tr>
		</table>
	</c:if> 
</body>
</html>