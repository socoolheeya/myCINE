<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="mycine.review.*"%>
<jsp:useBean id="reDAO" class="mycine.review.ReviewDAO" scope="session"/>
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
ArrayList<ReviewDTO> arr=reDAO.reviewfind(cp, listSize, fkey, fvalue);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
	margin: 0px auto;
	width: 900px;
	border-top: 3px double;
	border-spacing: 0px;
	text-align: center;
}
thead th{
	width: 50px;
	height: 50px;
	border-bottom: 3px double; 
}
tbody td{
	height: 30px;
	border-bottom: 1px solid;
}
#subject{
	width: 400px;
}
</style>
<script>
function reviewFind() {
	location.href="reviewFind.jsp";
}
</script>
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
					<th>평점</th>
					<th>조회</th>
					<th>추천</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<td colspan="3" align="center">
						<%
						if(groupNumber!=0){
							%><a href="reviewFind.jsp?cp=<%=(groupNumber-1)*pageSize+pageSize%>">&lt;&lt;</a><%
						}
						%>
						<%
						for(int i=((groupNumber*pageSize)+1);i<=((groupNumber*pageSize)+pageSize);i++){
							%>
							<a href="reviewFind.jsp?cp=<%=i%>"><%=i %></a>&nbsp;&nbsp;&nbsp;
							<%
							if(i==pageCnt)break;
						}
						%>
						<%
						if(groupNumber!=((pageCnt/pageSize)
								-(pageCnt%pageSize==0?1:0))){
							%><a href="reviewFind.jsp?cp=<%=(groupNumber+1)*pageSize+1%>">&gt;&gt;</a><%
						}
						%>
					</td>
					<td colspan="4" align="right">
					<input type="button" value="내글보기" onclick="">
					<input type="submit" value="글쓰기">
					</td>
				</tr>
				<%-- 
				<tr>
					<td colspan="7" align="right">
					<select name="fkey">
						<option value="writer">작성자</option>
						<option value="subject">제목</option>
						<option value="content">내용</option>
					</select>
					<input type="text" name="fvalue">
					<input type="button" name="search" value="검색" onclick="reviewFind()"> 
					</td>
				</tr>
				--%>
			</tfoot>
			<tbody>
			<%
			if(arr==null||arr.size()==0){
				%>
				<tr>
					<td colspan="7">검색결과가 없습니다.</td>
				</tr>
					
				<%
			}else{
				for(int i=0;i<arr.size();i++){
					%>
					<tr>
						<td><%= arr.get(i).getIdx() %></td>
						<td>
						<a href="reviewContent.jsp?idx=<%= arr.get(i).getIdx() %>">
						<%= arr.get(i).getSubject() %>
						</a></td>
						<td><%= arr.get(i).getWriter() %></td>
						<td><%= arr.get(i).getWritedate() %></td>
						<td><%= arr.get(i).getGrade() %>
						<td><%= arr.get(i).getReadnum() %></td>
						<td><%= arr.get(i).getRecommend() %></td>
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