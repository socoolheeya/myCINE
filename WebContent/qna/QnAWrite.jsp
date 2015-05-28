<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="id" value="${sessionScope.id }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA게시판 글쓰기</title>
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
	<c:if test="${empty id }">
		<script>
			window.alert("로그인 후에 이용할 수 있습니다.");
			location.href = "/myCINE/qnaList.do";
		</script>
	</c:if>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">

				<h2>질문하기</h2>
				<hr>
				<form name="QnAWrite" action="/myCINE/qnaWrite.do">

					<table border="1" class="table table-bordered">
						<tr>
							<th style="background-color: #ffcc00;">글쓴이</th>
							<td>${id }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<th style="background-color: #ffcc00">비밀번호</th>
							<td><input type="password" name="q_pwd" class="form-control">
								<p>*비번은 입력후 기억해주세요^^
								<p></td>
						</tr>
						<tr align="right">
							<th style="background-color: #ffcc00;">제목</th>
							<td colspan="3"><input type="text" name="q_subject"
								size="47" class="form-control"></td>
						</tr>

						<tr>
							<td colspan="4"><textarea name="q_content" rows="10"
									cols="60" rows="5" class="form-control"></textarea></td>
						</tr>
						<tr>
							<td align="center" colspan="4">
								<button type="reset" class="btn btn-info" onclick="history.back()">뒤로가기</button>
								<button type="reset" class="btn btn-warning">다시작성</button>
								<button type="submit" class="btn btn-success">보내기</button> 
							</td>
						</tr>
					</table>
				</form>
			</div>
			<div class="col-sm-2"></div>
		</div>
	</div>
	<footer>
		<%@include file="../footer.jsp"%>
	</footer>
</body>
</html>