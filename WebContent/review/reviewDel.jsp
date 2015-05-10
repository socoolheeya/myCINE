<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int idx_s = Integer.parseInt(request.getParameter("idx"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제 확인</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/myCINE/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="/myCINE/js/bootstrap.min.js"></script>
<script>
	function cancel() {
		window.self.close();
	}
</script>
</head>
<body>
	<div class="container">
		<h3 style="padding: 10px;">글을 삭제하시겠습니까?</h3>
		<form name="reviewDel" action="reviewDel_ok.jsp">
			<div align="right" style="margin: 10px;">
			<input type="hidden" name=idx value="<%=idx_s%>">
			<button class="btn btn-warning" type="button" name="cancel"
				onclick="javascript:window.self.close()">취소</button>
			<button class="btn btn-danger" type="submit" name="reviewdel">삭제</button>
			</div>
		</form>
	</div>
</body>
</html>