<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@page import="mycine.event.*"%>
<jsp:useBean id="eDAO" class="mycine.event.EventDAO" scope="session" />

<%
	String idx_s = request.getParameter("idx");
	int idx = Integer.parseInt(idx_s);
	String use = request.getParameter("use");
	if (use.equals("X")) {
%>
<script>
	window.alert("사용후에 삭제가 가능합니다.");
	location.href = "event_Myprize.jsp";
</script>
<%
	} else {
		int count=eDAO.event_DePrize(idx);
		if (count > 0) {
%>
<script>
	window.alert("삭제되었습니다.");
	location.href = "event_Myprize.jsp";
</script>
<%
	}
	}
%>