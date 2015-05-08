<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>


<%
	String popupCk = request.getParameter("popupCheck");
	if (popupCk != null && popupCk.equals("on")) {
		Calendar now = Calendar.getInstance();
		int h = now.get(Calendar.HOUR_OF_DAY) * 60 * 60; //hour_of_day : 0~24에 대한 시간 값 반환
		int m = now.get(Calendar.MINUTE) * 60;
		int s = now.get(Calendar.SECOND);
		int sum = h + m + s;
		int h24 = 60 * 60 * 24;
		Cookie ck = new Cookie("popupCheck", "on");
		ck.setMaxAge(h24 - sum);
		response.addCookie(ck);
	}
%>
<script>
	window.self.close();
</script>