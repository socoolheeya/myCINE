<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="fkey" value="${requestScope.fkey }"/>
<c:set var="fvalue" value="${requestScope.fvalue }"/>
<c:set var="cp" value="${requestScope.cp }"/>
<c:set var="pageLogic" value="${requestScope.pageLogic }"/>
<c:set var="arrfind" value="${requestScope.arrfind }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 검색</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/myCINE/css/bootstrap.min.css">
<script>
	function reviewWrite() {
		location.href = "/myCINE/reviewWriteForm.do"
	}
	function showMyContent() {
		location.href="/myCINE/reviewFindMyContent.do";
	}
</script>
<style type="text/css">
#title {
	background-color: #ffcc00;
}
</style>
</head>
<body>
	<header>
		<%@include file="../header.jsp"%>
	</header>
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
			<div class="container">
				<h2>리뷰검색결과</h2>
				<p style="font-size: 15px; color: gray;">리뷰 검색을 위한 공간</p>
			</div>
		</div>
		<div class="col-sm-2"></div>
	</div>
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
			<form name="reviewFind"
				action="reviewFind.jsp?cp=${cp }&fkey=${fkey }&fvalue=${fvalue}">
				<table class="table table-stripe">
					<thead id="title">
						<tr>
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
							<td colspan="3" align="center">
								${pageLogic }
							</td>
							<td colspan="4" align="right">
								<button class="btn btn-danger" type="button" onclick="history.back()">뒤로가기</button>
								<button class="btn btn-warning" type="button" onclick="showMyContent()">내글보기</button> 
								<button class="btn btn-success" type="button" onclick="reviewWrite()">글쓰기</button></td>
						</tr>
						<tr>
							<td colspan="7" align="right"><select name="fkey">
									<option value="writer">작성자</option>
									<option value="subject">제목</option>
									<option value="content">내용</option>
							</select> <input type="text" name="fvalue" value="${fvalue }"> <input
								type="submit" value="검색"></td>
						</tr>
					</tfoot>
					<tbody>
						<c:if test="${empty arrfind }">
							<tr>
								<td colspan="7">검색결과가 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${not empty arrfind }">
							<c:forEach var="dto" items="${arrfind }">
								<tr>
									<td>${dto.idx }</td>
									<td>
										<a href="reviewContent.jsp?idx=${dto.idx }">${dto.subject }</a>
									</td>
									<td>${dto.writer }</td>
									<td>${dto.writedate }</td>
									<td>${dto.grade }</td>
									<td>${dto.readnum }</td>
									<td>${dto.recommend }</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</form>
		</div>
		<div class="col-sm-2"></div>
	</div>
	<header>
		<%@include file="../footer.jsp"%>
	</header>
</body>
</html>