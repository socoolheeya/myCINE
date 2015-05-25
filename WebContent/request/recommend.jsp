<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${count > 0 }">
<script>
	window.alert("추천되었습니다.");
	location.href="requestList.do";
</script>
</c:if>
<c:if test="${count <= 0 }">
<script>
	window.alert("이미 추천되었습니다.");
	location.href="requestList.do";
</script>
</c:if>
