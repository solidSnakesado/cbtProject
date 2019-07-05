<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
function checkForm() {
    var takerId 		= document.fmField.takerId;
    var idDuplication	= document.fmField.idDuplication;
    var takerPassword 	= document.fmField.takerPassword;
    var takerPasswordRe = document.fmField.takerPasswordRe;
    var takerName 		= document.fmField.takerName;
    var takerInfo 		= document.fmField.takerInfo;
    var takerEmail 		= document.fmField.takerEmail;
    console.log("in");
    // 아이디 입력 유무 체크
    if(takerId.value == '' || !(takerId.value.length >= 3 && takerId.value.length <= 12)) {
        window.alert("아이디를 입력하시오");
        document.fmField.takerId.focus();
        document.getElementById('takerId').select();
        return false; // 아이디 입력이 안되어 있다면 submint 이벤트를 중지
    }
    // 암호 입력 유무 체크
    if(document.fmField.takerPassword.value == ''){
    	window.alert('암호를 입력하세요.');
        takerPassword.focus();
        return false;
    }
 	// 암호 입력동일 여부 체크
	    if(document.fmField.takerPassword.value != document.fmField.takerPasswordRe.value){
    	window.alert('암호를 확인 하세요.');
        takerPassword.focus();
        return false;
    }
 	//  
    if(document.fmField.takerName.value == ''){
    	window.alert('이름을 입력하세요.');
        takerName.focus();
        return false;
    }
    if(document.fmField.takerInfo.value == ''){
    	window.alert('연락처를 입력하세요.');
        takerInfo.focus();
        return false;
    }
    if(document.fmField.takerEmail.value == ''){
    	window.alert('이메일 주소를 입력하세요.');
        takerEmail.focus();
        return false;
    }
}
</script>

<script type="text/javascript">
//아이디 체크여부 확인 (아이디 중복일 경우 = 0 , 중복이 아닐경우 = 1 )
var idck = 0;
$(function() {
    $("#openIdChk").click(function() {
        var takerId = document.fmField.takerId;
        $.ajax({
            async: false,
            type : 'POST',
            data : takerId,
            url : "candidate/idcheck.do",
            dataType : "json",
            contentType: "application/json; charset=UTF-8",
            success : function(data) {
                if (data.cnt > 0) {
                    alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
                    $("#takerId").focus();
                } else {
                    alert("사용가능한 아이디입니다.");
                    idck = 1;
                }
            },
            error : function(error) {
                alert("error : " + error);
            }
        });
    });
});
 
 
</script>
	
	
	
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
	<script type="text/javascript">
/* 		$(document).ready(function() {
			$("#header").load("candidateInHeader.do")
		}); */
	</script>
	<header id="header"></header>
	
	<form id="fmField" name="fmField" action="insertCandidate.do" method="post" >
		<table border="1" align="center">
			<tr>
				<td>응시자ID</td>
				<td><input type="text" name="takerId" id="takerId"></td>
				<td><input type="button" value="중복확인" onclick="openIdChk()"></td>
			</tr>
			<tr>
				<td>응시자PW</td>
				<td colspan="2"><input type="text" name="takerPassword" id="takerPassword"></td>
			</tr>
			<tr>
				<td>PW확인</td>
				<td colspan="2"><input type="text" name="takerPasswordRe" id="takerPasswordRe"></td>
			</tr>
			<tr>
				<td>성명</td>
				<td colspan="2"><input type="text" name="takerName" id="takerName"></td>
			</tr>
			<tr>
				<td>주민등록번호</td>
				<td colspan="2"><input type="text" name="takerInfo" id="takerInfo"></td>
			</tr>
			<tr>
				<td>E-mail</td>
				<td colspan="2"><input type="text" name="takerEmail" id="takerEmail"></td>
			</tr>
			<tr>
				<td>최종학력</td>
				<td colspan="2"><select name="takerEducation">
						<option value="중졸">중졸</option>
						<option value="고졸">고졸</option>
						<option value="초대졸">초대졸</option>
						<option value="학사">학사</option>
						<option value="석사">석사</option>
						<option value="박사">박사</option>
				</select></td>
			</tr>
		</table>
		<br> <br>
		<div align="center">
			<button type="submit" onclick="checkForm()">가입</button> &nbsp; <input type="reset"
				value="취소" />
		</div>
	</form>

</body>
</html>