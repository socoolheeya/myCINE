<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="id" value="${sessionScope.id }" />
<c:set var="contentIdx" value="${requestScope.contentIdx }" />
<link rel="stylesheet" href="/myCINE/css/rating-star.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/myCINE/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="/myCINE/js/bootstrap.min.js"></script>
<div class="row">
	<div class="col-sm-2"></div>
	<div class="col-sm-8"></div>
	<div class="col-sm-2"></div>
</div>
<div class="row">
	<div class="col-sm-2"></div>
	<div class="col-sm-8">
		<form name="commentForm" action="/myCINE/reviewComment.do">
			<table class="table table-bordered">
				<thead>
					<tr>
						<c:if test="${empty id }">
							<td style="margin: 0px auto;"><input type="text"
								name="writer_cmt" style="width: 130px;"><input
								type="hidden" name="idx" value="${contentIdx }"></td>
						</c:if>
						<c:if test="${not empty id }">
							<th style="margin: 0px auto;">${id }<input type="hidden"
								name="writer_cmt" value="${id }"><input type="hidden"
								name="idx" value="${contentIdx }"></th>
						</c:if>
						<td colspan="6"><textarea name="content_cmt" rows="2"
								cols="63"></textarea></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="8" align="right">
							<button class="btn btn-warning" type="reset">다시작성</button>
							<button class="btn btn-success" type="submit">등록</button>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<hr>
	</div>
	<div class="col-sm-2"></div>
</div>