<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="mycine.review.*"%>
<jsp:useBean id="reDAO" class="mycine.review.ReviewDAO" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 리스트</title>
<script type="text/javascript">
	function main() {
		location.href = "/myCINE/index.jsp";

	}
</script>
<style>
table {
	margin: 0px auto;
	width: 900px;
	border-top: 3px double;
	border-spacing: 0px;
	text-align: center;
}

thead th {
	width: 50px;
	height: 50px;
	border-bottom: 3px double;
}

tbody td {
	height: 30px;
	border-bottom: 1px solid;
}

#subject {
	width: 400px;
}
</style>
</head>
<body>
	<section>
		<article>
			<form name="reviewlist" action="reviewWrite.jsp">
				<table>
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
							<td colspan="3" align="right"><input type="button"
								value="내글보기" onclick=""> <input type="submit"
								value="글쓰기"> <input type="button" value="메인화면으로가기"
								onclick="main()"></td>
						</tr>
						<tr>
							<td colspan="6" align="right"><select name="searchlist">
									<option value="name">작성자</option>
									<option value="subject">제목</option>
									<option value="content">내용</option>
							</select> <input type="text" name="search"> <input type="button"
								name="search" value="검색" onclick=""></td>
						</tr>
					</tfoot>
					<tbody>
						<%
							ArrayList<ReviewDTO> arr = reDAO.reviewList();
							if (arr == null || arr.size() == 0) {
						%>
						<tr>
							<td colspan="6">글이 없습니다.</td>
						</tr>
						<%
							} else {
								for (int i = 0; i < arr.size(); i++) {
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
						%>
					</tbody>
				</table>
			</form>
		</article>
	</section>
</body>
</html>