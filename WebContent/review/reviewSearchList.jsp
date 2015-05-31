<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="arr" value="${requestScope.arr }"/>
<c:set var="pageLogic" value="${requestScope.pageLogic }"/>
<c:set var="loop" value="${requestScope.loop }" />
<c:set var="requestSubject" value="${requestScope.requestSubject }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/myCINE/css/bootstrap.min.css">
<script type="text/javascript">
	function main() {
		location.href = "/myCINE/main.do";

	}
</script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="/myCINE/js/bootstrap.min.js"></script>
</head>
<body>
	<header>
		<%@include file="../header.jsp"%>
	</header>
	<div class="row" style="margin: 10px; padding: 10px;">
		<div class="col-sm-12">해당 영화의 리뷰 리스트는 다음과 같습니다.</div>
	</div>
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
			<form name="searchReviewlist">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th id="subject">제목</th>
							<th>작성자</th>
							<th>등록일</th>
							<th>조회</th>
							<th>추천</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<td colspan="6" align="right" style="text-align: right;">
								<button class="btn btn-success" type="button" onclick="main()">메인화면</button></td>
						</tr>
					</tfoot>
					<tbody>
					<c:if test="${empty arr }" >
						<tr>
							<td colspan="6">글이 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${not empty arr }" >
						<c:forEach var="dto" items="${arr }">
							<c:if test="${loop == true }">
								<tr>
									<td>${dto.idx }</td>
									<td><a href="reviewContent.jsp?idx=${dto.idx }">
										${dto.subject }
									</a></td>
									<td>${dto.writer }</td>
									<td>${dto.writedate }</td>
									<td>${dto.readnum }</td>
									<td>${dto.recommend }</td>
								</tr>
							</c:if>
						</c:forEach>
					</c:if>
					</tbody>
				</table>
			</form>
		</div>
		<div class="col-sm-2"></div>
	</div>
	<footer>
		<%@ include file="../footer.jsp"%>
	</footer>
</body>
</html>