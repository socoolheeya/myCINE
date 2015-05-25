<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<script>
	function begin() {
		document.myForm.pwd.focus();
	}
	function checkIt() {
		if (!document.myForm.pwd.value) {
			alert("비밀번호를 입력하지 않았습니다.");
			document.myForm.pwd.focus();
			return false;
		}
	}
	function cancel() {
		self.close();
	}
</script>
</head>
<body onload="begin()">
	<form name="myForm" action="memberDelete.do" method="post"
		onsubmit="return checkIt()">
		<table style="width: 250px; margin: 0px auto;" border="1">
			<tr>
				<td colspan="2" align="center"><b>회원 탈퇴</b></td>
			</tr>
			<tr>
				<td width="150"><b>비밀번호입력</b></td>
				<td width="110"><input type="password" name="pwd" size="15"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button class="btn btn-danger" type="submit">회원탈퇴</button>
					<button class="btn btn-warning" type="button"
						onclick="javascript:cancel()">취소</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
