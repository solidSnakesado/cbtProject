<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<style>
.mySlides {
	display: none;
}
</style>
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#header").load("co_header.html")
		});
	</script>
	<header id="header"></header>
	<h2 class="w3-center">Manual Slideshow</h2>

	<div class="w3-content w3-display-container">
		<img class="mySlides" src="image/일정1.png" style="width: 100%"> <img
			class="mySlides" src="image/일정2.png" style="width: 100%"> <img
			class="mySlides" src="image/일정3.png" style="width: 100%">


		<button class="w3-button w3-black w3-display-left"
			onclick="plusDivs(-1)">&#10094;</button>
		<button class="w3-button w3-black w3-display-right"
			onclick="plusDivs(1)">&#10095;</button>
	</div>

	<script>
		var slideIndex = 1;
		showDivs(slideIndex);

		function plusDivs(n) {
			showDivs(slideIndex += n);
		}

		function showDivs(n) {
			var i;
			var x = document.getElementsByClassName("mySlides");
			if (n > x.length) {
				slideIndex = 1
			}
			if (n < 1) {
				slideIndex = x.length
			}
			for (i = 0; i < x.length; i++) {
				x[i].style.display = "none";
			}
			x[slideIndex - 1].style.display = "block";
		}
	</script>

</body>
</html>