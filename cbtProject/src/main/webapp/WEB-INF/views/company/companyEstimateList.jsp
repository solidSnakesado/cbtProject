<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
 <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		
	<style>
		
	</style>
	<script type="text/javascript">
		/* $(document).ready(function() {
			$("#header").load("co_header.html")
		}); */
		
		$(function(){
			estimateList();

			estimateSelect();
			
			/* estimateDelete();
			
			estimateInsert();
		
			estimateUpdate();
			
			init(); */
		});
		
		//EstimateList
		function estimateList(){
			$.ajax({
				url:'Estimate',
				type:'GET',
				dataType:'json',
				error:function(xhr,status,msg){
					alert("상태값 :" + status + " Http에러메시지 :"+msg);
				},
				success:EstimateListResult
			});
		}
		
		function EstimateListResult(data){
			$("tbody").empty();
			$.each(data,function(idx,item){
				$('<tr onClick="estimateDetail('+item.estimateId+')" id="hover">')
				.append($('<td>').html(item.estimateId))
				.append($('<td>').html(item.categoryId))
				.append($('<td>').html(item.requestDay))
				.append($('<td>').html(item.tradeProgressNm))
				.append($('<td>').html(item.examDate))
				.append($('<td>').append('<button type="button">삭제</button>'))
				.appendTo('tbody');
			});
		}
		
		
		function estimateDetail(estimateId){
			console.log(estimateId);
			var wintype = "toolbar=no,width=500,height=1000,top=150,left=150,directories=no,menubar=no,scrollbars=yes";
			var winopen = window.open("companyDetailRequestList.do/"+estimateId,"windowopen",wintype);
			
		}
		
		
	</script>
</head>
<body>
  
	<header id="header"></header>
<section>
   <article>
      <ul>
         <li><button type="button" onclick="location.href='accountManage.html'">계정관리</button></li>
         <li><button type="button" onclick="location.href='requestList.html'">의뢰목록</button></li>
         <li><button type="button" onclick="location.href='conSulting_List.html'">상담목록</button></li>
         <li><button type="button" onclick="location.href='test_List.html'">시험목록</button></li>
      </ul>
   </article>
</section>

<h2>의뢰목록</h2>	
<hr/>		
<div class="container">	
	
	<table class="table text-center" border="1">
		<thead>
		<tr>
			<th class="text-center">순번</th>
			<th class="text-center">카테고리ID</th>
			<th class="text-center">의뢰일</th>
			<th class="text-center">진행상태</th>
			<th class="text-center">시험일시</th>
			<th class="text-center">삭제</th>
		</tr>
		</thead>
		<tbody></tbody>
	</table>
	
	<button type="button"  class="btn btn-primary" value="등록"  id="btnInsert"  onclick="location.href='companyEstimateInsert.do'">의뢰등록</button>
		
	</div>	
</body>

</html>