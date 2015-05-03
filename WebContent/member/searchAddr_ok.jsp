<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="pDTO" class="mycine.post.PostDTO" />
<jsp:useBean id="pDAO" class="mycine.post.PostDAO" />
<jsp:setProperty property="*" name="pDTO" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String zipcode = request.getParameter("zipcode");
		String addr = request.getParameter("addr");
		out.println(zipcode);
	%>
	<script>
		opener.document.join.addr.value = "<%=addr%>";
		opener.document.join.zipcode.value = "<%=zipcode%>";
		self.close();
	</script>
</body>
</html>