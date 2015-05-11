<%@page import="mycine.famousline.FamousLineDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="fDTO" class="mycine.famousline.FamousLineDTO" />
<jsp:useBean id="fDAO" class="mycine.famousline.FamousLineDAO" />
<jsp:setProperty property="*" name="fDTO" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/myCINE/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="/myCINE/js/bootstrap.min.js"></script>
</head>
<body>
	<%
		int idx = fDAO.getRandomIdx();
		FamousLineDTO fdto = fDAO.getFamousLine(idx);
		String url = fdto.getFamousLine();
	%>
	<form name="popupForm" action="popup_ok.jsp" method="post">
		<table>
			<tr align="center">
				<td><h2 align="center">내맘대로 명대사</h2></td>
			</tr>
			<tr>
				<td><img src='<%=url%>' /></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td style="margin: 10px; padding: 10px; text-align: right"><input type="checkbox"
					name="popupCheck" value="on">오늘하루 안보기
					<button class="btn btn-primary" type="submit">닫기</button></td>
			</tr>
		</table>
	</form>
</body>
</html>