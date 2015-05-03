<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	String id_s = (String)session.getAttribute("id");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=id_s %>님의 정보 페이지</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/myCINE/css/bootstrap.min.css">
<style>
.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	width: 70%;
	margin: auto;
}
#logining{
	font-size: 12px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="/myCINE/js/bootstrap.min.js"></script>
</head>
<body>
<%@include file="../header.jsp"%>
정보를 보고 싶니? 그럼 조금만 기다리렴..
<%@include file="../footer.jsp"%>
</body>
</html>