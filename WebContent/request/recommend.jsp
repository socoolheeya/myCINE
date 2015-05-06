<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="mycine.rboard.RequestBoardDTO"%>
<%@page import="mycine.recommend.*"%>
<jsp:useBean id="rDAO" class="mycine.rboard.RequestBoardDAO" />
<jsp:useBean id="rDTO" class="mycine.rboard.RequestBoardDTO" />
<jsp:setProperty property="*" name="rDTO" />
<jsp:useBean id="reDAO" class="mycine.recommend.RecommendDAO" />
<jsp:useBean id="reDTO" class="mycine.recommend.RecommendDTO" />
<jsp:setProperty property="*" name="reDTO" />
<%
	request.setCharacterEncoding("utf-8");
	int idx = Integer.parseInt(request.getParameter("idx"));
	String sessionID = (String)session.getAttribute("id");
	String dbID = reDAO.getRecommendID(idx);
	if(dbID != null && dbID.equals(sessionID)){
		%>
		<script>
		window.alert("이미 추천 하셨습니다.");
		location.href="requestList.jsp";
		</script>
		<%
	} else if(dbID == null || dbID.equals(sessionID) == false) {
		rDAO.recommend(idx);
		int recommend = reDAO.recommendUpdate(idx, sessionID);
		if(recommend > 0) {
			%>
			<script>
			location.href="requestList.jsp";
			</script>
			<%
		}
	}	
%>