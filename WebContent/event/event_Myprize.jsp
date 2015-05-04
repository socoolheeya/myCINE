<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/myCINE/css/bootstrap.min.css">
<title>내 이벤트 페이지</title>
<style>
a {
	text-decoration: none;
}	
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="/myCINE/js/bootstrap.min.js"></script>
</head>
<body>
	<%@include file="../header.jsp"%>
	<div class="row">
		<section>
			<div class="col-sm-3">
				<article>
					<fieldset>
						<ul>
							<li><a href="event_Main.jsp">포인트 사용안내</a></li>
							<li><a href="event_Exchange.jsp">상품 교환</a></li>
							<li><a href="event_Mypoint.jsp?idx=2">내 포인트 조회</a></li>
							<li>내가 보유한 상품</li>
						</ul>
					</fieldset>
				</article>
			</div>
			<div class="col-sm-8">
				<article>
					<fieldset>
						<legend>내가 보유한 상품</legend>
						<table>
							<tr>
								<th>번호</th>
								<th>상품명</th>
								<th>갯수</th>
							</tr>
							<tr>
								<td colspan="3">현재 보유한 상품이 없습니다.</td>
							</tr>
						</table>
					</fieldset>
				</article>
			</div>
		</section>
	</div>
	<%@include file="../footer.jsp"%>
</body>
</html>