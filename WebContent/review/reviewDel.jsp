<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int idx_s=Integer.parseInt(request.getParameter("idx"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function cancel() {
	window.self.close();
}
</script>
</head>
<body>
<h3>글을 삭제하시겠습니까?</h3>
<form name="reviewDel" action="reviewDel_ok.jsp">
	<input type="hidden" name=idx value="<%= idx_s %>">
	<input type="submit" name="reviewdel" value="삭제">
	<input type="button" name="cancel" value="취소" onclick="javascript:window.self.close()">
</form>
</body>
</html>