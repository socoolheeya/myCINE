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
</script>
</head>
<body onload="begin()">
	<form name="myForm" action="deletePro_ok.jsp" method="post" onsubmit="return checkIt()">
	<table width="260" border="1" align="center">
<tr>
	<td colspan="2" algin="center">
	<b>회원 탈퇴</b>
	</td>
</tr>
<tr>
	<td width="150"><b>비밀번호입력</b></td>
	<td width="110">
		<input type="password" name="pwd" size="15"></td>
</tr>
<tr>
	<td colspan="2" align="center">
	<input type="submit" value="회원탈퇴">
	<input type="button" value="취  소" onclick="javascript:window.location="/myCINE/index.jsp">
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
