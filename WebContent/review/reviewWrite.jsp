<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
	margin: 0px auto;
	width: 900px;
	border-top: 3px double;
	border-spacing: 0px;
	text-align: center;
}
thead td{
	height: 50px;
	border-bottom: 3px double;
}
</style>
</head>
<body>
<section>
	<article>
		<form name="reviewwrite" action="reviewWrite_ok.jsp">
		<table>
		<thead>
			<tr>
				<td>
				작성자:<input type="text" name="writer">
				</td>
				<td>
				제목:<input type="text" name="subject">
				</td>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<td colspan="2" align="right">
				<input type="reset" value="다시쓰기">
				<input type="submit" value="작성완료">
				</td>
			</tr>
		</tfoot>
		<tbody>
			<tr>
				<td colspan="2">
				<textarea name="content" rows="20" cols="130"></textarea>
				</td>
			</tr>
		</tbody>
		</table>
		</form>
	</article>
</section>
</body>
</html>