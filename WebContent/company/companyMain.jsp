<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>회사소개</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/myCINE/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="/myCINE/js/bootstrap.min.js"></script>
</head>
<body>
	<%@include file="../header.jsp"%>
<div class="container-fluid">
		<div class="row">
			<div class="col-sm-2" style="border: 1px solid #cccccc; margin: 10px; padding: 10px;">
			
			<ul>
			<li><a href="companyMain.jsp">회사소개</a></li>
			<li><a href="Ethic.jsp">myCINE윤리</a></li>
			<li><a href="dataProtection.jsp">정보보호인증</a></li>	
			<li><a href="supportProcess.jsp">지원절차</a></li>
			</ul>
			
			</div>
			<div class="col-sm-8">
			<br><br>
	<img src="/myCINE/image/메인1.jpg" alt="메인" width="629" height="570" >
		
		</div>
		<div class="col-sm-2"></div>
		</div>
		</div>
		<%@include file="../footer.jsp"%>
</body>
</html>