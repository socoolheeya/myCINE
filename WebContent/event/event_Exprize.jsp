<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="count" value="${requestScope.count }"/>
<c:set var="use" value="${requestScope.use }"/>
<c:if test="${use == 'O' }">
	<script>
		window.alert("이미 사용되었습니다.");
		location.href = "/myCINE/eventMyprize.do";
	</script>
</c:if>
<c:if test="${count > 0 }">
	<script>
		window.alert("교환권 사용이 완료되었습니다.");
		location.href = "/myCINE/eventMyprize.do";
	</script>
</c:if>
