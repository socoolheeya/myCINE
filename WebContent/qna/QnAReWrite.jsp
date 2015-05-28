<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="id" value="${sessionScope.id }"/>
<c:set var="subject" value="${param.q_subject }"/>
<c:set var="ref" value="${param.q_ref }"/>
<c:set var="lev" value="${param.q_lev }"/>
<c:set var="sunbun" value="${param.q_sunbun }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="/myCINE/css/mainLayout.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
</head>
<body>
<c:if test="${empty id }">
	<script>
		window.alert("로그인 후에 이용할 수 있습니다.");
		location.href="/myCINE/qnaList.do";
	</script>
</c:if>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-4"></div>
			<div class="col-sm-4">
	<section>
		<article>
			<h3>답글달기</h3>
			<form name="QnAReWrite" action="/myCINE/qnaReWrite.do">
				<input type="hidden" name="q_ref" value="${ref }">
				<input type="hidden" name=	"q_lev" value="${lev }">
				<input type="hidden" name="q_sunbun" value="${sunbun }">

					<table border="1" class="table">
						<tr>
							<th style="background-color:#ffcc00;">글쓴이</th>
							<td>${id }</td>
							<th style="background-color:#ffcc00;">비밀번호</th>
							<td><input type="password" name="q_pwd" class="form-control"><p style="font-size: 5px">*비번은 항상 기억해주세요^^<p></td>
						</tr>
						<tr>
							<th style="background-color:#ffcc00;">제목</th>
							<td colspan="3"><input type="text" name="q_subject" value="Re:)${subject }" class="form-control"></td>
						</tr>

						<tr>
							<td colspan="4"><textarea name="q_content" rows="10" cols="60"
									rows="5" class="form-control"></textarea></td>
						</tr>
						<tr>
							<td align="center" colspan="4"><input type="submit"
								value="보내기"  class="btn btn-warning"> <input type="reset" value="다시작성"  class="btn btn-warning"></td>
						</tr>
					</table>
			</form>
		</article>
	</section>
	</div>
	<div class="col-sm-4"></div>
	</div>
	</div>
</body>
</html>