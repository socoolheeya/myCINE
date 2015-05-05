<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="mycine.movie.*"%>
<jsp:useBean id="mDAO" class="mycine.movie.MovieDAO" />
<jsp:useBean id="mDTO" class="mycine.movie.MovieDTO" />
<jsp:setProperty property="*" name="mDTO" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%	
	String search = request.getParameter("search");
	mDTO = mDAO.search(search);
	%>


	<%
	if(mDTO == null || mDTO.equals("")) {
		%>
	<script>
		window.alert("검색결과 없음!");
		location.href="/myCINE/index.jsp";
		</script>
	<%
	} else {
		%>
	<table>
		<thead>
		<tr>
			<td>번호</td>
			<td>영화제목</td>
			<td>감독</td>
			<td>배우</td>
			<td>상영시간</td>
			<td>개봉일</td>
		</tr>
		</thead>
		<tr>
			<td><%=mDTO.getIdx() %></td>
			<td><%=mDTO.getSubject() %></td>
			<td><%=mDTO.getDirector() %></td>
			<td><%=mDTO.getActor() %></td>
			<td><%=mDTO.getPlayTime() %></td>
			<td><%=mDTO.getOpenDate() %></td>
		</tr>
	</table>
	<%
		 
	}
%>
</body>
</html>