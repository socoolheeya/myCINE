<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="dto" value="${requestScope.dto }"/>
<c:set var="content" value="${requestScope.content }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
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
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<h2>작성내용</h2>
				<hr>
				<c:if test=${empty dto }>
					<script>
						window.alert("잘못된 접근또는 삭제된 질문글 입니다");
						location.href = "/QnAList.jsp";
					</script>
				</c:if>
				<c:if test=${not empty dto }>
				<table border="1" class="table table-bordered">
					<tr>
						<th style="background-color: #ffcc00;">번호</th>
						<td >${dto.Q_idx }</td>
						<th style="background-color: #ffcc00;">작성자</th>
						<td>${dto.Q_writer }</td>
					</tr>

					<tr>
						<th style="background-color: #ffcc00;">제목</th>
						<td >${dto.Q_subject }</td>
						<th style="background-color: #ffcc00;">작성날짜</th>
						<td>${dto.Q_writedate }</td>
					</tr>
					<tr height="200">
						<td colspan="4" valign="top">${content}</td>
					</tr>

					<tr>
						<td colspan="4" align="center">
						<button class="btn btn-warning" type="reset" onclick="history.back()">뒤로가기</button>
						<a href="QnAReWrite.jsp?q_subject=${dto.Q_subject }&q_ref=${dto.Q_ref }&q_lev=${dto.Q_lev }&q_sunbun=${dto.Q_sunbun}" class="btn btn-success">답변쓰기</a>
							<a href="QnADel.jsp?q_idx=${dto.idx }" class="btn btn-danger">삭제하기</a></td>
					</tr>
				</table>
				</c:if>
			</div>
			<div class="col-sm-2"></div>
		</div>
	</div>
	<footer>
	<%@include file="../footer.jsp"%>
	</footer>
</body>
</html>