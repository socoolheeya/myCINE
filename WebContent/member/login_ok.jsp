<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="memberDAO" class="mycine.member.MemberDAO" />
<jsp:useBean id="memberDTO" class="mycine.member.MemberDTO" />
<jsp:setProperty property="*" name="memberDTO" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 체크 확인</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String rememberId = request.getParameter("rememberId");
		String name = "";
		int result = memberDAO.loginCheck(id, pwd);
		out.println(result);
		if (result > 0) {
			if (id.equals(memberDTO.getId())) {
				if (pwd.equals(memberDTO.getPwd())) {
					name = memberDAO.getUserInfo(id);			
					if (rememberId == null && rememberId.equals("")) {
						Cookie ck = new Cookie("rememberId", id);
						ck.setMaxAge(0);		
					} else {
						Cookie ck = new Cookie("rememberId", id);
						ck.setMaxAge(60 * 60 * 24 * 30);
						response.addCookie(ck);
					}
					session.setAttribute("name", name);
					session.setAttribute("id", id);
	%>
	<script>
        alert("<%=id%>님 환영합니다.");
		opener.location.reload();
		self.close();
	</script>
	<%
		} else {
	%>
	<script>
		alert("비밀번호가 틀렸습니다.");
		location.href = "login.jsp";
	</script>
	<%
		}
			} else {
	%>
	<script>
		alert("아이디가 틀렸습니다.");
		location.href = "login.jsp";
	</script>
	<%
		}
		} else {
	%>
	<script>
		alert("아이디가 존재하지 않습니다.");
		location.href = "login.jsp";
	</script>
	<%
		}
	%>
</body>
</html>
