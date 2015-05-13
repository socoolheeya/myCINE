<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@page import="mycine.event.*"%>
<jsp:useBean id="eDAO" class="mycine.event.EventDAO" scope="session" />

<%
	String idx_s = request.getParameter("idx");
	int idx = Integer.parseInt(idx_s);
	String use = request.getParameter("use");
	if (use.equals("O")) {
%>
<script>
	window.alert("이미 사용되었습니다.");
	location.href = "event_Myprize.jsp";
</script>
<%
	} else {
		int count=eDAO.event_UsePrize(idx);
		if (count > 0) {
%>
<script>
	window.alert("교환권 사용이 완료되었습니다.");
	location.href = "event_Myprize.jsp";
</script>
<%
	}
	}
%>