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
	border-bottom: 1px double;
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
				<td colspan="2">
				작성자&nbsp;&nbsp;<input type="text" name="writer">
				</td>
				<td colspan="2">
				제목&nbsp;&nbsp;<input type="text" name="subject">
				</td>
		</thead>
		<tfoot>
			<tr>
				<td colspan="4" align="right">제 평점은요&nbsp;&nbsp;<input type="text" name="grade"></td>
			</tr>
			<tr>
				<td colspan="4" align="right">
				<input type="reset" value="다시쓰기">
				<input type="submit" value="작성완료">
				</td>
			</tr>
		</tfoot>
		<tbody>
			<tr>
				<td colspan="4">
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