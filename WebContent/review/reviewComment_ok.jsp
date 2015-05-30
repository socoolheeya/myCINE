<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="result" value="${requestScope.result }"/>
<c:set var="idx" value="${requestScope.idx }"/>
<c:if test=${result > 0 }>
	<script>
		location.href="/myCINE/reviewContent.do?idx=${idx}";
	</script>
</c:if>
