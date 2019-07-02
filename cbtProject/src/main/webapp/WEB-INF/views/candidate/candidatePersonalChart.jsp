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

   <script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#header").load("candidateInHeader.do")
		});
	</script>
	<header id="header"></header>
<section>
   <article>
      <ul>
         <li><a href="candidateAccountManageModify.do"><button>계정관리</button></a></li>
         <li><a href="commonDetailRequestList.do"><button>응시목록</button></a></li>
         <li><a href="candidatePersonalChart.do"><button>통계</button></a></li>
      </ul>
   </article>
</section>
   <img src="${pageContext.request.contextPath}/image/개인시험결과.PNG">
   <a href="candidateSurvey.do"><button>설문작성후 문제해설 보기</button></a>
   <a href="candidateMain.do"><button>메인으로</button></a>
</body>
</html>