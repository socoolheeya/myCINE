<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="mDTO" class="mycine.member.MemberDTO" />
<jsp:setProperty property="*" name="mDTO" />
<jsp:useBean id="mDAO" class="mycine.member.MemberDAO" />
<!DOCTYPE html>
<html>
<head>
<title>회원탈퇴</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/myCINE/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="/myCINE/js/bootstrap.min.js"></script>
</head>
<%
	String id_s = (String) session.getAttribute("id");
	String pwd = request.getParameter("pwd");
	int check = mDAO.deleteMember(id_s, pwd);
	if (check == 1) {
		session.invalidate();
%>
<meta http-equiv="Refresh" content="3;url=/myCINE/index.jsp">
<body>
	<div class="col-sm-12">
		<font size="5" face="바탕체"> 회원정보가 삭제되었습니다.<br> 3초후에 메인 페이지로
			이동합니다. <script>
					opener.location.href = "../index.jsp";
					window.self.close();
				</script>
		</font>
		<%
			} else {
		%>
		<script>
			alert("비밀번호가 맞지 않습니다.");
			history.go(-1);
		</script>
		<%
			}
		%>
	</div>

</body>
</html>