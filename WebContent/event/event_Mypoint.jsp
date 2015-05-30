<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="id" value="${sessionScope.id }" />
<c:set var="dto" value="${requestScope.dto }" />
<!DOCTYPE html>
<html>
<head>
<title>내 포인트 조회</title>
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
</style>
<c:if test="${empty dto }">
	<script>
		window.alert("로그인 하고 이용해주세요!")
		location.href = "event_Main.jsp";
	</script>
</c:if>
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="/myCINE/js/bootstrap.min.js"></script>
<body>
	<%@include file="../header.jsp"%>
	<div class="row">
		<div class="col-sm-3"
			style="border: 1px solid #cccccc; margin: 10px; padding: 10px;">
			<ul>
				<li><a href="/myCINE/eventMain.do">포인트 사용안내</a></li>
				<li><a href="/myCINE/eventExchangeForm.do">상품 교환</a></li>
				<li>내 포인트 조회</li>
				<li><a href="/myCINE/eventMyPrize.do">내가 보유한 상품</a></li>
			</ul>
		</div>
		<div class="col-sm-7"
			style="border: 1px solid #cccccc; margin: 10px; padding: 10px;">
			<legend>
				<span class="glyphicon glyphicon-ok"></span>내 포인트 조회
			</legend>
			<h2>
				현재 <font color="#0033ff">${id }</font>님의 포인트는 <font color="red">${dto.point }P</font>
				입니다.
			</h2>
			<br>
			<p>교환 가능하신 상품 리스트</p>
			<c:if test="${empty arr }">
				<p>현재 교환 가능한 상품이 없습니다.</p>
			</c:if>
			<c:if test="${not empty arr }">
				<c:forEach var="eDTO" items="${arr }">
					<ul>
						<li>${eDTO.e_prize }</li>
					</ul>
				</c:forEach>
			</c:if>
		</div>
	</div>
	<%@include file="../footer.jsp"%>
</body>
</html>