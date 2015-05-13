<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="mycine.rboard.RequestBoardDTO"%>
<%@page import="mycine.recommend.*"%>
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="rDAO" class="mycine.rboard.RequestBoardDAO" />
<jsp:useBean id="reDAO" class="mycine.recommend.RecommendDAO" />
<%
	request.setCharacterEncoding("utf-8");
	int idx = Integer.parseInt(request.getParameter("idx"));
	String sessionID = (String)session.getAttribute("id");
	ArrayList<String> ids = reDAO.getRecommendID(idx);
	if(ids.size() == 0 ) {
		rDAO.recommend(idx);
		int recommend = reDAO.recommendUpdate(idx, sessionID);
		if(recommend > 0) {
			%>
			<script>
			location.href="requestList.jsp";
			</script>
			<%
			return;
		}
	} else if(ids.size() > 0) {
		for(int i = 0; i < ids.size(); i++) {
			if(ids.get(i).toString() != null && (ids.get(i).toString()).equals(sessionID)){
				%>
				<script>
				window.alert("이미 추천 하셨습니다.");
				location.href="requestList.jsp";
				</script>
				<%
				return;
				
			} else {
				rDAO.recommend(idx);
				int recommend = reDAO.recommendUpdate(idx, sessionID);
				if(recommend > 0) {
					%>
					<script>
					location.href="requestList.jsp";
					</script>
					<%
					return;
				}
			}	
		}
	}
	
%>