<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</head>
<body>
<%
	String commentID = request.getParameter("commentID");
	String comment = request.getParameter("comment");
%>
	<table>
		<tr>
			<th><%=commentID %></th>
			<td><%=comment %></td>
			<td></td>
		</tr>
	</table>
</body>
</html>