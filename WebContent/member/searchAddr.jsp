<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소검색</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script type="text/javascript">
	<script type="text/javascript">
	function searchAddr() {
		window.open("addrList.do?dong=", "addrList", "width=1500 height=500");
	}
</script>
</head>
<c:set var="requestDong" value="${requestScope.dong }"/>
<c:set var="arr" value="${requestScope.arr }"/>
<body style="margin: 5px auto; padding: 30px;">
	<section>
		<article>
			<fieldset>
				<legend style="font-size: 40px; font-weight: bold;">주소 찾기</legend>
				<form name="addrFind" method="post">
					<table>
						<tr>
							<td style="font-size: 20px; font-weight: bold; padding-right: 10px;">주소검색</td>
							<td><span class="col-sm-13"><input
									class="form-control" type="text" name="dong"
									placeholder="동(dong)을 입력하세요 "></span></td>
							<td>
								<button class="btn btn-primary" type="submit">
								<span class="glyphicon glyphicon-search"></span>
								검색</button>
							</td>
						</tr>
					</table>
				</form>
			</fieldset>
		</article>
		<article>
			<fieldset>
				<legend style="font-size: 40px; font-weight: bold;">주소검색결과</legend>
				${requestScope.searchAddrResult }
			</fieldset>
		</article>
		<hr>
	</section>
</body>
</html>