<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>영화 요청</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/myCINE/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="/myCINE/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function request() {
		location.href = "/myCINE/requestForm.do";
	}
</script>
</head>
<body>
	<c:set var="id" value="${sessionScope.id }"/>
	<c:if test="${empty id }">
		<script>
			window.alert("로그인 후에 이용할 수 있습니다.");
			location.href = "/myCINE/index.jsp";
		</script>
	</c:if>
	<%@include file="../header.jsp"%>
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
			<div class="container">
				<h2>요청 게시판</h2>
				<p style="font-size: 15px; color: gray;">여기는 영화를 요청하는 게시판입니다<a href="javascript:request()"
						class="btn btn-success">요청하기<span class="glyphicon glyphicon-heart"></span></a>
				</p>	
			</div>
		</div>
		<div class="col-sm-2"></div>
	</div>
	<hr>
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
			<form role="form" name="requestList">
				<table class="table table-hover">
					<thead>
						<tr style="background-color: #ffcc00;">
							<th style="text-align: center;">번호</th>
							<th style="text-align: center;">요청내용</th>
							<th style="text-align: center;">요청날짜</th>
							<th style="text-align: center;">추천</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="arr" value="${requestScope.arr }"/>
						<c:if test="${empty arr }">
							<tr class="danger">
								<td colspan="4" align="center">아직 요청한 영화가 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${not empty arr }">
							<c:forEach var="dto" items="${arr }">
								<tr>
									<td style="text-align: center;">${dto.idx }</td>
									<td>${dto.writer }님께서  <span id=requestMovieName>${dto.movieName }</span>을 요청하였습니다.</td>
									<td>${dto.writeDate }</td>
									<td style="text-align: center;"><a href="recommend.do?idx=${dto.idx }&id=${id}"
								class="btn btn-primary btn" id="recommendButton"><span
									class="glyphicon glyphicon-thumbs-up" data-toggle="tooltip"
									title="추천" id="recommend"></span>${dto.recommend }</a></td>
								</tr>
							</c:forEach>
						</c:if>
						<tr>
							<td  colspan="4" align="center">
								<c:set var="pageLogic" value="${requestScope.pageLogic }"/>
								${pageLogic }
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
		<div class="col-sm-2"></div>
	</div>
	<%@include file="../footer.jsp"%>
</body>
</html>