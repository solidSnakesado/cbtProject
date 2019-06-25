<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<title>Insert title here</title>
</head>
<body>
<table border="1">
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#header").load("candidateInHeader.jsp")
		});
	</script>
	<header id="header"></header>
   <tr>
      <td><h2 align="center"> OO 풀이 및 해설</h2></td>
   </tr>
   <tr>
     <td colspan="2" align="left" valign="top" style="20px 0px 0px 0px;">
     <!---------------------내용시작------------------>
   <table >
      <tr>
     	 <td>
 
	      <!--테이블 시작 -->
	      <table width="940" style="padding:5px 0 5px 0;">
	      <tr>
	        <th valign="top"><img src="image/오답.png"></th>
	        <td> "태산이 높다하되 하늘 아래 뫼이로다. 오르고 오르면 못 오를리 없건만 오리지 않고서 높다고만 하더라." 
	        	"태산이 높다하되 하늘 아래 뫼이로다. 오르고 오르면 못 오를리 없건만 오리지 않고서 높다고만 하더라."
	        	"태산이 높다하되 하늘 아래 뫼이로다. 오르고 오르면 못 오를리 없건만 오리지 않고서 높다고만 하더라."본 시의 작가는? <br>
	        </td>
	      </tr>
	      <tr><td>1</td> <td><input type="radio" name="01_1" value="####">이승환<br></td></tr>
	      <tr><td>2</td> <td><input type="radio" name="01_1" value="####">이숭한<br></td></tr>
	      <tr><td>3</td> <td><input type="radio" name="01_1" value="####">이송한<br></td></tr>
	      <tr><td>4</td> <td><input type="radio" name="01_1" value="####">이승한<br></td></tr>
	      
	      
	     	
	      </table>
	      <div>
	     		해설: 4번이승한  이승한작가는 위대하다
	     	</div>
	     </td>
	   </tr>
	   
	   <tr>
	   	<td><a href="#" class="previous">&laquo; Previous</a>
			<a href="#" class="next">Next &raquo;</a>
		</td>
	</tr>
	 </table>
	 <tr> 
	 	<td colspan="2" align="center" valign="top">
	 		<button>이의제기</button>&nbsp;<button onclick="location.href'candidateUserMain.jsp'">메인으로</button>
		</td>
   	</tr>
   
   
 
</table>
	
      
</body>
</html>