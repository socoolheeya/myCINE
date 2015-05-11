<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="mycine.review.*"%>
<jsp:useBean id="reDAO" class="mycine.review.ReviewDAO" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 수정하기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/myCINE/css/bootstrap.min.css">
<link rel="stylesheet" href="/myCINE/css/rating-star.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="/myCINE/js/bootstrap.min.js"></script>
</head>
<body>
	<%
		int idx_s = Integer.parseInt(request.getParameter("idx"));
		String writer = request.getParameter("writer");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		int grade_s = Integer.parseInt(request.getParameter("grade"));
	%>
	<header>
	<%@include file="../header.jsp"%>
	</header>
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
			<div class="container">
				<h2>수정하기</h2>
			</div>
		</div>
		<div class="col-sm-2"></div>
	</div>
	<hr>
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
			<form name="reviewwrite" action="reviewUpdateWrite_ok.jsp">
				<input type="hidden" name=idx value="<%=idx_s%>">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>작성자</th>
							<td><%=writer%></td>
							<th style="width: 150px;">평점</th>
							<td><input type="text" name="grade" value="<%=grade_s %>" size="1">점</td>
						</tr>
						<tr>
							<th>제목</th>
							<td colspan="3"><input class="form-control" type="text" name="subject"
								value="<%=subject%>" style="width: 500px;"></td>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<td colspan="4" align="right">
								<button class="btn btn-warning" type="reset" onclick="history.back()">취소</button>
								<button class="btn btn-success" type="reset">원래대로</button> 
								<button class="btn btn-primary" type="submit">수정완료</button>		
							</td>
						</tr>
					</tfoot>
					<tbody>
						<tr>
							<td colspan="4" align="center"><textarea name="content" rows="10"
									cols="70"><%=content.replace("\n", "<br>")%></textarea></td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
		<div class="col-sm-2"></div>
	</div>
	<footer>
	<%@include file="../footer.jsp"%>
	</footer>
</body>
</html>