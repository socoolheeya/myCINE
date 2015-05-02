<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@page import="mycine.rboard.RequestBoardDTO"%>
<jsp:useBean id="rDAO" class="mycine.rboard.RequestBoardDAO" />
<jsp:useBean id="rDTO" class="mycine.rboard.RequestBoardDTO" />
<jsp:setProperty property="*" name="rDTO" />
<%
	int totalCnt = rDAO.getTotalCnt(); //총 게시글 수
	int listSize = 10; //보여줄 리스트의 수
	int pageSize = 5; //보여줄 페이지의 수

	String cp_s = request.getParameter("cp");
	if (cp_s == null || cp_s.equals("")) {
		cp_s = "1";
	}

	int cp = Integer.parseInt(cp_s); //현재 페이지

	int pageCnt = (totalCnt / listSize) + 1;
	if (totalCnt % listSize == 0) {
		pageCnt--;
	}

	int groupNumber = cp / pageSize;
	if (cp % pageSize == 0) {
		groupNumber--;
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Case</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/myCINE/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="/myCINE/js/bootstrap.min.js"></script>
<script type="text/javascript">
function request(){
	window.open("request.jsp", "request", "width=500 height=300");
}
</script>
<style>
.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	width: 70%;
	margin: auto;
}
</style>
</head>
<body>
	<%
	String movieName = request.getParameter("moviename");
		ArrayList<RequestBoardDTO> arr = rDAO.requestList(cp, listSize);
	%>
	<%@include file="../header.jsp"%>
	<div class="row">
		<div class="col-sm-12">
			<div class="container">
				<h2>요청 게시판</h2>
				<p>여기는 영화를 요청하는 게시판입니다.<a href="javascript:request()">요청하기</a></p>
				<form role="form" name="requestListForm">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>번호</th>
								<th>요청내용</th>
							</tr>
						</thead>
						<tbody>
							<%
								if (arr == null || arr.size() == 0) {
							%>
							<tr class="danger">
								<td colspan="4" align="center">아직 요청한 영화가 없습니다.</td>
							</tr>
							<%
								} else {
									for (int i = 0; i < arr.size(); i++) {
							%>
							<tr class="info">
								<td><%=arr.get(i).getIdx()%></td>
								<td><%=session.getAttribute("id")%>님께서 영화 <%=movieName%>을
									요청하셨습니다.</td>
							</tr>
							<%
								}
							}
							%>
							<tr class="info">
								<td>1</td>
								<td>Doe 님께서 영화 <%=movieName %>를 요청하였습니다.</td>
							</tr>
							<tr class="info">
								<td>2</td>
								<td>lwh0102 님께서 영화 타이타닉를 요청하였습니다.</td>
							</tr>
							<tr class="info">
								<td>3</td>
								<td>나는자바왕 님께서 영화 벤허를 요청하였습니다.</td>
							</tr>
								<tr class="info">
								<td>3</td>
								<td>나는자바왕 님께서 영화 <input type="text" name="moviename">를 요청하였습니다.</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>
		<div class="col-sm-2"></div>
	</div>
	<%@include file="../footer.jsp"%>
</body>
</html>