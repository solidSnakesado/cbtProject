<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<br>
<div id="carouselExampleInterval" class="carousel slide carousel-fade"
	data-ride="carousel">
	<div class="carousel-inner">
		<div class="carousel-item active" data-interval="4000">
			<img src="${pageContext.request.contextPath}/image/mainImage1.png"
				width="1073" height="535" alt="오케이">
		</div>
		<div class="carousel-item" data-interval="4000">
			<img src="${pageContext.request.contextPath}/image/mainImage2.png"
				width="1073" height="535" alt="빨리끝나자">
		</div>
		<div class="carousel-item" data-interval="4000">
			<img src="${pageContext.request.contextPath}/image/mainImage3.png"
				width="1073" height="535" alt="안뇽">
		</div>
	</div>
	<a class="carousel-control-prev" href="#carouselExampleInterval"
		role="button" data-slide="prev" style="font-color: red"> <span
		class="carousel-control-prev-icon" aria-hidden="true"></span> <span
		class="sr-only">Previous</span>
	</a> <a class="carousel-control-next" href="#carouselExampleInterval"
		role="button" data-slide="next"> <span
		class="carousel-control-next-icon" aria-hidden="true"></span> <span
		class="sr-only">Next</span>
	</a>
</div>
