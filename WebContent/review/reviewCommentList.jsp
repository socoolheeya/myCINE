<%@page import="mycine.reviewComment.ReviewCommentDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="rcDTO" class="mycine.reviewComment.ReviewCommentDTO" />
<jsp:useBean id="rcDAO" class="mycine.reviewComment.ReviewCommentDAO" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰게시판 댓글 리스트</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/myCINE/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="/myCINE/js/bootstrap.min.js"></script>
<style type="text/css">
#writer {
	text-align: center;
	background-color: #ffff99;
}
</style>
</head>
<%
	int contentidx = Integer.parseInt(request.getParameter("idx"));
%>
<body>

	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
			<table class="table table-bordered">
				<%
					ArrayList<ReviewCommentDTO> arr = rcDAO.getComment(contentidx);
					for (int i = 0; i < arr.size(); i++) {
				%>
				<tr style="width: 700px;">
					<td id="writer"><%=arr.get(i).getWriter_cmt()%></td>
					<td><%=arr.get(i).getContent_cmt()%><span
						style="font-size: 11px; color: #999999; padding-left: 5px;"><%=arr.get(i).getWritedate_cmt()%></span></td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
		<div class="col-sm-2"></div>
	</div>
</body>
</html>