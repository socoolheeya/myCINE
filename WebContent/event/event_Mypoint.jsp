<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@page import="mycine.event.*"%>
<jsp:useBean id="eDAO" class="mycine.event.EventDAO" scope="session" />
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
</style>
<%	
	String id_s = (String)session.getAttribute("id");
	if (id_s == null || id_s.equals("")) {
		id_s = "0";
	}
	EventDTO dto = eDAO.eventMypoint(id_s);
	if (dto == null) {
%>
<script>
	window.alert("로그인 하고 이용해주세요!")
	location.href = "event_Main.jsp";
</script>
<%
	return;
	}
%>
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="/myCINE/js/bootstrap.min.js"></script>
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
							<li>내 포인트 조회</li>
							<li><a href="event_Myprize.jsp">내가 보유한 상품</a></li>
						</ul>
					</fieldset>
				</article>
			</div>
			<div class="col-sm-8">
				<article>
					<fieldset>
						<legend>내 포인트 조회</legend>
						<h2>
							현재
							<%=session.getAttribute("id")%>고객님의 포인트는
							<%=dto.getPoint()%>p 입니다.
						</h2>
						<p>교환 가능하신 상품은 어쩌구,저쩌구 입니다.</p>
					</fieldset>
				</article>
			</div>
		</section>
	</div>
	<%@include file="../footer.jsp"%>
</body>
</html>