<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		
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
<style>
p{
  font-size: 5
}
</style>
</head>
<body>


<%
		String ids = (String)session.getAttribute("id");
		if(ids == null || ids.equals("")) {
	%>
	<script>
		window.alert("로그인 후에 이용할 수 있습니다.");
		location.href="/myCINE/qna/QnAList.jsp";
	</script>
	<%}%>
		<div class="container-fluid">
		<div class="row">
			<div class="col-sm-4"></div>
			<div class="col-sm-4">
	<section>
		<article>
			<h2>글작성하기</h2>
			<form name="QnAWrite" action="QnAWriter_ok.jsp">

					<table border="1" class="table">
						<tr>
							<th style="background-color:#ffcc00;">글쓴이</th>
							<td><%=ids%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<th style="background-color:#ffcc00">비밀번호</th>
							<td><input type="password" name="q_pwd" class="form-control"><p>*비번은 입력후 기억해주세요^^<p></td>
						</tr>
						<tr align="right">
							<th style="background-color:#ffcc00;">제목</th>
							<td colspan="3"><input type="text" name="q_subject" size="47" class="form-control" ></td>
						</tr>

						<tr>
							<td colspan="4"><textarea name="q_content" rows="10" cols="60"
									rows="5" class="form-control" ></textarea></td>
						</tr>
						<tr>
							<td align="center" colspan="4"><input type="submit"
								value="보내기"class="btn btn-warning"> <input type="reset" value="다시작성"class="btn btn-warning"></td>
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