<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="pDTO" class="mycine.post.PostDTO" />
<jsp:useBean id="pDAO" class="mycine.post.PostDAO" />
<jsp:setProperty property="*" name="pDTO" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소검색</title>
</head>
<body>
	<%
		String zipcode = request.getParameter("zipcode");
		String zip[] = zipcode.split("-");
		String zipcode1 = zip[0];
		String zipcode2 = zip[1];
		String addr = request.getParameter("addr");
	%>
	<script>
		opener.document.memberInfo.addr1.value = "<%=addr%>";
		opener.document.memberInfo.zipcode1.value = "<%=zipcode1%>";
		opener.document.memberInfo.zipcode2.value = "<%=zipcode2%>";
		self.close();
	</script>
</body>
</html>