<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.*"%>
<%@ page import="mycine.review.*"%>
<jsp:useBean id="reDAO" class="mycine.review.ReviewDAO" scope="session" />
<jsp:useBean id="rcDAO" class="mycine.reviewComment.ReviewCommentDAO" />
<%
	
	int totalCnt=reDAO.getTotalCnt();//총 게시물 수
	int listSize=15;//보여줄 리스트 수
	int pageSize=10;//보여줄 페이지 수
	String cp_s=request.getParameter("cp");
	if(cp_s==null||cp_s.equals("")){
		cp_s="1";
	}
int cp=Integer.parseInt(cp_s);

int pageCnt=(totalCnt/listSize)+1;//게시물 그룹의 갯수
if(totalCnt%listSize==0)pageCnt--;

int groupNumber=cp/pageSize;//게시물 그룹의 그룹의 갯수
if(cp%pageSize==0)groupNumber--;

String fkey=request.getParameter("fkey");
String fvalue=request.getParameter("fvalue");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 게시판</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/myCINE/css/bootstrap.min.css">
<script>
	function reviewFind() {
		document.reviewSearchForm.action = "reviewFind.jsp";
		document.reviewSearchForm.submit();
	}
	function showMyContent() {
		location.href = "reviewFindMyContent.jsp";
	}
</script>
<style type="text/css">
#searchForm {
	padding: 10px;
	text-align: right;
}
#commentCount {
	color: #003366;
	font-size: 11px;
	padding-left: 10px;	
}
#writeDate {
	font-size: 12px;
}
#ab {
	font-size: 12px;
	text-align: center;
}
#buttonG {
}
#title {
	background-color: #ffcc00;
	
}
</style>
</head>
<body>
	<%
		ArrayList<ReviewDTO> arr = reDAO.reviewList(cp, listSize);
	%>
	<header>
		<%@include file="../header.jsp"%>
	</header>
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
			<div class="container">
				<h2>리뷰 게시판</h2>
				<p style="font-size: 15px; color: gray;">여기는 영화를 요청하는 게시판입니다</p>
			</div>
		</div>
		<div class="col-sm-2"></div>
	</div>
	<hr>
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
			<form name="reviewSearchForm" id="searchForm">
				<select name="fkey">
					<option value="writer">작성자</option>
					<option value="subject">제목</option>
					<option value="content">내용</option>
				</select> <input type="text" name="fvalue">
				<button class="btn btn-info" type="submit"
					onclick="javascript:reviewFind()">
					<span class="glyphicon glyphicon-search"></span>검색
				</button>
			</form>
			<%
				if (request.getMethod().equals("GET")) {
			%>
			<form name="reviewlist" action="reviewWrite.jsp">
				<table class="table table-hover">
					<thead>
						<tr id="title">
							<th id="ab">번호</th>
							<th id="ab">제목</th>
							<th id="ab">작성자</th>
							<th id="ab">등록일</th>
							<th id="ab">평점</th>
							<th id="ab">조회</th>
							<th id="ab">추천</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<td colspan="2" align="center">
								<%
									if (groupNumber != 0) {
								%><a
								href="reviewList.jsp?cp=<%=(groupNumber - 1) * pageSize + pageSize%>">&lt;&lt;</a>
								<%
									}
										for (int i = ((groupNumber * pageSize) + 1); i <= ((groupNumber * pageSize) + pageSize); i++) {
								%> <a href="reviewList.jsp?cp=<%=i%>"><%=i%></a>&nbsp;&nbsp;&nbsp;
								<%
									if (i == pageCnt)
												break;
										}
										if (groupNumber != ((pageCnt / pageSize) - (pageCnt % pageSize == 0 ? 1
												: 0))) {
								%> <a
								href="reviewList.jsp?cp=<%=(groupNumber + 1) * pageSize + 1%>">&gt;&gt;</a>
								<%
									}
								%>
							</td>

							<td id="buttonG" colspan="5" align="right">
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
							<%
								int commentCount = rcDAO.getCommentCount(arr.get(i).getIdx());
							%>
							<td><a href="reviewContent.jsp?idx=<%=arr.get(i).getIdx()%>">
									<%=arr.get(i).getSubject()%><span id="commentCount">[<%=commentCount %>]</span>
							</a></td>
							<%
								for (int z = 1; z <= arr.get(i).getLev(); z++) {
												out.println("&nbsp;&nbsp;");
											}
							%>
							<td><%=arr.get(i).getWriter()%></td>
							<td id="writeDate"><%=arr.get(i).getWritedate()%></td>
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
						%>
					</tbody>
				</table>
			</form>
			<%
				} else {
			%>
			<jsp:include page="reviewFind.jsp" />
			<%
				}
			%>

		</div>
		<div class="col-sm-2"></div>
	</div>
	<header>
		<%@include file="../footer.jsp"%>
	</header>
</body>
</html>