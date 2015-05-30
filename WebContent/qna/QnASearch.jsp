<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageLogic" value="${requestScope.pageLogic }" />
<c:set var="arr" value="${requestScope.arr }" />
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/myCINE/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="/myCINE/js/bootstrap.min.js"></script>
<script>
	function show() {
		window.open("/myCINE/qnaWrite.do", "QnAWrite", "width=600, height=500");
	}
</script>
</head>
<body>
	<%@include file="../header.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<h2>QnA게시판</h2>
				<form name="QnASearch" action="/myCINE/qnaSearch.do">
					<p style="text-align: right">
						<select name="fkey">
							<option value="q_subject">제목</option>
							<option value="q_writer">글쓴이</option>
						</select> <input type="text" name="fvalue"> <input type="submit"
							value="검색" class="btn btn-info btn-sm">
					</p>
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
					<tbody>
						<c:if test="${empty arr }">
							<tr>
								<td colspan="4" align="center">검색된질문이 없습니다</td>
							</tr>
						</c:if>
						<c:if test="${not empty arr }">
							<c:forEach var="dto" items="${arr }">
								<tr>
									<td style="text-align: center;">${dto.q_idx }</td>
									<td>
										<a href="QnAContent.jsp?idx=${dto.q_idx }">
										${dto.q_subject }
										</a>
									</td>
									<td style="text-align: center;">${dto.q_writer }</td>
									<td align="center">${dto.q_writedate }</td>
								</tr>		
							</c:forEach>
						</c:if>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="3" align="center">${pageLogic }</td>
							<td align="center"><input type="button" value="질문하기"
								onclick="show()" class="btn btn-warning"></td>
						</tr>
					</tfoot>
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