<%@page import="oracle.net.aso.e"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@page import="mycine.event.*"%>
<jsp:useBean id="eDAO" class="mycine.event.EventDAO" scope="session" />

<%
	String id = (String) session.getAttribute("id");
	String num_s = request.getParameter("c1");
	int num = Integer.parseInt(num_s);
	int usepoint = 0;
	String prize = null;
	switch (num) {
		case 700 :
			usepoint = 700;
			prize = "CGV SET 교환권";
			break;
		case 800 :
			usepoint = 800;
			prize = "쉐이크 SET 교환권";
			break;
		case 900 :
			usepoint = 900;
			prize = "에이드 SET 교환권";
			break;
		case 1000 :
			usepoint = 1000;
			prize = "오징어 SET 교환권";
			break;
		case 1100 :
			usepoint = 1100;
			prize = "즉석버터구이 SET 교환권";
			break;
		case 2000 :
			usepoint = 2000;
			prize = "영화관람권 2매";
			break;
	}
	int count1 = eDAO.updatePoint(id, usepoint);
	int count2 = eDAO.insertPrize(id, prize);

	if (count1 > 0 && count2 > 0) {
%>
<script>
	window.alert(
<%=usepoint%>
	+ "p가 차감되었습니다.");
	location.href = "event_Myprize.jsp";
</script>
<%
	} else {
%>
<script>
	window.alert("결제가 실패되었습니다.");
	location.href = "event_Myprize.jsp";
</script>
<%
	}
%>