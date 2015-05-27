<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="id" value="${sessionScope.id }"/>
<c:set var="idx" value="${requestScope.idx }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="myCINE/css/mainLayout.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/myCINE/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="/myCINE/js/bootstrap.min.js"></script>
<script>
	function show() {
		window.alert("취소되었습니다");
		location.href = "QnAList.jsp";
	}
</script>
<c:if test="${empty id }">
<script>
	window.alert("로그인 후에 이용할 수 있습니다.");
	location.href = "/myCINE/qna/QnAList.jsp";
</script>
</c:if>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-4"></div>
			<div class="col-sm-4">
				<article>
					<section>
						<form name="QnADel" action="/myCINE/qnaDel.do">
							<input type="hidden" name="q_idx" value="${idx }">
							<table class="table">

								<tr>
									<td>게시물을 삭제하시겠습니까?</td>
								</tr>

								<tr>
									<td><h4>비밀번호를 입력해 주세요</h4></td>
								</tr>

								<tr>
									<td>패스워드:<input type="password" name="q_pwd"
										class="form-control"></td>
								</tr>

								<tr>
									<td><input type="submit" value="삭제하기"
										class="btn btn-warning"> <input type="Button"
										value="취소" onclick="show()" class="btn btn-warning"></td>
								</tr>
							</table>
						</form>
					</section>
				</article>
			</div>
			<div class="col-sm-4"></div>
		</div>
	</div>
</body>
</html>