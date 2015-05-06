<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="java.util.*" %>
    <%@page import="mycine.qna.*" %> 
	<jsp:useBean id="qDAO" class="mycine.qna.QnaDAO" scope="session"/>
<!DOCTYPE html">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="/myCINE/css/mainLayout.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
</head>
<body>
	<%
	String q_subject=request.getParameter("q_subject");
	String q_ref=request.getParameter("q_ref");
	String q_lev=request.getParameter("q_lev");
	String q_sunbun=request.getParameter("q_sunbun");
	%>
	<section>
		<article>
			<h2>Q&A게시판 글작성하기</h2>
			<form name="QnAReWrite" action="QnAReWriter_ok.jsp">
				<input type="hidden" name="q_ref" value="<%=q_ref %>">
				<input type="hidden" name="q_lev" value="<%=q_lev %>">
				<input type="hidden" name="q_sunbun" value="<%=q_sunbun %>">
				<fieldset>
					<table border="1">
						<tr>
							<th>글쓴이</th>
							<td><input type="text" name="q_writer" ></td>
							<th>비번</th>
							<td><input type="password" name="q_pwd"></td>
						</tr>
						<tr>
							<th>제목</th>
							<td colspan="3"><input type="text" name="q_subject" value="Re:)<%=q_subject%>"></td>
						</tr>

						<tr>
							<td colspan="4"><textarea name="q_content" rows="10" cols="45"
									rows="5"></textarea></td>
						</tr>
						<tr>
							<td align="center" colspan="4"><input type="submit"
								value="보내기"> <input type="reset" value="다시작성"></td>
						</tr>
					</table>
				</fieldset>
			</form>
		</article>
	</section>
</body>
</html>