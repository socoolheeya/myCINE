<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mycine.review.*" %>
<jsp:useBean id="reDAO" class="mycine.review.ReviewDAO"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
	margin: 0px auto;
	width: 900px;
	border-top: 3px double;
	border-spacing: 0px;
	text-align: center;
}
thead td{
	height: 50px;
	border-bottom: 3px double;
	width: 100px;
}
</style>
</head>
<body>
<%
int idx_s=Integer.parseInt(request.getParameter("idx"));
String writer=request.getParameter("writer");
String subject=request.getParameter("subject");
String content=request.getParameter("content");
int grade_s=Integer.parseInt(request.getParameter("grade"));
%>
<section>
	<article>
		<form name="reviewwrite" action="reviewUpdateWrite_ok.jsp">
		<input type="hidden" name=idx value="<%= idx_s %>">
		<table>
		<thead>
			<tr>
				<td>작성자&nbsp;&nbsp;&nbsp;<%= writer %></td>
				<td>제목&nbsp;&nbsp;&nbsp;<input type="text" name="subject" value="<%= subject %>"></td>
				<td>평점&nbsp;&nbsp;&nbsp;<input type="text" name="grade" value="<%= grade_s %>"></td>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<td colspan="2" align="right">
				<input type="reset" value="원래대로">
				<input type="submit" value="수정완료">
				</td>
			</tr>
		</tfoot>
		<tbody>
			<tr>
				<td colspan="2">
				<textarea name="content" rows="20" cols="130"><%= content.replace("\n", "<br>") %></textarea>
				</td>
			</tr>
		</tbody>
		</table>
		</form>
	</article>
</section>
</body>
</html>