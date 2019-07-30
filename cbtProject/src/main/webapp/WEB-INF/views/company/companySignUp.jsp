<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
var idck = 0;
var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
var pattern1 = /[0-9]/;	// 숫자 
var pattern2 = /[a-zA-Z]/;	// 문자 
var pattern3 = /[~!@#$%^&*()_+|<>?:{}]/;	// 특수문자

function openIdChk() {
    var companyId = $("#companyId").val();
     
    if(special_pattern.test(companyId) == true) {
        window.alert("아이디에는 특수문자를 사용하실 수 없습니다");
    	e.preventDefault();
    	return false; 
    }
    if(companyId.search(/\s/) != -1) {
        window.alert("아이디에는 공백를 사용하실 수 없습니다");
    	e.preventDefault();
    	return false; 
    }
     if(companyId == '' || !(companyId.length >= 4 && companyId.length <= 12)) {
        window.alert("아이디 자리수를 확인하시오");
    	e.preventDefault();
        return false; // 아이디 입력이 안되어 있다면 submint 이벤트를 중지
    } 
		$.ajax({
			async : false,
			type : "post",
			url : "idcheck.do",
			dataType : "json",
			data : JSON.stringify($("#fmField").serializeObject()),
			contentType : "application/json; charset=UTF-8",
			success : function(response) {
				console.log(response);
				if (response.result == true) {
					window.alert("사용가능한 아이디입니다.");
					idck = 1
				} else {
					window.alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
				}
			},
			error : function(error) {
				console.log(error);
			}
		});
	};
	// id체크를 재사용하기 위해 companyId -> takerId로 변경
	function checkForm() {
		var companyId = document.fmField.companyId;
		var idDuplication = document.fmField.idDuplication;
		var companyPassword = document.fmField.companyPassword;
		var companyPwCheck = document.fmField.companyPwCheck;
		
		// 아이디 입력 유무 체크
		if (companyId.value == ''
				|| !(companyId.value.length >= 4 && companyId.value.length <= 12)) {
			window.alert("아이디를 입력하시오");
			e.preventDefault();
			return false; // 아이디 입력이 안되어 있다면 submint 이벤트를 중지
		}
		if (idck == 0) {
			window.alert("아이디 중복 체크를 해주세요.");
			e.preventDefault();
			return false;
		}
		// 암호 입력 유무 체크
		if (document.fmField.companyPassword.value == '') {
			window.alert('password를 입력하세요.');
			e.preventDefault();
			return false;
		}
		// 암호 입력동일 여부 체크
		if (document.fmField.companyPassword.value != document.fmField.companyPwCheck.value) {
			window.alert('암호를 확인 하세요.');
			e.preventDefault();
			return false;
		}
		//암호 보안 강화
	    if(!pattern1.test(document.fmField.companyPassword.value) || !pattern2.test(document.fmField.companyPassword.value) || !pattern3.test(document.fmField.companyPassword.value) || document.fmField.companyPassword.value.length < 8) { 
	    	window.alert("비밀번호는 8자리 이상 문자, 숫자, 특수문자로 구성하여야 합니다."); 
	    	return false; 
	    } 
		document.fmField.submit();
	}
</script>
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>
	<script type="text/javascript">
/* 		$(document).ready(function() {
			$("#header").load("in_header.html")
		}); */
	</script>
	<header id="header"></header>
	
	<h4 class="mx-auto pb-2">기업 회원 가입 페이지</h4>
	<form id="fmField" name="fmField"  action="companySignUp.do" method="post">
		<table border="1" align="center" class="table text-center">
			<tr>
				<td><label>기업ID</label></td>
				<td align="left"><input type="text" name="companyId" id="companyId" class="form-control">&nbsp;<input type="button" value="중복확인" onclick="openIdChk();"/>
			</tr>
			<tr>
				<td><label>기업PW</label></td>
				<td><input type="password" name="companyPassword" id="companyPassword" class="form-control"></td>
			</tr>
			<tr>
				<td><label>PW확인</label></td>
				<td><input type="password" name="companyPwCheck" id="companyPwCheck" class="form-control"></td>
			</tr>
			<tr>
				<td><label>기업명</label></td>
				<td><input type="text" name="companyName" id="companyName" class="form-control"></td>
			</tr>
			<tr>
				<td><label>사업자번호</label></td>
				<td><input type="text" name="businessNumber" id="businessNumber" class="form-control"></td>
			<tr>
				<td><label>회사분류</label></td>
				<td><select name="companyClassification" id="companyClassification" class="form-control">
						<option value="1">IT</option>
						<option value="2">전자</option>
						<option value="3">기계</option>
						<option value="4">방송</option>
						<option value="5">언론</option>
				</select></td>
			</tr>
			<tr>
				<td><label>세부업종</label></td>
				<td><select name="companySectors" id="companySectors" class="form-control">
						<option value="1">경영</option>
						<option value="2">회계</option>
						<option value="3">재무</option>
						<option value="4">인사</option>
						<option value="5">노무</option>
				</select></td>
			</tr>
			<tr>
				<td><label>주거래 은행</label></td>
				<td><input type="text" name="companyCredit" id="companyCredit" class="form-control"></td>
			</tr>
			<tr>
				<td><label>담당자</label></td>
				<td><input type="text" name="companyManager" id="companyManager" class="form-control"></td>
			</tr>
			<tr>
				<td><label>연락처</label></td>
				<td><input type="text" name="companyManagerTelNum" id="companyManagerTelNum" class="form-control"></td>
			</tr>
		</table>
		<div align="right">
			<button type="button" onclick="checkForm()" class="btn btn-primary m-3 p-3">가입</button>&nbsp;&nbsp;&nbsp; 
			<!-- <input type="submit" value="가입" class="btn btn-primary m-3 p-3">
			<input type="reset" value="취소" class="btn btn-warning m-3 p-3"> -->
			<input type="reset" value="취소" /> &nbsp;
		</div>
	</form>
	<br>
	<br>

</body>
</html>