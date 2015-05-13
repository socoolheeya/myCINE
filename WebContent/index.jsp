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
<script type="text/javascript">
function openPopup() {
	window.open("popup.jsp", "popup", "width=400 height=430 top=100 left=600");
}
</script>
</head>
<%
String login = null;
if(session.getAttribute("id") == null || session.getAttribute("id").equals("")) {
	
} else {
	login = (String)session.getAttribute("id");
}


String popupCheck = null;
Cookie cks[] = request.getCookies();
if(cks != null || cks.length != 0) {
	for(int i = 0; i < cks.length; i++) {
		if(cks[i].getName().equals("popupCheck")){
			popupCheck = cks[i].getValue();
		}
	}
} else {
	out.println("값이 없습니다.");
}

%>
<body <%= popupCheck == null ? "onload='openPopup()'":""%>>
	<header>
		<%@include file="header.jsp"%>
	</header>
	<div class="row">
		<%@ include file="center.jsp"%>
		<%
		if(login != null && login.equals("") == false) {
			%>
			<%@ include file="timeLine.jsp"%>
			<%
		}
		%>
	</div>
	<footer>
		<%@ include file="footer.jsp"%>
	</footer>
</body>
</html>