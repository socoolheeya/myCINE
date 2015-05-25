<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="mycine.movie.*"%>
<jsp:useBean id="mDAO" class="mycine.movie.model.MovieDAO" />
<jsp:useBean id="mDTO" class="mycine.movie.model.MovieDTO" />
<jsp:setProperty property="*" name="mDTO" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/myCINE/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="/myCINE/js/bootstrap.min.js"></script>
</head>
<body>
	<header>
		<%@include file="../header.jsp"%>
	
	</header>
	<div class="row" style="margin: 10px; padding: 10px;">
		<div class="col-sm-12">검색된 영화는 다음과 같습니다.</div>
	</div>
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10">
			<%
				String searchKeyword = request.getParameter("searchKeyword");
				mDTO = mDAO.search(searchKeyword);
			%>


			<%
				if (mDTO == null || mDTO.equals("")) {
			%>
			<script>
				window.alert("검색결과 없음!");
				location.href = "/myCINE/index.jsp";
			</script>
			<%
				} else {
			%>

			<table class="table table-striped">
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
					<td><%=mDTO.getIdx()%></td>
					<td><a
						href="/myCINE/review/searchReviewList.jsp?searchKeyword=<%=mDTO.getSubject()%>"><%=mDTO.getSubject()%></a></td>
					<td><%=mDTO.getDirector()%></td>
					<td><%=mDTO.getActor()%></td>
					<td><%=mDTO.getPlayTime()%></td>
					<td><%=mDTO.getOpenDate()%></td>
				</tr>
			</table>
			<%
				}
			%>
		</div>
		<div class="col-sm-1"></div>
	</div>

	<footer>
		<%@ include file="../footer.jsp"%>
	</footer>
</body>
</html>