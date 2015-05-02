<%@page import="mycine.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mDTO" class="mycine.member.MemberDTO"/>
<jsp:useBean id="mDAO" class="mycine.member.MemberDAO"/>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	String email = request.getParameter("email1")+"@"+request.getParameter("email2");
	String tel = request.getParameter("tel");
	String birthday = request.getParameter("year")+"/"+request.getParameter("month")+"/"+request.getParameter("day");
	String addr = request.getParameter("addr")+" "+request.getParameter("addr2");
	MemberDTO mdto = new MemberDTO(id,pwd,name, addr, email, tel, birthday);

	int result = mDAO.joinMember(mdto);

	String msg = result > 0 ? "가입 성공" : "가입 실패";
%>
<script>
window.alert("<%=msg%>");
location.href="join.jsp";
</script>