<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Case</title>
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

	<div class="container">
		<div class="col-sm-8">
			<h3>최신 영화를 한번에!</h3>
			<p>가장 Hot한 영화 베스트5</p>
		</div>
		<div class="col-sm-4">
			<form>
				<div class="table-responsive">
					<table class="table">
						<thead>
							<th>여기는 타임라인</th>
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

	<div class="container">
		<div class="col-sm-8">
			<br>
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
					<li data-target="#myCarousel" data-slide-to="3"></li>
				</ol>

				<!-- Wrapper for slides -->
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<img src="http://movie.naver.com/movie/bi/mi/photoViewPopup.nhn?movieCode=114249" alt="킹스맨" width="700"
							height="345">
					</div>
					<div class="item">
						<img src="http://movie.naver.com/movie/bi/mi/photoViewPopup.nhn?movieCode=124041" alt="차이나타운" width="460"
							height="345">
					</div>

					<div class="item">
						<img src="http://movie.naver.com/movie/bi/mi/photoViewPopup.nhn?movieCode=103381" alt="위험한상견례" width="460"
							height="345">
					</div>

					<div class="item">
						<img src="/bootstrap/image/movie.jpg" alt="Flower" width="460"
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
		
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>
