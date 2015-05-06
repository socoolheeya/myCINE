<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>이벤트 메인페이지</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/myCINE/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="/myCINE/js/bootstrap.min.js"></script>
<style type="text/css">
legend{
	font-size: 30px;
}
</style>
</head>
<body>
	<header>
		<%@include file="../header.jsp"%>
	</header>
	<div class="row">
		<div class="col-sm-3"
			style="border: 1px solid #cccccc; margin: 10px; padding: 10px;">
			<ul>
				<li>포인트 사용안내</li>
				<li><a href="event_Exchange.jsp">상품 교환</a></li>
				<li><a href="event_Mypoint.jsp?idx=2">내 포인트 조회</a></li>
				<li><a href="event_Myprize.jsp">내가 보유한 상품</a></li>
			</ul>
		</div>
		<div class="col-sm-7" style="border: 1px solid #cccccc; margin: 10px; padding: 10px;">
			<legend><span class="glyphicon glyphicon-ok"></span>포인트 사용안내</legend>
			<h2>POINT 적립방법</h2>
			<ol>
				<li>로그인 시 10 P 적립</li>
				<li>리뷰 작성시 10 P 적립</li>
				<li>댓글 작성시 5 P 적립</li>
			</ol>
			<p>POINT 적립시 다양한 혜택을 드립니다.</p>

			<h2>상품 정보</h2>
			<ul>
				<li>700 P -> CGV SET 교환권</li>
				<li>800 P -> 쉐이크 SET 교환권</li>
				<li>900 P -> 에이드 SET 교환권</li>
				<li>1000 P -> 오징어 SET 교환권</li>
				<li>1100 P -> 즉석버터구이 SET 교환권</li>
				<li>2000 P -> 영화관람권2매</li>
			</ul>
			<p>사용방법 : '상품 교환'으로 이동 후 원하는 상품을 고르신 뒤 '교환'클릭</p>
		</div>
	</div>
	<footer>
		<%@include file="../footer.jsp"%>
	</footer>
</body>
</html>