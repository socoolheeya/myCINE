<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="qDTO" class="mycine.qna.QnaDTO" scope="page" /><!-- page는 한번만사용한다는의미 -->
<jsp:setProperty property="*" name="qDTO" />
<jsp:useBean id="qDAO" class="mycine.qna.QnaDAO" scope="session" />
<%
	String writer=(String)session.getAttribute("id");
	int result = qDAO.QnAReWrite(qDTO ,writer);
	String msg = result > 0 ? "답글달기 성공!" : "답글달기 실패!";
%>
<script>
window.alert("<%=msg%>");
location.href="QnAList.jsp"
</script>