<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="mDTO" class="mycine.member.MemberDTO" />
<jsp:useBean id="mDAO" class="mycine.member.MemberDAO" />
<jsp:setProperty property="*" name="mDTO" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 중복체크</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		boolean result = mDAO.idCheck(id);
		if(result){
			%>
			<script>
			window.alert("이미 존재하는 ID입니다.");
			location.href = "idCheck.jsp";
			</script>
			<%
		} else {
			%>
			<script>
			window.alert("<%=id%>는 사용 가능한 ID입니다.");
			opener.document.join.id.value = "<%=id%>";
			self.close();
			</script>
			<%
		}
	%>
</body>
</html>