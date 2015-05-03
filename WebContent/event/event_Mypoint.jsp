<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@page import="mycine.event.*"%>
<jsp:useBean id="eDAO" class="mycine.event.EventDAO" scope="session" />
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
</style>
<%	
	//String id_p = (String)session.getAttribute("id");
	String idx_s = request.getParameter("idx");
	if (idx_s == null || idx_s.equals("")) {
		idx_s = "0";
	}
	int idx = Integer.parseInt(idx_s);
	EventDTO dto = eDAO.eventMypoint(idx);
	if (dto == null) {
%>
<script>
	window.alert("잘못된접근 또는 삭제된 게시글입니다.")
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
				<article id="eventMain_rigth">
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