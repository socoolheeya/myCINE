<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="arr" value="${requestScope.arr }"/>
<c:set var="pageLogic" value="${requestScope.pageLogic }"/>
<c:set var="fkey" value="${requestScope.fkey }"/>
<c:set var="fvalue" value="${requestScope.fvalue }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 쓴 리뷰 목록</title>
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
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
			<div class="container">
				<h2>내글 목록</h2>
				<p style="font-size: 15px; color: gray;">내가 쓴 리뷰 리스트입니다.</p>
			</div>
		</div>
		<div class="col-sm-2"></div>
	</div>
	<hr>
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
			<form name="myReviewListForm" action="/myCINE/reviewWriteForm.do">
				<table class="table table-hover">
					<thead>
						<tr style="background-color: #ffcc00;">
							<th>번호</th>
							<th id="subject">제목</th>
							<th>작성자</th>
							<th>등록일</th>
							<th>평점</th>
							<th>조회</th>
							<th>추천</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<td colspan="7" align="right">
								<button class="btn btn-danger" type="button"
									onclick="history.back()">뒤로가기</button>
								<button class="btn btn-warning" type="button"
									onclick="showMyContent()">내글보기</button>
								<button class="btn btn-success" type="submit">글쓰기</button>
							</td>
						</tr>
					</tfoot>
					<tbody>
						<c:if test="${empty arr }">
							<tr>
								<td colspan="7">글이 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${not empty arr }">
							<c:forEach var="dto" items="${arr }">
								<tr>
									<td>${dto.idx }</td>
									<td>
										<a href="reviewContent.jsp?idx=${dto.idx }">${dto.subject }</a>
									</td>
									<td>${dto.writer }</td>
									<td>${dto.writedate }</td>
									<td>${dto.grade }</td>
									<td>${dto.readnum }</td>
									<td style="text-align: center;">
										<a href="reviewRecommend.jsp?idx=${dto.idx }" class="btn btn-primary btn" id="recommendButton"><span
										class="glyphicon glyphicon-thumbs-up" data-toggle="tooltip"
										title="추천" id="recommend"></span>${dto.recommend }</a>
									</td>
							</c:forEach>
						</c:if>
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