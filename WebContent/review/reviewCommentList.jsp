<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contentIdx" value="${requestScope.contentIdx }" />
<c:set var="arr" value="${requestScope.arr }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰게시판 댓글 리스트</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/myCINE/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="/myCINE/js/bootstrap.min.js"></script>
<style type="text/css">
#writer {
	text-align: center;
	background-color: #ffff99;
}
</style>
</head>
<%
	int contentidx = Integer.parseInt(request.getParameter("idx"));
%>
<body>

	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
			<table class="table table-bordered">
				<c:forEach var="dto" items="${arr }">
					<tr style="width: 700px;">
						<td id="writer">${dto.writer_cmt }</td>
						<td>${dto.content_cmt }<span
							style="font-size: 11px; color: #999999; padding-left: 5px;">${dto.writedate_cmt }</span></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="col-sm-2"></div>
	</div>
</body>
</html>