<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@page import="mycine.event.*"%>
<jsp:useBean id="eDAO" class="mycine.event.EventDAO" scope="session" />

<%
	String id = (String) session.getAttribute("id");
	String idx_s = request.getParameter("idx");
	int idx = Integer.parseInt(idx_s);
	String use = request.getParameter("use");
	if (use.equals("O")) {
%>
<script>
	window.alert("이미 사용되어 취소가 불가합니다.");
	location.href = "event_Myprize.jsp";
</script>
<%
	} else {
		String user_prize = request.getParameter("user_prize");
		EventDTO dto = eDAO.event_RePoint1(user_prize);
		int e_point = dto.getE_point();
		int count1 = eDAO.event_RePoint2(e_point, id);
		int count2 = eDAO.event_DePrize(idx);
		if (count1 > 0 && count2 > 0) {
%>
<script>
	window.alert("결제취소가 완료되었습니다.");
	location.href = "event_Myprize.jsp";
</script>
<%
	}
	}
%>
