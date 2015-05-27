<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="dto" value="${requestScope.dto }"/>
<!DOCTYPE html>
<html>
<head>
<title>이벤트 교환</title>
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

<c:if test="${empty dto }">
	<script>
   	window.alert("로그인 하고 이용해주세요!")
   	location.href = "/myCINE/eventMain.do";
	</script>
</c:if>
</head>
<body>
	<%@include file="../header.jsp"%>
	<div class="row">

		<div class="col-sm-3"
			style="border: 1px solid #cccccc; margin: 10px; padding: 10px;">

			<ul>
				<li><a href="event_Main.jsp">포인트 사용안내</a></li>
				<li>상품 교환</li>
				<li><a href="event_Mypoint.jsp">내 포인트 조회</a></li>
				<li><a href="event_Myprize.jsp">내가 보유한 상품</a></li>
			</ul>

		</div>
		<div class="col-sm-7"
			style="border: 1px solid #cccccc; margin: 10px; padding: 10px;">
			<legend>
				<span class="glyphicon glyphicon-ok"></span>상품 구매
			</legend>
			<form action="/myCINE/eventExChange.do">
				<table align="center">
					<tbody>
						<tr>
							<th style="text-align: center;">CGV SET</th>
							<th style="text-align: center;">쉐이크 SET</th>
							<th style="text-align: center;">에이드 SET</th>
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
							<td>Point: 700 p
								<button type="submit" class="btn btn-warning" name="c1"
									value="700" onclick="return confirm('포인트를 사용해 결제 하시겠습니까?')">결제</button>
							</td>
							<td>Point: 800 p
								<button type="submit" class="btn btn-warning" name="c1"
									value="800" onclick="return confirm('포인트를 사용해 결제 하시겠습니까?')">결제</button>
							</td>
							<td>Point: 900 p
								<button type="submit" class="btn btn-warning" name="c1"
									value="900" onclick="return confirm('포인트를 사용해 결제 하시겠습니까?')">결제</button>
							</td>
						</tr>

						<tr>
							<td colspan="3">&nbsp;</td>
						</tr>

						<tr>
							<th style="text-align: center;">오징어 SET</th>
							<th style="text-align: center;">즉석버터구이 SET</th>
							<th style="text-align: center;">영화관람권 2매</th>
						</tr>
						<tr>
							<td><img src="/myCINE/image/squid_1000.jpg"
								title="팝콘(대)1 + 음료(중)2 + 오징어(완제품)"></td>
							<td><img src="/myCINE/image/butter_1100.jpg"
								title="팝콘(대)1 + 음료(중)2 + 즉석버터구이오징어"></td>
							<td><img src="/myCINE/image/movie_2000.jpg" title="영화관람권 2매"></td>
						</tr>
						<tr>
							<td>Point: 1000 p
								<button type="submit" class="btn btn-warning" name="c1"
									value="1000" onclick="return confirm('포인트를 사용해 결제 하시겠습니까?')">결제</button>
							</td>
							<td>Point: 1100 p
								<button type="submit" class="btn btn-warning" name="c1"
									value="1100" onclick="return confirm('포인트를 사용해 결제 하시겠습니까?')">결제</button>
							</td>
							<td>Point: 2000 p
								<button type="submit" class="btn btn-warning" name="c1"
									value="2000" onclick="return confirm('포인트를 사용해 결제 하시겠습니까?')">결제</button>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
	<footer>
		<hr>
		<%@include file="../footer.jsp"%>
	</footer>
</body>
</html>