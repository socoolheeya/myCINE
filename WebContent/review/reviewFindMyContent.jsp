<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="mycine.review.ReviewDTO"%>
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="rDTO" class="mycine.review.ReviewDTO" />
<jsp:useBean id="rDAO" class="mycine.review.ReviewDAO" />
<jsp:setProperty property="*" name="rDTO" />
<%
	int totalCnt = rDAO.getTotalCnt();//총 게시물 수
	int listSize = 15;//보여줄 리스트 수
	int pageSize = 10;//보여줄 페이지 수

	String cp_s = request.getParameter("cp");
	if (cp_s == null || cp_s.equals("")) {
		cp_s = "1";
	}

	int cp = Integer.parseInt(cp_s);

	int pageCnt = (totalCnt / listSize) + 1;//게시물 그룹의 갯수
	if (totalCnt % listSize == 0)
		pageCnt--;

	int groupNumber = cp / pageSize;//게시물 그룹의 그룹의 갯수
	if (cp % pageSize == 0)
		groupNumber--;

	String fkey = request.getParameter("fkey");
	String fvalue = request.getParameter("fvalue");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 쓴 리뷰 목록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/myCINE/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="/myCINE/js/bootstrap.min.js"></script>
</head>
<body>
	<%
		String loginID = (String) session.getAttribute("id");
		ArrayList<ReviewDTO> arr = rDAO.showMyReviewContent(loginID);
	%>
	<header>
		<%@include file="../header.jsp"%>
	</header>
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
			<div class="container">
				<h2>내글 목록</h2>
				<p style="font-size: 15px; color: gray;">내가 쓴 리뷰 리스트입니다.</p>
			</div>
		</div>
		<div class="col-sm-2"></div>
	</div>
	<hr>
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
			<%
				if (request.getMethod().equals("GET")) {
			%>
			<form name="myReviewListForm" action="reviewWrite.jsp">
				<table class="table table-hover">
					<thead>
						<tr style="background-color: #ffcc00;">
							<th>번호</th>
							<th id="subject">제목</th>
							<th>작성자</th>
							<th>등록일</th>
							<th>평점</th>
							<th>조회</th>
							<th>추천</th>
						</tr>
					</thead>
					<tfoot>
						<tr>

							<td colspan="7" align="right">
								<button class="btn btn-danger" type="button"
									onclick="history.back()">뒤로가기</button>
								<button class="btn btn-warning" type="button"
									onclick="showMyContent()">내글보기</button>
								<button class="btn btn-success" type="submit">글쓰기</button>
							</td>
						</tr>
					</tfoot>
					<tbody>
						<%
							if (arr == null || arr.size() == 0) {
						%>
						<tr>
							<td colspan="7">글이 없습니다.</td>
						</tr>
						<%
							} else {
									for (int i = 0; i < arr.size(); i++) {
						%>
						<tr>
							<td><%=arr.get(i).getIdx()%></td>
							<td><a href="reviewContent.jsp?idx=<%=arr.get(i).getIdx()%>">
									<%=arr.get(i).getSubject()%>
							</a></td>
							<%
								for (int z = 1; z <= arr.get(i).getLev(); z++) {
												out.println("&nbsp;&nbsp;");
											}
							%>
							<td><%=arr.get(i).getWriter()%></td>
							<td><%=arr.get(i).getWritedate()%></td>
							<td><%=arr.get(i).getGrade()%>
							<td><%=arr.get(i).getReadnum()%></td>
							<td style="text-align: center;"><a
								href="reviewRecommend.jsp?idx=<%=arr.get(i).getIdx()%>"
								class="btn btn-primary btn" id="recommendButton"><span
									class="glyphicon glyphicon-thumbs-up" data-toggle="tooltip"
									title="추천" id="recommend"></span><%=arr.get(i).getRecommend()%></a></td>
						</tr>
						<%
							}
						}
					}
						%>
					</tbody>
				</table>
			</form>
		</div>
		<div class="col-sm-2"></div>
	</div>
	<footer>
		<%@include file="../footer.jsp"%>
	</footer>
</body>
</html>