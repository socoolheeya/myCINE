<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="result" value="${requestScope.result }"/>
<c:if test="${result > 0 }">
<script>
	location.href="joinSuccess.jsp";
</script>
</c:if>
<c:if test="${result <= 0 }">
<script>
	window.alert("${requestScope.msg}");
	location.href="join.jsp";
</script>
</c:if>