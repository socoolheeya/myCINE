<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="mycine.review.*"%>
<jsp:useBean id="reDAO" class="mycine.review.ReviewDAO" scope="session" />
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 검색</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/myCINE/css/bootstrap.min.css">
<%
	String fkey=request.getParameter("fkey");
String fvalue=request.getParameter("fvalue");

int totalCnt=reDAO.getFindTotalCnt(fkey, fvalue);//총 게시물 수
int listSize=5;//보여줄 리스트 수
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

ArrayList<ReviewDTO> arrfind=reDAO.reviewFind(cp, listSize, fkey, fvalue);
%>
<script>
	function reviewWrite() {
		location.href = "reviewWrite.jsp"
	}
	function showMyContent() {
		location.href="reviewFindMyContent.jsp";
	}
</script>
<style type="text/css">
#title {
	background-color: #ffcc00;
}
</style>
</head>
<body>
	<header>
		<%@include file="../header.jsp"%>
	</header>
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
			<div class="container">
				<h2>리뷰검색결과</h2>
				<p style="font-size: 15px; color: gray;">리뷰 검색을 위한 공간</p>
			</div>
		</div>
		<div class="col-sm-2"></div>
	</div>
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
			<form name="reviewFind"
				action="reviewFind.jsp?cp=<%=cp%>&fkey=<%=fkey%>&fvalue=<%=fvalue%>">
				<table class="table table-stripe">
					<thead id="title">
						<tr>
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
							<td colspan="3" align="center">
								<%
									if (groupNumber != 0) {
								%><a
								href="reviewFind.jsp?cp=<%=(groupNumber - 1) * pageSize + pageSize%>&fkey=<%=fkey%>&fvalue=<%=fvalue%>">&lt;&lt;</a>
								<%
									}

									for (int i = ((groupNumber * pageSize) + 1); i <= ((groupNumber * pageSize) + pageSize); i++) {
								%> <a
								href="reviewFind.jsp?cp=<%=i%>&fkey=<%=fkey%>&fvalue=<%=fvalue%>"><%=i%></a>&nbsp;&nbsp;&nbsp;
								<%
									if (i == pageCnt)
											break;
									}

									if (groupNumber != ((pageCnt / pageSize) - (pageCnt % pageSize == 0 ? 1
											: 0))) {
								%><a
								href="reviewFind.jsp?cp=<%=(groupNumber + 1) * pageSize + 1%>&fkey=<%=fkey%>&fvalue=<%=fvalue%>">&gt;&gt;</a>
								<%
									}
								%>
							</td>
							<td colspan="4" align="right">
								<button class="btn btn-danger" type="button" onclick="history.back()">뒤로가기</button>
								<button class="btn btn-warning" type="button" onclick="showMyContent()">내글보기</button> 
								<button class="btn btn-success" type="button" onclick="reviewWrite()">글쓰기</button></td>
						</tr>
						<tr>
							<td colspan="7" align="right"><select name="fkey">
									<option value="writer">작성자</option>
									<option value="subject">제목</option>
									<option value="content">내용</option>
							</select> <input type="text" name="fvalue" value="<%=fvalue%>"> <input
								type="submit" value="검색"></td>
						</tr>
					</tfoot>
					<tbody>
						<%
							if (arrfind == null || arrfind.size() == 0) {
						%>
						<tr>
							<td colspan="7">검색결과가 없습니다.</td>
						</tr>
						<%
							} else {
								for (int i = 0; i < arrfind.size(); i++) {
						%>
						<tr>
							<td><%=arrfind.get(i).getIdx()%></td>
							<td><a
								href="reviewContent.jsp?idx=<%=arrfind.get(i).getIdx()%>"> <%=arrfind.get(i).getSubject()%>
							</a></td>
							<td><%=arrfind.get(i).getWriter()%></td>
							<td><%=arrfind.get(i).getWritedate()%></td>
							<td><%=arrfind.get(i).getGrade()%></td>
							<td><%=arrfind.get(i).getReadnum()%></td>
							<td><%=arrfind.get(i).getRecommend()%></td>
						</tr>
						<%
							}
							}
						%>
					</tbody>
				</table>
			</form>
		</div>
		<div class="col-sm-2"></div>
	</div>

	<header>
		<%@include file="../footer.jsp"%>
	</header>
</body>
</html>