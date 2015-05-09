<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cDTO" class="mycine.reviewComment.ReviewCommentDTO"/>
<jsp:useBean id="cDAO" class="mycine.reviewComment.ReviewCommentDAO"/>
<jsp:setProperty property="*" name="cDTO"/>
<%
	int idx = Integer.parseInt(request.getParameter("idx")); 
	String commentID = request.getParameter("commentID");
	String comment = request.getParameter("comment");

	int result = cDAO.insertComment(idx, commentID, comment);
	if( result > 0) {
		%>
		<script>
		location.href="reviewCommentList.jsp";
		</script>
		<%
		
	}

%>
