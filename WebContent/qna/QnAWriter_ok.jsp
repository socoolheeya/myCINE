<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="qDTO" class="mycine.qna.QnaDTO" scope="page" /><!-- page는 한번만사용한다는의미 -->
<jsp:setProperty property="*" name="mDTO" />
<jsp:useBean id="qDAO" class="mycine.qna.QnaDAO" scope="session" />
<%
	int result = qDAO.QnAwriter(qDTO);
	String msg = result > 0 ? "질문하기 성공!" : "질문하기 실패!";
%>
<script>
	window.alert("<%=msg%>");
	self.close();
</script>