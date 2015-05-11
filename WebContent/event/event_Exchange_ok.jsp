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
	EventDTO dto = eDAO.event_MyPoint(id);

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
	int point = dto.getPoint();
	if ((point - usepoint) < 0) {
%>
<script>
	   window.alert("포인트가 부족합니다.")
	   location.href="event_Mypoint.jsp";
	   </script>
<%
	} else {
		int count1 = eDAO.event_SubPoint(id, usepoint);
		int count2 = eDAO.event_AddMyPrize(id, prize);

		if (count1 > 0 && count2 > 0) {
%>
<script>
   var ok=window.confirm(<%=usepoint%>+"p를 사용하여 <%=prize%>(으)로 교환되었습니다.\n보관함으로 이동하시겠습니까?");
	if (ok) {
		location.href = "event_Myprize.jsp";
	} else {
		location.href = "event_Exchange.jsp";
	}
</script>
<%
	} else {
%>
<script>
	window.alert("결제를 실패하였습니다.");
	location.href = "event_Myprize.jsp";
</script>
<%
	}
	}
%>