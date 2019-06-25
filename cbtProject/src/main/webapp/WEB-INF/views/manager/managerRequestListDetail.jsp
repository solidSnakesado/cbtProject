<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />


</head>
<body>
	<nav id="nav2">
		<a href="candidateUserMain.jsp">로그아웃</a>
	</nav>
	<section>
		<article>
			<ul>
				<li><button type="button"
						onclick="location.href='managerAccountControl.jsp'">계정관리</button></li>
				<li><button type="button"
						onclick="location.href='managerRequestList.jsp'">의뢰목록</button></li>
				<li><button type="button"
						onclick="location.href='managerConsultingList.jsp'">상담목록</button></li>
				<li><button type="button"
						onclick="location.href='managerChart.jsp'">통 계</button></li>
			</ul>
		</article>
	</section>
	<h2>관리자 기업의뢰목록 세부</h2>
	의뢰일:
	<input type="text" value="19/06/17" readonly>
	<br> 금액:
	<input type="text" value=500000원>
	<br> 진행상태:
	<select>
		<option value="">진행대기</option>
		<option value="">의뢰완료</option>
		<option value="">의뢰거절</option>
		<option value="">의뢰대기</option>
		<option value="">결제완료</option>
		<option value="">결제대기</option>
	</select>
	<br> 응시자수 :
	<input type="text" value=50 readonly="readonly">
	<br> 난이도:
	<select>
		<option value="">상</option>
		<option value="">중</option>
		<option value="">하</option>
	</select>
	<br> 비고:
	<input type="text">
	<br> 응시대상자 :
	<select>
		<option value="">재직자</option>
		<option value="">신입사원</option>
		<option value="">학생</option>
	</select>
	<br> 응시목적
	<select>
		<option value="">자격증</option>
		<option value="">직무시험</option>
		<option value="">승진시험</option>
	</select>
	<br> 시험일시:
	<input type="text" value="19/07/11">
	<br> 시험분류:
	<select>
		<option value="">목적별시험분류</option>
		<option value=""></option>
		<option value=""></option>
	</select>
	<br> 시험횟수:
	<select>
		<option value="">1</option>
		<option value="">2</option>
		<option value="">3</option>
	</select>
	<br> 시험간격:
	<select>
		<option value="">1달</option>
		<option value="">2달</option>
		<option value="">3달</option>
	</select>
	<br> 합격점수:
	<input type="text" value=60>
	<br> 시험명:
	<input type="text" value="정보처리기사">
	<br> 시험시간:
	<select>
		<option value="">0:45:00</option>
		<option value="">1:00:00</option>
		<option value="">1:30:00</option>
	</select>
	<br> 문항수:
	<input type="text" value=50>
	<br> 응시가능횟수
	<select>
		<option value="">1회</option>
		<option value="">2회</option>
		<option value="">3회</option>
	</select>
	<br>
	<button type="button" onclick="location.href='managerRequestList.jsp'">확인</button>
	<button type="button" onclick="location.href='managerRequestList.jsp'">수정</button>
	<button type="button" onclick="location.href='managerRequestList.jsp'">삭제</button>
</body>
</html>