<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
   <script>
   function checkFileType(filePath) {
                var fileFormat = filePath.split(".");
                if (fileFormat.indexOf("xlsx") > -1) {
                    return true;
                } else {
                    return false;
                }
 
            }
 
            function check() {
                var file = $("#excelFile").val();
                if (file == "" || file == null) {
                    alert("파일을 선택해주세요.");
                    return false;
                } else if (!checkFileType(file)) {
                    alert("엑셀 파일만 업로드 가능합니다.");
                    return false;
                }
 
                if (confirm("업로드 하시겠습니까?")) {
                    var options = {
                        success : function(data) {
                            alert("모든 데이터가 업로드 되었습니다.");
 
                        },
                        type : "POST"
                    };
                    $("#excelUploadForm").ajaxSubmit(options);
    
                }
            }
</script>
<style>
</style>
</head>
<body>
<nav id="nav2">
				<a href="candidateUserMain.jsp">로그아웃</a>
			</nav>
	<section>
		<article>
			<ul>
				<li><button type="button" onclick="location.href='${pageContext.request.contextPath }/managerAccountControl.do'">계정관리</button></li>
				<li><button type="button" onclick="location.href='${pageContext.request.contextPath }/managerRequestList.do'">의뢰목록</button></li>
				<li><button type="button" onclick="location.href='${pageContext.request.contextPath }/managerConsultingList.do'">상담목록</button></li>
				<li><button type="button" onclick="location.href='${pageContext.request.contextPath }/managerChart.do'">통 계</button></li>
			</ul>
		</article>
	</section>
<h2>응시자 계정관리</h2>
<button type="button" onclick="location.href='managerUserInsert.do'">응시자 추가</button>
<form id="excelUploadForm" name="excelUploadForm" enctype="multipart/form-data" method="post" 
                                action= "${pageContext.request.contextPath}/user/excelUploadAjax">
    <div class="contents">
        <div>첨부파일은 한개만 등록 가능합니다.</div>
 
        <dl class="vm_name">
                <dt class="down w90">첨부 파일</dt>
                <dd><input id="excelFile" type="file" name="excelFile" /></dd>
        </dl>        
    </div>
            
    <div class="bottom">
        <button type="button" id="addExcelImpoartBtn" class="btn" onclick="check()" ><span>추가</span></button> 
    </div>
</form> 
<br><br>
<form action="managerUserDelete.do">
<button type="">응시자 삭제</button>
<br><br>

<table border="1" align="center">
   <tr>
   	  <th>선택</th>
      <th>응시자ID</th>
      <th>이름</th>
      <th>E-Mail</th>
   </tr>
   		<c:forEach items="${result }" var="CandidateVO">
		<tr>
			<td><input type="checkbox" name="takerList" value="${CandidateVO.takerId }"></td>
			<td>${CandidateVO.takerId }</td>
			<td><a href="managerUserAccountEdit.do/${CandidateVO.takerId }">${CandidateVO.takerName }</a></td>
			<td>${CandidateVO.takerEmail }</td>
		</tr>
		</c:forEach>
</table>
</form>
</body>
</html>