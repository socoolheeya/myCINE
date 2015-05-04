<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="mycine.rboard.RequestBoardDTO"%>
<jsp:useBean id="rDAO" class="mycine.rboard.RequestBoardDAO" />
<jsp:useBean id="rDTO" class="mycine.rboard.RequestBoardDTO" />
<jsp:setProperty property="*" name="rDTO" />
<%
	request.setCharacterEncoding("utf-8");
	int idx = Integer.parseInt(request.getParameter("idx")); 
	int recommend = rDAO.recommend(idx);
	if(recommend > 0) {
		%>
		<script>
		location.href="requestList.jsp";
		</script>
		<%
	}
%>