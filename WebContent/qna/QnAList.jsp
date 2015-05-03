<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="mycine.qna.*"%>
<%@page import="mycine.qna.QnaDTO"%>
<jsp:useBean id="mDAO" class="mycine.qna.QnaDAO" scope="session" />
<%
	int totalCnt = mDAO.getTotalCnt();
	int listSize = 10;
	int pageSize = 5;

	String cp_s = request.getParameter("cp");
	if (cp_s == null || cp_s.equals("")) {
		cp_s = "1";
	}
	int cp = Integer.parseInt(cp_s);

	int pageCnt = (totalCnt / listSize) + 1;
	if (totalCnt % listSize == 0)
		pageCnt--;

	int groupNumber = cp / pageSize;
	if (cp % pageSize == 0)
		groupNumber--;
%>
<!DOCTYPE html">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myCINE/css/mainLayout.css">
</head>
<body>
	<h2>Q&A게시판</h2>

	<section>
		<article>
			<fieldset>
				<table border="1">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>글쓴이</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tfoot>

						<tr>
							<td colspan="3">
								<%
									if (groupNumber != 0) {
								%><a
								href="QnAList.jsp?cp=<%=(groupNumber - 1) * pageSize + pageSize%>">&lt;&lt;</a>
								<%
									}
								%> <%
 	for (int i = ((groupNumber * pageSize) + 1); i <= ((groupNumber * pageSize) + pageSize); i++) {
 %> <a href="QnAList.jsp?cp=<%=i%>"><%=i%></a>&nbsp;&nbsp;&nbsp; <%
 	if (i == pageCnt)
 			break;
 	}
 %> <%
 	if (groupNumber != ((pageCnt / pageSize) - (pageCnt % pageSize == 0 ? 1
 			: 0))) {
 %><a href="QnAList.jsp?cp=<%=(groupNumber + 1) * pageSize + 1%>">&gt;&gt;</a>
								<%
									}
								%>
							</td>
							<td><a href="QnAWrite.jsp">질문하기</a></td>
						</tr>
					</tfoot>
					<tbody>
						<%
							ArrayList<QnaDTO> arr = mDAO.QnAList(cp, listSize);
							if (arr == null || arr.size() == 0) {
						%>
						<tr>
							<td colspan="4" align="center">등록된질문이 없습니다</td>
						</tr>
						<%
							} else {
								for (int i = 0; i < arr.size(); i++) {
						%>
						<tr>
							<td><%=arr.get(i).getQ_idx()%></td>
							<td align="left">
								<%
									for (int z = 1; z <= arr.get(i).getQ_lev(); z++) {
												out.println("&nbsp;&nbsp;");
											}
								%> <a href="QnAContent.jsp?idx=<%=arr.get(i).getQ_idx()%>">
									<%=arr.get(i).getQ_subject()%></a>
							</td>
							<td><%=arr.get(i).getQ_writer()%></td>
							<td><%=arr.get(i).getQ_readnum()%></td>
						</tr>
						<%
							}
						}
						%>
					</tbody>
				</table>
			</fieldset>
		</article>
	</section>
</body>
</html>