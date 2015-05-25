<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="result" value="${requestScope.result }"/>
<c:set var="count" value="${requestScope.count }"/>
<c:set var="msg" value="${requestScope.msg }"/>
<c:if test="${result == true }">
	<script>
		window.alert("${msg}");
		location.href="request.do";
	</script>
</c:if>
<c:if test="${result == false }">
	<script>
		window.alert("${msg}");
		location.href="requestList.do";
	</script>
</c:if>