<%@page import="java.util.ArrayList"%>
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
	String guestID = request.getRemoteAddr(); //사용자의 IP주소
	
	if(sessionID != null && !sessionID.equals("")) {
		//회원일 때 
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
	} else {
		//비회원일 때
		ArrayList<String> arr = reDAO.getRecommendGuestID(idx);
		for(int i = 0; i < arr.size(); i++) {
			if(dbID != null && dbID.equals(guestID)) {
				%>
				<script>
				window.alert("이미 추천 하셨습니다.");
				location.href="reviewList.jsp";
				</script>
				<%		
			} else if(dbID == null || dbID.equals(guestID) == false) {
				rDAO.recommend(idx);
				int recommend = reDAO.recommendUpdate2(idx, guestID);
				if(recommend > 0) {
					%>
					<script>
					location.href="reviewList.jsp";
					</script>
					<%
				}
			}
		}
	}	
%>