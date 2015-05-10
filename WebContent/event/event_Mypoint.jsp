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
legend{
	font-size: 30px;
}
</style>
<%	
	String id_s = (String)session.getAttribute("id");
	if (id_s == null || id_s.equals("")) {
		id_s = "0";
	}
	EventDTO dto = eDAO.event_MyPoint(id_s);
	if (dto == null) {
%>
<script>
	window.alert("로그인 하고 이용해주세요!")
	location.href = "event_Main.jsp";
</script>
<%
	return;
	}

	ArrayList<EventDTO> arr=eDAO.event_PrizeList(id_s);
%>
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="/myCINE/js/bootstrap.min.js"></script>
<body>
	<%@include file="../header.jsp"%>
	<div class="row">
		<div class="col-sm-3" style="border: 1px solid #cccccc; margin: 10px; padding: 10px;">
			<ul>
				<li><a href="event_Main.jsp">포인트 사용안내</a></li>
				<li><a href="event_Exchange.jsp">상품 교환</a></li>
				<li>내 포인트 조회</li>
				<li><a href="event_Myprize.jsp">내가 보유한 상품</a></li>
			</ul>
		</div>
		<div class="col-sm-7" style="border: 1px solid #cccccc; margin: 10px; padding: 10px;">

			<legend><span class="glyphicon glyphicon-ok"></span>내 포인트 조회</legend>
			<h2>
				현재
				<font color="#0033ff"><%=session.getAttribute("id")%></font>님의 포인트는
				<font color="red"><%=dto.getPoint()%>P</font> 입니다.
			</h2>
			<br>
			<p>교환 가능하신 상품 리스트</p>
			<%
				if(arr==null||arr.size()==0){
					out.print(arr);
				%>
				<p>현재 교환 가능한 상품이 없습니다.</p>
				<%
				}else{
					for(int i=0;i<arr.size();i++){
				%>
			<ul>
			<li><%= arr.get(i).getE_prize() %></li>
			</ul>
			<%
				}
			}
			%>
		</div>
	</div>
	<%@include file="../footer.jsp"%>
</body>
</html>