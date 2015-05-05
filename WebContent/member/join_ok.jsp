<%@page import="mycine.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mDTO" class="mycine.member.MemberDTO"/>
<jsp:useBean id="mDAO" class="mycine.member.MemberDAO"/>
<jsp:setProperty property="*" name="mDTO" />
<jsp:useBean id="tDTO" class="mycine.timeline.TimeLineDTO"/>
<jsp:useBean id="tDAO" class="mycine.timeline.TimeLineDAO"/>
<jsp:setProperty property="*" name="tDTO" />

<%

	int result = mDAO.joinMember(mDTO);
	if(result > 0) {
		tDAO.addJoinEvent(mDTO);
		%>
		<script>
		location.href="joinSuccess.jsp";
		</script>
		<%
	} else {
		%>
		<script>
		window.alert("가입실패");
		location.href="join.jsp";
		</script>
		<%
	}
%>