<%@page import="mycine.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="mycine.member.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="mDTO" class="mycine.member.MemberDTO" />
<jsp:setProperty property="*" name="mDTO" />
<jsp:useBean id="mDAO" class="mycine.member.MemberDAO" />
<%
	String id_s = (String)session.getAttribute("id");
	mDTO.setId(id_s);
	mDAO.updateMember(mDTO);
%>

<html>
<head><title>업데이트</title></head>
<meta http-equiv="Refresh" content="3;url=/myCINE/index.jsp">
<body>
<center>
<font size="5" face="바탕체">
입력하신 내용대로 <b>회원정보가 수정 되었습니다.</b><br><br>
3초후에 메인 페이지로 이동합니다.</font>
</center>
</body>
</html>