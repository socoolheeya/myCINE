<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="reDAO" class="mycine.review.ReviewDAO" scope="session" />
<jsp:useBean id="reDTO" class="mycine.review.ReviewDTO" scope="page" />
<jsp:setProperty property="*" name="reDTO" />
<jsp:useBean id="mDAO" class="mycine.member.MemberDAO" />
<jsp:useBean id="mDTO" class="mycine.member.MemberDTO" />
<jsp:useBean id="tDAO" class="mycine.timeline.TimeLineDAO" />
<%
	String loginID = (String) session.getAttribute("id");
	int result = reDAO.reviewWrite(reDTO);
	if (result > 0) {
		if(loginID == null || loginID.equals("")) {
			%>
			<script>
			window.alert("작성 성공!");
			location.href = "reviewList.jsp";
			</script>
			<%	
			return;
		} else {
			int count = mDAO.addReviewPoint(loginID);
			if(count > 0) {
				tDAO.addReviewWriteEvent(loginID);
				%>
				<script>
				window.alert("작성 성공!");
				location.href = "reviewList.jsp";
				</script>
				<%
				return;
			}
		}
	} else {
%>
<script>
	window.alert("작성 실패!");
	location.href = "reviewList.jsp";
</script>
<%
	}
%>
