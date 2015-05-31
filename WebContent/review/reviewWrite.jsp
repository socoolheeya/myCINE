<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="id" value="${sessionScope.id }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글달기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/myCINE/css/bootstrap.min.css">
<link rel="stylesheet" href="/myCINE/css/rating-star.css">
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
		<p style="font-size: 30px;">글쓰기</p>
		</div>
		<div class="col-sm-2"></div>
	</div>
	<hr>
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
			<form name="reviewwrite" action="/myCINE/reviewWrite.do">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th style="background-color: #ffcc00;">작성자</th>
							<td>
								<c:if test="${empty id }">
									<input type="text" name="writer">
								</c:if>
								<c:if test="${not empty id }">
									${id }<input type="hidden" name="writer" value="${id }">
								</c:if>
							</td>

						</tr>
						<tr>
							<th style="background-color: #ffcc00;">제목</th>
							<td>
								<input type="text" name="subject" style="width: 680px;">
							</td>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th style="text-align: center;">평점</th>
							<td>
								<div class="rating" align="right">
									<input type="radio" id="star5" name="grade" value="5" /><label for="star5" title="슈퍼울트라캡짱!">5 stars</label> 
									<input type="radio" id="star4" name="grade" value="4" /><label for="star4" title="좀 괜찮은데?!">4 stars</label> 
									<input type="radio" id="star3" name="grade" value="3" /><label for="star3" title="보통이에요!">stars</label> 
									<input type="radio" id="star2" name="grade" value="2" /><label	for="star2" title="그럭저럭!">2 stars</label> 
									<input type="radio" id="star1" name="grade" value="1" /><label for="star1" title="최악이야!">1 star</label>
								</div>			
							</td>
						</tr>
						<tr>
							<td colspan="2" align="right">
								<button class="btn btn-warning" type="reset" onclick="history.back()">뒤로가기</button>
								<button class="btn btn-success" type="reset">다시쓰기</button> 
								<button class="btn btn-primary" type="submit">작성완료</button>
							</td>
						</tr>
					</tfoot>
					<tbody>
						<tr>
							<td colspan="4" align="center">
								<textarea name="content" rows="10" cols="72"></textarea>
						 	</td>
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