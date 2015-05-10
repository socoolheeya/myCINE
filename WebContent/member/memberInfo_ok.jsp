<%@page import="mycine.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="mycine.member.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="mDTO" class="mycine.member.MemberDTO" />
<jsp:useBean id="mDAO" class="mycine.member.MemberDAO" />
<jsp:setProperty property="*" name="mDTO" />

<%
	String id_s = (String)session.getAttribute("id_s");
	mDAO.updateMember(mDTO, id_s);
%>
<html>
<head><title>업데이트</title>
<style type="text/css">
#info{
	font-size: 40px;
	font-weight: bold;
	text-align: center;
}
</style>
</head>
<meta http-equiv="Refresh" content="3;url=/myCINE/index.jsp">
<body>
<div class="row" style="padding-top: 150px; margin-top: 50px;">
	<div class="col-sm-2"></div>
	<div class="col-sm-8" id="info">
	입력하신 내용대로 회원정보가 수정 되었습니다.
	<div>3초후에 메인 페이지로 이동합니다.</div>
	</div>
	<div class="col-sm-2"></div>
</div>


</body>
</html>