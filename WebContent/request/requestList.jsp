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
<title>영화 요청</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/myCINE/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="/myCINE/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function request() {
		location.href = "request.jsp";
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
		String ids = (String)session.getAttribute("id");
		if(ids == null || ids.equals("")) {
	%>
	<script>
		window.alert("로그인 후에 이용할 수 있습니다.");
		location.href = "/myCINE/index.jsp";
	</script>
	<%
		}
		ArrayList<RequestBoardDTO> arr = rDAO.requestList(cp, listSize);
	%>
	<%@include file="../header.jsp"%>
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
			<div class="container">
				<h2>요청 게시판</h2>
				<p>
					여기는 영화를 요청하는 게시판입니다<a href="javascript:request()"
						class="btn btn-success">요청하기<span class="glyphicon glyphicon-heart"></span></a>
				</p>	
			</div>
		</div>
		<div class="col-sm-2"></div>
	</div>
	<hr>
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
			<form role="form" name="requestList">
				<table class="table table-hover">
					<thead>
						<tr style="background-color: #ffcc00;">
							<th style="text-align: center;">번호</th>
							<th style="text-align: center;">요청내용</th>
							<th style="text-align: center;">요청날짜</th>
							<th style="text-align: center;">추천</th>
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
						<tr>
							<td style="text-align: center;"><%=arr.get(i).getIdx()%></td>
							<%
								for (int z = 1; z <= arr.get(i).getLev(); z++) {
											out.println("&nbsp;&nbsp;");
										}
							%>
							<td><%=arr.get(i).getWriter()%>님께서 <span id=requestMovieName><%=arr.get(i).getMovieName()%></span>
								영화를 요청하셨습니다.</td>
							<td style="text-align: center; font-size: 17px; color: gray;"><%=arr.get(i).getWriteDate() %></td>
							<td style="text-align: center;"><a href="recommend.jsp?idx=<%=arr.get(i).getIdx()%>"
								class="btn btn-primary btn" id="recommendButton"><span
									class="glyphicon glyphicon-thumbs-up" data-toggle="tooltip"
									title="추천" id="recommend"></span><%=arr.get(i).getRecommend()%></a></td>
						</tr>
						<%
							}
							}
						%>
						<tr>
							<td  colspan="4" align="center">
								<%
									if (groupNumber != 0) {
								%> <a
								href="requestList.jsp?cp=<%=(groupNumber - 1) * pageSize + pageSize%>">&lt;&lt;</a>
								<%
									}

									for (int i = ((groupNumber * pageSize) + 1); i <= (groupNumber * pageSize)
											+ pageSize; i++) {
								%> <a href="requestList.jsp?cp=<%=i%>"><%=i%></a>&nbsp;&nbsp;&nbsp;
								<%
									if (i == pageCnt)
											break;
									}
									if (groupNumber != ((pageCnt / pageSize) - (pageCnt % pageSize == 0 ? 1
											: 0))) {
								%> <a
								href="requestList.jsp?cp=<%=(groupNumber + 1) * pageSize + 1%>">&gt;&gt;</a>
								<%
									}
								%>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
		<div class="col-sm-2"></div>
	</div>
	<%@include file="../footer.jsp"%>
</body>
</html>