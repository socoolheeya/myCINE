<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rcontent" value="${requestScope.rcontent }"/>
<c:set var="dto" value="${requestScope.dto }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/myCINE/css/rating-star.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/myCINE/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="/myCINE/js/bootstrap.min.js"></script>
<script>
function reviewDel(){
	window.open("/myCINE/reviewDelForm.do?idx=${idx}", "reviewDel", "width=350,height=200,top=150,left=500;");
	}
</script>
</head>
<body>
	<c:if test="${empty dto }">
		<script>
			window.alert("잘못된 접근입니다.");
			location.href = "/myCINE/reviewList.do";
		</script>
	</c:if>
	<header>
		<%@include file="../header.jsp"%>
	</header>
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
			<div class="container">
				<h2>글 보기</h2>
			</div>
		</div>
		<div class="col-sm-2"></div>
	</div>
	<hr>
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th style="background-color: #ffff99;">작성자</th>
						<td style="color: #0033ff;">${dto.writer }</td>
						<th style="background-color: #ffff99;">작성날짜</th>
						<td>${dto.writedate }</td>
						<th style="background-color: #ffff99;">조회</th>
						<td>${dto.readnum }</td>
						<th style="background-color: #ffff99;">추천</th>
						<td>${dto.recommend }</td>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<td colspan="8" align="right">|&nbsp;&nbsp; <a
							href="javascript:history.back()">뒤로가기<span
								class="glyphicon glyphicon-chevron-left"></span></a>
							&nbsp;&nbsp;|&nbsp;&nbsp; <a href="reviewList.jsp">목록으로<span
								class="glyphicon glyphicon-th-list"></span></a>
							&nbsp;&nbsp;|&nbsp;&nbsp; 
							<c:if test="${sessionScope.id == true }">
									<a href="reviewUpdateWrite.jsp?idx=${dto.idx }&writer=${dto.writer }&pwd=${dto.writedate }&subject=${dto.subject }
				&content=${dto.content }&grade=${dto.grade}">수정하기<span
								class="glyphicon glyphicon-pencil"></span></a>
							&nbsp;&nbsp;|&nbsp;&nbsp; <a href="javascript:reviewDel()">삭제하기<span
								class="glyphicon glyphicon-remove"></span></a> &nbsp;&nbsp;
							</c:if>
						</td>
					</tr>
				</tfoot>
				<tbody>
					<tr>
						<th style="background-color: #ffff99;">제목</th>
						<td colspan="5" align="left" id="subject">${dto.subject }
						</td>
						<th style="background-color: #ffff99;">평점</th>
						<td>${dto.grade }점</td>
					</tr>
					<tr>
						<th colspan="8" style="background-color: #ffff99;">내용</th>
					</tr>
					<tr>
						<td colspan="8"
							style="overflow: scroll; height: 300px; width: 100%;">${rcontent }</td>
					</tr>
				<tbody>
			</table>

		</div>
		<div class="col-sm-2"></div>
	</div>
	<%@include file="reviewComment.jsp"%>
	<%@include file="reviewCommentList.jsp"%>
	<footer>
		<%@include file="../footer.jsp"%>
	</footer>
</body>
</html>