<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageLogic" value="${requestScope.pageLogic }" />
<c:set var="arr" value="${requestScope.arr }" />
<c:set var="testId" value="${requestScope.testId }" />
<c:set var="commentCount" value="${requestScope.commentCount }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 게시판</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/myCINE/css/bootstrap.min.css">
<script>
	function reviewFind() {
		document.reviewSearchForm.action = "/myCINE/reviewFind.do";
		document.reviewSearchForm.submit();
	}
	function showMyContent() {
		location.href = "/myCINE/reviewFindMyContent.do";
	}
	function getUserInfo() {

	}
</script>
<script>
	$(document).ready(function() {
		$('[data-toggle="popover"]').popover();
	});
</script>
<style type="text/css">
#searchForm {
	padding: 10px;
	text-align: right;
}

#commentCount {
	color: #003366;
	font-size: 11px;
	padding-left: 10px;
}

#idx, #subject, #writer, #writeDate, #readnum, #grade {
	font-size: 14px;
}

#subject, #writer {
	color: black;
}

#ab {
	font-size: 12px;
	text-align: center;
}

#buttonG {
	
}

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
				<h2>리뷰 게시판</h2>
				<p style="font-size: 15px; color: gray;">여기는 영화를 요청하는 게시판입니다</p>
			</div>
		</div>
		<div class="col-sm-2"></div>
	</div>
	<hr>
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
			<form name="reviewSearchForm" id="searchForm">
				<select name="fkey">
					<option value="writer">작성자</option>
					<option value="subject">제목</option>
					<option value="content">내용</option>
				</select> <input type="text" name="fvalue">
				<button class="btn btn-info" type="submit"
					onclick="javascript:reviewFind()">
					<span class="glyphicon glyphicon-search"></span>검색
				</button>
			</form>
			<form name="reviewlist" action="reviewWrite.jsp">
				<table class="table table-hover">
					<thead>
						<tr id="title">
							<th id="ab">번호</th>
							<th id="ab">제목</th>
							<th id="ab">작성자</th>
							<th id="ab">등록일</th>
							<th id="ab">평점</th>
							<th id="ab">조회</th>
							<th id="ab">추천</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty arr }">
								<tr>
									<td colspan="7">글이 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="dto" items="${arr }">
									<tr>
										<td id="idx">${dto.idx }</td>
										<td id="subject"><a
											href="reviewContent.do?idx=${dto.idx }"> ${dto.subject }<span
												id="commentCount">[${commentCount }] </span>
										</a></td>
										<td id="writer" onmouseover="getUserInfo()"><a href="#"
											data-toggle="popover" title="Popover Header"
											data-content="Some content inside the popover">${dto.writer }</a></td>
										<td id="writeDate">${dto.writedate }</td>
										<td id="grade">${dto.grade }</td>
										<td id="readnum">${dto.readnum }</td>
										<td style="text-align: center;"><a
											href="reviewRecommend.do?idx=${dto.idx }&id=${testId}"
											class="btn btn-primary btn" id="recommendButton"><span
												class="glyphicon glyphicon-thumbs-up" data-toggle="tooltip"
												title="추천" id="recommend"></span>${dto.recommend }</a></td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="2" align="center">${pageLogic }</td>

							<td id="buttonG" colspan="5" align="right">
								<button class="btn btn-danger" type="button"
									onclick="history.back()">뒤로가기</button>
								<button class="btn btn-warning" type="button"
									onclick="showMyContent()">내글보기</button>
								<button class="btn btn-success" type="submit">글쓰기</button>
							</td>
						</tr>
					</tfoot>
				</table>
			</form>
			<div class="col-sm-2"></div>
		</div>
	</div>
	<footer>
		<%@include file="../footer.jsp"%>
	</footer>
</body>
</html>