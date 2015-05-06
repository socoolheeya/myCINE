<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@page import="mycine.event.*"%>
<jsp:useBean id="eDAO" class="mycine.event.EventDAO" scope="session" />
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
legend{
	font-size: 30px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="/myCINE/js/bootstrap.min.js"></script>
<%
	String id_s = (String)session.getAttribute("id");
	if (id_s == null || id_s.equals("")) {
		id_s = "0";
	}
	EventDTO dto1 = eDAO.eventMypoint(id_s);
	if (dto1 == null) {
%>
<script>
	window.alert("로그인 하고 이용해주세요!")
	location.href = "event_Main.jsp";
</script>
<%
	return;
	}
	ArrayList<EventDTO> arr = eDAO.prizeList(id_s);
%>
</head>
<body>
	<%@include file="../header.jsp"%>
	<div class="row">
		<div class="col-sm-3"
			style="border: 1px solid #cccccc; margin: 10px; padding: 10px;">
			<ul>
				<li><a href="event_Main.jsp">포인트 사용안내</a></li>
				<li><a href="event_Exchange.jsp">상품 교환</a></li>
				<li><a href="event_Mypoint.jsp?idx=2">내 포인트 조회</a></li>
				<li>내가 보유한 상품</li>
			</ul>
		</div>
		<div class="col-sm-7"
			style="border: 1px solid #cccccc; margin: 10px; padding: 10px;">
			<legend><span class="glyphicon glyphicon-ok"></span>내가 보유한 상품</legend>
			<table>
				<thead>
					<tr>
						<th>상품명</th>
						<th>사용여부</th>
						<th>&nbsp;</th>
					</tr>
				</thead>

				<tbody>
					<%
						for (int i = 0; i < arr.size(); i++) {
							if (arr == null || arr.equals("")) {
					%>
					<tr>
						<td colspan="3">현재 보유한 상품이 없습니다.</td>
					</tr>
					<%
						} else {
					%>
					<tr>
						<td><%=arr.get(i).getUser_prize()%></td>
						<td>x</td>
						<td><input type="submit" value="수령" name="ex<%=i+1%>"></td>
					</tr>
					<%
						}
					}
					%>
				</tbody>
			</table>
		</div>
	</div>
	<%@include file="../footer.jsp"%>
</body>
</html>