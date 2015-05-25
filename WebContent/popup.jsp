<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팝업창</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/myCINE/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="/myCINE/js/bootstrap.min.js"></script>
</head>
<body>
	<form name="popupForm" action="popup.do" method="post">
		<table>
			<tr align="center">
				<td><h2 align="center">내맘대로 명대사</h2></td>
			</tr>
			<tr>
				<c:set var="url" value="${sessionScope.url }"/>
				<td><img src='${url }' /></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td style="margin: 10px; padding: 10px; text-align: right">
				<input type="checkbox" name="popupCheck" value="on">오늘하루 안보기
					<button class="btn btn-primary" type="submit">닫기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>