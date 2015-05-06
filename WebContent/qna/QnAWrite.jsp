<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html">
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
	<section>
		<article>
			<h2>Q&A게시판 글작성하기</h2>
			<form name="QnAWrite" action="QnAWriter_ok.jsp">

					<table border="1" class="table">
						<tr>
							<th style="background-color:#ffcc00;">글쓴이</th>
							<td><input type="text" name="q_writer" size="10"></td>
							<th style="background-color:#ffcc00;">비번</th>
							<td align="left"><input type="password" name="q_pwd" size="10" maxlength="6"></td>
						</tr>
						<tr>
							<th style="background-color:#ffcc00;">제목</th>
							<td colspan="3"><input type="text" name="q_subject" size="47" ></td>
						</tr>

						<tr>
							<td colspan="4"><textarea name="q_content" rows="10" cols="60"
									rows="5" ></textarea></td>
						</tr>
						<tr>
							<td align="center" colspan="4"><input type="submit"
								value="보내기"class="btn btn-warning"> <input type="reset" value="다시작성"class="btn btn-warning"></td>
						</tr>
					</table>

			</form>
		</article>
	</section>
</body>
</html>