<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="mycine.main.FamousLineDTO"%>
<jsp:useBean id="fDTO" class=mycine.main.FamousLineDTO />
<jsp:useBean id="fDAO" class=mycine.main.FamousLineDAO />
<jsp:setProperty property="*" name="fDTO"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
오늘의 명대사
<%
	FamousLineDTO fdto = fDAO.getFamousLine();
	String str = fdto.getFamousLine();
	out.println(str);
%>
<div>

</div>
</body>
</html>