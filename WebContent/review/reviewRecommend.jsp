<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="mycine.rboard.RequestBoardDTO"%>
<%@page import="mycine.recommend.*"%>
<jsp:useBean id="rDAO" class="mycine.review.ReviewDAO" />
<jsp:useBean id="reDAO" class="mycine.recommend.RecommendDAO" />
<%
	request.setCharacterEncoding("utf-8");
	int idx = Integer.parseInt(request.getParameter("idx"));
	String sessionID = (String)session.getAttribute("id");
	String dbID = reDAO.getRecommendID2(idx);
	if(dbID != null && dbID.equals(sessionID)){
		%>
		<script>
		window.alert("이미 추천 하셨습니다.");
		location.href="reviewList.jsp";
		</script>
		<%
	} else if(dbID == null || dbID.equals(sessionID) == false) {
		rDAO.recommend(idx);
		int recommend = reDAO.recommendUpdate2(idx, sessionID);
		if(recommend > 0) {
			%>
			<script>
			location.href="reviewList.jsp";
			</script>
			<%
		}
	}	
%>