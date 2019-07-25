<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>

	<h4 class="mx-auto pb-2" >응시자 등록 페이지(관리자 화면)</h4>
	<hr>	

<form action="${pageContext.request.contextPath }/managerUserInsert.do" method="post" enctype="application/x-www-form-urlencoded">
<table align="center" border="1">
			<tr>
				<th><label>응시자ID</label></th><td><input type="text" name="takerId" class="form-control"></td>
			</tr>
			<tr>
				<th><label>비밀번호</label></th><td><input type="password" name="takerPassword" class="form-control"></td>
			</tr>
			<tr>
				<th><label>이름</label></th><td><input type="text" name="takerName" class="form-control"></td>
			</tr>
			<tr>
				<th><label>생년월일</label></th><td><input type="text" name="takerInfo" class="form-control"></td>
			</tr>
			<tr>
				<th><label>최종학력</label></th><td>
					<my:select items="${J}" name="takerEducation" value="${result.takerEducation }"></my:select>
					</td>
			</tr>
			<tr>
				<th><label>E-mail</label></th><td><input type="text" name="takerEmail" class="form-control"></td>
			</tr>
			<tr>
				<th><label>연락처</label></th><td><input type="text" name="takerPhoneNum" class="form-control"></td>
			</tr>
			</table>
			<br>
	<input type="submit" id="submit" value="등록" class="btn btn-primary m-3 p-3">
	<input type="reset" id="reset"class="btn btn-warning m-3 p-3" onclick="location.href='managerUserAccountList.do'" value="돌아가기">
		</form>

</body>
</html>
    