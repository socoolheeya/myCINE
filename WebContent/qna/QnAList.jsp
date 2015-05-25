<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>QnA리스트</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/myCINE/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="/myCINE/js/bootstrap.min.js"></script>
</head>
<body>
	<%@include file="../header.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<h2>QnA게시판</h2>
				<form name="QnASearch" action="QnASearch.jsp">
					<div align="right" style="margin: 10px; padding: 10px;">	
						<select name="fkey" style="width: 100px;">
							<option value="q_subject">제목</option>
							<option value="q_writer">글쓴이</option>
						</select>
						<input type="text" name="fvalue"> 
						<button class="btn btn-info" type="submit"><span class="glyphicon glyphicon-search"></span>검색</button>
					</div>
				</form>
				<table class="table">
					<thead>
						<tr style="background-color: #ffcc00;">
							<th style="text-align: center;">번호</th>
							<th style="text-align: center;">제목</th>
							<th style="text-align: center;">글쓴이</th>
							<th style="text-align: center;">작성날짜</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<td colspan="3" align="center">
								<c:set var="pageLogic" value="${requestScope.pageLogic }"/>
								${pageLogic }
							</td>
							<td align="center"><a href="QnAWrite.jsp"
								class="btn btn-success">질문하기</a></td>
						</tr>
					</tfoot>
					<tbody>
					<c:set var="arr" value="${requestScope.arr }"/>
					<c:if test="${empty arr }">
						<tr>
							<td colspan="4" align="center">등록된질문이 없습니다</td>
						</tr>
					</c:if>
					<c:if test="${not empty arr }">
						<c:forEach var="dto" items="${arr }">
							<c:url var="contnetURL" value="QnAContent.do">
								<c:param name="idx">${dto.idx }</c:param>
							</c:url>
							<tr>
								<td style="text-align: center;">${dto.idx }</td>
								<td><a href="${contentURL }"></a>${dto.subject }</td>
								<td style="text-align: center;">${dto.writer }</td>
								<td align="center">${dto.writedate }</td>
							</tr>
						</c:forEach>
					</c:if>
					</tbody>
				</table>
			</div>
			<div class="col-sm-2"></div>
		</div>
	</div>
	<footer>
		<%@include file="../footer.jsp"%>
	</footer>
</body>
</html>