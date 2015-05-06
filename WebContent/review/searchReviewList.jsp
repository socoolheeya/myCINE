<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="mycine.review.*"%>
<jsp:useBean id="reDAO" class="mycine.review.ReviewDAO" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/myCINE/css/bootstrap.min.css">
<script type="text/javascript">
	function main() {
		location.href = "/myCINE/index.jsp";

	}
</script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="/myCINE/js/bootstrap.min.js"></script>
</head>
<body>
	<header>
		<%@include file="../header.jsp"%>
	</header>
	<div class="row" style="margin: 10px; padding: 10px;">
		<div class="col-sm-12">해당 영화의 리뷰 리스트는 다음과 같습니다.</div>
	</div>
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
			<section>
				<article>
					<form name="searchReviewlist">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>번호</th>
									<th id="subject">제목</th>
									<th>작성자</th>
									<th>등록일</th>
									<th>조회</th>
									<th>추천</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<td colspan="3" align="center">페이징</td>
									<td colspan="3" align="right"><button
											class="btn btn-primary" type="button" onclick="">내글보기</button>
										<button class="btn btn-success" type="button" onclick="main()">메인화면</button></td>
								</tr>
								<tr style="margin: 40px;">
									<td colspan="6" align="right"><select name="searchlist">
											<option value="name">작성자</option>
											<option value="subject">제목</option>
											<option value="content">내용</option>
									</select> <input type="text" name="search">
										<button class="btn btn-warning" type="button" name="search"
											onclick="">검색</button></td>
								</tr>
							</tfoot>
							<tbody>
								<%
									String requestSubject = request.getParameter("searchKeyword");
									ArrayList<ReviewDTO> arr = reDAO.reviewList();
									if (arr == null || arr.size() == 0) {
								%>
								<tr>
									<td colspan="6">글이 없습니다.</td>
								</tr>
								<%
									} else {
										for (int i = 0; i < arr.size(); i++) {
											if (arr.get(i).getSubject().contains(requestSubject)) {
								%>
								<tr>
									<td><%=arr.get(i).getIdx()%></td>
									<td><a
										href="reviewContent.jsp?idx=<%=arr.get(i).getIdx()%>"> <%=arr.get(i).getSubject()%>
									</a></td>
									<td><%=arr.get(i).getWriter()%></td>
									<td><%=arr.get(i).getWritedate()%></td>
									<td><%=arr.get(i).getReadnum()%></td>
									<td><%=arr.get(i).getRecommend()%></td>
								</tr>
								<%
									}
								}
							}
								%>
							</tbody>
						</table>
					</form>
				</article>
			</section>
		</div>
		<div class="col-sm-2"></div>
	</div>

	<footer>
		<%@ include file="../footer.jsp"%>
	</footer>
</body>
</html>