<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

	<h4 class="mx-auto pb-2">상담 세부 항목</h4>
	<table align="center">
		<tr>
			<th><label>상담희망일</label></th>
			<td style="text-align: left;"><input type="datetime-local" name="consultingDesiredDate" id="consultingDesiredDate" class="form-control" value="${consulting.consultingDesiredDate}" readonly></td>
		</tr>
		<tr>
			<th><label>제목</label></th>
			<td><input type="text" name="consultingTitle" id="consultingTitle" 
					class="form-control" value="${consulting.consultingTitle}" style="width: 100%;" readonly="readonly"></td>
		</tr>
		<tr>
			<th><label>상담내용</label></th>
			<td><textarea name="consultingContents" id="consultingContents" cols="80" rows="8" class="form-control" readonly>${consulting.consultingContents}</textarea><td>
		</tr>
		<tr>
			<!-- 2019.07.10 성재민 -->
			<!-- 상담일 값이 있으면 해당 값을 없으면 미정이라고 표시 -->
			<th><label>상담일</label></th>
			<c:if test="${not empty consulting.consultingDate }">
				<td><input type="datetime-local" name="consultingDate" id="consultingDate" readonly="readonly" class="form-control" value="${consulting.consultingDate}"></td>
			</c:if>
			<c:if test="${empty consulting.consultingDate }">
				<td>상담일이 지정되지 않았습니다.</td>
			</c:if>
		</tr>
	</table>
	<br>

	<c:if test="${consulting.consultingState == 'C1'}">
		<input type="button" class="btn btn-primary m-3 p-3" onclick="location.href='${pageContext.request.contextPath }/companyConSultingUpdate.do/${consulting.consultingId}'" value="수정하기">
	</c:if>
	<input type="button" class="btn btn-primary m-3 p-3" onclick="location.href='${pageContext.request.contextPath }/companyConSultingDelete.do/${consulting.consultingId}'" value="삭제하기">
	<input type="button" class="btn btn-primary m-3 p-3" onclick="location.href='${pageContext.request.contextPath }/companyConSultingList.do'" value="목록으로">
