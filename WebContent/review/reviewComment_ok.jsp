<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cDTO" class="mycine.reviewComment.ReviewCommentDTO"/>
<jsp:useBean id="cDAO" class="mycine.reviewComment.ReviewCommentDAO"/>
<jsp:setProperty property="*" name="cDTO"/>
<%
	String idx_s = request.getParameter("idx");
	int idx = Integer.parseInt(idx_s);
	String commentID = request.getParameter("writer_cmt");
	String comment = request.getParameter("content_cmt");

	int result = cDAO.insertComment(idx, commentID, comment);
	if( result > 0) {
		%>
		<script>
		location.href="reviewContent.jsp?idx=<%=idx_s%>";
		</script>
		<%
		
	}

%>
