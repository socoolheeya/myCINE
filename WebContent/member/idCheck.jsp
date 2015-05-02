<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 체크</title>
</head>
<body>
	<fieldset>
		<legend>중복확인</legend>
		<form name="f" action="idCheck_ok.jsp">
			<table>
				<tr>
					<td>ID</td>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<td><input type="submit" value="확인"></td>
				</tr>
			</table>
		</form>
	</fieldset>
</body>
</html>