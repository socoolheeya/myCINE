<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="col-sm-8" style="background-color: white;">
	<p style="color: black;">가장 Hot한 영화리뷰 베스트5</p>
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
				<a
					href="http://localhost:9090/myCINE/review/reviewContent.jsp?idx=386"><img
					src="/myCINE/image/킹스맨.jpg" alt="킹스맨" width="700" height="345"></a>
			</div>
			<div class="item">
				<a
					href="http://localhost:9090/myCINE/review/reviewContent.jsp?idx=4"><img
					src="/myCINE/image/차이나타운.jpg" alt="차이나타운" width="460" height="345"></a>
			</div>
			<div class="item">
				<a
					href="http://localhost:9090/myCINE/review/reviewContent.jsp?idx=382"><img
					src="/myCINE/image/테이큰.jpg" alt="테이큰" width="460" height="345"></a>
			</div>
			<div class="item">
			<a href="http://localhost:9090/myCINE/review/reviewContent.jsp?idx=400">
				<img src="/myCINE/image/티파니에서아침을.jpg" alt="티파니에서아침을" width="460"
					height="345"></a>
			</div>
			<div class="item">
			<a href="http://localhost:9090/myCINE/review/reviewContent.jsp?idx=379">
				<img src="/myCINE/image/로마의휴일.jpg" alt="로마의휴일" width="460"
					height="345"></a>
			</div>
		</div>

		<!-- Left and right controls -->
		<a class="left carousel-control" href="#myCarousel" role="button"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
</div>