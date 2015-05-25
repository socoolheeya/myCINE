<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 중복체크</title>
</head>
<body>
<c:set var="result" value="${requestScope.result }"/>
<c:set var="id" value="${requestScope.id }"/>
<c:if test="${result == true }">
	<script>
		window.alert("이미 존재하는 ID입니다.");
		location.href = "idCheck.jsp";
	</script>
</c:if>
<c:if test="${result == false }">
	<script>
		window.alert("${id}는 사용 가능한 ID입니다.");
		opener.document.join.id.value = "${id}";
		self.close();		
	</script>
</c:if>
</body>
</html>