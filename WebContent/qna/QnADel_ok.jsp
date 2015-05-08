<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="qDTO" class="mycine.qna.QnaDTO" scope="page" />
<jsp:setProperty property="*" name="qDTO" />
<jsp:useBean id="qDAO" class="mycine.qna.QnaDAO" scope="session" />
<%
	int result = qDAO.QnADel(qDTO);
	String q_idx = request.getParameter("q_idx");
	if (result > 0) {
%><script>
	window.alert("삭제되었습니다!");
	location.href="QnAList.jsp";
	</script>
<%
	} else {
%>
<script>
	window.alert("비밀번호가 틀렸습니다! 다시입력해주세요");
	location.href="QnADel.jsp?q_idx=<%=q_idx%>";
</script>
<%
	}
%>
