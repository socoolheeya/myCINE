<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mycine.review.*" %>
<jsp:useBean id="reDAO" class="mycine.review.ReviewDAO"/>
<%
String idx_s=request.getParameter("idx");
//첫번째 유효성 검사
if(idx_s==null||idx_s.equals("")){
	idx_s="0";
}
int idx=Integer.parseInt(idx_s);
ReviewDTO redto=reDAO.reviewContent(idx);
//두번째 유효성 검사
if(redto==null){
	%>
	<script>
	window.alert("잘못된 접근입니다.");
	location.href="reviewList.jsp";
	</script>
	<%
	return;
}
reDAO.getReadnum(idx);
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
thead{
	
}
thead th{
	width: 100px;
	height: 50px;
	border-bottom: 2px double;
}
#subject{
	height: 200px;
}
</style>
<script>
function reviewDel(){
	window.open("reviewDel.jsp?idx=<%=idx%>","reviewDel","width=350,height=200;");
}
</script>
</head>
<body>
<section>
	<article>
	<table>
		<thead>
			<tr>
				<th>작성자</th>
				<th><%= redto.getWriter() %></th>
				<th><%= redto.getWritedate() %></th>
				<th>조회:<%= redto.getReadnum() %></th>
				<th>추천:<%= redto.getRecommend() %></th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<td colspan="5" align="right">
				|&nbsp;&nbsp;
				<a href="reviewList.jsp">목록으로</a>
				&nbsp;&nbsp;|&nbsp;&nbsp;
				<a href="reviewUpdateWrite.jsp?idx=<%=redto.getIdx()%>&writer=<%=redto.getWriter()%>
				&pwd=<%=redto.getWritedate()%>&subject=<%=redto.getSubject()%>
				&content=<%=redto.getContent()%>&grade=<%=redto.getGrade()%>">수정하기</a>
				&nbsp;&nbsp;|&nbsp;&nbsp;
				<a href="javascript:reviewDel()">삭제하기</a>
				&nbsp;&nbsp;|&nbsp;&nbsp;
				<a href=#>추천하기</a>
				&nbsp;&nbsp;|
				</td>
			</tr>
			
		</tfoot>
		<tbody>
			<tr>
				<td></td>
				<td colspan="3" align="left" id="subject">
				<%= redto.getSubject() %>
				</td>
				<td>
				이 영화의<br>
				평점은&nbsp;&nbsp;<%= redto.getGrade() %>&nbsp;&nbsp;점
				</td>
			</tr>
			<tr>
				<td></td>
				<td colspan="3" align="left">
				<%= redto.getContent().replace("\n", "<br>") %>
				</td>
				<td></td>
			</tr>
		</tbody>
	</table>
	</article>
</section>
<%@include file="reviewComment.jsp"  %>
</body>
</html>