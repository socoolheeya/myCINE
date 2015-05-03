<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>myCINE</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/myCINE/css/bootstrap.min.css">
<style>
.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	width: 70%;
	margin: auto;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="/myCINE/js/bootstrap.min.js"></script>
</head>
<body>
	<%@include file="header.jsp"%>
	<div class="row">
		<div class="col-sm-8" style="background-color: lavenderblush;">
			<p>가장 Hot한 영화리뷰 베스트5</p>
			<br>
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
					<li data-target="#myCarousel" data-slide-to="3"></li>
					<li data-target="#myCarousel" data-slide-to="4"></li>
				</ol>

				<!-- Wrapper for slides -->
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<img src="/myCINE/image/킹스맨.jpg" alt="킹스맨" width="700"
							height="345">
					</div>
					<div class="item">
						<img src="/myCINE/image/차이나타운.jpg" alt="차이나타운" width="460"
							height="345">
					</div>
					<div class="item">
						<img src="/myCINE/image/위험한상견례.jpg" alt="위험한상견례" width="460"
							height="345">
					</div>
					<div class="item">
						<img src="/myCINE/image/티파니에서아침을.jpg" alt="티파니에서아침을" width="460"
							height="345">
					</div>
					<div class="item">
						<img src="/myCINE/image/로마의휴일.jpg" alt="로마의휴일" width="460"
							height="345">
					</div>
				</div>

				<!-- Left and right controls -->
				<a class="left carousel-control" href="#myCarousel" role="button"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#myCarousel" role="button"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
		</div>
		<div class="col-sm-4" style="background-color: lavender;">
			<form>
				<div class="table-responsive">
					<table class="table">
						<thead>
							<tr>
								<th>여기는 타임라인</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>홍길동 님께서 고스트맘마 영화를 요청하였습니다.</td>
							</tr>
							<tr>
								<td>lwh0102 님께서 로마의 휴일 영화를 요청하였습니다.</td>
							</tr>
							<tr>
								<td>haha</td>
							</tr>
							<tr>
								<td>haha</td>
							</tr>
						</tbody>
					</table>
				</div>
			</form>
		</div>
	</div>
	<footer>
		<%@ include file="footer.jsp"%>
	</footer>
</body>
</html>
