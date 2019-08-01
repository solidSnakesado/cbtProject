<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
<div align="right">
	<script>
		$(document).ready(function() {
			$('#table_id').DataTable();
		});
	</script>
	
	<!-- <button id="excelDownBtn" name="excelDownBtn">엑셀 다운</button> -->
	<button
		onclick="location.href='${pageContext.request.contextPath }/managerExamList.do'">시험목록으로</button>
	[<a href="<c:url value='/managerExamQuestionExcelDown.do/${examId}' />">엑셀
		다운</a>] [<a
		href="javascript:window.open('<c:url value='/managerExamSendForm.do' />','email','width=800,height=600')">이메일전송</a>]

</div>
<table id="table_id" class="display">
	<thead>
		<tr>
			<th width="100px">문제</th>
			<th>보기1</th>
			<th>보기2</th>
			<th>보기3</th>
			<th>보기4</th>
			<th>정답</th>
			<th>해설</th>

		</tr>
	</thead>
	<tbody>
		<c:forEach var="item" items="${questionVOList}">
			<tr>
				<td>${item.questionContent}</td>
				<td>${item.example1}</td>
				<td>${item.example2}</td>
				<td>${item.example3}</td>
				<td>${item.example4}</td>
				<td>${item.rightAnswer}</td>
				<td>${item.rightCommentary}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
