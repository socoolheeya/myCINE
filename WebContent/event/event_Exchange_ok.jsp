<%@page import="mycine.event.EventDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="eDAO" class="mycine.event.EventDAO" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = (String) session.getAttribute("id");
		int usepoint = Integer.parseInt(request.getParameter("c1"));
		int result = eDAO.updatePoint(id, usepoint);
		out.println("id: " + id);
		out.println("userpoint: " + usepoint);
		out.println("result: " + result);
		if (result > 0) {
	%>
	<script>
		window.alert("차감성공");
		location.href = "event_Myprize.jsp";
	</script>
	<%
		} else {
	%>
	<script>
		window.alert("차감실패");
		location.href = "event_Exchange.jsp";
	</script>
	<%
		}
	%>
</body>
</html>