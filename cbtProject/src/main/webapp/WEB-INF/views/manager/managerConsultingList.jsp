<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>

	<h4 class="mx-auto pb-2">기업상담목록(관리자)</h4>
	<script>
		function goList(p) {
			searchFrm.page.value=p;
			searchFrm.submit();
		}
	</script>
	<hr />
	<form name="searchFrm">
	정렬기준
	<input type="hidden" name="page" value="1">
	<select name="sort">
		<option value="CONSULTING_ID">컨설팅ID
		<option value="CONSULTING_TITLE">제목
		<option value="CONSULTING_DESIRED_DATE">상담희망일
		<option value="CONSULTING_STATE">상담상태
	</select>
	&nbsp; &nbsp;
		검색조건 <my:consultingListSelect items="${consultingMap }"/>&nbsp;&nbsp;
		<input type="text" name="searchKeyword" value="${ConsultingVO.searchKeyword }">
		<button>검색</button>
	</form>
	 <script>
		searchFrm.sort.value="${ConsultingVO.sort}"==""?searchFrm.sort.options[0].value
							:"${ConsultingVO.sort}";
		searchFrm.searchConsulting.value="${ConsultingVO.searchConsulting}"==""
									?searchFrm.searchConsulting.options[0].value
									:"${ConsultingVO.searchConsulting}";
	</script>
	<div class="container">
		<br>
		<button type="button" class="btn btn-primary m-3 p-3"
			onclick="location.href='managerConsultingInsert.do'">상담내역 추가</button>
		<br>
		<br>
		<form action="managerConsultingDelete.do">
			<table border="1" align="center" class="table table-striped">
				<tr>
					<th>선택</th>
					<th>제목</th>
					<th>상담희망일</th>
					<th>상담진행상태</th>
				</tr>
				<c:forEach items="${result.consultingList}" var="ConsultingVO">
					<tr>
						<td><input type="checkbox" name="consultingList"
							value="${ConsultingVO.consultingId }"></td>
						<td><a
							href="managerConsultingListDetail.do/${ConsultingVO.consultingId }">${ConsultingVO.consultingTitle}</a></td>
						<td>${ConsultingVO.consultingDesiredDate}</td>
						<td>${ConsultingVO.consultingStateName}</td>
					</tr>
				</c:forEach>
			</table>
			<button id="" align="right" class="btn btn-warning m-3 p-3">삭제</button>
		</form>
		<br>
		<hr />
		<my:paging jsFunc="goList" paging="${result.paging }" />
	</div>
