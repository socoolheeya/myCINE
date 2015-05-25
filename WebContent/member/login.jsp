<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/myCINE/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="/myCINE/js/bootstrap.min.js"></script>
</head>
<c:set var="saveid" value="${requestScope.saveid }"/>
<body>
	<div style="border:1px solid #cccccc; padding: 10px; margin: 10px;">
		<legend style="font-size: 30px; font-weight: bold;"> 로그인 </legend>
		<form role="form" action="login.do?cmd=login">
			<div class="row">
				<div class="col-sm-4"></div>
				<div class="col-sm-4">
					<div class="form-group">
						<label for="focusedInput">ID: </label> <input type="text"
							class="form-control" id="focusedInput" name="id"
							value="${saveid }" placeholder="ID 입력">
					</div>
					<div class="form-group">
						<label for="pwd">Password:</label> <input type="password"
							class="form-control" id="pwd" name="pwd"
							placeholder="Password 입력">
					</div>
					<c:set var="condition" value="${requestScope.str }"/>
					<span class="checkbox"> <label style="font-size: 15px;"><input
							type="checkbox" name="saveid" value="on"
							${condition }> Remember me</label>
					</span>
					<button type="submit" class="btn btn-primary">로그인</button>
				</div>
				<div class="col-sm-4"></div>
			</div>
		</form>
	</div>
</body>
</html>