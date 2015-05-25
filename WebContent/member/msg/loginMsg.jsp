<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="name" value="${sessionScope.name }"/>
<c:if test="${not empty name }">
<script>
	window.alert("${name}님 환영합니다.");
	opener.location.reload();
	window.self.close();
</script>
</c:if>
<c:if test="${empty name }">
<script>
	window.alert("${requestScope.msg}");
</script>
</c:if>