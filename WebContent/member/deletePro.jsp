<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mycine.member.*" %>
<jsp:useBean id="mDTO" class="mycine.member.MemberDTO"/>
<jsp:setProperty property="*" name="mDTO"/>
<jsp:useBean id="mDAO" class="mycine.member.MemberDAO"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/myCINE/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="/myCINE/js/bootstrap.min.js"></script>
<script>
function begin(){
	document.myForm.pwd.focus();
}
function checkIt(){
	if(!document.myForm.pwd.value){
		alert("비밀번호를 입력하지 않았습니다.");
		document.myForm.pwd.focus();
		return false;
	}
}
function cancel() {
	self.close();
}
</script>
<style type="text/css">
#pwdText {
	font-size: 12px;
}
</style>
</head>
<body onload="begin()">
	<form name="myForm" action="deletePro_ok.jsp" method="post" onsubmit="return checkIt()">
	<table class="table table-bordered">
<tr>
	<td colspan="2" align="center">
	<b>회원 탈퇴</b>
	</td>
</tr>
<tr>
	<td id="pwdText"><b>비밀번호입력</b></td>
	<td>
		<input type="password" name="pwd" size="15"></td>
</tr>
<tr>
	<td colspan="2" align="center">
	<input class="btn btn-danger" type="submit" value="회원탈퇴">
	<input class="btn btn-warning" type="button" value="취  소" onclick="javascript:cancel()">
	</td>
</tr>
</table>
</form>
	<!-- 		<tr>
				<td>비밀번호</td>
				<td><input type="password" name="passwd"></td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;
				<input type="button" value="취소" onclick="window.self.close()"></td>
				<td><a href="/myCine/index.jsp"></a><input type="submit" value="회원탈퇴"></td>
			</tr>
		</table>
		</form>
	</fieldset> -->
</body>
</html>
