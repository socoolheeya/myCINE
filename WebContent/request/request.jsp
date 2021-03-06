<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 요청</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/myCINE/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="/myCINE/js/bootstrap.min.js"></script>
</head>
<body>
	<header>
		<%@include file="../header.jsp"%>
	</header>
	<div class="row">
		<div class="col-sm-12">
			<p align="center" style="margin: 10px; padding: 10px;">요청할 영화 제목을 입력해주세요!</p>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-4"></div>
		<div class="col-sm-4">
			<form name="requestForm" action="request.do">
				<table class="table table-default">
					<tr>
						<td style="font-weight: bold;">영화제목</td>
						<td><input type="text" name="searchword"></td>
					</tr>
					<tr>
						<td colspan="2" align="right">
						<button class="btn btn-warning" type="reset" onclick="history.back()">취소</button>
						<button class="btn btn-success" type="submit">확인</button>
						</td>
						
					</tr>
				</table>
			</form>
		</div>
		<div class="col-sm-4"></div>
	</div>
	<footer>
		<%@include file="../footer.jsp"%>
	</footer>
</body>
</html>