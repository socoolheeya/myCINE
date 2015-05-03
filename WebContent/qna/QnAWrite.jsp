<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html">
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="/myCINE/css/mainLayout.css">
</head>
<body>
	<section>
		<article>
			<h2>Q&A게시판 글작성하기</h2>
			<form name="QnAWrite" action="QnAWriter_ok.jsp">
				<fieldset>
					<table border="1">
						<tr>
							<th>글쓴이</th>
							<td><input type="text" name="q_writer" ></td>
							<th>비번</th>
							<td><input type="password" name="q_pwd"></td>
						</tr>
						<tr>
							<th>제목</th>
							<td colspan="3"><input type="text" name="q_subject"></td>
						</tr>

						<tr>
							<td colspan="4"><textarea name="q_content" rows="10" cols="45"
									rows="5"></textarea></td>
						</tr>
						<tr>
							<td align="center" colspan="4"><input type="submit"
								value="보내기"> <input type="reset" value="다시작성"></td>
						</tr>
					</table>
				</fieldset>
			</form>
		</article>
	</section>
</body>
</html>