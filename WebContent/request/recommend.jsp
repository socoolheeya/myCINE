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
	String id = request.getParameter("id");
	ArrayList<RecommendDTO> arr = reDAO.getRecommendID(idx, id);
	
	if(arr == null || arr.size() == 0) {
		int count = reDAO.recommendUpdate(idx, id);
		if(count > 0) {
			rDAO.recommend(idx);
			%>
			<script>
			window.alert("추천되었습니다.");
		    location.href="requestList.jsp";
			</script>
			<%
		}
	} else {
		%>
		<script>
		window.alert("이미 추천되었습니다.");
		location.href="requestList.jsp";
		</script>
		<%
	}
	
%>