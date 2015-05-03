<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/myCINE/css/bootstrap.min.css">
<style>
a {
	text-decoration: none;
}

legend {
	font-size: 30px;
}

table tr {
	text-align: center;
}

table img {
	width: 200px;
}

tfoot tr {
	font-size: 30px;
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
							<li>상품 교환</li>
							<li><a href="event_Mypoint.jsp?idx=2">내 포인트 조회</a></li>
							<li><a href="event_Myprize.jsp">내가 보유한 상품</a></li>
						</ul>
					</fieldset>
				</article>
			</div>
			<div class="col-sm-8">
				<article>
					<fieldset>
						<legend>상품 교환</legend>
						<table>
							<tfoot>
								<tr>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td colspan="3">※ 교환하신 상품은 환불이 불가합니다.</td>
								</tr>
							</tfoot>
							<tbody>
								<tr>
									<th>CGV SET</th>
									<th>쉐이크 SET</th>
									<th>에이드 SET</th>
								</tr>
								<tr>
									<td><img src="/myCINE/image/cgv_700.jpg"
										title="팝콘(대)1 + 음료(중)2"></td>
									<td><img src="/myCINE/image/shake_800.jpg"
										title="팝콘(대)1 + 음료(중)2 + 시즈닝(7가지중 택1)"></td>
									<td><img src="/myCINE/image/ade_900.jpg"
										title="팝콘(대)1 + 에이드(중)2"></td>
								</tr>
								<tr>
									<td>point: 700 p
										<button type="button" class="btn btn-warning">교환</button>
									</td>
									<td>point: 800 p
										<button type="button" class="btn btn-warning">교환</button>
									</td>
									<td>point: 900 p
										<button type="button" class="btn btn-warning">교환</button>
									</td>
								</tr>

								<tr>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>

								<tr>
									<th>오징어 SET</th>
									<th>즉석버터구이 SET</th>
									<th>영화관람권 2매</th>
								</tr>
								<tr>
									<td><img src="/myCINE/image/squid_1000.jpg"
										title="팝콘(대)1 + 음료(중)2 + 오징어(완제품)"></td>
									<td><img src="/myCINE/image/butter_1100.jpg"
										title="팝콘(대)1 + 음료(중)2 + 즉석버터구이오징어"></td>
									<td><img src="/myCINE/image/movie_2000.jpg"
										title="영화관람권 2매"></td>
								</tr>
								<tr>
									<td>Point: 1000 p
										<button type="button" class="btn btn-warning">교환</button>
									</td>
									<td>Point: 1100 p
										<button type="button" class="btn btn-warning">교환</button>
									</td>
									<td>Point: 2000 p
										<button type="button" class="btn btn-warning">교환</button>
									</td>
								</tr>
							</tbody>
						</table>
					</fieldset>
				</article>
			</div>
		</section>
	</div>
	<footer>
		<hr>
		<%@include file="../footer.jsp"%>
	</footer>
</body>
</html>