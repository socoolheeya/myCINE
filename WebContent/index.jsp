<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<script type="text/javascript">
function openPopup() {
	window.open("/myCINE/popupForm.do", "popup", "width=400 height=430 top=100 left=600");
}
</script>
</head>
<c:set var="id" value="${sessionScope.id }"/>
<c:set var="msg" value="${sessionScope.msg }"/>
<body ${msg }>
	<header>
		<%@include file="header.jsp"%>
	</header>
	<div class="row">
		<%@ include file="center.jsp"%>
		<c:if test="${not empty id }">
			<%@ include file="timeLine.jsp"%>
		</c:if>
	</div>
	<footer>
		<%@ include file="footer.jsp"%>
	</footer>
</body>
</html>