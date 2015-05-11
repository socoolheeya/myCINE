<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*"%>
<%@page import="mycine.qna.*"%>
<%@page import="mycine.qna.QnaDTO"%>

<jsp:useBean id="qDAO" class="mycine.qna.QnaDAO" scope="session" />
<% 
	request.setCharacterEncoding("utf-8");
	%>
<%
String fkey_s=request.getParameter("fkey");
String fvalue_s=request.getParameter("fvalue");

int totalCnt=qDAO.getTotalCnt1(fkey_s, fvalue_s);
int listSize=10;
int pageSize=5;

String cp_s=request.getParameter("cp");
if(cp_s==null||cp_s.equals("")){
	cp_s="1";
}
int cp=Integer.parseInt(cp_s);

int pageCnt=(totalCnt/listSize)+1;
if(totalCnt%listSize==0)pageCnt--;

int groupNumber=cp/pageSize;
if(cp%pageSize==0)groupNumber--;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/myCINE/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="/myCINE/js/bootstrap.min.js"></script>
<script>
	function show() {
		window.open("QnAWrite.jsp", "QnAWrite", "width=600, height=500");
	}
</script>
</head>
<body>

<%@include file="../header.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<h2>Q&A게시판</h2>
				<form name="QnASearch" action="QnASearch.jsp">
					<p style="text-align: right">
						<select name="fkey">
							<option value="q_subject">제목</option>
							<option value="q_writer">글쓴이</option>
						</select> <input type="text" name="fvalue"> <input type="submit"
							value="검색" class="btn btn-info btn-sm">
					</p>
				</form>
				<table class="table">
					<thead>
						<tr style="background-color: #ffcc00;">
							<th style="text-align: center;">번호</th>
							<th style="text-align: center;">제목</th>
							<th style="text-align: center;">글쓴이</th>
							<th style="text-align: center;">작성날짜</th>
						</tr>
					</thead>
					<tfoot>

						<tr>
							<td colspan="3" align="center">
								<%
									if (groupNumber != 0) {
								%> <a
								href="QnASearch.jsp?cp=<%=(groupNumber - 1) * pageSize + pageSize%>"
								class="btn btn-warning">&lt;&lt;</a> <%
 	}
 	for (int i = ((groupNumber * pageSize) + 1); i <= ((groupNumber * pageSize) + pageSize); i++) {
 %> <a href="QnASearch.jsp?cp=<%=i%>" class="btn btn-warning"><%=i%></a>&nbsp;&nbsp;&nbsp;
								<%
									if (i == pageCnt)
											break;
									}
									if (groupNumber != ((pageCnt / pageSize) - (pageCnt % pageSize == 0 ? 1
											: 0))) {
								%> <a
								href="QnASearch.jsp?cp=<%=(groupNumber + 1) * pageSize + 1%>"
								class="btn btn-warning">&gt;&gt;</a> <%
 	}
 %>
							</td>
							
							<td align="center"><input type="button" value="질문하기"
								onclick="show()" class="btn btn-warning"></td>
						</tr>
					</tfoot>
					<tbody>
						<%
						String fkey=request.getParameter("fkey");
						  String fvalue=request.getParameter("fvalue");
						  ArrayList<QnaDTO> arr=qDAO.QnASearch(fkey, fvalue);
							if (arr == null || arr.size() == 0) {
						%>
						<tr>
							<td colspan="4" align="center">검색된질문이 없습니다</td>
						</tr>
						<%
							} else {
								for (int i = 0; i < arr.size(); i++) {
						%>
						<tr>
							<td style="text-align: center;"><%=arr.get(i).getQ_idx()%></td>
							<td>
								<%
									for (int z = 1; z <= arr.get(i).getQ_lev(); z++) {
												out.println("&nbsp;&nbsp;");
											}
								%> <a href="QnAContent.jsp?idx=<%=arr.get(i).getQ_idx()%>">
									<%=arr.get(i).getQ_subject()%></a>
							</td>
							<td style="text-align: center;"><%=arr.get(i).getQ_writer()%></td>
							<td align="center"><%=arr.get(i).getQ_writedate()%></td>
						</tr>
						<%
							}
							}
						%>
					</tbody>
				</table>
			</div>
			<div class="col-sm-2"></div>
		</div>
	</div>
	<footer>
		<%@include file="../footer.jsp"%>
	</footer>
</body>
</html>