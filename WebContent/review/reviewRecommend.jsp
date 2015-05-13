<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="rDAO" class="mycine.review.ReviewDAO" />
<jsp:useBean id="reDAO" class="mycine.recommend.RecommendDAO" />
<%
	request.setCharacterEncoding("utf-8");
	int idx = Integer.parseInt(request.getParameter("idx"));
	String sessionID = (String)session.getAttribute("id"); //로그인 사용자의 ID
	ArrayList<String> dbIDs = reDAO.getRecommendID2(idx); //추천 버튼을 누른 ID의 목록
	String guestID = request.getRemoteAddr(); //비로그인 사용자의 ID를 대신할 IP주소
	
	if(dbIDs.size() == 0) { //추천버튼을 처음 눌렀을 때
		if(sessionID != null && !sessionID.equals("")) {
			rDAO.recommend(idx);
			int recommend = reDAO.recommendUpdate2(idx, sessionID);
			if(recommend > 0) {
				%>
				<script>
				location.href="reviewList.jsp";
				</script>
				<%
				return;
			} else {
				%>
				<script>
				location.href="reviewList.jsp";
				</script>
				<%
				return;
			}
		} else if (guestID != null && guestID.equals("")) {
			rDAO.recommend(idx);
			int recommend = reDAO.recommendUpdate2(idx, guestID);
			if(recommend > 0) {
				%>
				<script>
				location.href="reviewList.jsp";
				</script>
				<%
				return;
			} else {
				%>
				<script>
				location.href="reviewList.jsp";
				</script>
				<%
				return;
			}
		}
		return;
	} else if(dbIDs.size() > 0){ //추천버튼 2번째부터 회원인지 비회원인지 구분
		if(sessionID == null || sessionID.equals("")) { //로그인하지 않았을 떄
			if(guestID == null || guestID.equals("")) {
				%>
				<script>
				alert("알 수 없는 오류!!");
				location.href="reviewList.jsp";
				</script>
				<%
				return;
			} else { //게스트 아이디가 있는 경우
				for(int i = 0; i < dbIDs.size(); i++) {
					if(guestID.equals(dbIDs.get(i).toString())) {
						%>
						<script>
						alert("이미 추천하였습니다.");
						location.href="reviewList.jsp";
						</script>
						<%
						return;
					} else {
						rDAO.recommend(idx);
						int recommend = reDAO.recommendUpdate2(idx, guestID);
						if(recommend > 0) {
							%>
							<script>
							location.href="reviewList.jsp";
							</script>
							<%
							return;
						}
					}
				}
			}
		} else { //세션에 아이디가 있는 경우
			for(int i = 0; i < dbIDs.size(); i++) {
				if(sessionID.equals(dbIDs.get(i).toString())) {
					%>
					<script>
					alert("이미 추천하였습니다.");
					location.href="reviewList.jsp";
					</script>
					<%
					return;
				} else {
					rDAO.recommend(idx);
					int recommend = reDAO.recommendUpdate2(idx, sessionID);
					if(recommend > 0) {
						%>
						<script>
						location.href="reviewList.jsp";
						</script>
						<%
						return;
					}
				}
			}
		}
	}
%>