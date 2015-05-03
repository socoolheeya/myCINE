<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="mycine.qna.*"%>
<jsp:useBean id="qDAO" class="mycine.qna.QnaDAO" scope="session" />
<%
	String idx_s = request.getParameter("idx");

	//첫번째 유효성검사
	if (idx_s == null || idx_s.equals("")) {
		idx_s = "0";
	}
	int q_idx = Integer.parseInt(idx_s);
	QnaDTO dto = qDAO.QnAContent(q_idx);
	//두번째 유효성검사
	if (dto == null) {
%>
<script>
	window.alert("잘못된 접근또는 삭제된 질문글 입니다");
	location.href = "/QnAList.jsp";
</script>
<%
	return;
	}
%>
<!DOCTYPE html">
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
</head>
<body>
	<section>
		<article>
			<table border="1">
				<tr>
					<th>번호</th>
					<td><%=dto.getQ_idx()%></td>
					<th>조회수</th>
					<td><%=dto.getQ_readnum()%></td>
				</tr>

				<tr>

					<th>작성자</th>
					<td><%=dto.getQ_writer()%></td>
					<th>작성날짜</th>
					<td><%=dto.getQ_writedate()%></td>
				</tr>

				<tr>
					<th>제목</th>
					<td colspan="3"><%=dto.getQ_subject()%></td>
				</tr>

				<tr height="200">
					<td colspan="4" valign="top"><%=dto.getQ_content().replace("\n", "<br>")%></td>
				</tr>

				<tr>
					<td colspan="4" align="center">목록보기|<a
						href="QnAReWrite.jsp?q_subject=<%=dto.getQ_subject()%>&q_ref=<%=dto.getQ_ref()%>&q_lev=<%=dto.getQ_lev()%>&q_sunbun=<%=dto.getQ_sunbun()%>">답변쓰기</a>
						|<a href="QnADel.jsp">삭제하기</a></td>
				</tr>
			</table>
		</article>
	</section>
</body>
</html>